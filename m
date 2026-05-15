Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE89CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122108407B;
	Fri, 15 May 2026 17:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF6FMzf1C7PM; Fri, 15 May 2026 17:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29026845C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867169;
	bh=/PaEQ36NiZSOFRcfPAXOgVq/wRjP0BMdiNcVa6eDY/Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kwUPyJ7gvKlw/49rlJy3bMfOYBfFx8JvoxYVw+Uo38dmrQoOtI3BCL8udAtrgJGg3
	 ATsHzWmc10QBAN72t+QIsBsnTywlfAaOQ/k/ave0bklfTIwAl3EOoGTm19YDvA4/UP
	 Kv9xOKPU85u9jU+awHu6nQ0nkjbfgYkrHI17Q7zlWMdV5N097Xsjj/sET4CylZtkhi
	 MXStFiJIqsJkPLlLtfeWzKpMCEluVJ0FzBuL23dQKffqIZ3r7eLSnCVfV3kTo5g8/z
	 WW0bG3B2t0O/yclMvBL6kKQsk/xSLUZyaD3fKPwlhzBzBMeSS3pscAC5Si6Mh7mRko
	 frZyP34pU4iNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29026845C6;
	Fri, 15 May 2026 17:46:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D077B45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B697861697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qd8B7sjMxo-o for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAD8A61623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD8A61623
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAD8A61623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so1179495e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867162; x=1779471962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yI9l0RhaPPAry4LpzVgeiZwa5qyudqHSwQxS7mrkCFg=;
 b=PuKn38/mq4JXB6HQVC5YVVfkytntbNHCiAXW/m3e7lp4GNzKpYJzAQOrTP0OdZ5OiH
 WmWOedccz595xRE9zcDW1f93eLM7Hrszd29egG1WIScV0LL9PmgBspgGWIuAAPRey26M
 L311vZMdVluCdrzGkA/MvsjETdxj3ywLIC4iHXB8RTdlg+2od+gvngbaJAmOoVreKvnA
 Ayj0nmOsRdw0GPdugnllEoPNVMu6DxpmeqhDghdQktq2YHgeOZjv2NxaOyVwwO1gD5Nf
 UMw3or80l9hqgZMrH1998Mlww7gZ2Ets9y5IiReldj6Bz71Occl+LIfgFj0lNOuNMaPv
 laow==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GG6OqTbLA3K9woSE3LnbM2Otsb2XKXJAFE0Wro63XbSRA62nTveMkXj490PwguiRftVgszLTH+wM=@buildroot.org
X-Gm-Message-State: AOJu0YyO6gZGvirJZIIFWkWy7VbpZqBaEJm31vXFoaOMbIx1pn8nxYA5
 VIpz1fXEeJyqGufpPSrMoaY5eYXWZn7Z7GHMsxXQ8fs0oQEGs0+Q/x5cN0+RxqEBIbU=
X-Gm-Gg: Acq92OGtqI4fC2yoQtuoaywM0ZQffVnmUaa58tFYFuNUbPi/CFEV/uApFOC7yLrdDTm
 CRw17a7/7GvfrAvnhv8VzppSO/QoIUN6VwNwZj72aCO8u8MlQzcYr1kY2KdOLllvCuTtcZdPDxZ
 k6aobRol/c/RYnP/l2/M8SuEOCcX1xE4T40WUG5muBrE+JjszG7sS4e5ihPq0Bver1VVJtumhTZ
 FhLWJLYKH1p77lb5VcJeSf+GW1qF/NcNOk759c6++brVzpF17AsEEa+HRA0/gsrYi4b8d8tm4R2
 knz09v9ER1oPRFKZ+dw62Dd7yyaMLx7aDlzZyJrwsdxB1BRSXGz2UyNQNhvr1tml+niXOr4PrPs
 GJUg9/LG+OD7EneaE6mPhX9G3Y8qbcMUVDUKLEr3UGHnzkM5NVyOTdWgrOA/AOIT0m8dek7pJ44
 /+HPp20YLeYoTF4HWi2b3ATOO3cAaqiwo7mXYtJN76vRxK
X-Received: by 2002:a05:600d:10:b0:48f:e230:2a21 with SMTP id
 5b1f17b1804b1-48fe662fd6bmr61527395e9.32.1778867162356; 
 Fri, 15 May 2026 10:46:02 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fead18659sm19908485e9.7.2026.05.15.10.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:02 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:01 +0200
Message-ID: <20260515174601.529402-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507195049.1002469-2-peter@korsgaard.com>
References: <20260507195049.1002469-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867162; x=1779471962; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI9l0RhaPPAry4LpzVgeiZwa5qyudqHSwQxS7mrkCFg=;
 b=VilC8sWGG/u7bAzwF/r74TSWf54wvhEkRXqR9Hk6eLbLC42MzRBNbRKD0CynBjOwYA
 0ECAg+MExFDAbrTANwhRaNTufa3hGeIaIuhT7y8Ui4RNXGpt+4S9cZE1yGLyGeAiDDno
 ZAcODarfWDeQJae8dSkMpJBzWV+Oh8SFQ3pSxKe+vQRT3yzohtXj+SjYbPlZ29KUMv6Q
 WvYMWbU8W655EIkWTQuv8lA2xut8lRIsioFtUbxX7bRetS2fpwztQvjuHq1iTa6GOYIV
 O0hw0mBLZQ0Y1AGYXx2CBAlvrqMOUHYEGBPtbYitVWgdXfauBs6k+xC2dnwI9VqSxfVB
 Clgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VilC8sWG
Subject: Re: [Buildroot] [PATCH 2/2] package/go-bootstrap-stage5: security
 bump to version 1.25.10
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
> Fixes the following security issues:
> 
> CVE-2026-33811: net: crash when handling long CNAME response
> CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given bad
>                 SETTINGS_MAX_FRAME_SIZE
> CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
> CVE-2026-39819: md/go: "go bug" follows symlinks in predictable temporary
>                 filenames
> CVE-2026-39820: net/mail: quadratic string concatenation in consumeComment
> CVE-2026-39823: html/template: bypass of meta content URL escaping causes
>                 XSS
> CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with more
>                 than urlmaxqueryparams parameters
> CVE-2026-39826: html/template: escaper bypass leads to XSS
> CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL byte on
>                 Windows
> CVE-2026-42499: net/mail: quadratic string concatenation in consumePhrase
> CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum database
> 
> go1.25.10 (released 2026-05-07) includes security fixes to the go command,
> the pack tool, and the html/template, net, net/http, net/http/httputil,
> net/mail, and syscall packages, as well as bug fixes to the go command, the
> compiler, the linker, the runtime, and the crypto/fips140, go/types, and os
> packages.
> 
> https://go.dev/doc/devel/release#go1.25.10
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash | 2 +-
>  package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> index 5e40ba7e6e..58391471d9 100644
> --- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
> +sha256  20cf04a92e5af99748e341bc8996fa28090c9ac98765fa115ec5ddf41d7af41d  go1.25.10.src.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> index 9006e5bf44..85468414a2 100644
> --- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> @@ -6,7 +6,7 @@
>  
>  # Use last Go version that go-bootstrap-stage4 can build: v1.25.x
>  # See https://go.dev/doc/go1.26#bootstrap
> -GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
> +GO_BOOTSTRAP_STAGE5_VERSION = 1.25.10
>  GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
>  GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
>  
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
