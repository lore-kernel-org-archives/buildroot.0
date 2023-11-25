Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DECC10DC3
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D30941B58;
	Mon,  4 Dec 2023 20:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D30941B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnMIworTvUHw; Mon,  4 Dec 2023 20:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D35D41B86;
	Mon,  4 Dec 2023 20:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D35D41B86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 326311BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C16560B09
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C16560B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1VagaSOGPep for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4845A60FFE
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4845A60FFE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3515D879B7; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 906a9fb98972683c8db3820c073ddaa0a0218212
X-Git-Newrev: fde20964c71202589568d84de0c3bb4c3d6e9b17
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.3515D879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jailhouse: move conditional
 build/install to macro
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

commit: https://git.buildroot.net/buildroot/commit/?id=fde20964c71202589568d84de0c3bb4c3d6e9b17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The usual way of having conditional build and installation of parts
of a generic-package, is to conditionally define macros that do that
build and installation, and unconditionally expand the macros in the
_BUILD_CMDS and _INSTALL_CMDS.

Do that in jailhouse, which used to use an ad-hoc conditional block
directly in _BUILD_CMDS and _INSTALL_CMDS.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jailhouse/jailhouse.mk | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 6356c5a7aa..913be765bd 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -30,11 +30,26 @@ JAILHOUSE_MAKE_OPTS += \
 	PYTHON_PIP_USABLE="no"
 endif
 
+ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
+define JAILHOUSE_BUILD_HELPER_SCRIPTS
+	cd $(@D) && \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_DIR)/bin/python setup.py \
+		build
+endef
+define JAILHOUSE_INSTALL_HELPER_SCRIPTS
+	cd $(@D) && \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_DIR)/bin/python setup.py \
+		install --no-compile \
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+endef
+endif
+
 define JAILHOUSE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)
 
-	$(if $(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS), \
-		cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python setup.py build)
+	$(JAILHOUSE_BUILD_HELPER_SCRIPTS)
 endef
 
 define JAILHOUSE_INSTALL_TARGET_CMDS
@@ -47,8 +62,7 @@ define JAILHOUSE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
 	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
 
-	$(if $(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS), \
-		cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python setup.py install --no-compile $(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS))
+	$(JAILHOUSE_INSTALL_HELPER_SCRIPTS)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
