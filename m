From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  5 Mar 2021 14:48:37 +0100
Subject: [Buildroot] [PATCH 2/3] package/openblas: strip any optimization
 flag where needed
In-Reply-To: <20210305134839.30612-1-patrickdepinguin@gmail.com>
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
Message-ID: <20210305134839.30612-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

openblas strips off -O1-O3 for certain source files, but forgets to handle
-Os, -Og and -O. This means that the intended effect of 'no optimization' is
not always reached.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...nsider-Os-when-determining-LAPACK_NO.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch

As the openblas patch is fixing a generic problem, I will attempt to upstream it.

diff --git a/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch b/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
new file mode 100644
index 0000000000..0ff9051ae4
--- /dev/null
+++ b/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
@@ -0,0 +1,31 @@
+From ced08de1ad74811bc23d74121751537bfd8e9556 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Fri, 5 Mar 2021 11:15:52 +0100
+Subject: [PATCH 1/2] Makefile: also consider -O, -Og and -Os when stripping flags
+
+gcc also supports -O, -Og and -Os as optimization flags.
+They may be given on the make command-line by users.
+
+For the calculation of LAPACK_NOOPT, all such flags should be considered.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a22e16ba..fc5fe3f5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,7 +32,7 @@ export NOFORTRAN
+ export NO_LAPACK
+ endif
+ 
+-LAPACK_NOOPT := $(filter-out -O0 -O1 -O2 -O3 -Ofast,$(LAPACK_FFLAGS))
++LAPACK_NOOPT := $(filter-out -O0 -O1 -O2 -O3 -Ofast -O -Og -Os,$(LAPACK_FFLAGS))
+ 
+ SUBDIRS_ALL = $(SUBDIRS) test ctest utest exports benchmark ../laswp ../bench cpp_thread_test
+ 
+-- 
+2.26.2
+
-- 
2.26.2
