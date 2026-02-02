Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0202E7DEF4
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CDF640B11;
	Mon,  2 Feb 2026 15:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlpA_Sp7aXEY; Mon,  2 Feb 2026 15:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A0940B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770045569;
	bh=7v51yP1tIYmGj0zUwU10bGLjvToLtLtPWsbFn/tMU8M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EETc5uuNTJ6R5h18Y2UXz15enyo9SXEI/av84JRLO3Mq8w9pw/CvwR2bo7BZQCEdJ
	 ukm8bD6mN1QVjQuhJS0fn8wR0rp+oqzywYYXFD8emF9NKis1ZLfDYkfF+fV8q3XdqI
	 8amDrninlYqCiihmAVQuNMQKti5d5TdYd2eqnQNdKE4S30v1QDYtu372dVfjPiJHJR
	 MkgfGmYzSv/4Kbj9PMtciAkbiKlM94OpddTjuvxDcnXOUtD90sDwjw5fCqiScd5gYU
	 LdfuK3VicuKOLvSgXYlDvg+ORVb/XHZETKlabUDVjt5UnVpwKtwyQ89ZEdZyprHm+l
	 766doU0YJi2Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A0940B0B;
	Mon,  2 Feb 2026 15:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4ED1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86C68402C6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdNne7WgzThu for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F31B401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F31B401E1
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F31B401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:19:23 +0000 (UTC)
X-CSE-ConnectionGUID: fNoc/4ArRgWvg0iz1VkTbw==
X-CSE-MsgGUID: Us+bjToETrqMruIPqQdOxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:19:20 +0200
X-CSE-ConnectionGUID: CZMvK/iUSK2NrRvUFrTwkA==
X-CSE-MsgGUID: U2zX/1p8TnaUcf7HuuBBEw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces01_data.me-corp.lan with SMTP; 02 Feb 2026 17:21:32 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 17:19:19 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 17:19:08 +0200
Message-ID: <20260202151908.1203336-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770045564; x=1801581564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+PvLLLnxVZucVqDJRBM5ZeL7Ix4Qg1jIk7NzuyQ0jhM=;
 b=BUEZux7elVBHLIZ9OgwRHqUQrKAt3r4VZwlBG6IRI8KcAP+L31M9N8z1
 nH++sFtPiEd10AtnMvY/envgBCNn0hFqEWdnFDE8BM5o5aR93hqpKeXaj
 WZ6hRS0JvgmAasXhuMZtJYHz2JOpQ3tHsYXP6PDeu5lMKAg879l8hjB87
 T24hz9OeD3VwvbmY658BOlJiC8+TTIio5bguySQdjyTVttgFVWegN41o8
 yZLgFJGbdxplWzTEmvxbE5UsKKx3FK5q+RLT/hN4vAP611H/Mw3s4eA6/
 VuK63YoRsyFoG021mDDsT4Co8Snkt3csd25115jxdO0qxGJL+YRUlQdGs
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH] package/libunwind: enable on riscv 64-bit glibc
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Since version 1.8, libunwind supports 64-bit riscv,
at least with glibc

Change-Id: Ia06dad0215baa34bef33f7693bd76ffb66f3a32a
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
(cherry picked from commit 180117f1ca693725f3b937341ac243a863f6746c)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/libunwind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 08f7f879c9..dd8cc72926 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_sh || \
-		 BR2_i386 || BR2_x86_64)
+		 BR2_i386 || BR2_x86_64 || (BR2_riscv && BR2_ARCH_IS_64))
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
