Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F48FC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B6860D72;
	Sun, 25 Sep 2022 20:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B6860D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mU46lJM_780w; Sun, 25 Sep 2022 20:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B29960E03;
	Sun, 25 Sep 2022 20:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B29960E03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9DA1BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53A27826C2
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A27826C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CMenIfNax1O for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:40:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B70801EC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8B70801EC
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:40:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C6F1C20003;
 Sun, 25 Sep 2022 20:40:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sun, 25 Sep 2022 22:40:28 +0200
Message-Id: <20220925204030.1661583-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664138439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cXOVFCPhjghwPhJEK6bXUeldPn2RW/0d0qeCMDOHWE=;
 b=TwEAlQxw2EbRWHgVXAL5KCGgLNKuqRnxn0KsSRZrXeq3mCX0vXfs21k4Qo4LVuA3j2pLat
 CZ9mUcaIhghno3yuyr5f9azMAfoYE1Hi347ePzWgCOv90/zpqgZyDRprWhiL88KAwmyCul
 D4hzGW4OpRynA5BP/2IH0RTLa5fLAvm2QQsmo8dNRR43e6+GigVSujZnqNJABZwuKUuNwZ
 HK8ned6+ZVTx8jvhU7LNrbzEq0pIv2Lzi3RdBJDtrvQwoQEs1m2fjc1FYfXJxga3jg1gsu
 0XZ8ZEP26smpOU2CWbxE5y3xzys3pbZRAkhgUceu4IpWk8fmMXdHem9iArg3QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TwEAlQxw
Subject: [Buildroot] [PATCH RFC 3/4] package/nodejs: make host package a
 virtual package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-nodejs is quite long to build (5 minutes on a very fast build
machine), and will become a download dependency when we implement
vendoring for NodeJS-based packages.

In order to mitigate this build time, an idea is to use a pre-compiled
host NodeJS. One option would be to use a pre-installed NodeJS, but
we're concerned by version compatibility issues of the host NodeJS/NPM
does not have the same version as the target NodeJS/NPM. So another
option is to use a pre-compiled NodeJS provided by the NodeJS project
itself.

To achieve this, this commit turns the host-nodejs package into a
virtual package, which has two providers:

 - host-nodejs-src, which builds host-nodejs from source. Therefore
   the logic that used to be in package/nodejs/nodejs.mk to build
   host-nodejs from source is moved to
   package/nodejs-src/nodejs-src.mk. It should be noted that the
   patches in package/nodejs are not applied to package/nodejs-src as
   all patches are related to solving target-only issues. However, we
   could certainly think of applying the same patches if need be.

 - host-nodejs-bin, which was introduced in the previous commit, and
   which simply installs a pre-compiled NodeJS.

One possible alternate organization is to have package/nodejs/ contain
all three packages: package/nodejs/nodejs/, package/nodejs/nodejs-src,
package/nodejs/nodejs-bin, which would allow to more easily share a
few common variables (version, license, license files, CPE ID, etc.).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 package/nodejs-bin/nodejs-bin.mk              |  4 +-
 package/{nodejs => nodejs-src}/Config.in.host |  4 +-
 package/nodejs-src/nodejs-src.hash            |  1 +
 package/nodejs-src/nodejs-src.mk              | 72 +++++++++++++++++++
 package/nodejs/Config.in.host                 | 39 ++++++++--
 package/nodejs/nodejs.mk                      | 57 +--------------
 7 files changed, 115 insertions(+), 63 deletions(-)
 copy package/{nodejs => nodejs-src}/Config.in.host (78%)
 create mode 120000 package/nodejs-src/nodejs-src.hash
 create mode 100644 package/nodejs-src/nodejs-src.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 564ab2ae72..d6955ccbb4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2904,6 +2904,7 @@ F:	package/musl-fts/
 F:	package/ne10/
 F:	package/nodejs/
 F:	package/nodejs-bin/
+F:	package/nodejs-src/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
diff --git a/package/nodejs-bin/nodejs-bin.mk b/package/nodejs-bin/nodejs-bin.mk
index 5ebd8760c0..5077458eab 100644
--- a/package/nodejs-bin/nodejs-bin.mk
+++ b/package/nodejs-bin/nodejs-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# keep in sync with package/nodejs/nodejs.mk
+# keep in sync with package/nodejs and package/nodejs-src
 NODEJS_BIN_VERSION = 16.17.1
 NODEJS_BIN_SITE = https://nodejs.org/dist/v$(NODEJS_BIN_VERSION)
 
