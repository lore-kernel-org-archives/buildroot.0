Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4DEC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 19:56:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9318861163
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 19:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9318861163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 651BA80E82;
	Sat, 21 Aug 2021 19:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ho40t2wSsKdG; Sat, 21 Aug 2021 19:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B382080EAD;
	Sat, 21 Aug 2021 19:56:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F79E1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 19:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14B0380EAD
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 19:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ogq8Xxc6RHdm for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 19:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6DDE80E82
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 19:56:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z9so19290347wrh.10
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QB7xVejx6Jqjylz3XMoNExbciArFe3eBV3aPoqtjPh8=;
 b=isLTDNdSIDkp9SdZogRxXWo1c+prjejc448VGseI8Omyia16att/cHpNB1emM+XUNS
 yu3lH8AnsKTXpHO5Ty4E8AddBok68/9TDqURm4Ccs+j9caEQG0XOb75XL8H9TPUl1Wb3
 ng84hkw4w0vsY5XZK0ybIQg1Ouil6KqxYdHcMH09bmWNWfii6Zw1qZMr0dXJC/t/0+TV
 Di43TduezjxKzbzquGuipK/MKtcF3H6O3jLtPIzCxMCgNLiFMIneZB7cAHNzvCHMautW
 cL4kMLReuwXwHCts9FRiVKEDSkuM/FHw8XiyKuRB/EpRMI2qhb6RUOHlzeCDrNx2LIIc
 9zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QB7xVejx6Jqjylz3XMoNExbciArFe3eBV3aPoqtjPh8=;
 b=rSlBAFBefOLgAaEqpSpcXKO6dlFSOxyLZfkiZ1hZirS+xgoRdXFOUOkq9Yn6D3JRM/
 gyhfkyl7xE1UnsmwTnVbEcfbdSPanv9mFS5g0CwNghcGEqSNS3hSWL3syXew58ldG7ej
 xoJVooJZNeJ0ILhjRQa3AB/rLmEQ87/H5aGUo4I/LPZw6XhXBsjszkBze1p+lWxELdyr
 Pkvbe2lo9JoAVYxXoOTb/caOGvvbs2mm70DnqfWnvz0y+XVZIkgwQeP8g2Af1xgb2szC
 OMcIVRSb+l4bZlDNfXXh9m8zxuZNuNX1XeLw9RJmo32pvzgrAnYiYoZ5KXTu6AI36oms
 ZxvA==
X-Gm-Message-State: AOAM531OAQBpigtv6shoy1Q9MSNSHk4mSLKERRhj4KXHH2N0MN1TD3m4
 jz0X9MM2CiYLrFy9w2IfFy6ooWTeS/VYMxXx
X-Google-Smtp-Source: ABdhPJxvNoOiiiB8RorxT6nKtkOs6qVXvaXbzerb95Cm8wjpGM1WG2/RClb7ZuEJYSXzRyNU/nVD+Q==
X-Received: by 2002:adf:9783:: with SMTP id s3mr3728953wrb.349.1629575797691; 
 Sat, 21 Aug 2021 12:56:37 -0700 (PDT)
Received: from localhost.localdomain (195.160.9.109.rev.sfr.net.
 [109.9.160.195])
 by smtp.gmail.com with ESMTPSA id r129sm8857020wmr.7.2021.08.21.12.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 12:56:37 -0700 (PDT)
From: Bensuperpc <bensuperpc@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 21:56:34 +0200
Message-Id: <20210821195634.60346-1-bensuperpc@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Enable quadmath on aarch64
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Bensuperpc <bensuperpc@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Enable quadmath on aarch64

Signed-off-by: Bensuperpc <bensuperpc@gmail.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 1d0469a13e..b4cd6d511f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
 # - When available, libquadmath requires wchar support.
 config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	bool
-	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_i386 || BR2_x86_64 || BR2_aarch64
 
 endmenu
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
