Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1037FC83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 23:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4703E41528;
	Sun,  3 Sep 2023 23:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4703E41528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFIMBM2_d191; Sun,  3 Sep 2023 23:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D8AF41529;
	Sun,  3 Sep 2023 23:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8AF41529
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8960A1BF384
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 23:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60BC141529
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 23:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60BC141529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f87LctWK4JU2 for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 23:06:58 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A5141528
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 23:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A5141528
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68a41035828so399146b3a.1
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 16:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693782417; x=1694387217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/V33xUFu/Uno+5rdIVCy7ud7S8E4sIPz7IWXZbCUMM=;
 b=OQbVI/W2EGzZRQ7V+4oJ92IR/3oFdfat1YPwgtvL9L9pYJGp2kgK5pUnUo/+RaPdUD
 k/AfV7HxWSKaUycyloFdw8AeKFRSbsIkC8VWuW3CDIV1E8sdqm0V55FFkImMboQx85xc
 bIaKGn6JqGU2bg17eO2EDZXc6DYKWBnrqxsCi93/7K3C22Br00dTyGkrsSJfn72MFs0l
 yPHyFzej4RXzVXmjDD6IMj8CVtGBMrQaXTyTqo6lh7BXNySh3xllwm1N0E+P3KDt1ssm
 pI0cMQztmPKPsJqN/z1mRh0sHaVNpGc3FdgLYFq4GpkN9oKHLIyao7VdyhXC941+pA/8
 MWqQ==
X-Gm-Message-State: AOJu0YyyL4wGaVBcgtINqSfxcFINuJcr6RVdSxd8hSwyuBstw2wgM2eT
 jnzEm3LNoVu7RvPV+i9cUyweiYek9kQ=
X-Google-Smtp-Source: AGHT+IEeNjKdOftoxgPYKrXtumWmu1A1IBV1K1hAo7TtsxnoB3Lr2LyB33tJpNmrhozFrHyzeyvfMg==
X-Received: by 2002:a05:6a00:21c8:b0:68b:fdfe:76c2 with SMTP id
 t8-20020a056a0021c800b0068bfdfe76c2mr7620496pfj.20.1693782417108; 
 Sun, 03 Sep 2023 16:06:57 -0700 (PDT)
Received: from pox13.. (office.relectrify.team. [159.196.192.155])
 by smtp.gmail.com with ESMTPSA id
 fe19-20020a056a002f1300b006884844dfcasm6171708pfb.20.2023.09.03.16.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 16:06:56 -0700 (PDT)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Date: Mon,  4 Sep 2023 09:06:09 +1000
Message-ID: <20230903230647.311877-2-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230902191549.44efa583@windsurf>
References: <20230902191549.44efa583@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693782417; x=1694387217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/V33xUFu/Uno+5rdIVCy7ud7S8E4sIPz7IWXZbCUMM=;
 b=R8NR5VHuClgmlEK1WlaZtbih+OhKjFA3xUCfof+xUPbLRQCTriVNsy083CNyZ+ArBM
 /1vaS90+b+xoN0gyfKVcef71lxBVGhg4L7c9GhYZxHQllbF8rWU/iCphTxz/Qsjjkdyk
 X4GF9tB1OvoPqv4FRPO1mZXk5C/CKy9ADkZZ8iAQwLU4lwmYmI5MDYL1IYnbJJfP4Jfc
 hkILgYdWK/Ym0hGi0PL9e8eEAusLmT1ylPaCkdoqGSSbNvARpc3euHdZkrF1W1f7Udk8
 siAe/KZ/SSzDSc6AnT1NDNjI/NbKKnpBgKIY9Dc0sflJWOCIMLZzUsWQrLGccXSsjjwx
 3gkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=R8NR5VHu
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Patrick Oppenlander <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Hi Thomas,

sorry about that. Resend below.

Patrick

---
 boot/ti-k3-r5-loader/Config.in          | 10 ++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 2419babe70..580abf59ec 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -92,3 +92,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	  Path to the TI K3 R5 Loader configuration file.
 
 endif
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to arch/ARCH/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the TI K3 R5 Loader
+	  configuration file must refer to it.
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 8311e1b401..012f4ee52d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -77,7 +77,12 @@ TI_K3_R5_LOADER_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
 endif
 endif
 
+TI_K3_R5_LOADER_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH))
+
 define TI_K3_R5_LOADER_BUILD_CMDS
+	$(if $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH),
+		cp -f $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
+	)
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
