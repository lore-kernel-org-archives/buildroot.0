From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Sep 2015 17:01:53 -0300
Subject: [Buildroot] [PATCH] samba: bump to version 4.3.0
Message-ID: <1442001713-9454-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New patch status: sent upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0002-build-improve-stack-protector-check.patch | 56 ++++++++++++++++++++++
 package/samba4/samba4.hash                         |  2 +-
 package/samba4/samba4.mk                           |  4 +-
 3 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 package/samba4/0002-build-improve-stack-protector-check.patch

diff --git a/package/samba4/0002-build-improve-stack-protector-check.patch b/package/samba4/0002-build-improve-stack-protector-check.patch
new file mode 100644
index 0000000..51ffc04
--- /dev/null
+++ b/package/samba4/0002-build-improve-stack-protector-check.patch
@@ -0,0 +1,56 @@
+From e4ef92852023f4e2f192d3c47220dc75930a615c Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 11 Sep 2015 16:41:31 -0300
+Subject: [PATCH] build: improve stack protector check
+
+Testing a toolchain for proper -fstack-protector must go beyond ensuring
+the compiler and linker accept the option.
+If the test C program does nothing with the stack then guards aren't
+inserted and/or are optimized away giving the false impression that it
+works when in fact the libc might not support it.
+
+Update the check to a program that uses the stack, hence making a link
+fail if proper support isn't available, for example in non-ssp enabled
+uclibc toolchains like this:
+
+test.c:(.text.startup+0x64): undefined reference to `__stack_chk_fail'
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ buildtools/wafsamba/samba_autoconf.py | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
+index c5f132c..ef34b00 100644
+--- a/buildtools/wafsamba/samba_autoconf.py
++++ b/buildtools/wafsamba/samba_autoconf.py
+@@ -657,9 +657,23 @@ def SAMBA_CONFIG_H(conf, path=None):
+     if not IN_LAUNCH_DIR(conf):
+         return
+ 
+-    if conf.CHECK_CFLAGS(['-fstack-protector']) and conf.CHECK_LDFLAGS(['-fstack-protector']):
+-        conf.ADD_CFLAGS('-fstack-protector')
+-        conf.ADD_LDFLAGS('-fstack-protector')
++    # we need to build real code that can't be optimized away to test
++    if conf.check(fragment='''
++        #include <stdio.h>
++
++        int main(void)
++        {
++            char t[100000];
++            while (fgets(t, sizeof(t), stdin));
++            return 0;
++        }
++        ''',
++        execute=0,
++        ccflags='-fstack-protector',
++        ldflags='-fstack-protector',
++        msg='Checking if toolchain accepts -fstack-protector'):
++            conf.ADD_CFLAGS('-fstack-protector')
++            conf.ADD_LDFLAGS('-fstack-protector')
+ 
+     if Options.options.debug:
+         conf.ADD_CFLAGS('-g', testflags=True)
+-- 
+2.4.6
+
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e2b3969..d242f94 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b6dfa5ae4818d891ee2fcff04a5912f4a4fb2394b4f5e66a2a15b428da094c7c	samba-4.2.3.tar.gz
+sha256	d8dbb6b29dec1d9aa295655c4aa4eadd1e5367ef7047be22f4d6a18ba8acdb63	samba-4.3.0.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c88cc9f..6f3fb58 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.2.3
-SAMBA4_SITE = http://ftp.samba.org/pub/samba
+SAMBA4_VERSION = 4.3.0
+SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPLv3+
-- 
2.4.6
