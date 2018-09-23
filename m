From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Sep 2018 07:22:34 +0300
Subject: [Buildroot] [PATCH 1/2] monkey: switch to cmake package
Message-ID: <f0cb06bc463b44e6fdfcbde7049e41c4814839ef.1537676555.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.6.x the configure script is a wrapper around cmake. Use
cmake directly since we want to make sure that cmake is available.

monkey no longer provides the libmonkey.so shared library. Remove the
BR2_PACKAGE_MONKEY_SHARED option.

Fixes:
http://autobuild.buildroot.net/results/b07/b077720c16857b752f4f38b73619a6a62862f35f/
http://autobuild.buildroot.net/results/799/799bcbd332f254fbf3d3547e5e52ac9463d58bcc/
http://autobuild.buildroot.net/results/3b0/3b095ca77a900af724fbc79d9cc20cbb9931fe15/

Cc: Morgan Delestre <m.delestre@sinters.fr>
Cc: David Pierret <david.pierret@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/monkey/Config.in |  6 -----
 package/monkey/monkey.mk | 49 +++++++---------------------------------
 2 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/package/monkey/Config.in b/package/monkey/Config.in
index fdfa1481e4ce..32a95ee62336 100644
--- a/package/monkey/Config.in
+++ b/package/monkey/Config.in
@@ -11,12 +11,6 @@ config BR2_PACKAGE_MONKEY
 
 if BR2_PACKAGE_MONKEY
 
-config BR2_PACKAGE_MONKEY_SHARED
-	bool "install shared library"
-	help
-	  Build Monkey as a shared library in addition to stand-alone
-	  server
-
 config BR2_PACKAGE_MONKEY_SSL
 	bool "enable SSL/TLS"
 	select BR2_PACKAGE_MBEDTLS
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index b75765553bb0..6159f5522eab 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -15,58 +15,25 @@ MONKEY_LICENSE_FILES = LICENSE
 # infrastructure.
 
 MONKEY_CONF_OPTS = \
-	--prefix=/usr \
-	--sysconfdir=/etc/monkey \
-	--webroot=/var/www \
-	--mandir=/usr/share/man \
-	--logdir=/var/log \
-	--pidfile=/var/run \
-	--malloc-libc
+	-DINSTALL_SYSCONFDIR=/etc/monkey \
+	-DINSTALL_WEBROOTDIR=/var/www \
+	-DWITH_SYSTEM_MALLOC=1
 
-# --uclib-mode is not a typo
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-MONKEY_CONF_OPTS += --uclib-mode --no-backtrace
+MONKEY_CONF_OPTS += -DWITH_UCLIB=1 -DWITH_BACKTRACE=0
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-MONKEY_CONF_OPTS += --musl-mode --no-backtrace
-endif
-
-ifeq ($(BR2_PACKAGE_MONKEY_SHARED),y)
-MONKEY_CONF_OPTS += --enable-shared
-MONKEY_INSTALL_STAGING = YES
-else
-# Even without --enable-shared, the monkey build system leaves a
-# broken libmonkey.so symbolic link.
-define MONKEY_REMOVE_DANGLING_SYMLINK
-	$(RM) -f $(TARGET_DIR)/usr/lib/libmonkey.so
-endef
-MONKEY_POST_INSTALL_TARGET_HOOKS += MONKEY_REMOVE_DANGLING_SYMLINK
+MONKEY_CONF_OPTS += -DWITH_MUSL=1 -DWITH_BACKTRACE=0
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MONKEY_CONF_OPTS += --debug
+MONKEY_CONF_OPTS += -DWITH_DEBUG=1
 endif
 
 ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
-MONKEY_CONF_OPTS += --enable-plugins=tls --mbedtls-shared
+MONKEY_CONF_OPTS += -DWITH_PLUGINS=tls -DWITH_MBEDTLS_SHARED=1
 MONKEY_DEPENDENCIES += mbedtls
 endif
 
-define MONKEY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MONKEY_CONF_OPTS))
-endef
-
-define MONKEY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define MONKEY_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
-endef
-
-define MONKEY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.19.0
