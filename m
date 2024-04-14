Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B3C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 07:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233FF81E45;
	Sun, 14 Apr 2024 07:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BataO2L0X45B; Sun, 14 Apr 2024 07:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B65981E38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B65981E38;
	Sun, 14 Apr 2024 07:36:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB24E1BF40B
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 07:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B84C940151
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 07:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URRX-rx8X4Ot for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 07:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C73A400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C73A400E5
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C73A400E5
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 07:36:23 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 43FDA3521100; Sun, 14 Apr 2024 09:36:18 +0200 (CEST)
Date: Sun, 14 Apr 2024 09:36:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZhuHcg6qHhbBCUCE@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1713080179; bh=9iQO7sHRCGXExMXeHwYkbaUtADGQdcpx3mBfLPa81Dc=;
 h=Date:From:To:Cc:Subject:From;
 b=VVZw00ZB39NME77nSqG/ggseNmne+AJBLSYtutrLzQIICA9RgFVI+zWicFcVTZ2dx
 B5XkjFfzywU6DA+ykzNL8mJRNvKOcGDC8HQSPNk8ARJcRUG9snxcVvZlCvy8eJ33Pu
 kYvVlgQBMKLPMIfQV0p5GJBkiirTf74DB7MjaSNsLpJEwcla/Gmf/m13AuPHId5Gov
 4R9ywSNxYofIOM37XU3xmgE9HP9PjDshXHcowEmD4j8YF6Ltjd2gNluGOCLsTvtMbv
 /Y8RXfKNAPoWWnIkX35P20Se4xvWcXZhK6T85PPCF7TrnJB72H6mNr8McDfuG8sw+m
 pjpdcx6xHu2HA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=VVZw00ZB
Subject: [Buildroot] [PATCH] package/uclibc: enable time64 support
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>,
 Chin Huat Ang <chinhuat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng supports time64 since release 1.0.46.
This commit enables it by default.
It was discussed on the mailinglist and one suggestion was to
enable it by default without a config option inside buildroot.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 5beb2bd908..0d4cbcfbbe 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -40,3 +40,4 @@ DEVEL_PREFIX="/usr/"
 UCLIBC_HAS_SSP=y
 UCLIBC_BUILD_NOW=y
 # DOSTRIP is not set
+UCLIBC_USE_TIME64=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
