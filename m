Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5BFEE3688
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DFB2406F2;
	Thu, 12 Feb 2026 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Q-YGYaH4ykG; Thu, 12 Feb 2026 14:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17508406E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770905903;
	bh=ln5S3x9Et0Y0Qa32Vo/KZcZqCum9e1n0t4jPfhU1ZTo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZOZ1U3pStAxju94HjsMm+PQ+VWF4zSfnJJLCquDLMDj8k4zl3GXTl3LlIntTXGuA
	 JbRyb8PXymtoGwWnUEaS+auC70/iaVGuXM64Na5+0u+ezH2R+hKZ5LR8vGgfWReBbB
	 h3Ql1STGK3caxValtjmn53NyLnRRsAe+iAQeZ4jNuEZ5MGrHNYabqtykeBbqsFqntY
	 hL1zdIbMHyFEFMKycCtsc6ZgWelQ3aAVijf6p2aB7OcTw1ZU5jSmM9Mqu31841uc/g
	 fcZk7wPzb0zum2qc4SPk+SxaTFMyk7ryCUDKQiOqbomKmrfjvpVPAuEGxTifnmAAE5
	 eTaSS7BOZT8xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17508406E1;
	Thu, 12 Feb 2026 14:18:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26444BE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 14:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0771340167
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 14:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT0X-M1ld2xU for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=ming.jvle@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 340F740148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 340F740148
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 340F740148
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 14:18:21 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-824adf81fa6so556009b3a.3
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 06:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770905900; x=1771510700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smIMQjjX+IVd77AVwHIzNJ3tP2toGySKk/o8I0AniV0=;
 b=kUbNc+qDeNB23z4Cr8TMwdBVPNo9UjIT3voFwkmxGCMyAD24H4tJu21P/AXJNTvYHX
 E119CNTa7OiqbF1in7VPtvhwBFX/LoiQ24lbcXH+xXb4pCPjBR//SfMp16j7GjkX+ZSY
 WY26+fRW1x5awR6zknjphD4j0MNH2TvwLZaoahy2hIwq/wszi7qDKKOBnVXd0OdVrV5C
 PZG4hhwC+zemUz2B1eQnEaxQAVrlmBmozS5JqFKklLpp1pjCDkSPpl1VAfQXxl2JPiwx
 o5lp/7VBSHdTlTeI5saUxErqLqdPvEt5QxgYaL5E1MjQ0B2litBptpgCQBFZZd0eHa9c
 +bdA==
X-Gm-Message-State: AOJu0YzsR+uk/3SF/tHZZepiGXkVCcOwGATglpKPdPa87u7A2s7qOGE7
 PhiY/tYwHH6y+LfaOQjDVcdyJCe/HCx/T5xTZmtq77+5z+wnIcldDH4beFF82AFt
X-Gm-Gg: AZuq6aL2b33SZdsRnYNwqSVXgejrXrlMqtAaXxOQ9xrie1rBkobgJiZ4go/NiEBf5TV
 Qvtvl/id507CN6fxcM+oeUTvnjJSAYLhPQN1tLya1Y4BnBQEroByJA+U4ft11eOp/JFf6DMzljx
 6hJlEm3ykyjIVMd5N1Xj/nG15+4TPcbHRI+WHtzclLKztNa3w0aVs2PdcPQYLZaKC5Cli1kOnfE
 oxPkHbDOyGLNz5Y2YMxbA/CXWgIzVzflj9oHFvLEZguLMLtllEg0r2McI6zzJRwu9ldtOJNU7Ys
 Y977/dtKv5gfa3WBcaI6gM5u56AgLuR5opVMPmHiv3DbLJZF2cevDpjaChqvWZFkJCIjZ/TtXOx
 YWLHauybuIn2FURtdRHWwACcA6HPZzI4JZ9KZVsMKrRly92vygQW4s4SSU1wDLEbRMPSkegSWgg
 RQxVA7ODdq4UM5qhSiaBEcn2JALvVKU6S1M2Gwd9PC1fPBkxU=
