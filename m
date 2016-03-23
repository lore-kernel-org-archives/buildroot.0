From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Mar 2016 16:24:31 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.4.0
Message-ID: <1458761071-27389-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libaio support is now automatic so drop the enable/disable (it will fall
back to pthread aio if libaio is not present).

0002-build-improve-stack-protector-check.patch is upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0002-build-improve-stack-protector-check.patch | 56 ----------------------
 package/samba4/samba4.hash                         |  2 +-
 package/samba4/samba4.mk                           | 10 +---
 3 files changed, 3 insertions(+), 65 deletions(-)
 delete mode 100644 package/samba4/0002-build-improve-stack-protector-check.patch

diff --git a/package/samba4/0002-build-improve-stack-protector-check.patch b/package/samba4/0002-build-improve-stack-protector-check.patch
deleted file mode 100644
index 51ffc04..0000000
--- a/package/samba4/0002-build-improve-stack-protector-check.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From e4ef92852023f4e2f192d3c47220dc75930a615c Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 11 Sep 2015 16:41:31 -0300
-Subject: [PATCH] build: improve stack protector check
-
-Testing a toolchain for proper -fstack-protector must go beyond ensuring
-the compiler and linker accept the option.
-If the test C program does nothing with the stack then guards aren't
-inserted and/or are optimized away giving the false impression that it
-works when in fact the libc might not support it.
-
-Update the check to a program that uses the stack, hence making a link
-fail if proper support isn't available, for example in non-ssp enabled
-uclibc toolchains like this:
-
-test.c:(.text.startup+0x64): undefined reference to `__stack_chk_fail'
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- buildtools/wafsamba/samba_autoconf.py | 20 +++++++++++++++++---
- 1 file changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
-index c5f132c..ef34b00 100644
---- a/buildtools/wafsamba/samba_autoconf.py
-+++ b/buildtools/wafsamba/samba_autoconf.py
-@@ -657,9 +657,23 @@ def SAMBA_CONFIG_H(conf, path=None):
-     if not IN_LAUNCH_DIR(conf):
-         return
- 
--    if conf.CHECK_CFLAGS(['-fstack-protector']) and conf.CHECK_LDFLAGS(['-fstack-protector']):
--        conf.ADD_CFLAGS('-fstack-protector')
--        conf.ADD_LDFLAGS('-fstack-protector')
-+    # we need to build real code that can't be optimized away to test
-+    if conf.check(fragment='''
-+        #include <stdio.h>
-+
-+        int main(void)
-+        {
-+            char t[100000];
-+            while (fgets(t, sizeof(t), stdin));
-+            return 0;
-+        }
-+        ''',
-+        execute=0,
-+        ccflags='-fstack-protector',
-+        ldflags='-fstack-protector',
-+        msg='Checking if toolchain accepts -fstack-protector'):
-+            conf.ADD_CFLAGS('-fstack-protector')
-+            conf.ADD_LDFLAGS('-fstack-protector')
- 
-     if Options.options.debug:
-         conf.ADD_CFLAGS('-g', testflags=True)
--- 
-2.4.6
-
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d8458e6..95d111d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3251eca5b196854e79978f4a92d5fd2b55bd7b0a252a65131a9be02be6754924	samba-4.3.6.tar.gz
+sha256	c5f6fefb7fd0a4e5f404a253b19b55f74f88faa1c3612cb3329e24aa03470075	samba-4.4.0.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0fa70a5..9f7b11d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.6
+SAMBA4_VERSION = 4.4.0
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
@@ -13,6 +13,7 @@ SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-python \
 	e2fsprogs popt python zlib \
+	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline)
@@ -32,13 +33,6 @@ else
 SAMBA4_CONF_OPTS += --disable-cups
 endif
 
-ifeq ($(BR2_PACKAGE_LIBAIO),y)
-SAMBA4_CONF_OPTS += --with-aio-support
-SAMBA4_DEPENDENCIES += libaio
-else
-SAMBA4_CONF_OPTS += --without-aio-support
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
 SAMBA4_CONF_OPTS += --enable-avahi
 SAMBA4_DEPENDENCIES += avahi
-- 
2.7.3
