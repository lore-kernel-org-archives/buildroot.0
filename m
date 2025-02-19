Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5CCC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD2E4F3A0;
	Wed, 19 Feb 2025 08:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq-JxHTYQ8BL; Wed, 19 Feb 2025 08:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12A250122
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F12A250122;
	Wed, 19 Feb 2025 08:51:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9054C8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C86E80DBB
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJXt6naGf8yY for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B712884D93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B712884D93
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B712884D93
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso4259239f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955053; x=1740559853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wqJrPSzY44nByywc7slvD3ypUw70LOE+RQlJT45aVAc=;
 b=dgmMMS3sVS6O+K1HuiwUNZA/yh484zu96SFD7MbTeWu6+x2VB+bfcpD3WGQ/vdZteh
 2ewPAcT9KfOnx5QuQAxeqt91WQqqpK1045uBFUT0tVmQp3P8VZxNiOmKzl+JQDVJ9nCP
 1qIO9bEf42ldNy/Vg9GPTvij7IwDTOTKPfVlDefQQGTaRnTYbxJHOvCpij53MLOgm8YS
 B7KVs8AwEYis+3RdG26zUdsRLCZ0cKDN+rAM4ocn5aeTdy4QTXv3YDIthX9lZrPQEAlA
 pnGS8Me3pRkfdKaAVQLRyDtJ4Jon41dYWYUux2I0SuFrOL14CZZn2nVvqFtZJk44Cqd3
 NmDw==
X-Gm-Message-State: AOJu0YwGq22xBpqX1QVsh0WRFmvTIcfeuJRNxn60Zn6KuUBqBiHUKuZx
 reYSoUXDcgtXK9b0x/DPonTWCsRGzH/41WPK1m+b6njxxKGDcTkv4JLvww==
X-Gm-Gg: ASbGncv0JC2ltNmZSxdFi3qLEaG2S7EB/ed5xOP4X+oBlM7QprNnaIKdtWn/DnY6xjk
 ft56KWDd0Ek5XsoeXYCkvgvFxYvlo1UICTFPtYkPdEYy6ul30U/dllTPydq5o9TwP5FeQCl1UJE
 Q9W8gPCE6TKLsdPxFL2+JozAFKJ9iOX0Ml31DkDr5pk17UMuS0V/fq7w9U20kYc+jD1RP9pY+13
 MKPUdBCpYAeu2S7/X/6M6xK0USKs4Vm5CGgXqZqZOrv8RvoLGFSUlL9bywliQMXlwFIMzWyMKzf
 cTpM5LNx/QfkQ6QvdrBBYPc33w==
X-Google-Smtp-Source: AGHT+IHEDcy5W9nMM32OL6PDjTHP/ZO4BDSRCnz8xDUX3yle4grB5XizRrNMwve4LCirhFlPIb4Y0Q==
X-Received: by 2002:a5d:6d84:0:b0:38f:457e:3f2b with SMTP id
 ffacd0b85a97d-38f58781a0cmr2107946f8f.6.1739955052759; 
 Wed, 19 Feb 2025 00:50:52 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:52 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:30 +0100
Message-ID: <f38265c959b954d3796c00dcb8da221ee220628c.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955053; x=1740559853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqJrPSzY44nByywc7slvD3ypUw70LOE+RQlJT45aVAc=;
 b=Ib5WHTePDUZUq3Sq7nohAnL1tBGpt0kCpqXe5IO2ghuJ9bpPU0WoCgckFXbdnYpEew
 X6gguHKGtrhXMOgyVMqRdPli2d5PeR/SGMY7qxZ9bwrBNAjrkdo2/tBsSdPQytpjMCMN
 s6X8CDfTqIU8/fEoPgUqvvnki808Kv+fgIlBqZa6dJG+7SrvHcAmrMTyrTdRhQ2CUArd
 oaGSmTbM89mEueRDNYpVg6s7DXqmbNJm9/8t4H3SMosNoOnTrbHfz+5RbyydP9VOMyDm
 WM4lnkSd9o3uKdUQ/tWnIsP8FeDHt65tLmvB8zbNPFWnD42rA4Cwmjbqub3jzphuN7TT
 AeXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ib5WHTeP
Subject: [Buildroot] [PATCH 15/27] pakcage/boost: make host variant slightly
 configurable
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

regex and system are currently not disabled, on the off-chance that
host-riscv-isa-sim is needed. But when it is not, this uselessly builds
regex and system...

Add options for those, and select them from host-riscv-isa-sim.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in.host         | 10 ++++++++++
 package/boost/boost.mk               |  6 ++++--
 package/riscv-isa-sim/Config.in.host |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
index 5ffcbe6932..d377a8fbd8 100644
--- a/package/boost/Config.in.host
+++ b/package/boost/Config.in.host
@@ -1,2 +1,12 @@
 config BR2_PACKAGE_HOST_BOOST
 	bool
+
+if BR2_PACKAGE_HOST_BOOST
+
+config BR2_PACKAGE_HOST_BOOST_REGEX
+	bool
+
+config BR2_PACKAGE_HOST_BOOST_SYSTEM
+	bool
+
+endif
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 6af76e1302..95191476a8 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -39,8 +39,8 @@ HOST_BOOST_FLAGS = \
 	--without-icu \
 	--with-toolset=gcc
 
-# keep host variant as minimal as possible
-# regex & system are needed by host-riscv-isa-sim
+# keep host variant as minimal as possible, only add options when
+# an actual host package needs it.
 HOST_BOOST_WITHOUT_FLAGS = \
 	atomic \
 	chrono \
@@ -64,8 +64,10 @@ HOST_BOOST_WITHOUT_FLAGS = \
 	program_options \
 	python \
 	random \
+	$(if $(BR2_PACKAGE_HOST_BOOST_REGEX),,regex) \
 	serialization \
 	stacktrace \
+	$(if $(BR2_PACKAGE_HOST_BOOST_SYSTEM),,system) \
 	test \
 	thread \
 	timer \
diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
index eb28d5b063..60dc6823d8 100644
--- a/package/riscv-isa-sim/Config.in.host
+++ b/package/riscv-isa-sim/Config.in.host
@@ -2,6 +2,8 @@ config BR2_PACKAGE_HOST_RISCV_ISA_SIM
 	bool "host riscv-isa-sim"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_HOST_BOOST
+	select BR2_PACKAGE_HOST_BOOST_REGEX
+	select BR2_PACKAGE_HOST_BOOST_SYSTEM
 	help
 	  Spike, the RISC-V ISA Simulator, implements a functional
 	  model of one or more RISC-V harts.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
