From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2021 10:15:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/openblas: fix detection of gfortran
 compiler
In-Reply-To: <20210212091511.9905-1-patrickdepinguin@gmail.com>
References: <20210212091511.9905-1-patrickdepinguin@gmail.com>
Message-ID: <20210212091511.9905-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The compiler detection since openblas 0.3.8 added support for gcc 10, but
this broke detection of compilers created with crosstool-ng, or other
toolchains that have a package version containing a version like x.y.z where
at least one of x, y or z have more than one digit, for example
"Crosstool-NG 1.24.0".

See the reported issue for more details [1].

Backport the upstream patch that fixes it.

[1] https://github.com/xianyi/OpenBLAS/issues/3099

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../0001-fix-gfortran-detection.patch         | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/openblas/0001-fix-gfortran-detection.patch

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
-- 
2.26.2
