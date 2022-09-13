Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A088FC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 07:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5A3408E5;
	Tue, 13 Sep 2022 07:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5A3408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MBsgXI2vRwL; Tue, 13 Sep 2022 07:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB0D408CC;
	Tue, 13 Sep 2022 07:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB0D408CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1F01BF313
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 07:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D674086E
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 07:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D674086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIPXuW2bWnXT for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 07:23:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E132A4017F
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E132A4017F
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 07:23:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso10471562pjd.4
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 00:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=1oyj2vr5vMrhhS64pxST/Iz7zO9CpCT/HRPia41nF88=;
 b=gbbZ4N2J16LovXUSFNOQJFuesgtdzDCX+qkk7LBYlKBUHMPgVUQdm9p0QCXaZ+fx17
 M1ddV4QjY4j+Ka8yB0KELwq5CNwM19oB4xBk8f0HUIdRuvHZAV0QiJ6JhZreiwRYcoBO
 J/jfsvFZJEc1lEAIYm4+w23r662oQNQ0SAttKa1lQTE2o9pYzcX6oT2oBRDGVGx63g7v
 nfUnWbaGkjopoHO4OSgJpCpH3ENZjgdsOE7bgh63aIam+3bCe1z6VYXNeMAATgfBqDKr
 T8uT78TvezAQAbcKAlY8oCW8gme8MikUCox7/hfECKFKxc/m7TGaQFrYwrRvd+FboTLi
 AKMw==
X-Gm-Message-State: ACgBeo30L/3abb0QY813vCTdwT+ojkDXZbRou9tv+8HUTAZxQZsDKhc+
 8zGF/Ul6pTIY1Zt2wf3o80p3FIyx5vc=
X-Google-Smtp-Source: AA6agR47uisjZIcOfvYPSCJmm50Kq2F5LZntEYH/XE67MGu81THnvA1JBkJN4b5b0hbpRJFIrgDcDQ==
X-Received: by 2002:a17:902:a383:b0:176:dd41:4f56 with SMTP id
 x3-20020a170902a38300b00176dd414f56mr30469060pla.104.1663053792497; 
 Tue, 13 Sep 2022 00:23:12 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18]) by smtp.gmail.com with ESMTPSA id
 p18-20020a170902e75200b0017849a2b56asm796682plf.46.2022.09.13.00.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 00:23:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:53:03 +0930
Message-Id: <20220913072303.1698887-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=1oyj2vr5vMrhhS64pxST/Iz7zO9CpCT/HRPia41nF88=;
 b=WxC/fRGYX6KFKRkSaeMyj6zP70egHl9O+8GQ1s/pDgPpfuNpyZaS/+EBnO8bwwt8cx
 mMKy/gBfoqtigupIWAIPstp9i8AEEgIO64sWsbmoWkl3E8lZp2LBf1jE8yy+BukpG/ZM
 p/sG0jGeg72BFW6D50MED509v4VLvIM/L9Nt6kiydZ3OjynKp9iIaOdul7TozTG1lI3g
 Wf31iEO0uwJjoYEJ96luLu2iWBWlo62YP4X6pNj/WHTr81yfSi6JSXooeCcGAgEQm9ck
 tVwd974FQJXJng2Y/wBvlUKIg70b4hW+3Ww8ocwazrQtHFMup/ZJ/f2iSq1Fqva3arG+
 9ZTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WxC/fRGY
Subject: [Buildroot] [PATCH] package/coremark: Set cflags
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The coremark build needs to set PORT_CFLAGS explicitly in order to pick
up the configured optmisation level, and other flags.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/coremark/coremark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
index 418fd5c8d39b..9ea8693e7189 100644
--- a/package/coremark/coremark.mk
+++ b/package/coremark/coremark.mk
@@ -11,6 +11,7 @@ COREMARK_LICENSE_FILES = LICENSE.md
 
 define COREMARK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
+		PORT_CFLAGS="$(TARGET_CFLAGS)" \
 		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
