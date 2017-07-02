From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] openzwave: don't download patch from Github
Message-ID: <20170702220304.9B0BF81EDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80f08a4b281eecdf13eb7fa994d5bab21007e75f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../openzwave/0001-Fix-compilation-of-MinOZW.patch | 37 ++++++++++++++++++++++
 ...x-warning-on-wcsdup-implicit-declaration.patch} |  0
 ... 0003-Ensure-correct-git-repository-path.patch} |  0
 package/openzwave/openzwave.hash                   |  1 -
 package/openzwave/openzwave.mk                     |  6 ----
 5 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/package/openzwave/0001-Fix-compilation-of-MinOZW.patch b/package/openzwave/0001-Fix-compilation-of-MinOZW.patch
new file mode 100644
index 0000000..773672e
--- /dev/null
+++ b/package/openzwave/0001-Fix-compilation-of-MinOZW.patch
@@ -0,0 +1,37 @@
+From 599e2a11c6f48dde744012ec45686c08e15f3059 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Mon, 3 Oct 2016 10:35:52 +0200
+Subject: [PATCH] Fix compilation of MinOZW (#991)
+
+LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
+libraries. However, as it was unset by default, the cross-compilation
+could fail if the host had a library such as libnss3.so in /.
+To fix this issue, this patch sets LIBDIR to top_buildir if it is unset
+
+Fixes:
+  http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+[Upstream commit: https://github.com/OpenZWave/open-zwave/commit/599e2a11c6f48dde744012ec45686c08e15f3059]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ cpp/examples/MinOZW/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/cpp/examples/MinOZW/Makefile b/cpp/examples/MinOZW/Makefile
+index e575632a3..95d684b77 100644
+--- a/cpp/examples/MinOZW/Makefile
++++ b/cpp/examples/MinOZW/Makefile
+@@ -17,9 +17,11 @@ DEBUG_LDFLAGS	:= -g
+ 
+ top_srcdir := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))../../../)
+ 
++#where is put the temporary library
++LIBDIR  	?= $(top_builddir)
+ 
+ INCLUDES	:= -I $(top_srcdir)/cpp/src -I $(top_srcdir)/cpp/tinyxml/ -I $(top_srcdir)/cpp/hidapi/hidapi/
+-LIBS =  $(wildcard $(LIBDIR)/*.so $(LIBDIR)/*.dylib $(top_builddir)/*.so $(top_builddir)/*.dylib $(top_builddir)/cpp/build/*.so $(top_builddir)/cpp/build/*.dylib )
++LIBS =  $(wildcard $(LIBDIR)/*.so $(LIBDIR)/*.dylib $(top_builddir)/cpp/build/*.so $(top_builddir)/cpp/build/*.dylib )
+ LIBSDIR = $(abspath $(dir $(firstword $(LIBS))))
+ minozwsrc := $(notdir $(wildcard $(top_srcdir)/cpp/examples/MinOZW/*.cpp))
+ VPATH := $(top_srcdir)/cpp/examples/MinOZW
diff --git a/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch b/package/openzwave/0002-Fix-warning-on-wcsdup-implicit-declaration.patch
similarity index 100%
rename from package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch
rename to package/openzwave/0002-Fix-warning-on-wcsdup-implicit-declaration.patch
diff --git a/package/openzwave/0002-Ensure-correct-git-repository-path.patch b/package/openzwave/0003-Ensure-correct-git-repository-path.patch
similarity index 100%
rename from package/openzwave/0002-Ensure-correct-git-repository-path.patch
rename to package/openzwave/0003-Ensure-correct-git-repository-path.patch
diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
index d07961e..cd1231f 100644
--- a/package/openzwave/openzwave.hash
+++ b/package/openzwave/openzwave.hash
@@ -1,3 +1,2 @@
 # Locally computed:
 sha256	abfb4c7e7728e86ba374c2e0ef7de912594eb24a8c44935457352df844530238	openzwave-V1.5.tar.gz
-sha256	98851964fd8de3dd40f00d0032b47c61c17a4cf789ad5792e14149da5ab8755e	599e2a11c6f48dde744012ec45686c08e15f3059.patch
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index a632468..38515e3 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -13,12 +13,6 @@ OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 OPENZWAVE_DEPENDENCIES = host-pkgconf udev
 OPENZWAVE_INSTALL_STAGING = YES
 
-# This patch fixes incorrect default value of LIBDIR:
-# http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
-# This patch is currently in dev branch and will be a part of v1.6
-OPENZWAVE_PATCH = \
-	https://github.com/OpenZWave/open-zwave/commit/599e2a11c6f48dde744012ec45686c08e15f3059.patch
-
 # Set instlibdir to install libopenzwave.so* in the correct directory
 # otherwise openzwave will check that /lib64 exists (on the host) to
 # know if the library should be installed in $(PREFIX)/lib or $(PREFIX)/lib64.
