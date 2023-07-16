Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42261EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 08:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E93E81363;
	Sun, 16 Jul 2023 08:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E93E81363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghH3mXvQuXUb; Sun, 16 Jul 2023 08:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE69C81339;
	Sun, 16 Jul 2023 08:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE69C81339
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C321A1BF372
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 08:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA1EA81339
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 08:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1EA81339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbWYnPuVNZ1f for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 08:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB3A81331
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFB3A81331
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 08:39:10 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3487d75e4c5so4214855ab.0
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 01:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689496749; x=1692088749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JGjxoiP8PdOn3fOAMiMOh3CSS+zVlsnaoOhFrpTJ/WA=;
 b=CERxF1lOOa1h//G1Aq98KBVYroh3rozCxWUdgNOsKZM8CCAoJA/y7Qg+dp7+ttM2l1
 RzFrt58ez95DH0q0K6+s70BaFlBsmtmgaqcRNGAHm/AJE4wFeOIFNlWkmS777aKemZ9R
 lgPEr0hi7jB61J/0dDb9cNgB48vzGfIdGLMlg9PYY8xCoiZ0h3oH+12nFlO5HnLgfPxL
 hDXZNWAoWbKQf1vETOw/eNdlVZ9TzFgRHD/guEsu5Jqywz3KrNwnr/+peMYYZy3Ze78L
 UYAf8oxrljqTETUPX7Hvc6XY4xbtZa/7+gsMrR4GkK54S4fZa59B8Lq4aOgQMTqurW5p
 9SBQ==
X-Gm-Message-State: ABy/qLZSJGkkoNmKAoxt3KE8gWeiDtpDtZUbuFPreDj4ydnL3084KJgk
 AurtmuwUF/GvNb/UiXyEUUa4yXqVamA=
X-Google-Smtp-Source: APBJJlHZuQsKST7QQ2Fqbny6IIAQ38mQPfgutmOwmt/tsBNr9yVGWiin5YGoNsoTNBEP+hYw+LQyiw==
X-Received: by 2002:a6b:6809:0:b0:786:25a3:ef30 with SMTP id
 d9-20020a6b6809000000b0078625a3ef30mr9494479ioc.7.1689496749248; 
 Sun, 16 Jul 2023 01:39:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-225-212.hlrn.qwest.net.
 [71.218.225.212]) by smtp.gmail.com with ESMTPSA id
 a5-20020a029985000000b0042b2a16f6b1sm3727271jal.176.2023.07.16.01.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 01:39:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 02:39:00 -0600
Message-Id: <20230716083900.745225-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689496749; x=1692088749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JGjxoiP8PdOn3fOAMiMOh3CSS+zVlsnaoOhFrpTJ/WA=;
 b=k8qFGvnnWJsfzFg6wRVsYaQKEarUP9q92DQ6R7a97rKOtAQemZ3w8MU2tK+k0WloMW
 MVj8XcPqzWzMS+Wffq7aCYXPn/iNkjib8cykhJVsmUlrhWaz4SKEtp07BSP62LaW/Zvu
 zPu+uPIpXEuxwx0ZuQR6T2V2YgqQtgD1QfdWeT6iPQ59cSod3et6i9Fkcf0jpNZJyeQC
 VkS8OUiPq0qVw4QMppEpo70IIWHZiuB7C73KcQsrG6krr/VJh5wsMIxSDRBX0I2Ah+AN
 E5Dft9S6DlHQExEs4Ns2eLVKG6yfXV7iAKFScJQSBAgjkZywIyJRIWpvuV97Vb1qkPt+
 hvmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k8qFGvnn
Subject: [Buildroot] [PATCH 1/1] boot/uboot: set DTC path when
 BR2_TARGET_UBOOT_NEEDS_DTC
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order for host-dtc to get picked up properly we need to set
the DTC path passed to the build explicitly.

See:
https://github.com/u-boot/u-boot/blob/v2023.07.02/Makefile#L420

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..1a6e70a792 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -209,6 +209,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
+UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
