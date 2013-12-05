From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 00:10:09 +0100
Subject: [Buildroot] [git commit] package/openssl: fix coding style
Message-ID: <20131205231349.77F5A9B92F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a17ec1645d0f9e1d6acc6a50c9b84e0c280ac4f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, openssl defines three conditional hooks, but two do not
follow our coding rules:
  - for PRE_CONFIGURE, the hook is defined in the if-block, but
    the _HOOK variable is always set
  - for POST_INSTALL_TARGET, the hook is always defined, but the
    _HOOK variable is set in the if-block

Fix that:
  - define the hook in the if-block
  - assign the _HOOK variable in the if-block

At the same time, get rid of extra empty lines that make it more
difficult to read.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 5416141..30f8057 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -19,9 +19,8 @@ define OPENSSL_DISABLE_APPS
 	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
 	$(SED) '/^DIRS=/ s/apps//' $(@D)/Makefile.org
 endef
-endif
-
 OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
+endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
@@ -111,23 +110,19 @@ define OPENSSL_INSTALL_TARGET_CMDS
 endef
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-
 # libraries gets installed read only, so strip fails
 define OPENSSL_INSTALL_FIXUPS_SHARED
 	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
 	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
 	do chmod +w $$i; done
 endef
-
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS_SHARED
-
 endif
 
+ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 define OPENSSL_REMOVE_OPENSSL_ENGINES
 	rm -rf $(TARGET_DIR)/usr/lib/engines
 endef
-
-ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_ENGINES
 endif
 
