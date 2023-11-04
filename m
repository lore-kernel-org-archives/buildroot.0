Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFEFC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F89640164;
	Sat,  4 Nov 2023 18:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F89640164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg8u-3UmZ6CJ; Sat,  4 Nov 2023 18:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 384484021C;
	Sat,  4 Nov 2023 18:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 384484021C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21D731BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEB22418C1
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEB22418C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZsMGlzGV18w for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 249CC41B72
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249CC41B72
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FC19866D0; Sat,  4 Nov 2023 18:21:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 19:21:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a001ca657b4434989900a2a2a55faae45b786a6a
X-Git-Newrev: dec855e19c28e8cf17d225cac9b90af252bfbbe8
X-Patchwork-Hint: ignore
Message-Id: <20231104182141.0FC19866D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless_tools: make 'iwconfig'
 tool optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=dec855e19c28e8cf17d225cac9b90af252bfbbe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow disabling iwconfig for targets that only want the library.

Signed-off-by: Neal J. Buchmeyer <neal.buchmeyer@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireless_tools/Config.in         | 9 +++++++++
 package/wireless_tools/wireless_tools.mk | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index 349908dbde..74786d883e 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_WIRELESS_TOOLS
 	bool "wireless tools"
+	select BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG if \
+		!BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	help
 	  A collection of tools to configure wireless lan cards.
 
@@ -7,6 +9,13 @@ config BR2_PACKAGE_WIRELESS_TOOLS
 
 if BR2_PACKAGE_WIRELESS_TOOLS
 
+config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
+	bool "Install tools"
+	default y
+	help
+	  Build and install the iwconfig, iwlist, iwspy, iwpriv, and
+	  iwgetid tools.
+
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 1d29c3b102..3e55eda600 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -14,8 +14,10 @@ WIRELESS_TOOLS_CPE_ID_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_CPE_ID_UPDATE = pre9
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG),y)
 WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
 WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
+endif
 
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
