From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:48:56 +0200
Subject: [Buildroot] [git commit] package: share downloaded files for big
 packages
Message-ID: <20180402154921.7DA0D8127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f3c77245982c00c2c76b8e3a57a62123e74d522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Theses packages are given as an example of the use of the *_DL_SUBDIR feature.
There maybe other packages that would benefit from that feature, they
would need to be added on a case by case basis.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk       | 2 ++
 package/gcc/gcc-initial/gcc-initial.mk   | 5 +++++
 package/linux-headers/linux-headers.mk   | 3 +++
 package/mesa3d-headers/mesa3d-headers.mk | 1 +
 4 files changed, 11 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 213f3d7b66..b7b27aec13 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -8,6 +8,8 @@ GCC_FINAL_VERSION = $(GCC_VERSION)
 GCC_FINAL_SITE = $(GCC_SITE)
 GCC_FINAL_SOURCE = $(GCC_SOURCE)
 
+HOST_GCC_FINAL_DL_SUBDIR = gcc
+
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index c476b2faeb..9b20eb18f9 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -8,6 +8,11 @@ GCC_INITIAL_VERSION = $(GCC_VERSION)
 GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
+# We do not have a 'gcc' package per-se; we only have two incarnations,
+# gcc-initial and gcc-final. gcc-initial is just am internal step that
+# users should not care about, while gcc-final is the one they shall see.
+HOST_GCC_INITIAL_DL_SUBDIR = gcc
+
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index f1e3790608..954c6b7978 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -82,6 +82,9 @@ endif
 
 endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
 
+# linux-headers really is the same as the linux package
+LINUX_HEADERS_DL_SUBDIR = linux
+
 LINUX_HEADERS_LICENSE = GPL-2.0
 LINUX_HEADERS_LICENSE_FILES = COPYING
 
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b48d965d8a..19d1c6fdf1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -15,6 +15,7 @@ endif
 MESA3D_HEADERS_VERSION = 18.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
+MESA3D_HEADERS_DL_SUBDIR = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.html
 
