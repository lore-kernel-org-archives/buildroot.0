From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Sep 2013 14:16:17 +0200
Subject: [Buildroot] [git commit] civetweb: fix static linking with openssl
Message-ID: <20130924121819.D22399B85D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cf5b3019118cdc980666d7a1ccfd29f658d0261
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/acf/acfefc4f0f23ef646094ec427c9502eab7b86736/

Corrects a number of issues with the openssl handling:
 - Libraries have to be listed after the object files using them, so pass
   openssl linker statements in LIBS rather than COPT
 - Openssl support library is libcrypto, not libcrypt
 - Openssl need zlib

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/civetweb/civetweb.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index e468563..171ad0c 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -11,6 +11,7 @@ CIVETWEB_LICENSE_FILES = LICENSE.md
 
 CIVETWEB_CONF_OPT = TARGET_OS=LINUX
 CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
+CIVETWEB_LIBS = -lpthread -lm -ldl
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
@@ -27,7 +28,8 @@ ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	CIVETWEB_COPT += -DNO_SSL_DL -lcrypt -lssl
+	CIVETWEB_COPT += -DNO_SSL_DL
+	CIVETWEB_LIBS += -lssl -lcrypto -lz
 	CIVETWEB_DEPENDENCIES += openssl
 else
 	CIVETWEB_COPT += -DNO_SSL
@@ -36,7 +38,7 @@ endif
 define CIVETWEB_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) build \
 		$(CIVETWEB_CONF_OPT) \
-		COPT="$(CIVETWEB_COPT)"
+		COPT="$(CIVETWEB_COPT)" LIBS="$(CIVETWEB_LIBS)"
 endef
 
 define CIVETWEB_INSTALL_TARGET_CMDS
