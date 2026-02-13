Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D4EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CAC84550;
	Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giH760M1KaSI; Fri, 13 Feb 2026 19:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF2D4846E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011442;
	bh=AZxVgqw+D/RmqUD31DlP7Oo6gCEsVqgUvCf6bUvBZkQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZH8OMZm7jsdAObNSg/LYdta5m5N7/QXcm9UGhEJ0iv29LWx5fI4GWzLFzzmxITU/I
	 k1RHdJVfDHcJbkgVjpXmPdQ1EoPHpGFmBU8nrVPj30vwGKCzU52pkbrLZAeB5Qt2b4
	 wuL8NGksRdfG6tVBnUYvRZPyn0LVxRLgnigccFfWpv+tT80dlc0YZ4bBFIgrheu7vS
	 gXz2DW0RDvlJPpsFE6X2WclynIaLGZ6XnaGLYoS8vt3DOw3E5KcX81cglNiqP2RPIq
	 +KUvAEX08hEe8H/1d1IJN9swRWgp62daujgglC+O3IcN7T0aqRXvgiERkaI2XDsiOv
	 Aad1HjOHECr0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF2D4846E3;
	Fri, 13 Feb 2026 19:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80ED6EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB93844B5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWqNCJjfvspa for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FA9984558
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA9984558
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FA9984558
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so7994165e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011409; x=1771616209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nxi7gKmPs3aBLBUO0Ugzqm96oOcnEUqB/FM5Y6j3yII=;
 b=a0Qw5BxtYEdtE25f1IAQa3q0Wfc5VPlaWPFWlZwxfCpZb4a4Dwg1XshEunlyGxppSY
 89VGFxoSjzuRB3HEszU5n9SWC8h7el4iG3zmEpfjjgHL7qFjK1xKi6dNzRkvDI00rB01
 NqayNIx2PbSAvHTo21S2tIUKJRCG5qgC27X6JySrvnzcDN9wZ4ZJX1YHFyr0C0bzwxww
 A4uvy06EypCCPgJKOE6bFt63mccClj0l6qtrsee5nYI6+tTdaBMA24QAvlqrKV1xSP6h
 21xpBU8fvZSwg2aT5wC4G1/aRfKG0WpWjahWrMqnLYd3WnqbMiOnb3gHokZ1CHKqQCzm
 iFvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR2dEI3b1m9yn+WIuG5/jV36yLDDHkrDGJ2XuRaqAvupbU1CKKNzlmljyXj3Xq7Cc7uu875eSJyjA=@buildroot.org
X-Gm-Message-State: AOJu0YzQEE6aUHRHb7zXYN0XA26H0qx6QnRCzZcggkovjYfvqppJaaB/
 qgrywxGWZTqsl0z3/GfahYWnBVzcXUFUvnHHHI8fBRC2/4ZaguMcZYtjY5cYVBc9rZAbB3UWEaG
 mn9Ht
X-Gm-Gg: AZuq6aJzjb8hv9WDCxY3FQmbhN0RsTMd7klWknMSrgEGS9m+fGctHCxgG3SxTViA1UT
 H31ISnUxiUbg/nvhY++lE4BjepCIWUoQpq/ezqfvtwblkD7wi49bq2j/hzcvISTkPCV0wr7X+TJ
 iBwm2Xrchua+Jrvy1B/DZhAHKBPDKlqjrPoMCRIW3nNt/MUqjE37qIc2K9/Phcsy/1VlxLA44n+
 FG7ndH4O/fBGaan9i7ChjInWOJFckActNoZD0znRW6AYkxzR2fBLnRt5pWbsQ9D5S79LIh98s+Y
 zOLwAYhdxY890LCWQylshGsxW07pqoXa3TrVZuWGpiCCNDZSbXzjYtaX3Lc9RzzeUuIxnREAM+J
 C+ZMV4J17wfCH8MdQNYKMeihYku0APgISK+/ebiLh3I2RmPGUPQgcZjlNePBtzt7Vduiks2WKTQ
 MIn5o453YLtvWp3WY=
X-Received: by 2002:a05:600c:8119:b0:47a:975b:e3e6 with SMTP id
 5b1f17b1804b1-48379be8248mr5767235e9.18.1771011409210; 
 Fri, 13 Feb 2026 11:36:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm7983348f8f.30.2026.02.13.11.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:48 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:48 +0100
