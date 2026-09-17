Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4655EC982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0781560830;
	Thu, 17 Sep 2026 07:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ryyM6otgHHy; Thu, 17 Sep 2026 07:53:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 194DB60659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631622;
	b=GUa8Og/ukmb4NvbT8Wv04xwJNX2iil3s7oJShTx8+vvTmdqbtGdJ6lvgbB2WFocAx+Ni
	 cwYmE1hIKmhHql6j2Wv19pcWnZmKMfaT8n7HCRJ2UpGSxDw10gYlE09eIuX3qLsV5LLlW
	 qCJa82YWhFSY1qG2iKlnifaJikuwoBRzpZceCVN5m4OlYN43V0j7mSrdK3UhbRsuYXRIU
	 WHIuTRThbyjxQ279lA1oFIShmFeRpyo/CYGBePhT+UKvuwcyBzJLPgiI5KnRX9dP0f+vh
	 LXRzkk8C/oOiMjyjKhVsRCCMq4KuzUrfTl8WsOoHRy2DoVQiVgSLAwR3gR5tihRkuHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631622;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QtepTEm9nyw5bq8r0ZRwyGHSJRnQdwexW1hYQkPmW08=;
	b=em/C3GXLWEm2vZl422MTqhu5s+G974JCRAeztZunHpGr+OM/6O6UXDt6GTvopkOw5mol
	 pbImSPZz6q4M80BqRctBSZNbpUkxH2p/TbHxw3kYi2eHbeg/2gAZP+raJxQE4KgLuwiis
	 ZwxNIdbdrIHWOSAWdG7O7Y2FPdlLyYRwSLjHvpMD9+buNXJJWs4lujkqgmRMqoSSajosI
	 YqBGNriExzA5yJQStej9Ui15HMNnpRWYnaPHcxxQpKPksc8Ip/sPQL/zWomXASuHK6oGB
	 6KA6UlQ/gSGCveeZt3YIekpcfJ0XGIschEia36UP2SzULyvMNU/DozD+5xFaDRnof5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631622;
	bh=QtepTEm9nyw5bq8r0ZRwyGHSJRnQdwexW1hYQkPmW08=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=OFSZnKXXlsMivW7yjsnQpK68wdAf084E4+6Vo0VlphOjgk6bP4VY1BFI5w7UcG4Ib
	 I3N0hU8i+5NAu24LTxzmU4PAEpkfy55kGDjV+Fr6+WVHTnR+r4Mr0xLwiEXCqNlLY7
	 2d1R+joDaYl5u/nKExztNsAZe0ftV5m3v2aBUXGOge4Zm18rJBDjIDvwfpZTWyyKd9
	 FyR2AatrFGYOpz7ue4It1Xzo79KYXy4dYsQicV0EHg32jGx5YFe11JajTTV970oswW
	 07tV5MByzC7ts0FO/n7CdhYmdIpMrR8/0/aelI503OVklxQLedyTWraMkmDy5V/GiY
	 YxpLNKwATQdbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194DB60659;
	Thu, 17 Sep 2026 07:53:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EEBD29B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 154C460629
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_5hGXhhvrjg for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:53:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0EDFE6069A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631620;
 b=obmLpTOOxfUWlzMN+u+jksm8ohUxB84R9Hv6KwoYGAKbLle39W8Ax3vecU5GhNlEUyNr
 xY0ZLKIyIiK3ExtM6dZGBt5ilrmqFYzcf3luJT49RuiZhd+uB/hGKnfjdu/pCYLpKe+6J
 22tKSslG+RPnYuG5gvi2UNvPhecTQt3LSgkjJZtLgW4Hdc10GclRhGe764JfH5mKZuvfB
 RPqaKf1lM8Znpoq3dgZSI5ABcln5rhUvGZnFTl/ZLTkoh6FpFAX12RVBR9aXtfs3bIWMe
 93NstNj8f/XUYCAyb86xnPq6CJ8GbFrY6xx/k5BB1x6jqQOvn9zCmhakZ81gXgDmWtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631620;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=2c51u541N8vvey1dt1UP1mMmWiMYiZtaFUlYXpmWAaE=;
 b=SyWnnXYraP+4Qs/w3oGf+Gl8+n0vimShBCPeDY8E9vkz6ZmbCZ1fSLalYu+bdU4uIdM1
 vw9ic8z3/zfr4OrvK11/43ye7YVeoQXpS+TFw9SC0uoWEkuTK6ryjKkUYKnPKlndzPYS5
 QopZgnzZA5rEEB0uadzvYOPxEVCtTGsOVlPDnRMo0TIIEl2p2stDEDCVxfRCM8hNVYUCx
 2NZW7CAWuD8tWkt/U+ABEOR04qqyVQpSmwOfhDk1wgJT2GGbdTxxCOWwmkxAQnrxUgxfg
 cFWynC+FAVQHA0ZEClYMT88NH1C4xlJKNOnZfsBJ2zb1QUHRXhHJ5h/Kh7OxQ+PlR7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=DRRaOC4p; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::f;
 helo=mail-ej2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0f.google.com (mail-ej2-x0f.google.com
 [IPv6:2a00:1450:4864:34::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EDFE6069A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:39 +0000 (UTC)
Received: by mail-ej2-x0f.google.com with SMTP id
 a640c23a62f3a-c254f56039dso74912466b.3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789631618; x=1790236418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2c51u541N8vvey1dt1UP1mMmWiMYiZtaFUlYXpmWAaE=;
 b=hRXkbydw6FUEz6IUFEro2aBUI3KecQfIeZ3/+QAglBhYV4xk1L9CFPyrKUvUx8b98j
 qplzfKXFj14D/YnlHi+vze2xg/RZbT6vc7gFSObNNFG/yCXjk0qJxtMZTOzxsWV0ppq9
 rLCVRyf96zU21YP8HRcM3hpJMkv6FnXIf9zWTeDOBTQSE01VvzM4Cq7y53rJTxNGPsBF
 a70RqB9fV1Eh3uP8k86ua+N9O77j8z6KlZdnwR3LE++H21nW0hMgVuPs7muBjoWWMDIg
 8cGgB/cIufDbs5hgjk02Y5wkdFYOP1xryGd68MeaXHDkDmtE3YwM9J0c4FQ408H5tnmF
 fC1w==
X-Gm-Message-State: AFuF++lzhhiq8aeAv6PFO1KRfGdprZhQVdhh53TC8QWmDag1PToIPIjO
 Pae8o9/KsW8TOgmqe/9x1DMMGxa0GHcwTJbPIG320FNiOeooWAHMw4ZXCn6FPQ==
X-Gm-Gg: AYBFou0PVqHEQxsj6jqka0QYylhJqfeGz40654DL+nLVW7tDSE8hx0FbQEm/mmhOaBN
 XA0wGhsEvxMi8Xub98UFj1woNZDq9SluGHbCmXV2Iamac2vvTruQCb7qUIXNoWMwkspKbRsaAX8
 Gr5Iw555Q+o+zl3MokwFyDYw21vh0S1lDSA1WKZCMcTirnxU1QZhYhgsg3EuwuxUQQHD5vAq8ab
 5CsenTKS818cdYLDkZ/qTu0Q8bdfMDbHK13KyamRHWaWXXf3rzPy5BxQf2CWIunTAFlYnY6oHu7
 cKaZNKGP/hhso5jRU703qYHgJnDm3R4Kf9Ucvf8o4wFfbJp8ugo9UKjmRRC5n2gn7h6mW+CfUxf
 cHsRFpXFm8vjFIr3ShqVnZrn6daBZSc/n7y2u3sgGJW3zODiGu6RjjDnr5XMXIRHQClPP4FEzlW
 84Wr+Uf6D3kBVRgc4/TllxwtBmPQubGi4MJ/dND04T3y1EgHW+f/LEbZmpOqUbdaM1hIG6brHdP
 1LuTLmGQThJSisw0rrRRkvpKsTSytYY1P7yuk6l6QaOg/o1tr4ejT7YIQ==
X-Received: by 2002:a17:907:9309:b0:c29:60c1:7e55 with SMTP id
 a640c23a62f3a-c29e523d53dmr382262266b.12.1789631617487; 
 Thu, 17 Sep 2026 00:53:37 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de454b88sm246492066b.20.2026.09.17.00.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 00:53:36 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:53:25 +0200
Message-Id: <20260917075326.1256294-3-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917075326.1256294-1-yegorslists@gmail.com>
References: <20260917075326.1256294-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] arch/Config.in.x86: add BR2_X86_CPU_HAS_XOP
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Romain Naour <romain.naour@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The AMD Bulldozer family (bdver1 to bdver4, i.e. bulldozer, piledriver,
steamroller and excavator) is the only x86 family implementing the XOP
instruction set, together with the equally Bulldozer-specific FMA4 and
LWP extensions, and TBM starting with bdver2. All of them were dropped
again with Zen.

This can be verified with:

  $ gcc -march=bdver1 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
    -mfma4      [enabled]
    -mlwp       [enabled]
    -mtbm       [disabled]
    -mxop       [enabled]

  $ gcc -march=bdver2 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
    -mfma4      [enabled]
    -mlwp       [enabled]
    -mtbm       [enabled]
    -mxop       [enabled]

with bdver3 and bdver4 behaving like bdver2.

Add a hidden BR2_X86_CPU_HAS_XOP capability symbol and select it from
those four CPU variants, so that packages which cannot cope with this
instruction set can depend on it, instead of listing the CPU variants
one by one. The first user is host-qemu, whose TCG engine does not
implement XOP.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 arch/Config.in.x86 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 3c4a725360..51b157409f 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -20,6 +20,14 @@ config BR2_X86_CPU_HAS_AVX
 config BR2_X86_CPU_HAS_AVX2
 	bool
 
+# BR2_X86_CPU_HAS_XOP is selected by the AMD Bulldozer family (bdver1
+# to bdver4), which is the only family implementing XOP. On those CPUs,
+# gcc also enables the equally Bulldozer-specific FMA4 and LWP
+# extensions (and TBM starting with bdver2). Those extensions were
+# dropped again with Zen.
+config BR2_X86_CPU_HAS_XOP
+	bool
+
 # BR2_X86_CPU_HAS_AVX512 implies the following AVX512 extensions:
 #   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
 # This subset is common to Intel Xeon (excl Xeon Phi), AMD Zen 4, and
@@ -604,6 +612,7 @@ config BR2_x86_bulldozer
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_piledriver
 	bool "piledriver"
 	select BR2_X86_CPU_HAS_MMX
@@ -613,6 +622,7 @@ config BR2_x86_piledriver
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_steamroller
 	bool "steamroller"
 	select BR2_X86_CPU_HAS_MMX
@@ -622,6 +632,7 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 config BR2_x86_excavator
 	bool "excavator"
@@ -634,6 +645,7 @@ config BR2_x86_excavator
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_zen
 	bool "zen"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
