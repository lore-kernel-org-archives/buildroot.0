Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5944CC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A0C60C21;
	Sun, 14 Aug 2022 23:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A0C60C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vizlZuhP3zvV; Sun, 14 Aug 2022 23:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1507160C09;
	Sun, 14 Aug 2022 23:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1507160C09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2B8E1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89A7F81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89A7F81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeR7K05-LDzf for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B6281CA7
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3B6281CA7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:25 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q15so5876537vsr.0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I4CMHWwr+GOIwoPB5zgts4tBCO56IWpbyF3UFOA24VQ=;
 b=tcQ0hClfPu5HIHeGHB7apb+4a00Vv8VEhv+auBz9wP6zPYalvaitScd2oPbWLMqA0p
 VpKYtgoXJ7zC4rWh3U2WHSaUzU0mqmkjH5bCVCSnIfVGLkCV+NYINZ43ElJ7Dg7i/q8B
 nwCJDsqFDDVlhM9QHNAHqhzso4+he/ohfZ0NWPET4vqMe9t2sbrMF84fNNBACi1J2wJp
 iyHFlCRv1KcAI6BJFr7oIWdJULlephMGGlO0MwZykIEFRdzVb6FmZfXtFASdn6NS2pDh
 vgE0tToic5eU7dLODpJxpBS2pHoHtJ+oOdh/BcKrb+dAPjNu/RPMItvT8/RdQHIu6wWJ
 AAEw==
X-Gm-Message-State: ACgBeo1qNfPhl5txnQWJprI4nFX6Z+51E0S1Ih6c8468+KCRnkdfMj0i
 bSQ98axdSuuMIETWviqIZZx0XdqYQbc=
X-Google-Smtp-Source: AA6agR4dZcjfFoABKQ+eftiWRnYduZP+RWelEI+HyY5XpgpTyyk3h4Z3okqy6g9Zav3JBCJFjxRrxA==
X-Received: by 2002:a67:e1c5:0:b0:371:73d9:7316 with SMTP id
 p5-20020a67e1c5000000b0037173d97316mr5278961vsl.38.1660520425597; 
 Sun, 14 Aug 2022 16:40:25 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:24 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:39 -0300
Message-Id: <20220814233845.2247022-28-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I4CMHWwr+GOIwoPB5zgts4tBCO56IWpbyF3UFOA24VQ=;
 b=ocbnw699TckrXJU/Y6C17jjYcyfyRY90hxQo/3wixsunIbBGgzfn+qeA/qt53rFFzv
 7HSGqZnfuPGW56L2Scg4bejY1rc1JLzjCzqu9UmAwecPJfRhzjx46FCS90WGLzlOHEXa
 KJ75ktBBi/rvqPP1izoLvGaK97gJgFRRt44DdpKob2svIJUSpQECYlBCEQtKCcrRtjhi
 FX9fVaNHdrPvKT6GDAoHYEC9yoKVzqlT+OF1beHAlpGz3saIOn0otckIuUWDdiXbTH+w
 ufEnG4UEOmcWv4jYS0A5j9Fh0jpobo198eQr8Y/VFbGunvgIGZwZJ9uzg0xFZYVEK96p
 Xwig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ocbnw699
Subject: [Buildroot] [PATCH 27/33] package/openocd: drop bogus
 BR2_PACKAGE_OPENOCD_ZY1000*
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These inexistent symbols are referenced since 2014, from commit:
'aa441aa84c openocd: bump to version 0.8.0'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/openocd/openocd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9f53ae3ee3..37a06ca848 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -56,8 +56,6 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_VPI),--enable-jtag_vpi,--disable-jtag_vpi) \
 	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb-blaster,--disable-usb-blaster) \
 	$(if $(BR2_PACKAGE_OPENOCD_AMTJT),--enable-amtjtagaccel,--disable-amjtagaccel) \
-	$(if $(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),--enable-zy1000-master,--disable-zy1000-master) \
-	$(if $(BR2_PACKAGE_OPENOCD_ZY1000),--enable-zy1000,--disable-zy1000) \
 	$(if $(BR2_PACKAGE_OPENOCD_EP93XX),--enable-ep93xx,--disable-ep93xx) \
 	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
 	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
