Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7936E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 18:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D043402D8;
	Thu,  2 Jan 2025 18:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7jJPe8RRMVw; Thu,  2 Jan 2025 18:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01AC7402A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01AC7402A9;
	Thu,  2 Jan 2025 18:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E196E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C946606B0
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I20E0cF34qq7 for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 18:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B978660681
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B978660681
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:29:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B84282580; Thu,  2 Jan 2025 18:29:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 19:10:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb9bb656299700a543dc675e6baca0bfe9f53870
X-Git-Newrev: 9c2947ff1e8c244a09ac4a71b818297b877c35f5
X-Patchwork-Hint: ignore
Message-Id: <20250102182914.9B84282580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbip: add missing kernel options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c2947ff1e8c244a09ac4a71b818297b877c35f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usbip needs USBIP_CORE, which needs network support (NET), and both
basic USB support (USB_SUPPORT) and host-side USB support (USB).
Both NET and USB are usually enabled, so they got missed when adding
usbip in f05f2c1ad717 (package/usbip: new package).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/usbip/usbip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
index 77dd341f9b..b4475c8d89 100644
--- a/package/usbip/usbip.mk
+++ b/package/usbip/usbip.mk
@@ -32,7 +32,9 @@ USBIP_AUTORECONF = YES
 USBIP_CONFIGURE_OPTS = --without-tcp-wrappers
 
 define USBIP_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USBIP_CORE)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
