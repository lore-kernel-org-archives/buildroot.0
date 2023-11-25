Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CFEC4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B20F181248;
	Sat, 25 Nov 2023 21:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B20F181248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8D3Ku42o4T-o; Sat, 25 Nov 2023 21:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B62A81351;
	Sat, 25 Nov 2023 21:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B62A81351
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4E891BF865
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DFBB4089E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFBB4089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTj7brZ32Z9r for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B94224087A
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94224087A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1E79873AA; Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 906a9fb98972683c8db3820c073ddaa0a0218212
X-Git-Newrev: fde20964c71202589568d84de0c3bb4c3d6e9b17
X-Patchwork-Hint: ignore
Message-Id: <20231125210555.A1E79873AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jailhouse: move
 conditional build/install to macro
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
