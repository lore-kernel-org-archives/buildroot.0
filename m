Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3386EC87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 02:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAF5883C6E;
	Tue,  5 Aug 2025 02:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtSq15RjThEx; Tue,  5 Aug 2025 02:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C60D183C66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60D183C66;
	Tue,  5 Aug 2025 02:42:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 211311A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 063BC83C66
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAyYg2C_TozC for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 02:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BE2E83C63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE2E83C63
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BE2E83C63
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:42:25 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-7076b55460eso44032286d6.0
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 19:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754361744; x=1754966544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0G6SWJvV2k5+whnWdBDFTt8pF9f4MtnIyGJRsb2S5g=;
 b=GRQIimoMSBxUsoWSj8K0+yzyMOWuLJSFnDlYacK2qSEzp7VHjQRbuZJFpf6Py4zQ95
 0DR+q4bM5X188mPmzMSYz80RXVAOYh7z2E8mafT75R1v6FWJROymNJkM/own34Mv54mm
 74c7ceQIfJialTbmRMVfGeENLCKY4W2RtBzcXTd+K2+O36uZ5EcxmX2QXEEwCli8Aw0M
 J2lNQTqdf0IircsCWZfJNly5/l6Di74c2Z65ra7W+gXJZ0HGpGt9MeBf/rwiw05aF2DU
 UatkIRw68EwQeVeDFeV5u5HL8kQs6d0SLxppKmSDt+bwZXn3+cO1Bj8uQRVXJjuWxais
 B3Vg==
X-Gm-Message-State: AOJu0YxyeySRduvg3aiehdmazvwDFqO8do2iOO1rGDdmJP2W3nsSAbr4
 fh/cpsTzo58agrUGNcmxpuFqPiylhUK4nROtDrUqWHuxA1KdekjyY9hOFGEYIw==
X-Gm-Gg: ASbGncvE1cxhLf2Ffw7Ob1Oq02HMOsJmB9aq7CbqNGyarc5LX/RTF0kn6Z59VN54mZt
 rLiMoR+NIgpcZFHJbz/APVIwl8wgoktxZ92GGRzOoz77rsqgwC5EFJliQOWHjX6WUa6nMSiLJ9t
 Ij0zM5H1upoqUxlzqtL1FeNXvGRqbIibsn9bm3miBTnCcL7INFsAB/gx7yGKmvPL9skxeLXzcjB
 6w6+7u/07ycQEdbYxSSd2Pr+fOrJcM1ScFLwl3UkodzmnN8+0zuwsWAnQ7lfj7LBqKgAhgTjBaZ
 Qcb4b+PyTd7A5c3GTHPjS6UcX8pxMwTiLZMOPK8QMaSbGvWWUYZKVRyTLXmAbJ14IlrtZb5Gffe
 IgOON36+EAnFBT6Q73UvMHLqVBoJpExeRu7dCISiyHWUAnwNdq2gTpF7FISfQJA21IK41KfNWtq
 i7LZGIEB2wjCUQbN+e
X-Google-Smtp-Source: AGHT+IEpFLsgeaQ049cy/EdKyNEt4bFWMw5JCDU7ox+Buik0ZpC1F6ibdkkN88alIt5N76MuSFUdPA==
X-Received: by 2002:ad4:5b8d:0:b0:707:16cd:8329 with SMTP id
 6a1803df08f44-7093631d6ebmr176115916d6.37.1754361743681; 
 Mon, 04 Aug 2025 19:42:23 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cd5a438sm65762666d6.48.2025.08.04.19.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 19:42:23 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Arnout Vandecappelle <arnout@mind.be>, Julien Olivain <ju.o@free.fr>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Mon,  4 Aug 2025 22:42:22 -0400
Message-ID: <20250805024222.247903-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754361744; x=1754966544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0G6SWJvV2k5+whnWdBDFTt8pF9f4MtnIyGJRsb2S5g=;
 b=mGoG1Dt2I8YzRmZKnN7n+afP4H6s5qks9Mu46dL3LRaDd5Z4B9xpdZsPx97cSv3ugV
 ig9MAZOXMzm6lhXWCN/YeoHl24PLFdIgBt0kLFHdWH8y9h3Oo/VeOxl+f2UWWvi4MymU
 t6+OrIdzdjWIf6Qarfk7GEvLJiYTRO0xsZYoIlKIBgW4MPSlYlGcOOP71vSoSryYCdS0
 ikXgekVs8Dh5hazsM5KIWhE2mOuqHWASU3dyoee2Ada1rzdLdghqdqA6BfNElcKGAWwF
 it2v1rVb83Gfq7cOyk4RHuirjGYsUelaRNY0ujwTJDjszeeTEPFXVFkvyFEQcZCLxK8f
 m3hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mGoG1Dt2
Subject: [Buildroot] [PATCH] package/gcc-bare-metal: Add extra options to
 bare-metal gcc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users may want to add extra options to the bare-metal gcc
configuration, such as a default abi. Add a new option to
allow this, similar to the existing one for the regular gcc.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 package/gcc-bare-metal/gcc-bare-metal.mk           | 3 ++-
 toolchain/toolchain-bare-metal-buildroot/Config.in | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 17232a8ef1..e7290a11bf 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -53,7 +53,8 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
-	--with-isl=$(HOST_DIR)
+	--with-isl=$(HOST_DIR) \
+	$(call qstrip,$(BR2_EXTRA_GCC_BARE_METAL_CONF_OPTIONS))
 
 define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
 	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 19c97410c6..89b0a98fdd 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	  metal toolchain, use the following definition:
 	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
+config BR2_EXTRA_GCC_BARE_METAL_CONF_OPTIONS
+	string "Additional bare-metal gcc options"
+	default ""
+	help
+	  Any additional bare-metal gcc configure options you
+	  may want to include. Affects al architecture tuples
+	  specified in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH.
+
 source "package/newlib-bare-metal/Config.in"
 
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
