Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDBDC001DB
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 13:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F38940120;
	Tue, 15 Aug 2023 13:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F38940120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7ecwSCiSqmd; Tue, 15 Aug 2023 13:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C0F540191;
	Tue, 15 Aug 2023 13:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C0F540191
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7971BF3D8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408FA415C8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408FA415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UU2YYzSqWdUN for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 13:16:24 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE364094B
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 13:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE364094B
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-688779ffcfdso42749b3a.1
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 06:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692105383; x=1692710183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nwo1QYV3zVMoumHZv82FBUgC+hSuwNjFsCzxY3jhznY=;
 b=dBpobSwgWR9LTqbIIV8CrXs8uQ7LlRnt6+Nffzvn91PqQqY1X/pW3LSVBGLShWPWFr
 EqFvZjR1TI0vFr1omTLpRgCuxZy0oTiAeFjDjCnACwLv/yDqbT5uUkuuinE6Dkww/38/
 samK9mNSLlBvjUg1Uhj17pBytBFJbi6V8MCz6ihqZaNM5PDuEu5vYZ9GAEEhgczXILNH
 EMASRlAvTY2wvXi/LopvJFHgHoJXXxOvDD2u38DkR9kVan8sPt7a3pKL8AMYLynp4FF9
 PIcuhu/sRqWDxNzr81FP9937zg8AiK87S3ceisi3H1owxF243N09JoiZyL97CzlNMQgS
 pGgA==
X-Gm-Message-State: AOJu0YwpqyKixyhYpbjSBXr+AeWcu3KsITrcJmYGAQT9Dsszy5VwxUrT
 rvltc1MwszLQyu6WCjgdSe57IXeDlnEtkfUPMNw=
X-Google-Smtp-Source: AGHT+IFgA4mRvAWrXaiKMBGy65K2rWPShAwMIUqj+U5QL2pXWtokBtmM08uGidiBKSwIbZjYCtj1KQ==
X-Received: by 2002:a05:6a20:2d7:b0:135:38b5:7e58 with SMTP id
 23-20020a056a2002d700b0013538b57e58mr11594425pzb.37.1692105383369; 
 Tue, 15 Aug 2023 06:16:23 -0700 (PDT)
Received: from localhost.localdomain ([45.133.6.75])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aa7908b000000b0066f37665a6asm9335551pfa.117.2023.08.15.06.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 06:16:22 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:45:40 +0330
Message-Id: <20230815131542.1402848-2-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815131542.1402848-1-javad321javad@gmail.com>
References: <20230815131542.1402848-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692105383; x=1692710183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nwo1QYV3zVMoumHZv82FBUgC+hSuwNjFsCzxY3jhznY=;
 b=Sah+yDHFPDfHMw3brpiayzz5truC6/NE2jlLdkCSah5kroeKk9COpc8KTvvyU/daJy
 fmbIA3vPJHz3cX5PVCqjuta9AjV1bZv/4d6cT7X49GCHT2H7TdiT3E3KmnzE2ATTPSQC
 wpd7VH2RHKA7DjW8S+qhSlSwaFoMMVRtSMJb9/+aIyfZ5YG8IMF21uXEnTjzOD0sFsxM
 Q9G1baVdmYjyZ3kiocGKbMEb+p06PZjA/AMt43fc15I0FhmB0u60S8cPsuSKPTbc5tq5
 1N3wnkIXxaXXgPnO0IqO+3pCSBfDKFRKD0jYnLU+unucBRcSSXyTVj9z0oE1Ud5uUFsK
 fifw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Sah+yDHF
Subject: [Buildroot] [PATCH 2/4] configs/orangepi_pc2: change /dev/
 mangement to mdev
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
Cc: Javad Rahimi <javad321javad@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 configs/orangepi_pc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 7536704947..a1fb9a112c 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -2,6 +2,7 @@ BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
