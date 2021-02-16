From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 23:10:57 +0100
Subject: [Buildroot] [git commit] package/openblas: fix detection of
 gfortran compiler
Message-ID: <20210216214932.4F043801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8efa82a41d7c345d59fcd8113a679aaacd8043a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
