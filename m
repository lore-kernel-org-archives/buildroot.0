From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 20:52:14 +0200
Subject: [Buildroot] [git commit] libgcrypt: bump to version 1.5.2
Message-ID: <20130423190644.BB7799B13A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5dfb4de46d2855c6c02bc55a670b783789db28f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also work around a build failure for ARM thumb mode which was also
present in the previous versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgcrypt/libgcrypt.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b7c2742..6a3bc7c 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBGCRYPT_VERSION = 1.5.0
+LIBGCRYPT_VERSION = 1.5.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
@@ -19,6 +19,11 @@ LIBGCRYPT_CONF_OPT = \
 	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+# Code doesn't build in thumb mode
+ifeq ($(BR2_arm),y)
+	LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
+endif
+
 # Tests use fork()
 define LIBGCRYPT_DISABLE_TESTS
 	$(SED) 's/ tests//' $(@D)/Makefile.in
