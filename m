Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2D0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B153560D90;
	Sat,  1 Jan 2022 13:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIX6uDA9ANwG; Sat,  1 Jan 2022 13:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010A960D79;
	Sat,  1 Jan 2022 13:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7F591BF31D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B3A81430
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMKOvYCyln1M for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:04:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D9B8142E
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:04:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B0DFC82901; Sat,  1 Jan 2022 12:58:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 14:02:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b9c58531e97b012a8a11c6ae5145b16dcfb8f74
X-Git-Newrev: 20dd9453f32c9898ae4a0dc482bbb0a21853090c
X-Patchwork-Hint: ignore
Message-Id: <20220101125821.B0DFC82901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: add
 BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
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

commit: https://git.buildroot.net/buildroot/commit/?id=20dd9453f32c9898ae4a0dc482bbb0a21853090c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP following Arnout feedback:
https://patchwork.ozlabs.org/project/buildroot/patch/20210303091904.467706-1-fontaine.fabrice@gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dhcpcd/Config.in | 19 +++++++++++++++++++
 package/dhcpcd/dhcpcd.mk | 22 ++++------------------
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index ece08d2c96..3ebacb3ba2 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -8,3 +8,22 @@ config BR2_PACKAGE_DHCPCD
 	  An RFC2131 compliant DHCP client
 
 	  http://roy.marples.name/projects/dhcpcd/
+
+if BR2_PACKAGE_DHCPCD
+
+config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
+	bool
+	default y
+	depends on BR2_USE_MMU
+	# Audit headers were only added in recent kernels for some arches
+	depends on !(BR2_arceb || BR2_arcle) || \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	depends on !(BR2_microblazeel || BR2_microblazebe) || \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	depends on !BR2_nds32 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	depends on !BR2_nios2 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	depends on !BR2_or1k || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_sh || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_xtensa || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
+endif
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ebe6941646..922d289b26 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -17,23 +17,9 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
-# AUDIT_ARCH_{OPENRISC,SH,SHEL,SH64,SHEL64} are only available with kernel >= 3.7
-ifeq ($(BR2_or1k)$(BR2_sh):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7),y:)
-DHCPCD_CONFIG_OPTS += --disable-privsep
-endif
-
-# AUDIT_ARCH_MICROBLAZE is only available with kernel >= 3.18
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18),y:)
-DHCPCD_CONFIG_OPTS += --disable-privsep
-endif
-
-# AUDIT_ARCH_XTENSA is only available with kernel >= 5.0
-ifeq ($(BR2_xtensa):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y:)
-DHCPCD_CONFIG_OPTS += --disable-privsep
-endif
-
-# AUDIT_ARCH_{ARCOMPACT,ARCV2,NDS32,NIOS2} are only available with kernel >= 5.2
-ifeq ($(BR2_arceb)$(BR2_arcle)$(BR2_nds32)$(BR2_nios2):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
+ifeq ($(BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP),y)
+DHCPCD_CONFIG_OPTS += --enable-privsep
+else
 DHCPCD_CONFIG_OPTS += --disable-privsep
 endif
 
@@ -49,7 +35,7 @@ DHCPCD_CONFIG_OPTS += --enable-static
 endif
 
 ifeq ($(BR2_USE_MMU),)
-DHCPCD_CONFIG_OPTS += --disable-fork --disable-privsep
+DHCPCD_CONFIG_OPTS += --disable-fork
 endif
 
 define DHCPCD_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
