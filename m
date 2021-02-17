From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:36:21 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/openblas: fix
 detection of gfortran compiler
Message-ID: <20210217101519.BCA04815D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f193d5603c86045161f18ed0a4dfd4d3ad0686f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The compiler detection since openblas 0.3.8 added support for gcc 10, but
this broke detection of compilers created with crosstool-ng, or other
toolchains that have a package version containing a version like x.y.z where
at least one of x, y or z have more than one digit, for example
"Crosstool-NG 1.24.0".

See the reported issue for more details [1].

Backport the upstream patch that fixes it.

[1] https://github.com/xianyi/OpenBLAS/issues/3099

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8efa82a41d7c345d59fcd8113a679aaacd8043a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/0001-fix-gfortran-detection.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/openblas/0001-fix-gfortran-detection.patch b/package/openblas/0001-fix-gfortran-detection.patch
new file mode 100644
index 0000000000..1fecdac3e5
--- /dev/null
+++ b/package/openblas/0001-fix-gfortran-detection.patch
@@ -0,0 +1,30 @@
+From ece3ce581e3ec530eaccfe7f284c52e115ec7aa9 Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Wed, 10 Feb 2021 14:22:59 +0100
+Subject: [PATCH] Strip parenthesized (pkgversion) data from GCC version string
+ to avoid misinterpretation
+
+See https://github.com/xianyi/OpenBLAS/issues/3099 for details.
+
+Upstream-status: backport
+
+[for import into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+
+---
+ f_check | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/f_check b/f_check
+index e9aca4ff9..ffe9c6b46 100644
+--- a/f_check
++++ b/f_check
+@@ -75,6 +75,7 @@ if ($compiler eq "") {
+ 
+ 	} elsif ($data =~ /GNU/ || $data =~ /GCC/ ) {
+ 
++            $data =~ s/\(+.*?\)+//g;
+ 	    $data =~ /(\d+)\.(\d+).(\d+)/;
+ 	    $major = $1;
+ 	    $minor = $2;
