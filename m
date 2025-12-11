Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A9CD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09FB58117E;
	Thu, 11 Dec 2025 19:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwVgUfRO1O3Q; Thu, 11 Dec 2025 19:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1B2A80D50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481544;
	bh=LRYtDYYil4W5IB1KNKt5dgF7TYiIE+uJWUlGVCiKydc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i/covVL9hF9ZogFpt0m5Vw/CaOx9FQ6NAPVWHqYWXwW4uMc2Nc+mOhxGVJP1QAblH
	 AJdvjXqLqqt3GMHpi+qtcK7FNNLLZQ8QsUU5+kmaqJAlNz8Bhba9wEUzwzzenJfJfn
	 RqBkb2YCWFeXRibG/BkcuRf/vG6Wn1vSLEkNQRd8HgCXOPKThNsOghg1quPl7oC/gL
	 nm74xxKocSYQr3d3IZTRH0ig13XBpuv8qijIhae479Jifa9Tak6q1mYpdwZNOW39CM
	 lfgxjNtVp4hk+HYDw01PAOcRcbuesNJOcUGZRrWLAolzzNqmGVJp+mkV8G5CGr9gBR
	 aUhdQFKDMN/3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B2A80D50;
	Thu, 11 Dec 2025 19:32:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 143B2E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF013411B2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNxX1C3kg1F7 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 650C5406C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650C5406C1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 650C5406C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9675CB979EEF; Thu, 11 Dec 2025 20:32:19 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:17 +0100
Message-ID: <20251211193217.1100552-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122130505.2240518-1-bernd@kuhls.net>
References: <20251122130505.2240518-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481539; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=KiW6O6fxS9xBLl5e0p/rHkYuVakry7/kSYW9CON4o3Y=;
 b=SKsyDuNu9Q9SzOqLTS98ubU7S2K3helT0Xjalt5NRQB3Xaq5xKQ4+CNCjii7UJ9+SuQNgQ
 tU76MIO7pPJBOh24GbFCgdhSDmFQgdXA0mPB/PlnQZkyc1HvZ448oZpFBJxkY6meqTBfey
 y/tGqsn6G1TIHPMETcQuj9IBlkjIoMhin417IVEQ4HuFAaUEklnWPYf8t/eIrEdrtNqsiH
 X328mjoG43PvT2kqK61xVgisrUAAjfayF1GKmmhF2OeM8YnXpUtar7XW9jufUmCtm6kBdI
 xZ8WqqvIGlywEYkermlSPZqUDxDATFZiN51MikeGFs1N7v2q8BoMPZ9rg0gzpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SKsyDuNu
Subject: Re: [Buildroot] [PATCH 1/1] package/woff2: fix build with newer gcc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes a build error not yet seen by the autobuilders due to other
> packages failing before. Seen with defconfig:
> https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  ...utput.h-add-missing-stdint.h-include.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
> 
> diff --git a/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
> new file mode 100644
> index 0000000000..a79b414a4c
> --- /dev/null
> +++ b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
> @@ -0,0 +1,41 @@
> +From 08ece7871775c0d7bf4fdff64b961cdc256adf6c Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Fri, 2 Aug 2024 22:12:03 +0100
> +Subject: [PATCH] include/woff2/output.h: add missing <stdint.h> include
> +
> +Without the change `woff2` build fails on upcoming `gcc-15` as:
> +
> +    In file included from src/woff2_out.cc:9:
> +    include/woff2/output.h:73:25: error: expected ')' before '*' token
> +       73 |   WOFF2MemoryOut(uint8_t* buf, size_t buf_size);
> +          |                 ~       ^
> +          |                         )
> +    include/woff2/output.h:79:3: error: 'uint8_t' does not name a type
> +       79 |   uint8_t* buf_;
> +          |   ^~~~~~~
> +    include/woff2/output.h:16:1: note: 'uint8_t' is defined in header '<cstdint>';
> +      this is probably fixable by adding '#include <cstdint>'
> +       15 | #include <string>
> +      +++ |+#include <cstdint>
> +       16 |
> +
> +Upstream: https://github.com/google/woff2/pull/176
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + include/woff2/output.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/woff2/output.h b/include/woff2/output.h
> +index dc78ccf..b12d538 100644
> +--- a/include/woff2/output.h
> ++++ b/include/woff2/output.h
> +@@ -9,6 +9,8 @@
> + #ifndef WOFF2_WOFF2_OUT_H_
> + #define WOFF2_WOFF2_OUT_H_
> + 
> ++#include <stdint.h>
> ++
> + #include <algorithm>
> + #include <cstring>
> + #include <memory>
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