X-Received: by 2002:a05:6a21:6da5:b0:38b:e55a:97c9 with SMTP id
 adf61e73a8af0-394484fefb8mr3124439637.28.1770905900055; 
 Thu, 12 Feb 2026 06:18:20 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([117.150.31.55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab29999cedsm54522415ad.91.2026.02.12.06.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 06:18:19 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: buildroot@buildroot.org
Cc: Keke Ming <ming.jvle@gmail.com>
Date: Thu, 12 Feb 2026 22:18:03 +0800
Message-ID: <20260212141803.30239-1-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770905900; x=1771510700; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=smIMQjjX+IVd77AVwHIzNJ3tP2toGySKk/o8I0AniV0=;
 b=jdpndNVU5vh0Q2gR0jc5SPJpIwL0T5MjEeFdR3cZFuIrTwR1QXJsTm5im4e5hhpxO8
 xAtzHIT7OeG/pJP7l90n2JoxpiNImxBPff0nss4aqIwn9La9vhL5vDgM/ayjlTXY776S
 ApumqZBA/revtyQh1pGBZ+M5dNhKiDTMoZBUo984iRBWdP/YOT7pk3mWbbhhYUaSC89z
 r3LNAaocAvLWgic//0ajGBVhhBY1oTnQs9x55RB4Pk2nO9lMmrt7vA4GVSpobZ3wJncp
 TU5F0dVnJFJ1N5cJAO3/oxOSWHNsFZiB1P3hKwbooNYza81t2BrnuupDCt4Y7rjjhMoz
 yZzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jdpndNVU
Subject: [Buildroot] [PATCH] package/sdl12-compat: new package
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

sdl12-compat is a SDL1.2 compatibility layer that uses SDL2 under
the hood. This is particularly useful for running older SDL1.2
applications on modern systems or hardware where SDL2 has better
support.

The reason I recommended this software to Buildroot is that I was
unable to initialize correctly when I tried to run several SDL1.2
projects on embedded devices, but SDL2 could initialize them.
After using this project, the initialization problem was solved.

https://github.com/libsdl-org/SDL-1.2/issues/898

I have added the necessary files:
- Config.in
- sdl12-compat.mk
- sdl12-compat.hash

https://github.com/libsdl-org/sdl12-compat

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 package/Config.in                      |  1 +
 package/sdl12-compat/Config.in         | 11 +++++++++++
 package/sdl12-compat/sdl12-compat.hash |  3 +++
 package/sdl12-compat/sdl12-compat.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/sdl12-compat/Config.in
 create mode 100644 package/sdl12-compat/sdl12-compat.hash
 create mode 100644 package/sdl12-compat/sdl12-compat.mk

diff --git a/package/Config.in b/package/Config.in
index 6284bea7f4..9de93dcb69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/sdl12-compat/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
diff --git a/package/sdl12-compat/Config.in b/package/sdl12-compat/Config.in
new file mode 100644
index 0000000000..608adf153c
--- /dev/null
+++ b/package/sdl12-compat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SDL12_COMPAT
+	bool "sdl12-compat"
+	depends on BR2_PACKAGE_SDL2
+	depends on !BR2_PACKAGE_SDL
+	help
+	  An SDL-1.2 compatibility layer that uses SDL 2.0.
+
+	  https://github.com/libsdl-org/sdl12-compat
+
+comment "sdl12-compat needs sdl2 and conflicts with legacy sdl"
+	depends on !BR2_PACKAGE_SDL2 || BR2_PACKAGE_SDL
diff --git a/package/sdl12-compat/sdl12-compat.hash b/package/sdl12-compat/sdl12-compat.hash
new file mode 100644
index 0000000000..8c095a6202
--- /dev/null
+++ b/package/sdl12-compat/sdl12-compat.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2588686c0972e1785829dc3bf436b543c317e6afa30a9b91d48013dd9c110e81  sdl12-compat-1.2.74.tar.gz
+sha256  8bb90ab9c7b3b4aaa2f59e6e629ecdb55b7d8f4a0159e74d8f106237e094eaab  LICENSE.txt
diff --git a/package/sdl12-compat/sdl12-compat.mk b/package/sdl12-compat/sdl12-compat.mk
new file mode 100644
index 0000000000..c8fcbacb65
--- /dev/null
+++ b/package/sdl12-compat/sdl12-compat.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sdl12-compat
+#
+################################################################################
+
+SDL12_COMPAT_VERSION = 1.2.74
+SDL12_COMPAT_SITE = $(call github,libsdl-org,sdl12-compat,release-$(SDL12_COMPAT_VERSION))
+SDL12_COMPAT_LICENSE = Zlib
+SDL12_COMPAT_LICENSE_FILES = LICENSE.txt
+SDL12_COMPAT_INSTALL_STAGING = YES
+SDL12_COMPAT_DEPENDENCIES = sdl2
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
