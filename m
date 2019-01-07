From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:29 +0100
Subject: [Buildroot] [PATCH 07/19] infra/pkg-generic: offload same-package
 filtering to check-uniq-file
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <b46c2134e7b2851fc8623d0f0538bcfce1a5fa60.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d3dca1e9936b (core/pkg-generic: only save latest package list)
added filtering so that, upon a "pkg-rebuild", the check-uniq-file test
would not report the same package as installing the same file.

Additionally, it also ensured that the file-list file did not grow with
each rebuild, by removing all references of a package-installed files
before listing them again.

However, that second part also meant that the accounting may get wrong
upon a rebuild, in case the new installation step installs less files
than the previous, in which case previously installed files are no
longer assigned to the package.

It also hides the fact that the package has been re-installed.

Furthermore, the combined size of those three files lists is almost
negligible when compared to the rest of the build tree, so the growing
argument does not hold.

The only interesting feature of d3dca1e9936b, is thus to not report a
package that re-installs the same file.

So, we revert d3dca1e9936b but use a python set() instead of a list, to
store the packages that installed each file. Adding to a set, an entry
which is already in that set, does not create a new entry; it will be
there only once.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: John Keeping <john@metanate.com>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk           | 2 --
 support/scripts/check-uniq-files | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 42aebeb49d..7daea190a6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,8 +63,6 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
-	@touch $(BUILD_DIR)/packages-file-list$(3).txt
-	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
 	cd $(2); \
 	find . \( -type f -o -type l \) \
 		-newer $@_before \
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index fbc6b5d6e7..eb92724e42 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -24,11 +24,11 @@ def main():
         sys.stderr.write('No type was provided\n')
         return False
 
-    file_to_pkg = defaultdict(list)
+    file_to_pkg = defaultdict(set)
     with open(args.packages_file_list[0], 'rb') as pkg_file_list:
         for line in pkg_file_list.readlines():
             pkg, _, file = line.rstrip(b'\n').partition(b',')
-            file_to_pkg[file].append(pkg)
+            file_to_pkg[file].add(pkg)
 
     for file in file_to_pkg:
         if len(file_to_pkg[file]) > 1:
-- 
2.14.1
