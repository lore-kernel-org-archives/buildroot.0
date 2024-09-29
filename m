Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265A0CF6497
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E777780FAA;
	Sun, 29 Sep 2024 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xbk4U74Lf-f6; Sun, 29 Sep 2024 20:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BE080FA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68BE080FA1;
	Sun, 29 Sep 2024 20:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC81B1BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA12402AC
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArYlg_mvcbco for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF7F64014C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF7F64014C
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF7F64014C
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso4908810a12.1
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640912; x=1728245712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OPj1LagV09A6dHhjL4D/hUiyhNE79dFbtn+41NSJSP0=;
 b=S7DNgfWbZcCTSKaKgrxxkWQsKPU5vr0gpgECHUulU7S64GxI2BmtU1Gt2Z2xM4FWDn
 JvJqSFegSMWIgRy5gzFuidS21M2YFuqZmp/eKtysdJvyyoYKCu2Vbf2ebrNFQ9Ago+NJ
 sjHX/Gx7S2kBSrPOkosQ2537vwFh34bHlsDrKl7pREol10Z0v6TWBp5vNo+7Fek5hnqz
 kCw8DZTqJs9mflqoRdD6G4f0zjhOFxPp9GE63Q2R7It/gekH3X3THe8ImVMHC+lR4c63
 qeExtJFx/z84c2BMC9tZ3jfEbroOo+ngsVLZDhYMu+zSki6q4FIU8AU0eq8DLjVb35wZ
 epXQ==
X-Gm-Message-State: AOJu0YwOI65a3ciKayEhZP6I5Ezhskpdel0wPZxhbnFddZqk2f4IG+F6
 cx/2faHYfN3bDIqzLRDWNivYytSsq3f+XpmXZZXZo+73gSDSpXflHBar3MRHeZlIH5t9ETKTuiY
 vBAg=
X-Google-Smtp-Source: AGHT+IE9Mei98XmAf69lxuF0iNmzpH9Z5+qM442xxuAPHJ0fE5k1ZYJjiF+kBX1N3e39VdLnoBMjzQ==
X-Received: by 2002:a05:6402:2417:b0:5c5:b8bd:c873 with SMTP id
 4fb4d7f45d1cf-5c8824eac7fmr10328837a12.16.1727640912424; 
 Sun, 29 Sep 2024 13:15:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:54 +0200
Message-ID: <20240929201459.1761285-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640912; x=1728245712;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPj1LagV09A6dHhjL4D/hUiyhNE79dFbtn+41NSJSP0=;
 b=GCfNePGA7yHLmltGj2B0W2twLNAJahmBWVBJ1pheJrnoWBzblHJ2KSugZ31MezwbTH
 PA6WvnyUFmEBHO7m2jdyF9JwsqActs/GUHyktidS1ZZD0gC14p3ePouIp9gYnU3FvgEg
 gka74uRPcAg5OWAf7d1vV5qKum3G7xNeh6svg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GCfNePGA
Subject: [Buildroot] [PATCH v3 4/9] arch/arm: add support for FDPIC
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
This patch enables support for building a toolchain that produces FDPIC
binaries.

The target name for a FDPIC toolchain must be
arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard format
and requires a special case.

According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
available on all ARM platforms, not just no-MMU.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 arch/Config.in      | 1 +
 package/Makefile.in | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa06..b89be16de0f7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -39,6 +39,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
diff --git a/package/Makefile.in b/package/Makefile.in
index 808b71a93e99..829636900ba9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,7 +39,13 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
+# FDPIC on ARM requires a special target name: it has no OS field and must
+# use the suffix -uclinuxfdpiceabi.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi
+else
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
 
 # FLAT binary format needs uclinux, except RISC-V which needs the
 # regular linux name.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
