Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323FCF45A0F
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 22:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF4184125F;
	Fri, 10 Apr 2026 22:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0qdFAxJH1C1; Fri, 10 Apr 2026 22:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA7840B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775860954;
	bh=m/J5kBs0DG9vCCSwDbIDbR2QywFfXKdzbVbvzNeTChE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Xj32o16LHVFcQ5OU8f6RmKW3qgA2eLfen7OP7uKjiHfEIdl6K/6QagyAnIyurwKpZ
	 0Mv9zNKRsT7GSLOf4S44hurmGDUktnGKWymPJ0NVU4aM3sbopNswh0qFF9c5N5bvdZ
	 8e0erSUN9S3t5WO4cs4dr0qgMkSB5IKCriGOxtbe/3QGq0PBUBQokbuaTJWeogrPlw
	 nwlPPaNRz42UFAWVZdmuZqgkR0w2LKO85ZuvvgtN29nvAs0TvmwvJnFeya0GBowxHC
	 C/PuBf4NuH83AnFlubZJKNa33jo6AVDUC+jHgdtitYPUJ6JbJKDwBYjCTKsB5pHAZv
	 BWU3t1UYtZnfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA7840B9E;
	Fri, 10 Apr 2026 22:42:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D5524D
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E878083CE9
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgAbXMcZ0Ay3 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 22:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=nicolas.serafini@flyability.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCD7A83CE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD7A83CE8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCD7A83CE8
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so24249975e9.0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775860947; x=1776465747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jyEn6yMdzSBur2KFPfdWS9AMDThwGiYyGzjG1fd0Ahg=;
 b=ki5Ynd2/dhLXOYvVEMRbV9CaWP5NZtGH9Vo+ERzgWH5ZKQQZT8ECqOAg4kh5zLFF5c
 kh0M8TgZWOiXeEzEzGRiWddLh6Nm04Dy/kDrMLaefwFcrHvocDhzKv0b0SFbSENnRzsQ
 NKg7ksXcS4ubXFNLRqkdsTht30oB/Yg/cjGOwvb10XcdXjVBsRpsSAt4mvIpXZvwmchA
 G8rAivvb0dGT3ayiXcI/r77A0m+f7hHwjXdOycvGfq/RlA0ZodgsBTsSR8iY8gimYhsH
 DNqxhJ4AS+BnsT55t2VV1xhElKBE3em80e1QQoBdI3UbLeCgozKTjvsrn+b0g5HA3Vv3
 mvOw==
X-Gm-Message-State: AOJu0YzYseigvXzkt8EisLFNjIfsb8FRW27yRsU6LYiVDRN/tFan9cd3
 MnzP382M7a3xe2BJvNp1FTZk0HvoIpTgyfLYdUBtlulnXVKVwjj6WBeHIWtvIeGmiJ9ATEDlqZ3
 CwiVER5dgPQ==
X-Gm-Gg: AeBDieunEC+/TAe3C2tO9+MdMNDklRyYe1KUqr4pgl+KPfHF0FUaNniJ/bGI5MLbCea
 xc6GDcMpbaLipkLif2sEOIUu0d1zTqZA7gYaAUPcj3oZeFocB25Wk0+n18573VoONeqDTaY8w0V
 4yzzFYO9VVM2jfW99da8+rXX/J/P3cd+AqmozmTrhbcSeTUVk0xYRKr81xBBe9mMaIVwlu18xLd
 3HcCmLFlLNzvGnip17R7CiahwsbxgK+VemQaStz9ho0OLInMfFHg2xawgl8LyT8XG5RyhQaB9Ea
 Zjm8W+pL1rMXMpD35BCwqJoaij/9VoTvawY2tsZ1VsZpeRaf+utEOywvYV+sDjYSNtYI+mXmLRj
 0Kwkbu9M0pncLzTcDe6KxQspu3wm55rf3nThzEFVG85Ht0q0sf+VwWqhv922uyLVuKiOf1zJkRG
 KbcLIV9cs7Fgg56wIPLQoz/gtHbbgMt4NBD69yPy02CVAYPZReMeKHJxA61bdS3NgZD7izFDwX
