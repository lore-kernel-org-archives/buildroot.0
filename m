Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573E2C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC6360E22;
	Tue,  2 Aug 2022 20:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC6360E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkG7GVj4aH1O; Tue,  2 Aug 2022 20:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0345F60E19;
	Tue,  2 Aug 2022 20:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0345F60E19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB9F21BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6D8560E19
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D8560E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dg6-w6q6YV-g for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:22:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 900BE60BD8
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 900BE60BD8
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:22:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so1422277qto.10
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 13:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/t7DfGFB4xFImZwXt3sG0E94ef6D8UgKjorqAVftoww=;
 b=gDqKAYmPOg89/lWmhW1612BdOk0U2inyyQcXso9U0IssVIDpf3A2VHVnhbOClzD5sv
 fdvSajp/cAv52Cw4Wh2DIAxpWT/MDfoFXkXTyL8iZkDMtaDQ6iEC3VABUHwByjRtWme1
 wzMq6Klc02euGwA9C0UaGmguOvFvOVRGLVU/jU0zoUPr1Hum8RuA9bqLM8Eq9YHBAejk
 Js7lsra3d5LN0mbFW/0UXND+JcwBuVWrF0lV0YinUGEYuTVN+Th13llKo/g+LgfY+IRe
 j0OcHgl2HA44MGrxbC9lNt2DEVIPcq1ijD9Ov9XenMeq8zf2jlYGFYkcfG9Bdc0r6AjV
 1FkA==
X-Gm-Message-State: AJIora+2kXE7AbLKlJ+fAKGbqrozRGbJu+VXxqwfzzMQEIL9IfZgEqAS
 1APLia/QB5nEYhv2comPY3VHmCk8Wl/WqA==
X-Google-Smtp-Source: AGRyM1s23XwqjFQfHlVAmGGbBgNq9OM7a3REtn+cS6vsnqEAq2qLjZxUZyBNUrLxYquGwHrzyLD1tQ==
X-Received: by 2002:a05:622a:1050:b0:31e:f648:4e24 with SMTP id
 f16-20020a05622a105000b0031ef6484e24mr19906472qte.484.1659471730364; 
 Tue, 02 Aug 2022 13:22:10 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a448e00b006b6757a11fcsm11661660qkp.36.2022.08.02.13.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 13:22:09 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 16:21:42 -0400
Message-Id: <20220802202142.1770838-5-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/t7DfGFB4xFImZwXt3sG0E94ef6D8UgKjorqAVftoww=;
 b=RyuelIxMIkhllmIIXZusbEoR9E0QqKZ9KsTHbF16bgjCM/e8t4mi5UVihfPsHGshbY
 vGBZdE6Z1RblgUguBRPjYpsEo1FSHTZ5VHnVZztPIXNcTQ8A3+bg0b2hnRca84o+fXzc
 lReuKcW5IUU6+T/df6L6a21uHYSAiZYgkbGeCxL8x6cfkK5zDUfRKlaj06lChaSyKim1
 lESCA3NmxBd6StN6jV6Nz/J+krXIUK4XXdhPj6LZAu5r+mQnFUm0eZz3dRKHMon+0k7U
 m2/wbpfgRPz4OrCXF9REVVmBPLk2lbiaEHkf7iEYCJmYLxd8X+SlMOqqxbYVMhoL3NCq
 XteA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=RyuelIxM
Subject: [Buildroot] [PATCH v2 4/4] linux: pass -mno-fdpic if FDPIC is
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building the kernel.
---
 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3d9ac37959..c73806ed49 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -152,6 +152,7 @@ endif
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	KCFLAGS="$(LINUX_CFLAGS)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
@@ -172,7 +173,12 @@ endif
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+LINUX_CFLAGS += -Wno-attribute-alias
+endif
+
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+LINUX_CFLAGS += -mno-fdpic
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
