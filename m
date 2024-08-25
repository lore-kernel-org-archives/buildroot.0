Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A41CC5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC5B4605A7;
	Sun, 25 Aug 2024 13:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7cAXztoeizt; Sun, 25 Aug 2024 13:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02B5605F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02B5605F4;
	Sun, 25 Aug 2024 13:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5E41BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9FA480A66
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMY4xRfyXPVN for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:56:09 +0000 (UTC)
X-Greylist: delayed 459 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 25 Aug 2024 13:56:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F140780A4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F140780A4E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.11.48.116;
 helo=ngcobalt16.manitu.net; envelope-from=linux@ulli-kroll.de;
 receiver=<UNKNOWN> 
Received: from ngcobalt16.manitu.net (ngcobalt16.manitu.net [217.11.48.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F140780A4E
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:56:08 +0000 (UTC)
Received: from localhost (ip-078-094-238-058.um19.pools.vodafone-ip.de
 [78.94.238.58]) (Authenticated sender: linux@ulli-kroll.de)
 by ngcobalt16.manitu.net (Postfix) with ESMTPSA id 99B0010E00AC;
 Sun, 25 Aug 2024 15:48:28 +0200 (CEST)
From: Hans Ulli Kroll <linux@ulli-kroll.de>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 15:42:24 +0200
Message-ID: <20240825134224.1443593-1-linux@ulli-kroll.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ulli-kroll.de
Subject: [Buildroot] [PATCH] toolchain:uclibc-ng:enable gnu hash for non
 mips platforms
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
Cc: Hans Ulli Kroll <linux@ulli-kroll.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In toolchain-wrapper.mk we use both sysv and gnu hash style for all 
platforms, except MIPS which uses sysv only.

However uClibc-ng has some extra knob to enable gnu hash via Kconfig, 
which is set by default off.

This leads to wrong symbol resolving on armv5 and output of devices,
here on Pogoplug 4 detected with lcpci 3.10.

Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
---
 package/uclibc/uclibc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index de834bac4f..f48ebe6a16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -205,6 +205,12 @@ define UCLIBC_X86_TYPE_CONFIG
 endef
 endif
 
+ifneq ($(UCLIBC_TARGET_ARCH),mips)
+define UCLIBC_LDSO_GNU_HASH_SUPPORT
+	$(call KCONFIG_ENABLE_OPT,LDSO_GNU_HASH_SUPPORT)
+endef
+endif
+
 #
 # Debug
 #
@@ -403,6 +409,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_SH_TYPE_CONFIG)
 	$(UCLIBC_SPARC_TYPE_CONFIG)
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
+	$(UCLIBC_LDSO_GNU_HASH_SUPPORT)
 	$(UCLIBC_X86_TYPE_CONFIG)
 	$(UCLIBC_DEBUG_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
