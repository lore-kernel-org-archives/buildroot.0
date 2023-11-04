Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C64BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BD8D4033F;
	Sat,  4 Nov 2023 18:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BD8D4033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3uWsZaBD-Ro; Sat,  4 Nov 2023 18:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D72DE4025D;
	Sat,  4 Nov 2023 18:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72DE4025D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56C891BF868
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3044D81FEF
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3044D81FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyhd-5YI6SRR for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C24E81FEC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C24E81FEC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A2A4866D1; Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 19:21:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dec855e19c28e8cf17d225cac9b90af252bfbbe8
X-Git-Newrev: d58f2677e5a46fc1d73b30ffa276a2a1bae777be
X-Patchwork-Hint: ignore
Message-Id: <20231104182141.1A2A4866D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless_tools: add option to
 build ifrename
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d58f2677e5a46fc1d73b30ffa276a2a1bae777be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ifrename tool is separate from iwconfig and is not being built. The
upstream does not have an install target for ifrename either, so we must
manually install it.

Signed-off-by: Neal J. Buchmeyer <neal.buchmeyer@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireless_tools/Config.in         |  6 ++++++
 package/wireless_tools/wireless_tools.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index 74786d883e..1d83cb5a5a 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WIRELESS_TOOLS
 	bool "wireless tools"
 	select BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG if \
+		!BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME && \
 		!BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	help
 	  A collection of tools to configure wireless lan cards.
@@ -16,6 +17,11 @@ config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
 	  Build and install the iwconfig, iwlist, iwspy, iwpriv, and
 	  iwgetid tools.
 
+config BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME
+	bool "Install ifrename"
+	help
+	  Build and install the ifrename tool
+
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 3e55eda600..90c9286688 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -19,6 +19,10 @@ WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
 WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
 endif
 
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME),y)
+WIRELESS_TOOLS_BUILD_TARGETS += ifrename
+endif
+
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
@@ -37,8 +41,11 @@ define WIRELESS_TOOLS_BUILD_CMDS
 endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
-		$(WIRELESS_TOOLS_INSTALL_TARGETS)
+	$(if $(WIRELESS_TOOLS_INSTALL_TARGETS),
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" \
+			LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS))
+	$(if $(BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME),
+		$(INSTALL) -D -m 755 $(@D)/ifrename $(TARGET_DIR)/sbin/ifrename)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
