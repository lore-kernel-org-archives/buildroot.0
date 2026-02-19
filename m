Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93019E9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 10:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E070D40ADE;
	Thu, 19 Feb 2026 10:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6JmPG_jf7Dt; Thu, 19 Feb 2026 10:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1998B40B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771497832;
	bh=09MpcQ+Prq0MPeXTHtxJf8g+keOHOdJebZMe2DueQ/A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YQ3FKdeo8i/9aTTNVGYXQNmiZiBb++R7sWBAUCt+V0RH5gusjKQWlhBOrC/MjD8vN
	 92YzZ2pKXur6WGEjEAnM2oEGhoHZW2l3MPde6YuaZ2fPhVnqevpSjcCWhUwGxe/hw2
	 WPc6DY8RmyNsfy94f+DbtzAz8K9l47nzozbdp5aNovLeRiGTqlhotWQLgWH799IDkF
	 09IwTRF+aFWdoNohIo2AFhyzca9SBfuCfibZhG2UJhTUjTI2Mm059pjiMOOEnlJoCr
	 6GSDs7wrz5bWqw8cqa16adupMCM67OjbYQDR6NAwZoSQLQk8xorcX9lFT2+uPKQX2l
	 lLXqVwDDk09kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1998B40B02;
	Thu, 19 Feb 2026 10:43:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D4F183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB828227E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3BHtGDotO0d for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 10:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8215E8226F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8215E8226F
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8215E8226F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id t1VWv92YWIfDkt1VWv35OA; Thu, 19 Feb 2026 11:43:42 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 11:43:40 +0100
Message-ID: <20260219104341.2640089-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
References: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGDAPl9RytZMdhmFmXIVWoWjh1PLQsDjkhcAJA74IgJe1yGbxnmvzpfrC7TInAC6kIqXM1KVSyQ9O7ACMYTaur/sZvGUva4NZTFTftv0aWf7T0VSjNgD
 zvkz2tuj2+bAQRPK/JyMI6Vsp4LcsvDa82bVgDIvDknz3Rf9mLV3fe5pSV5RGd25aky67PzzFXPJoFW1brC+YadeDqi2PVpPJZDXszmjmsxDlBlGS4TsKvyn
 dceRtKycndSrjFiIgFG8TNsf+aoJjRigi5Z0+zZ24EgXAMqtm73yUyPeanxfdLHnWXPnnqTvPbw+kWba/gucY62UmIAKO4QMcwwNe8RIynFmYQECYliPllDQ
 D3dybT/f
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771497822; bh=OQRfz687K4szWRgKMqYPuTrI21meDKC7SEatXtoLLD4=;
 h=From:To:Subject:Date:MIME-Version;
 b=CXipqUParBjodkVypgYkncj9m4AeqZ/BFhuic/AJ7I928fppCOuXaqrK5mObCq5BZ
 0mf8SkL6/aU0oMtudeKmXTaaPgx2eomoo30GnoFWlERgo+/xhUmMBv/z9zwwJR55PK
 3A3z5U9DCe+t0xa1Lre3pkVdXmlH5hn5rb+B/DrvqnU2YSNoX8xbXwqXSjODL34JJr
 T5hmDGcjwN0pO/taASra7NnqmE+GwCDMZCRL7jdqa0gW+5bxROE9SOxt4hSS70Ipus
 dY9UbQMX4bmm3hv+tL7zeBZSOfYMKgcpodfi5Ons3CbXk6Nh35dm2ZxPF4pGW2qH9Q
 N7juGRpsZb9Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CXipqUPa
Subject: [Buildroot] [PATCH 2/3]
 configs/olimex_a20_olinuxino_lime2_defconfig: bump Linux to version 6.18.8
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 116daed624..4e8686615b 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
