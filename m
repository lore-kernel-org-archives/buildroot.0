From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 23:05:49 +0200
Subject: [Buildroot] [PATCH 2/5] nodejs: force python interpreter
In-Reply-To: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
References: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1397509552-5278-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs build system is based on python, and it does not support python3.

This patch makes sure python2 is used for the build.

Note that, setting PYTHON=... at configure time or in the make
environment is not enough to override all the hard-coded python call, so
we have to sed some python scripts to avoid being screwed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/nodejs/nodejs.mk | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0d84765..0b8e285 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -17,6 +17,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	NODEJS_DEPENDENCIES += openssl
 endif
 
+# nodejs build system is based on python, but only support python-2.6 or
+# python-2.7. So, we have to enforce PYTHON interpreter to be python2.
+# However, few build scripts hard-code 'python' as the interpreter to be
+# invoked; so we have to manually fix them.
 define HOST_NODEJS_CONFIGURE_CMDS
 	# Build with the static, built-in OpenSSL which is supplied as part of
 	# the nodejs source distribution.  This is needed on the host because
@@ -26,20 +30,23 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure \
+		PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=$(HOST_DIR)/usr \
 		--without-snapshot \
 		--without-dtrace \
 		--without-etw \
 	)
+	$(SED) "s@'python',@'$(HOST_DIR)/usr/bin/python2',@" \
+		$(@D)/deps/v8/tools/gyp/v8.gyp
 endef
 
 define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 $(MAKE) -C $(@D)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 $(MAKE) -C $(@D) install
 endef
 
 ifeq ($(BR2_i386),y)
@@ -66,7 +73,8 @@ define NODEJS_CONFIGURE_CMDS
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
-		./configure \
+		PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
 		--without-snapshot \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
@@ -77,10 +85,13 @@ define NODEJS_CONFIGURE_CMDS
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
 		--dest-os=linux \
 	)
+	$(SED) "s@'python',@'$(HOST_DIR)/usr/bin/python2',@" \
+		$(@D)/deps/v8/tools/gyp/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -116,7 +127,8 @@ endef
 endif
 
 define NODEJS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-- 
1.9.2
