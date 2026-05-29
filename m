Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FD3CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EBC613AB;
	Fri, 29 May 2026 08:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GggqP9ubMoo2; Fri, 29 May 2026 08:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D896F613CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043438;
	bh=umYvY1gFt7rjqBSj3vMyOj31+KdADRTHfWo8xImtRMg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BkpfKZ+qELtXJneZf5qt5I8BXKighDOo04L3JYtZ0Bnlk2bYiBrMYhG8dxDjpHxyE
	 9EAO0E3haIx5sjmHJxyjebfqp42fM0ZugohnHjfBrFH/P9wyqlxhZb56ZqfJSfhzKc
	 7Mg6kTj3v6yafTW0P+kJ5K56mcnbFwRxDfJAtlq0epVpgvxj4ThCkORvoxdJGwXYss
	 UyZcR/ufVflBv1pBJhEOiiYk8WdnNTE/rK2J3VrVEjqUvFEzro4jLOcY7B9ioig2Qc
	 ghlEvm6Xe/EGJajOlv7gDy4k0qUeblXtiD0ceCLH8O1LkDlbb66+tbKFOX2OAJDNN7
	 Ci+THGsmGcRUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D896F613CC;
	Fri, 29 May 2026 08:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89D74288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78DC284304
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECs6i3HPNHvz for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70068842FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70068842FD
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70068842FD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45ef42dfb26so58431f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043423; x=1780648223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NAbgWG2aQDqbkraQ+8TAwP/dT6JHFnzV4X2sjZu2Kr8=;
 b=rSHeEr50iEzFIAMJpitT5OrStsGyzemnGlmX7iDJZO7AOAipeM5GhTUOh9+7/7rlfZ
 YKyDUO+XJukTVKUqqE6wBWiBGsN6moVJJxKQHGpBKXXlp0rwEtW9uXAi7QF73rU06TwD
 VofquHOtW3PmPdR2y2i+XSrFuBGIsg7yfwyF46keqCqc7xIsmMjwfndl95ibj0vSqZ1M
 nlDg2iHhmVZyCj4uiMwUIfehaEUiBayzNvVvt0qLGmIeja2CaNlYKr61DiJ6+KiwaDUF
 rmkQLXXtFslkQLNp65Fdt5VSTz2khymc9EK+c7tIVqFPcCtIwLWGQqIDrVezx8vjIubJ
 CAdQ==
X-Gm-Message-State: AOJu0YyUA+0Ir2mHK+/NgcjsVos1U1OlvZ2zQerJoldGQrFovIIVWVp1
 m5grl1sk4p/659cMRNiBIzf+DQe3CgvuwMJxFVE/9htwa1250F/i5mqE3GXvMjVIk5M5RkgD2R8
 BMcj9
X-Gm-Gg: Acq92OFtI0M5ddhCTMcXzGP5oFFGeZWiN0HYMkc+9dWhnQr7t+1JgVpy7ltGfJJFBHi
 J/f9Spn1PRN856mxUfrGt1dXCu9Wr+UItRz9kwWeo35Vy/2qsNgPqYO6G0RKWHi4Nw8Ny3BlGpW
 KBuQESFBHkvxUgR50THThLCJAz+9hr4biL+36DvP/VpuJ8ANE1RkRdqYGosUnS5raBY9++V86Qr
 4HdzSxaD0MLd4lQ3axgJ5a+CulFDBxXeFw0KJ7wBe8F3ST3HSc1onKhiUw/THj04s3sZBO3ZEor
 jIMlqd1SOSL44EZojDrVQs0T5DBDiJTt5jNCm9OTa4AyMtQCSEoAuvSOXbQtxTf9Jgiar4vWes4
 ORA5mm+i2ST8yp8jrjz3BivVd4MPqXL3qV7mq1gP2riQPjSaYEU7KXvC3MOrbIwAuAxVRWgFq8Q
 MlcCJxC9XpT00RLCkY3B1OXwVH7jbgEKBDdIcTRz+pZtfami92qrmdbH+icQ==
X-Received: by 2002:a05:600c:4504:b0:490:51e2:d992 with SMTP id
 5b1f17b1804b1-4909c0b3349mr32222295e9.13.1780043423373; 
 Fri, 29 May 2026 01:30:23 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6a0a89sm32823695e9.7.2026.05.29.01.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:22 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:22 +0200
Message-ID: <20260529083022.59434-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513112857.433733-1-thomas.perale@mind.be>
References: <20260513112857.433733-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043423; x=1780648223; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAbgWG2aQDqbkraQ+8TAwP/dT6JHFnzV4X2sjZu2Kr8=;
 b=JXROgS8AwDOc1Ms5b8JrH2D4eNahGnJH1jSrSt9vHyANTi2mJt6h3OJH6nd8PpeJAq
 Wlp2cuGL7ig+9NeOlf0+wBH4V8CXIHRUlLpZk9mpEPwbiALuRby37XzaJrncWmlA6JNq
 CmIGQ62WBAkCLM6xq0v8wrn/DcaYpqVyLxDoBKGUkV0d5IRfpimIA6mowY2x+bS+fbHw
 K4T8OYcIRyErhwG7VTO/kVs02/vX6EosTQ7r4aJKxnAn6d/4LNjyrhELmqdhy1K+5qDO
 MeX8VhJY3dibVcd8dPv4opa/I/+mEjAp3x/OqhZY9kGO9D4dYrnhqSZ5sWFsxaJ4tyn6
 4NuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JXROgS8A
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: add CPE ID
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
> The "cpe:2.3:a:agronholm:cbor2:*:*:*:*:*:python:*:*" is a valid CPE
> [1][2] for this package.
> 
> [1] https://nvd.nist.gov/products/cpe/detail/C9CB66BA-6D92-430D-B3A8-D20C43E0655C
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-26209
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-cbor2/python-cbor2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
> index 859ee4a1b5..bb8944f861 100644
> --- a/package/python-cbor2/python-cbor2.mk
> +++ b/package/python-cbor2/python-cbor2.mk
> @@ -10,6 +10,8 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d
>  PYTHON_CBOR2_SETUP_TYPE = setuptools
>  PYTHON_CBOR2_LICENSE = MIT
>  PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
> +PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
> +PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
>  PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
>  PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
>  HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
