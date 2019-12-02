From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:52 -0000
Subject: [Buildroot] [git commit] package/dtc: bump version to 1.5.1
Message-ID: <20191202083933.1038D81055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=870fc9be27e411d1ce0519069e3b73f4f435efcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated patch 1 to handle changed context.
Removed patch 2 which is now upstream.

The update allows QEMU's configure script to successfully detect libfdt.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...de-guards-for-older-kernel-u-boot-sources.patch | 19 +++++++----
 .../0002-Makefile-Add-EXTRA_CFLAGS-variable.patch  | 37 ----------------------
 package/dtc/dtc.hash                               |  2 +-
 package/dtc/dtc.mk                                 |  2 +-
 4 files changed, 14 insertions(+), 46 deletions(-)

diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
index bff5f4c07a..127114e866 100644
--- a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
+++ b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
@@ -15,6 +15,8 @@ Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
 [ThomasDS: also update fdt.h which has the same issue, seen on U-Boot
 2011.03]
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+[SB: Updated to match context change in v1.5.1]
+Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
 ---
  libfdt/fdt.h        | 4 ++++
  libfdt/libfdt.h     | 4 ++++
@@ -22,10 +24,11 @@ Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
  3 files changed, 12 insertions(+)
 
 diff --git a/libfdt/fdt.h b/libfdt/fdt.h
-index 74961f9..2904f48 100644
+index f2e6880..0f1dc4d 100644
 --- a/libfdt/fdt.h
 +++ b/libfdt/fdt.h
-@@ -1,3 +1,7 @@
+@@ -1,4 +1,8 @@
+ /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
 +#ifdef _FDT_H
 +#warning "Please consider updating your kernel and/or u-boot version"
 +#define FDT_H
@@ -34,10 +37,11 @@ index 74961f9..2904f48 100644
  #define FDT_H
  /*
 diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
-index 830b77e..bef4566 100644
+index 8037f39..7668432 100644
 --- a/libfdt/libfdt.h
 +++ b/libfdt/libfdt.h
-@@ -1,3 +1,7 @@
+@@ -1,4 +1,8 @@
+ /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
 +#ifdef _LIBFDT_H
 +#warning "Please consider updating your kernel and/or u-boot version"
 +#define LIBFDT_H
@@ -46,10 +50,11 @@ index 830b77e..bef4566 100644
  #define LIBFDT_H
  /*
 diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
-index eb20538..6a61e6a 100644
+index 73b6d40..b95a287 100644
 --- a/libfdt/libfdt_env.h
 +++ b/libfdt/libfdt_env.h
-@@ -1,3 +1,7 @@
+@@ -1,4 +1,8 @@
+ /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
 +#ifdef _LIBFDT_ENV_H
 +#warning "Please consider updating your kernel and/or u-boot version"
 +#define LIBFDT_ENV_H
@@ -58,5 +63,5 @@ index eb20538..6a61e6a 100644
  #define LIBFDT_ENV_H
  /*
 -- 
-2.19.2
+2.22.0.216.g00a2a96fc9
 
diff --git a/package/dtc/0002-Makefile-Add-EXTRA_CFLAGS-variable.patch b/package/dtc/0002-Makefile-Add-EXTRA_CFLAGS-variable.patch
deleted file mode 100644
index b3f14a6991..0000000000
--- a/package/dtc/0002-Makefile-Add-EXTRA_CFLAGS-variable.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f7c659d7daff5dbf4a0be959a544f15eab7fc49c Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Mon, 22 Jul 2019 12:21:49 +0930
-Subject: [PATCH] Makefile: Add EXTRA_CFLAGS variable
-
-Distributions packaging dtc may need to set extra flags. Currently when
-they do that it overrides the ones set by the makefile. This is
-particularly problematic when compiling without yaml, as the yaml
-detection is ignored.
-
- ld: dtc.o: in function `main':
- dtc.c:(.text.startup+0x718): undefined reference to `dt_to_yaml'
-
-This patch provides a EXTRA_CFLAGS variable that is added to the list of
-CFLAGS, and can be set on the command line when packaging.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index e6b32cf1cbf5..6807669569b3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
- CPPFLAGS = -I libfdt -I .
- WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
- 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
--CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS)
-+CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
- 
- BISON = bison
- LEX = flex
--- 
-2.20.1
-
diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 4d0aaea601..3adfcc45a9 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256 c672e443c9f7e39f5a7c8e602da6777f9ad55ad70de87de300a43828c8050172  dtc-1.5.0.tar.xz
+sha256 660b74039690fc37013660544d09191834efb58503c73c555c5513ba75ab031f  dtc-1.5.1.tar.xz
 
 # Hash for license files
 sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 76106519e5..fd822846dc 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.5.0
+DTC_VERSION = 1.5.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
