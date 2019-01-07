From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:36 +0100
Subject: [Buildroot] [PATCH 14/19] support/check-uniq-files: don't report
 files of the same content
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <18f69b9fb1e0277f26c40609c6fc16e25b9d689a.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we check that no two packages write to the same files, as a
sanity check. We do so by checking which files were touched since the
end of the build (aka beginning of the installation).

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
One prominent case where this happens, is the fftw family of packages,
that all install different libraries, but install the same set of
headers and some common utilities, and they are all identical across the
family.

As such, when the packages all installed the same content (same md5), do
not report the file. Only report it if at least two packages installed a
different content.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: John Keeping <john@metanate.com>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-uniq-files | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index cf9ea292bc..f42edeb534 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -36,13 +36,18 @@ def main():
         return False
 
     file_to_pkg = defaultdict(set)
+    file_md5 = defaultdict(set)
     for record in parse_pkg_file_list(args.packages_file_list[0]):
         file_to_pkg[record['file']].add(record['pkg'])
+        file_md5[record['file']].add(record['md5'])
 
     for file in file_to_pkg:
         if len(file_to_pkg[file]) == 1:
             continue
 
+        if len(file_md5[file]) == 1:
+            continue
+
         sys.stderr.write(warn.format(args.type, str_decode(file),
                                      ", ".join([str_decode(p)
                                                 for p in file_to_pkg[file]])))
-- 
2.14.1