X-Received: by 2002:a05:6000:2f83:b0:43c:f66e:f31 with SMTP id
 ffacd0b85a97d-43d642ab985mr7388773f8f.27.1775860947479; 
 Fri, 10 Apr 2026 15:42:27 -0700 (PDT)
Received: from nse-t16 (adsl-84-227-54-58.adslplus.ch. [84.227.54.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm11668479f8f.27.2026.04.10.15.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 15:42:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 Apr 2026 00:42:19 +0200
Message-ID: <20260410224221.1185631-3-nicolas.serafini@flyability.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
References: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flyability.com; s=google; t=1775860947; x=1776465747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyEn6yMdzSBur2KFPfdWS9AMDThwGiYyGzjG1fd0Ahg=;
 b=vfuNzNCOEUe0YDrt/9HVcM5F3gtOA8IhvypS9DQP/d+RjZeBbfrO7g6+vsGQx5Nrzp
 zLpYjr2tOGbfiJyh0SYEMSPr6s5Hn4dhappgzTj0/xfxR5G8lPFS2lNq2TRWC9Kt1hBj
 oYya5iBsA5AtjMlyOvQwrxiZYiQHty8JveWRQ3pSWhf8eU8oZ8n4S6/y/CY2HButIivO
 qDjKmb8376B/B4j+YPXGNowG4sNl/zCwBh0XNimLQS+/ilxed+kq+owr4a4yU1Q9Kh+s
 VZ/UOUXiShKldHRNij1tCSqJh1m1diixoIq0yuk7OJj+1+sR7JSDA3Kiwqjx+l26G+gk
 6w5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=flyability.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=flyability.com header.i=@flyability.com
 header.a=rsa-sha256 header.s=google header.b=vfuNzNCO
Subject: [Buildroot] [PATCH 2/4] package/rust{,
 -bin}: fix bootstrap build for Rust >= 1.89.0
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
From: Nicolas Serafini via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Serafini <nicolas.serafini@flyability.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Simon Richter <simon@sinic.eu>,
 David Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Bernd Kuhls <bernd@kuhls.net>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 Julien Olivain <ju.o@free.fr>, Torben Voltmer <mail@t-voltmer.net>,
 Nicolas Serafini <nicolas.serafini@flyability.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Rust 1.89.0, the bootstrap was redesigned (upstream PR #119899):
the stage 0 standard library is no longer built from source but copied
from the stage 0 compiler's sysroot. This breaks host-rust in two
ways.
https://github.com/rust-lang/rust/pull/119899

First, building std from source for a cross target at stage 0 now
requires build.local-rebuild to be set in config.toml. Without it,
the bootstrap refuses to proceed. Set local-rebuild = true since the
stage 0 compiler (host-rust-bin) is the same version as the compiler
being built from source.
https://github.com/rust-lang/rust/pull/145876

Second, host-rust-bin creates relative symlinks to expose the host
std libraries under its rustc component directory. The bootstrap's
copy_link_internal() copies these symlinks verbatim into the
stage0-sysroot, where the relative paths no longer resolve. Replace
them with hardlink copies (cp -al) in HOST_RUST_BIN_LIBSTD_EXTRACT.

Signed-off-by: Nicolas Serafini <nicolas.serafini@flyability.com>
---
 package/rust-bin/rust-bin.mk | 4 ++--
 package/rust/rust.mk         | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index aef132562c..0a1f3e5c56 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -28,8 +28,8 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
 	mkdir -p $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME)/lib
-	cd $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME)/lib; \
-		ln -sf ../../../../../$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)/lib/* .
+	cp -al $(@D)/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)/lib/* \
+		$(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME)/lib/
 endef
 
 HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 27b3c49db3..8a643c4a58 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -40,6 +40,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'compiler-docs = false'; \
 		echo 'docs = false'; \
 		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
+		echo 'local-rebuild = true'; \
 		echo '[install]'; \
 		echo 'prefix = "$(HOST_DIR)"'; \
 		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