Message-ID: <20260213193648.38233-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104110220.352547-1-bernd@kuhls.net>
References: <20260104110220.352547-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011409; x=1771616209; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxi7gKmPs3aBLBUO0Ugzqm96oOcnEUqB/FM5Y6j3yII=;
 b=bWLGwPMspQOIouyY97Z/zpDcPOgFyERSXZ9yjRwZ2MuWXI0ZiRdt5L1COk0zuLaw0u
 tUJCOzWfQ1dqaLzo6PJimF26APp6Lkjr/t+WbMVuLxk2FvHihmon+HQMw70XBPw/pbdD
 NiMu9mUSQEuX7nXm7wynaT6I2VawYubUvsDOA3g2Z8g2MO8GxDL2lQGZFQUwdLEuLsSs
 zDQ5/bEufXkpM6ORPaEjdiqzNo+jjYbor1apcLMaXfxjPdOWLfSV2BvjxY+NlSDuwchZ
 DBDEhShZEmpGdw78D0jMv2Q7lZjplEbZXDqFuBasPKBcIOPQShr82wLZGoNyYCC1xQhD
 2x3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bWLGwPMs
Subject: Re: [Buildroot] [PATCH v2 1/1] package/brotli: fix LoongArch64 build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit 473c9400a0c7be14e7eb8ba617697a76286915b3 bumped brotli
> to version 1.2.0 causing build errors on loongarch64. The build error
> does not occur with brotli 1.1.0.
> 
> Fixes:
> https://autobuild.buildroot.net/results/57f/57f61a5fd17432bba05e4f1865f82cc2f4626d3c/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
> v2: added comment that the previous brotli version builds with
>     LoongArch64 (Thomas)
> 
>  ...-BROTLI_MODEL-macro-for-some-targets.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
> 
> diff --git a/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch b/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
> new file mode 100644
> index 0000000000..d35b4b3336
> --- /dev/null
> +++ b/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
> @@ -0,0 +1,46 @@
> +From e230f474b87134e8c6c85b630084c612057f253e Mon Sep 17 00:00:00 2001
> +From: Evgenii Kliuchnikov <eustas@google.com>
> +Date: Mon, 3 Nov 2025 07:20:19 -0800
> +Subject: [PATCH] disable BROTLI_MODEL macro for some targets
> +
> +PiperOrigin-RevId: 827486322
> +
> +Upstream: https://github.com/google/brotli/commit/e230f474b87134e8c6c85b630084c612057f253e
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + c/common/platform.h | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/c/common/platform.h b/c/common/platform.h
> +index b59f9b809..e1254d5ca 100644
> +--- a/c/common/platform.h
> ++++ b/c/common/platform.h
> +@@ -213,6 +213,10 @@ To apply compiler hint, enclose the branching condition into macros, like this:
> + #define BROTLI_TARGET_MIPS64
> + #endif
> + 
> ++#if defined(__ia64__) || defined(_M_IA64)
> ++#define BROTLI_TARGET_IA64
> ++#endif
> ++
> + #if defined(BROTLI_TARGET_X64) || defined(BROTLI_TARGET_ARMV8_64) || \
> +     defined(BROTLI_TARGET_POWERPC64) || defined(BROTLI_TARGET_RISCV64) || \
> +     defined(BROTLI_TARGET_LOONGARCH64) || defined(BROTLI_TARGET_MIPS64)
> +@@ -665,13 +669,14 @@ BROTLI_UNUSED_FUNCTION void BrotliSuppressUnusedFunctions(void) {
> + #undef BROTLI_TEST
> + #endif
> + 
> +-#if BROTLI_GNUC_HAS_ATTRIBUTE(model, 3, 0, 3)
> ++#if !defined(BROTLI_MODEL) && BROTLI_GNUC_HAS_ATTRIBUTE(model, 3, 0, 3) && \
> ++    !defined(BROTLI_TARGET_IA64) && !defined(BROTLI_TARGET_LOONGARCH64)
> + #define BROTLI_MODEL(M) __attribute__((model(M)))
> + #else
> + #define BROTLI_MODEL(M) /* M */
> + #endif
> + 
> +-#if BROTLI_GNUC_HAS_ATTRIBUTE(cold, 4, 3, 0)
> ++#if !defined(BROTLI_COLD) && BROTLI_GNUC_HAS_ATTRIBUTE(cold, 4, 3, 0)
> + #define BROTLI_COLD __attribute__((cold))
> + #else
> + #define BROTLI_COLD /* cold */
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
