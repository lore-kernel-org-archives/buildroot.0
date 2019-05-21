From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 21 May 2019 07:56:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ofono: bump to version 1.29
Message-ID: <20190521055644.11708-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport upstream patch which adds explicit_bzero() autoconf detection,
which fixes br-arm-cortex-a9-glibc and br-arm-full-static build:

In file included from ell/random.c:34:
ell/missing.h:59:20: error: static declaration of ?explicit_bzero? follows non-static declaration
 static inline void explicit_bzero(void *s, size_t n)
                    ^~~~~~~~~~~~~~
In file included from ./ell/util.h:26,
                 from ell/private.h:26,
                 from ell/random.c:33:
/home/pvorel/br-test-pkg/br-arm-cortex-a9-glibc/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/string.h:435:13: note: previous declaration of ?explicit_bzero? was here
 extern void explicit_bzero (void *__s, size_t __n) __THROW __nonnull ((1));
             ^~~~~~~~~~~~~~

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...Add-check-for-explicit_bzero-support.patch | 28 +++++++++++++++++++
 package/ofono/ofono.hash                      |  2 +-
 package/ofono/ofono.mk                        |  5 +++-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch

diff --git a/package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch b/package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch
new file mode 100644
index 0000000000..b2507df3ff
--- /dev/null
+++ b/package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch
@@ -0,0 +1,28 @@
+From dff595671bf5a46f7c9231966a6cd7d2a0183076 Mon Sep 17 00:00:00 2001
+From: Marcel Holtmann <marcel@holtmann.org>
+Date: Wed, 15 May 2019 09:39:44 +0200
+Subject: [PATCH] build: Add check for explicit_bzero support
+
+Upstream: dff595671bf5a46f7c9231966a6cd7d2a0183076
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index bacb7ac5..cad35c5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,8 @@ AC_ARG_ENABLE(pie, AC_HELP_STRING([--enable-pie],
+ 	fi
+ ])
+ 
++AC_CHECK_FUNCS(explicit_bzero)
++
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+ 
+-- 
+2.21.0
+
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 2dbb9986c7..5204bb4fca 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 93bb2cedef54f897dd5200e22b072a6e38b5d9b44be57eebbbe8d513f0beb0e4	ofono-1.28.tar.xz
+sha256 67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679  ofono-1.29.tar.xz
 # Locally computed
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 0552a181fd..176d23ae05 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.28
+OFONO_VERSION = 1.29
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
@@ -49,4 +49,7 @@ else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
+# required by 0003-build-Add-check-for-explicit_bzero-support.patch
+OFONO_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.21.0
