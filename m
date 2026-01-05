Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B54BC2A072
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 08:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 550A6405DC;
	Mon,  5 Jan 2026 08:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsHCKOsXZbBz; Mon,  5 Jan 2026 08:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3DD405A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767601122;
	bh=Lqwma+/40+FVB8yhYqUid8ZnT2vYli7U+yKmsSjz8PI=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qY4chlmqsHEZHjYBJUqxVsTY4ylvxMpLq2lUk7gVK88o04YsaraUx0lCb5bvxP7/D
	 2AT6LvAINzPiPXeOYdUiJyrsKlzm98SdKRcJ2drXQ3AHbYeK2Vbjq9o+jPfjA4ah2k
	 IgkCUXblEk0h5/HptwFQRix/88Rrzh7Ol2NI8idYIdIA+3hyGRM1ysO2EdSEbwzLkO
	 6AlJBtAdnjljNgLa4TcOAYqW8LNurmQECCo6NipwGOfP82xwl2zaw1LKhQGyy9OkfO
	 VfsZKNqXpdqDrgVQurEPK3+Tfpj7yGfI6P9Ic9duwk9ceAMWlCB5ZlSSGuidcx/4QX
	 wyb2kBoYFQDBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3DD405A2;
	Mon,  5 Jan 2026 08:18:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 509FBE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37049402D4
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dhxy3soahbxn for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 08:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.102;
 helo=mail-244102.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9AA674009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AA674009E
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AA674009E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:18:36 +0000 (UTC)
Date: Mon, 05 Jan 2026 08:18:20 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Message-ID: <20260105081456.2799173-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 91c6daebcb0ab6522a9b12aba70ce6be9423bca3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1767601104; x=1767860304;
 bh=DGz187rxIyybXBIn+Sr0gYFHu5ThCLMX1k+4AgVeIHo=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Jk5vnVje24qlgCYeMHceDeOsyuSH/ORxNqEWlvnndUkHoRsnkDG0HYx9xYOyv1rIz
 ggtb/B4G8H2c+SwiUgcn0X9DZ7VbcHh64AB59dma1A8gRA3g3YM5pQ9wuyhAu4SPSv
 afz0w+T6U1ZAJTMyYE6CE765hAHVmnr8bdbyhUtWH3B/i9bAjHsDW9dMvvYbCyUT9p
 lZKeRnWnQKhQiIF2p+1vaTxrJEDjS7Xs61sfqc0OSNkWWCUUB1bECuBTpKtC76bsw+
 nyZcvO2dAkBN50KMXRQbwj7ScRI2P5UHG5Vkj1yn92gSrmyWkYXw1JrabkGNSteJmQ
 HixXvf1/X0tbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=Jk5vnVje
Subject: [Buildroot] [PATCH] configs/beagleboneai_defconfig: fix whitespace
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
Cc: Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Philip Molloy <philip.molloy@analog.com>

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
---
 board/beagleboard/beagleboneai/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beagleboard/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
index 8aefd76ef8..02e61bc9be 100644
--- a/board/beagleboard/beagleboneai/genimage.cfg
+++ b/board/beagleboard/beagleboneai/genimage.cfg
@@ -19,7 +19,7 @@ image sdcard.img {
 	partition u-boot {
 		partition-type = 0xC
 		bootable = "true"
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
-- 
2.52.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
