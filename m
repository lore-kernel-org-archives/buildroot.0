Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE1C32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B091960F30;
	Fri, 19 Aug 2022 15:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B091960F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9ywaPylkO0j; Fri, 19 Aug 2022 15:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAC4611CA;
	Fri, 19 Aug 2022 15:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEAC4611CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41DB01BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D038842C8
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D038842C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JF5XrY1O0Av for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E88842A5
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79E88842A5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:25 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id q8so3567530qvr.9
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mvWF0NC8a/LlGCuf6E1CL08t9p7+14pwntwfepfY97A=;
 b=4vkIq09jPadVDUzmggMKe1qo7U7yaLLBugfXvRZbJ5zUc5IPoZZ6thfECRgfvHCIvN
 gl6g69oVFttCm1duNiBpkqDfrDxqAZa5zvZUV4mncI8GCuhGTMbw+r95g9zNO24GlvlR
 ThSsFwxxHXT7FA5oacQBCXNK1ARo9eboL5Kc798NO5wIWo+skZDOrURi/xGNPo3l3+xa
 8KLFRaglZUvlnXjGw7xSCa1dO6qT3UHn4Q1Mf0IUUq3yzEqiMPjP3pFZo7VvWWGi+DPF
 QAZZv7idLt1ZNQSUZO8QeF4G9+da+Ou3Af8g+psVzojIDA28A+G8CW4IazvyS9kGckKM
 gEXA==
X-Gm-Message-State: ACgBeo1rER8FrHj+pGiqOI5fz0n0Fuk470/Oz7YulvB/CRuDZTqTgy7O
 tGEQt+sGoGBrWEWgBYO/2+t+1xycBwUmBA==
X-Google-Smtp-Source: AA6agR7EEmGc2rpvRgZe3E0kJvvRF4rW6eaAjhJYfqzBXEVKXdHpg9OmyRBl9ExxXLhMU1LWIQQwhQ==
X-Received: by 2002:a05:6214:20a3:b0:477:155b:74e7 with SMTP id
 3-20020a05621420a300b00477155b74e7mr6797785qvd.70.1660922304156; 
 Fri, 19 Aug 2022 08:18:24 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:23 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:30 -0400
Message-Id: <20220819151734.926106-6-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mvWF0NC8a/LlGCuf6E1CL08t9p7+14pwntwfepfY97A=;
 b=T0Oi0lAoaeJ2M+iJ82mODOOqbchXUBrv1nY1Foox93hwTmFntIGPrrYUrYfHz4/ra3
 pwll9+vDOT/cFq3GjKkFM1peqJeqWW9o3Z4F37pP8ztgGm6uslQ94UtNxDgq6Ta4kDlT
 b82pN1NLRtu17WJagu9ANgFBaA/IxIks+3gGRqK2DyXg7arzbCrS6GgLJQV4mrJtaez5
 inKmJ3it0EFF6uo+QPAKjrpri3IbG2sR/oe2UiFNJGFt5/i2lb9nJVgJLo7YLDF6T52S
 IMaIOm4Aw7YykodmS8JdVXCuM6ED1EHRFN4xyEq0Lxi0A5+oBmq+lYC/P8c1cVM6G4S1
 34TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=T0Oi0lAo
Subject: [Buildroot] [PATCH v3 5/8] boot/uboot: pass -mno-fdpic if FDPIC is
 enabled
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building U-Boot.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 boot/uboot/uboot.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9f9b1bf16..4955a59a60 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -158,6 +158,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
 
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+UBOOT_MAKE_OPTS += KCFLAGS=-mno-fdpic
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
