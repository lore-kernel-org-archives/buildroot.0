Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40102D5B872
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 480AC40AE5;
	Mon, 15 Dec 2025 22:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJP6aUeBnTtC; Mon, 15 Dec 2025 22:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E187240AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765837859;
	bh=SJ4f7tjr3ycUzj55A6Le16cGAisdNmPQl5aWeVKyEpQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fq/sKFzwTZhIZA8Y0pVSXM4i0jslXkKaKSixZ4FZ9XMPPp36X4B5SYNkXAkwAx3se
	 FZ6hJA3uwx4rCfDKe9C9IGh0Yc+9LWSZAxhNhKSMX77wszC1MJBPQAH6m0FnroPepa
	 hY9IvaOPtuY9iRTb7dEDm10cBKFZ3SjmKQLsjjP+MOH02EcZc+Z69XLS39Cab7VyNE
	 SLHW+g/fB8qgc8CZijYMCsKWqdAxtHjMKYmuUwq5DZ/4DvZd4NWqbBA2RqsiB/4iSg
	 jxNl20YHyP/VY5JFeL1P4ZFK6FgemVIrhXazh6ti7+odApwDPwkk30unZYekyD+Fn0
	 LHFZ9rQevPKcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E187240AB1;
	Mon, 15 Dec 2025 22:30:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ABA6255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D14F40AB1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IDSKBVjizuU for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:30:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8768C40AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8768C40AAB
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8768C40AAB
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:30:56 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-37fd6e91990so24716541fa.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765837854; x=1766442654;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RYoq78RmXnngUoNBga/xOjyJxHMhTBkAfBrpq73O2IM=;
 b=g7W91sGFUyxh0aBmQgZE/sYw0Ws4VuVvtNWL2CeioxKOCQSrUFKwJOOloJFfmhuw/4
 8RRsDNK1e3DDNgIC2AjqsNsMeBSiW/y+5y2DSbQkc9T2O6IRSoirU0z+oqg7W5VzQoFi
 PQipHoW3jzBsOFyWrSOHceNGlmstyFdxWm/VSgYCAkXWCBmpjMgbEtieU+v9l8ltSP3Y
 JXsQNmtNyyPMJSPnMX4gih7AgIEK3Tq1xqMNAn31lVwmkBhxiiN7w/SGNlLR0d8XTJP2
 aWqS60AcgTVzxi1xHm2TiuR57pJ349Pp6kGMBIbZCmae2WgzBeCtT80coWZJFPuzpHFJ
 p8gQ==
X-Gm-Message-State: AOJu0Yx/7sURxwQjfPTgjdaTEIE04Qd4c2CvaIjwCijF3W1+q6pbDgt7
 AzXB4DihGg2NI4V8awAwrz5zk2RxceSC42Hf6hk0cvPTzfm0591d+EtMq3o2tg==
X-Gm-Gg: AY/fxX4ciSb7OhMTl71i8Hq6+LVS1pZldyFrcZHwZWHepOxvTlBO9X6V1LDwuXQD9aX
 mqQ6roFkjt0ws8tPWdS4768PQ22dTsHkye2gt24e+8Zw9Ejex66Jggw2stKVWYpusBGtpOBRiyC
 A6H4qJu+JRSog/lus6QMYpen9Z+/Hn9TDe/kr2u6uY5LxHgCixapvjs91Sv7wuZCPkfAb9pbt9K
 Du5yL56YV2+EuVTBpXC20W0x+45VYoMCP90nJbg/dAo6CFCvjR4FZLgoCnSBk83jbHWNRBj9uno
 xVdASM66gg8sLbQu07WzUwPSmLgb1bj123Ott4Vhat0eSG4CumJhmmaHATfiBvDHktDX+Zt3BX1
 ObmdeSf5zpSZ1Rxi9ykV2u5I8bEZDF/+EYjwqUHuBLjNQAoom/oDfI2Rv+R/SjPJiu7ooFZ0DHz
 EW96vow9tksZd7GmrpmwysjUUwJs4a0mB1br+E4wMNegU=
X-Google-Smtp-Source: AGHT+IGBZjadP3hg1N2OQaCT0qoy3CPquLXTxqGCuTL7NBVn8b1R/iljpJ2co+QjL3MpmgrGG4daEQ==
X-Received: by 2002:a2e:9a04:0:b0:37f:a216:e473 with SMTP id
 38308e7fff4ca-37fd05d9a9fmr35739001fa.0.1765837853695; 
 Mon, 15 Dec 2025 14:30:53 -0800 (PST)
Received: from gimli.. (h-158-174-186-51.NA.cust.bahnhof.se. [158.174.186.51])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fdeda15a3sm33515291fa.35.2025.12.15.14.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 14:30:53 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 15 Dec 2025 23:30:49 +0100
Message-ID: <20251215223050.2231782-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765837854; x=1766442654; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RYoq78RmXnngUoNBga/xOjyJxHMhTBkAfBrpq73O2IM=;
 b=cNnEl92h10UPsSxjmS5JgrI7uiA24Z9LTmfxahue+AiTu/tp7eX/5AEcqPxZJa/OTz
 X3fds924no0oR0+6GlSVZ+fMXLZjjMREvZB1GAzf8mFTAjqtLNsWnBQ2UMBC4w2SNqu7
 lIRzju3nk7+Jq14yvXmDsuF3cXbzrsbGK/vnLTDZEtGrWwXRMYcmjfxNbNnojR8oPcfc
 IFCOeNdgX/PcyGPMBLkIIA8IOj5+P8fzm6l6I3nc1w/A9N4MTjYuLI3iV6rGZUc+S0rI
 TLlXQBFIF7sGE/1KEfMi94M8Xt+xc0JVy30PMDI9ub8+1+ntZZBLDlLUlA8gHJPXddRp
 3pIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cNnEl92h
Subject: [Buildroot] [PATCH 1/2] package/libite: bump to v2.6.2
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

Changes:
- Fix memory leak in which() on realloc() failure
- Fix pidfile() to handle missing trailing slash in prefix path

https://github.com/troglobit/libite/releases/tag/v2.6.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 3abad09b0a..c593f7a66d 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,7 @@
 # Upstream .sha256 from GitHub
-sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
+sha256  0550ac5670836db85569786e00860d1d6999df8f74005307c290371c990e1dbd  libite-2.6.2.tar.xz
 
 # Locally calculated
 sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
 sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
-sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
+sha256  b6cc7074a27b26ee4e1ccda8d634d485d0f6f819e564c663c28ed61f4cc2b451  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index e4bd845487..beb8c27ba7 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.6.1
+LIBITE_VERSION = 2.6.2
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
