From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 14 Mar 2017 09:36:08 +0100
Subject: [Buildroot] [PATCH] package/libscrypt: Allow the package makefile
	to add -fPIC to CFLAGS
Message-ID: <20170314083608.25519-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b25/b256d003d841e492da073788198203e7cbc834cf/

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 ...g-options-to-CFLAGS-and-LDFLAGS-variables.patch | 31 ++++++++++++++++++++++
 package/libscrypt/libscrypt.mk                     |  7 -----
 2 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100644 package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch

diff --git a/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch b/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch
new file mode 100644
index 0000000..f6fe3ca
--- /dev/null
+++ b/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch
@@ -0,0 +1,31 @@
+From c04c358bfaa506c47772740ed040be36a92d8a6f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Tue, 14 Mar 2017 09:23:51 +0100
+Subject: [PATCH] Allow adding options to CFLAGS and LDFLAGS variables.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
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
+2.9.3
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
-- 
2.9.3
