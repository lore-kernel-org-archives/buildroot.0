Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429ACC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD89B60BAB;
	Sun,  9 Jan 2022 16:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTV1DlKrewXy; Sun,  9 Jan 2022 16:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36CF60BA4;
	Sun,  9 Jan 2022 16:26:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA52B1BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B673E40586
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yV45r3oFxa59 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:26:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AECF640471
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:26:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CAF9882DEC; Sun,  9 Jan 2022 16:20:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 17:24:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2e1a39a203c5476fb464d8ec164a9c6b0fc4aa0
X-Git-Newrev: 5ad7eb6c61d281912a8c692f0b69d46726394b10
X-Patchwork-Hint: ignore
Message-Id: <20220109162027.CAF9882DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: force host-python3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ad7eb6c61d281912a8c692f0b69d46726394b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of nodejs fails if python 3.10 is installed on host.
As suggested by Arnout in
https://bugs.buildroot.org/show_bug.cgi?id=14451, use the same
workaround than in qt5webkit to force host-python3 (which is in version
3.9)

It should be noted that python 3.10 support has been added in version
14.18.2: https://github.com/nodejs/node/releases/tag/v14.18.2

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14451

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 54 ++++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 44bf786dfd..7d5c93eb93 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -27,6 +27,30 @@ NODEJS_CONF_OPTS = \
 	--cross-compiling \
 	--dest-os=linux
 
+HOST_NODEJS_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
+	LDFLAGS.host="$(HOST_LDFLAGS)" \
+	NO_LOAD=cctest.target.mk \
+	PATH=$(@D)/bin:$(BR_PATH)
+
+NODEJS_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	NO_LOAD=cctest.target.mk \
+	PATH=$(@D)/bin:$(BR_PATH) \
+	LDFLAGS="$(NODEJS_LDFLAGS)" \
+	LD="$(TARGET_CXX)"
+
+# nodejs's build system uses python which can be a symlink to an unsupported
+# python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
+# forcing host-python3 early in the PATH, via a python->python3 symlink.
+define NODEJS_PYTHON3_SYMLINK
+	mkdir -p $(@D)/bin
+	ln -sf $(HOST_DIR)/bin/python3 $(@D)/bin/python
+endef
+HOST_NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
+NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NODEJS_DEPENDENCIES += openssl
 NODEJS_CONF_OPTS += --shared-openssl
@@ -75,21 +99,13 @@ HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
-		$(HOST_CONFIGURE_OPTS) \
-		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-		LDFLAGS.host="$(HOST_LDFLAGS)" \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH)
+		$(HOST_NODEJS_MAKE_OPTS)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
-		$(HOST_CONFIGURE_OPTS) \
-		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-		LDFLAGS.host="$(HOST_LDFLAGS)" \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH)
+		$(HOST_NODEJS_MAKE_OPTS)
 
 	$(foreach f,$(NODEJS_HOST_TOOLS), \
 		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
@@ -195,11 +211,7 @@ endef
 define NODEJS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
-		$(TARGET_CONFIGURE_OPTS) \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)"
+		$(NODEJS_MAKE_OPTS)
 endef
 
 #
@@ -236,22 +248,14 @@ define NODEJS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(STAGING_DIR) \
-		$(TARGET_CONFIGURE_OPTS) \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)"
+		$(NODEJS_MAKE_OPTS)
 endef
 
 define NODEJS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
-		$(TARGET_CONFIGURE_OPTS) \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)"
+		$(NODEJS_MAKE_OPTS)
 	$(NODEJS_INSTALL_MODULES)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
