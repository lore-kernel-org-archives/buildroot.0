From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:12:46 +0100
Subject: [Buildroot] [git commit] package/libscrypt: add patch to fix
	CFLAGS/LDFLAGS passing
Message-ID: <20170314222028.230D182536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ac1a2b1baeccc25999c033219df4194ff371c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because Buildroot passes its own CFLAGS/LDFLAGS, this was overriding
the ones from the package Makefile, leading to build failures because
-fPIC was no longer being passed.

This commit fixes that by adding a patch that allows to keep the
package CFLAGS while passing additional ones through the make command
line. While doing this, it also removes a few hardcoded optimization
and hardening flags, leaving it to Buildroot to decide whether they
should be passed or not. This makes the workaround for stack protector
no longer needed.

Fixes:

  http://autobuild.buildroot.net/results/b25/b256d003d841e492da073788198203e7cbc834cf/

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[Thomas: tweak commit log and patch description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...g-options-to-CFLAGS-and-LDFLAGS-variables.patch | 34 ++++++++++++++++++++++
 package/libscrypt/libscrypt.mk                     |  7 -----
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch b/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch
new file mode 100644
index 0000000..a023a6f
--- /dev/null
+++ b/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch
@@ -0,0 +1,34 @@
+From 097c5d9248f4afd34c73de5aba01a143ef784257 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Tue, 14 Mar 2017 09:23:51 +0100
+Subject: [PATCH] Allow adding options to CFLAGS and LDFLAGS variables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This also removes a number of hard-coded CFLAGS, leaving it up to the
+user to pass appropriate optimization/hardening flags.
+
+Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7022a4a..3098a9a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,8 +5,8 @@ MAKE_DIR     ?= install -d
+ INSTALL_DATA ?= install
+ 
+ CC?=gcc
+-CFLAGS?=-O2 -Wall -g -D_FORTIFY_SOURCE=2 -fstack-protector -fPIC
+-LDFLAGS?=-Wl,-z,now -Wl,-z,relro -Wl,-soname,libscrypt.so.0 -Wl,--version-script=libscrypt.version
++override CFLAGS+=-fPIC
++override LDFLAGS+=-Wl,-z,now -Wl,-z,relro -Wl,-soname,libscrypt.so.0 -Wl,--version-script=libscrypt.version
+ CFLAGS_EXTRA?=-Wl,-rpath=.
+ 
+ all: reference
+-- 
+2.7.4
+
diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index 8f72d67..5326b22 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -10,13 +10,6 @@ LIBSCRYPT_LICENSE = BSD-2c
 LIBSCRYPT_LICENSE_FILES = LICENSE
 LIBSCRYPT_INSTALL_STAGING = YES
 
-ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
-define LIBSCRYPT_DISABLE_STACK_PROTECTOR
-	$(SED) 's/-fstack-protector//g' $(@D)/Makefile
-endef
-LIBSCRYPT_POST_PATCH_HOOKS += LIBSCRYPT_DISABLE_STACK_PROTECTOR
-endif
-
 define LIBSCRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
