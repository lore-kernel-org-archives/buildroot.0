Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC66CF6497
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B62C780F92;
	Sun, 29 Sep 2024 20:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpExpR6vInOk; Sun, 29 Sep 2024 20:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF1280FA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF1280FA7;
	Sun, 29 Sep 2024 20:15:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 202961BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BF1040165
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1lNBrfO1MHe for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C56BF40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C56BF40135
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C56BF40135
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c88e45f467so1418390a12.1
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640908; x=1728245708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A1fwdrkxR9UaBIlKgHknDI6TdyU+F9Gj3rb8SiV9Hkk=;
 b=riKWgjFHNekZiXE9Hk8BnjCXscJJwkb9tCikOm06VZjyMsxl/iHeJYZlY3IAxDo/0N
 6GJluJ68CTs35xoy7zOczKbfDWPfDoLuha/o0bezvZh20WDL0ykpsT6KFgYJI2nBtywT
 f6WvrVEtR0FyeT2hZT1vOkKTqpFntEFqm38ziGqnPPjiOQ2fGUP7akeUHaQkikyIxsih
 5wHRzpgl/bB2bfbcnyxu2GWRyw/KapLRpLvneh/TygychvHSPvPjF8PzSEs7XHA/V3YS
 D/1B0YWGQSGyGNtfwZXWCctD1gWtsiAQ7NLjt0pTt7IbgYqs3ZbKx0hIgKriSy8fg5wS
 dpBQ==
X-Gm-Message-State: AOJu0YwXr/pWUHQy75hlpDhBHmhrgAE2UVMoP81LWC7mG/Z3QTuMBsjT
 FX7MGo+WIReETdRO5IUuCaehsPITfKq6lE/vkj+ct24jiZ4SfV44rmf7Ve2QtW3mM6eS5p3VYOr
 /yis=
X-Google-Smtp-Source: AGHT+IGicD4fG3I9yPaXDhkFH9S77JGaHdqJANgGWKT66FUZ6gW2qVxSHZOpTYbzL2palnkpdCjueQ==
X-Received: by 2002:a05:6402:40d2:b0:5c7:2209:dedb with SMTP id
 4fb4d7f45d1cf-5c8777b59c1mr14934747a12.8.1727640908274; 
 Sun, 29 Sep 2024 13:15:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:51 +0200
Message-ID: <20240929201459.1761285-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640908; x=1728245708;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1fwdrkxR9UaBIlKgHknDI6TdyU+F9Gj3rb8SiV9Hkk=;
 b=S1M/BvHyfhDuvZmvuZsqdBEMtmcbC2axJ72hYaMlvFrETVTKiY3euxYf2CxE57LXU9
 D5f6aZbKzLI2AHX+j0rRXyr5ZDv/e2WDZwuEh8T5UQ59FV/ZwWoH9LEkVRHWnoNZhiew
 rA5uLb1ulDDnPiBZrQdZwiWP+kBGTkY9FZRa8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=S1M/BvHy
Subject: [Buildroot] [PATCH v3 1/9] Revert: "arch: drop now useless support
 for FDPIC"
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

This reverts commit 58dcd28dfbed481becb822b009583a63efbc6ffa.

ARM supports FDPIC, so this code is needed once again.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 arch/Config.in           | 14 ++++++++++++++
 package/uclibc/uclibc.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 2e7ac080efc5..bd5f9ce47058 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -12,6 +12,9 @@ config BR2_SOFT_FLOAT
 config BR2_USE_MMU
 	bool
 
+config BR2_ARCH_HAS_FDPIC_SUPPORT
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -430,6 +433,7 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
+	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
@@ -441,6 +445,16 @@ config BR2_BINFMT_ELF
 	  and executables used across different architectures and
 	  operating systems.
 
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
+	select BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  ELF FDPIC binaries are based on ELF, but allow the individual
+	  load segments of a binary to be located in memory
+	  independently of each other. This makes this format ideal for
+	  use in environments where no MMU is available.
+
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on !BR2_USE_MMU
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index de834bac4f2a..600d72ce7ba8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -57,6 +57,13 @@ UCLIBC_LOCALES = \
 endif
 
 # noMMU binary formats
+ifeq ($(BR2_BINFMT_FDPIC),y)
+define UCLIBC_BINFMT_CONFIG
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
