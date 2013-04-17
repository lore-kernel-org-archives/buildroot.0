From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 23:00:21 +0200
Subject: [Buildroot] [git commit] openssl: add host variant
Message-ID: <20130421211400.986289B783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7842789cb539b6b64d61b03f5c8dbe6813f01da7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Useful for the upcoming host-python-m2crypto package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 7701d51..8486c44 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -46,6 +46,18 @@ ifeq ($(BR2_x86_i386),y)
 	OPENSSL_TARGET_ARCH = generic32 386
 endif
 
+define HOST_OPENSSL_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		./config \
+		--prefix=/usr \
+		--openssldir=/etc/ssl \
+		--libdir=/lib \
+		shared \
+		no-zlib \
+	)
+endef
+
 define OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -69,6 +81,10 @@ define OPENSSL_CONFIGURE_CMDS
 	$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
 endef
 
+define HOST_OPENSSL_BUILD_CMDS
+	$(MAKE1) -C $(@D)
+endef
+
 define OPENSSL_BUILD_CMDS
 	$(MAKE1) -C $(@D)
 endef
@@ -77,6 +93,10 @@ define OPENSSL_INSTALL_STAGING_CMDS
 	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 endef
 
+define HOST_OPENSSL_INSTALL_CMDS
+	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(HOST_DIR) install
+endef
+
 define OPENSSL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 endef
@@ -124,3 +144,4 @@ define OPENSSL_UNINSTALL_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