@@ -26,6 +26,8 @@ NODEJS_BIN_LICENSE_FILES = LICENSE
 NODEJS_BIN_CPE_ID_VENDOR = nodejs
 NODEJS_BIN_CPE_ID_PRODUCT = node.js
 
+HOST_NODEJS_BIN_PROVIDES = host-nodejs
+
 define HOST_NODEJS_BIN_INSTALL_CMDS
 	rsync -a --exclude=CHANGELOG.md --exclude=LICENSE --exclude=README.md \
 		$(@D)/* $(HOST_DIR)/
diff --git a/package/nodejs/Config.in.host b/package/nodejs-src/Config.in.host
similarity index 78%
copy from package/nodejs/Config.in.host
copy to package/nodejs-src/Config.in.host
index f7f2b80a9b..e8f50959de 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs-src/Config.in.host
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_HOST_NODEJS
+config BR2_PACKAGE_HOST_NODEJS_SRC
 	bool "host nodejs"
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_PYTHON3
@@ -10,5 +10,5 @@ config BR2_PACKAGE_HOST_NODEJS
 
 	  http://nodejs.org/
 
-comment "host nodejs needs a host gcc >= 8"
+comment "host nodejs-src needs a host gcc >= 8"
 	depends on !BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/nodejs-src/nodejs-src.hash b/package/nodejs-src/nodejs-src.hash
new file mode 120000
index 0000000000..d719b6629e
--- /dev/null
+++ b/package/nodejs-src/nodejs-src.hash
@@ -0,0 +1 @@
+../nodejs/nodejs.hash
\ No newline at end of file
diff --git a/package/nodejs-src/nodejs-src.mk b/package/nodejs-src/nodejs-src.mk
new file mode 100644
index 0000000000..f62e975c61
--- /dev/null
+++ b/package/nodejs-src/nodejs-src.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# nodejs-src
+#
+################################################################################
+
+# Keep in sync with package/nodejs and package/nodejs-bin
+NODEJS_SRC_VERSION = 16.17.1
+NODEJS_SRC_SOURCE = node-v$(NODEJS_VERSION).tar.xz
+NODEJS_SRC_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
+
+NODEJS_SRC_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
+NODEJS_SRC_LICENSE_FILES = LICENSE
+NODEJS_SRC_CPE_ID_VENDOR = nodejs
+NODEJS_SRC_CPE_ID_PRODUCT = node.js
+
+HOST_NODEJS_SRC_PROVIDES = host-nodejs
+
+HOST_NODEJS_SRC_DEPENDENCIES = \
+	host-icu \
+	host-libopenssl \
+	host-ninja \
+	host-pkgconf \
+	host-python3 \
+	host-zlib
+
+HOST_NODEJS_SRC_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
+	LDFLAGS.host="$(HOST_LDFLAGS)" \
+	NO_LOAD=cctest.target.mk \
+	PATH=$(@D)/bin:$(BR_PATH)
+
+define HOST_NODEJS_SRC_PYTHON3_SYMLINK
+	mkdir -p $(@D)/bin
+	ln -sf $(HOST_DIR)/bin/python3 $(@D)/bin/python
+endef
+HOST_NODEJS_SRC_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
+
+define HOST_NODEJS_SRC_CONFIGURE_CMDS
+	cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH) \
+		PYTHON=$(HOST_DIR)/bin/python3 \
+		$(HOST_DIR)/bin/python3 ./configure \
+		--prefix=$(HOST_DIR) \
+		--without-dtrace \
+		--without-etw \
+		--shared-openssl \
+		--shared-openssl-includes=$(HOST_DIR)/include \
+		--shared-openssl-libpath=$(HOST_DIR)/lib \
+		--shared-zlib \
+		--no-cross-compiling \
+		--with-intl=system-icu \
+		--ninja
+endef
+
+HOST_NODEJS_SRC_CXXFLAGS = $(HOST_CXXFLAGS)
+
+define HOST_NODEJS_SRC_BUILD_CMDS
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
+		$(MAKE) -C $(@D) \
+		$(HOST_NODEJS_MAKE_OPTS)
+endef
+
+define HOST_NODEJS_SRC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
+		$(MAKE) -C $(@D) install \
+		$(HOST_NODEJS_MAKE_OPTS)
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index f7f2b80a9b..8e797cc6f4 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,14 +1,43 @@
+config BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "arm"
+	default y if BR2_HOSTARCH = "ppc64le"
+	default y if BR2_HOSTARCH = "x86_64"
+
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
-	depends on BR2_HOST_GCC_AT_LEAST_8
-	select BR2_PACKAGE_HOST_PYTHON3
-	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
-	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	depends on BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS || \
+		BR2_HOST_GCC_AT_LEAST_8
 	help
 	  Event-driven I/O server-side JavaScript environment based on
 	  V8.
 
 	  http://nodejs.org/
 
-comment "host nodejs needs a host gcc >= 8"
+if BR2_PACKAGE_HOST_NODEJS
+
+choice
+
+config BR2_PACKAGE_HOST_NODEJS_BIN
+	bool "pre-built version"
+	depends on BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
+
+config BR2_PACKAGE_HOST_NODEJS_SRC
+	bool "compile from source"
+	depends on BR2_HOST_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+
+comment "host nodejs from source needs a host gcc >= 8"
 	depends on !BR2_HOST_GCC_AT_LEAST_8
+
+endchoice
+
+endif
+
+config BR2_PACKAGE_PROVIDES_HOST_NODEJS
+	string
+	default "host-nodejs-bin" if BR2_PACKAGE_HOST_NODEJS_BIN
+	default "host-nodejs-src" if BR2_PACKAGE_HOST_NODEJS_SRC
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 05456e3443..1dbe99cec5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Keep in sync with package/nodejs-src and package/nodejs-bin
 NODEJS_VERSION = 16.17.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
@@ -17,13 +18,6 @@ NODEJS_DEPENDENCIES = \
 	nghttp2 \
 	zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = \
-	host-icu \
-	host-libopenssl \
-	host-ninja \
-	host-pkgconf \
-	host-python3 \
-	host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
@@ -41,13 +35,6 @@ NODEJS_CONF_OPTS = \
 	--dest-os=linux \
 	--ninja
 
-HOST_NODEJS_MAKE_OPTS = \
-	$(HOST_CONFIGURE_OPTS) \
-	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-	LDFLAGS.host="$(HOST_LDFLAGS)" \
-	NO_LOAD=cctest.target.mk \
-	PATH=$(@D)/bin:$(BR_PATH)
-
 NODEJS_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	NO_LOAD=cctest.target.mk \
@@ -62,7 +49,6 @@ define NODEJS_PYTHON3_SYMLINK
 	mkdir -p $(@D)/bin
 	ln -sf $(HOST_DIR)/bin/python3 $(@D)/bin/python
 endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
 NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -83,38 +69,6 @@ ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
 endif
 
-define HOST_NODEJS_CONFIGURE_CMDS
-	cd $(@D); \
-		$(HOST_CONFIGURE_OPTS) \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 ./configure \
-		--prefix=$(HOST_DIR) \
-		--without-dtrace \
-		--without-etw \
-		--shared-openssl \
-		--shared-openssl-includes=$(HOST_DIR)/include \
-		--shared-openssl-libpath=$(HOST_DIR)/lib \
-		--shared-zlib \
-		--no-cross-compiling \
-		--with-intl=system-icu \
-		--ninja
-endef
-
-HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
-
-define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) \
-		$(HOST_NODEJS_MAKE_OPTS)
-endef
-
-define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) install \
-		$(HOST_NODEJS_MAKE_OPTS)
-endef
-
 ifeq ($(BR2_i386),y)
 NODEJS_CPU = ia32
 else ifeq ($(BR2_x86_64),y)
@@ -186,13 +140,6 @@ define NODEJS_WRAPPER_FIXUP
 endef
 NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
 
-# Do not run the qemu-wrapper for the host build.
-define HOST_NODEJS_WRAPPER_FIXUP
-	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
-	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
-endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP
-
 define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -265,4 +212,4 @@ endef
 
 # node.js configure is a Python script and does not use autotools
 $(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(host-virtual-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
