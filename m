From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Jan 2019 17:04:31 +0100
Subject: [Buildroot] [PATCH] core/instrumentation: filter-out packages that
 install identical files
Message-ID: <20190103160431.13306-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we check that no two packages write to the same files, as a
sanity check. We do so by checking which files were touched since the
end of the build (aka begining of the installation).

However, when the packages do install the exact same file, i,e, the
same content, we in fact do not really care what package had provided
said file.

In the past, we avoided that situation because we were md5sum-inf every
files before and after installation. Anything that changed was new or
modified, and everything that did not change was not modified (but could
have been reinstalled).

However, since 7fb6e78254 (core/instrumentation: shave minutes off the
build time), we're now using mtimes, and we're in the situation that the
exact same file installed by two-or-more packages is reported.

In such a situation, it is not very interesting to know what package
installed the file, because whatever the ordering, or whatever the
subset of said packages, we'd have ended up with the same file anyway.
One prominent case where this happens, if the fftw familly of pcackages,
that all install different libraries, but install the same set of
identical headers and some common utilities.

The rationale for 7fb6e78254 was that the impact on the build time was
horrible, so we can't revert it.

However, we can partially restore use of md5 to detect if the files were
actually modified or not, and limiting the md5sum-ing only to those
actually modified files. The comparison of the md5 is then offloaded to
later, during the final check-uniq-files calls.

Since the md5sum is run only on new files, they are cache-hot, and so
the md5 is not going to storage to fetch them (and if they were not
cache-hot, it would mean memory pressure for a reason or another, and
the system would already be slowed for other reasons).

Using a defconfig with a various set of ~236 packages, the build times
reported by running "time make >log.file 2>&1", on an otherwise unloaded
system, were (smallest value of 5 runs each):

    before:     35:15.92
    after:      35:22.03

Which is a slight overhead of just 6.11s, which is less than 26ms per
package. Also, the system, although pretty idle, was still doing
background work like fetching mails and such, so the overhead is not
even consistent across various measurements...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Trent Piepho <tpiepho@impinj.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Note: as said above, the measurements were not consistent, and I just
reported the two smallest values. The two values usually differed by
less than 4s overall, and the two smallest values just exacerbate the
delta. I.e we know that the "before" can go as fast as that, but we
don't know if the "after" was the fastest.

I'm also interested in people actually having the overhead issue before
7fb6e78254, to test this new patch and report how they are impacted.
---
 package/pkg-generic.mk           | 10 ++++++----
 support/scripts/check-uniq-files | 34 ++++++++++++++++++++--------------
 support/scripts/size-stats       |  2 +-
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f5cab2b9c2..7c6a995c19 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -64,12 +64,14 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
 	@touch $(BUILD_DIR)/packages-file-list$(3).txt
-	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
+	$(SED) '/^$(1)  /d' $(BUILD_DIR)/packages-file-list$(3).txt
 	cd $(2); \
-	find . \( -type f -o -type l \) \
+	find . -xtype f \
 		-newer $($(PKG)_DIR)/.stamp_built \
-		-exec printf '$(1),%s\n' {} + \
-		>> $(BUILD_DIR)/packages-file-list$(3).txt
+		-print0 \
+	|xargs -0 -r md5sum \
+	|sed -r -e 's/^/$(1)  /' \
+	>> $(BUILD_DIR)/packages-file-list$(3).txt
 endef
 
 define step_pkg_size
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index fbc6b5d6e7..94deea01db 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -24,24 +24,30 @@ def main():
         sys.stderr.write('No type was provided\n')
         return False
 
-    file_to_pkg = defaultdict(list)
+    file_to_pkg = defaultdict(set)
+    file_md5 = defaultdict(set)
     with open(args.packages_file_list[0], 'rb') as pkg_file_list:
         for line in pkg_file_list.readlines():
-            pkg, _, file = line.rstrip(b'\n').partition(b',')
-            file_to_pkg[file].append(pkg)
+            pkg, md5, file = line.rstrip(b'\n').split(b'  ', 2)
+            file_to_pkg[file].add(pkg)
+            file_md5[file].add(md5)
 
     for file in file_to_pkg:
-        if len(file_to_pkg[file]) > 1:
-            # If possible, try to decode the binary strings with
-            # the default user's locale
-            try:
-                sys.stderr.write(warn.format(args.type, file.decode(),
-                                             [p.decode() for p in file_to_pkg[file]]))
-            except UnicodeDecodeError:
-                # ... but fallback to just dumping them raw if they
-                # contain non-representable chars
-                sys.stderr.write(warn.format(args.type, file,
-                                             file_to_pkg[file]))
+        if len(file_to_pkg[file]) == 1 or len(file_md5[file]) == 1:
+            # If only one package installed that file, or they all
+            # installed the same content, don't report that file.
+            continue
+
+        # If possible, try to decode the binary strings with
+        # the default user's locale
+        try:
+            sys.stderr.write(warn.format(args.type, file.decode(),
+                                         [p.decode() for p in file_to_pkg[file]]))
+        except UnicodeDecodeError:
+            # ... but fallback to just dumping them raw if they
+            # contain non-representable chars
+            sys.stderr.write(warn.format(args.type, file,
+                                         file_to_pkg[file]))
 
 
 if __name__ == "__main__":
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index deea92e278..f67fe1d268 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -68,7 +68,7 @@ def build_package_dict(builddir):
     filesdict = {}
     with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
         for l in filelistf.readlines():
-            pkg, fpath = l.split(",", 1)
+            pkg, _, fpath = l.split("  ", 2)
             # remove the initial './' in each file path
             fpath = fpath.strip()[2:]
             fullpath = os.path.join(builddir, "target", fpath)
-- 
2.14.1
