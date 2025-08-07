Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74F0C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B988280ED1;
	Thu,  7 Aug 2025 18:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXiX0p5862xe; Thu,  7 Aug 2025 18:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3CC80E7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3CC80E7C;
	Thu,  7 Aug 2025 18:25:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94C3B10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 848B060604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWCxJuHOHgqg for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6795C605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6795C605F0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6795C605F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so9175765e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591074; x=1755195874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmFoOIZ4qjXC/lJPJ0JmpeUWG/cV8PktTYtAONXSrug=;
 b=VjBbYTx7UTTmcb9EH96Rz35P8qQEJ07hDNSvy61N4bgt+bqUOUNsMGVrdkbmok03Fy
 /6k4UVnasDAl27zVXaKvKI0EAhwCs9yYYep5uNmNw7xM9NIfmlKKUMMIXoJZNYHKCmGm
 lntfqa+bZlO3qgmjpENapWhaXFRf+euIPU6o0tzvP0z7erb37I5am5VGKihLdvu0GyjJ
 HlNfDkuseLRSCHeBSRd2ZcERy0AhhhKx+Ff1925SkqOA5Ij3GugTmH9iY9EsOAHjpJdd
 9eQzHGM9Nil5ii/kTrt3zYDKfi//7QvewjGWcvBoBPahwNV69sy4kzqlr0D4kmWqsfbw
 dbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeF5jFmiGX6RK78hN50sgOK9ccXo5Rnw/+L7O/vOSMvzaLbfsoAFbjxuV4MU5UmmzvhTKZOWVTZt8=@buildroot.org
X-Gm-Message-State: AOJu0Yx4DEzk7VjemO9xCpMdwvIs+KWz+TBQ9XR/FjJpt8GiyygDLmET
 nKmsNtv+o2Tku3HgKsX8/9WWwMisyI5n5xRHhwjQ0LX2tKOpmiL9E1PbKVr+bWungP4=
X-Gm-Gg: ASbGncuBjP7NZt9CUePTNKw/NfbX+x8VseNCrd38KX83THtR0yfRxkvKRour58aqS++
 I76ImeNmB5rg4dsEP8ceFg0C/Ox3QuRvYuSpijPUD0HcCBUiHNsFhqhMRDBlNNrqOGqde3/Rvma
 cMJrPUhmaH/HWdeEX2Ia97g3Ti7ONi8fo2mJA05p8be9NAkl6m1XBV0+govR8nEcA5ln1fBGTQz
 1X43++zy0rwe9+XIODYzdSaUmd0NZLO4gRkYi2GFQdJjhPFM93vhMYBHXm96U8sOSLwmoJ1v7G+
 ned1wmyf5HVHn52CyCKpb/QhSKGOTAus4ihNK/65+Z+wp6QMy1bezLuQsjhpYxsJNVP1Q1GuJwp
 NLJuHzr3lnQIyWg==
X-Google-Smtp-Source: AGHT+IH1UG8LG8o8OT71XGJj35TnOQt19I32lcFTbTiwO7MlNQrYfEqVA7YbRNC7RX4FB0wP9eDIjQ==
X-Received: by 2002:a05:600c:45d1:b0:456:8eb:a35c with SMTP id
 5b1f17b1804b1-459e7122a05mr82999335e9.31.1754591074454; 
 Thu, 07 Aug 2025 11:24:34 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458af917d20sm154195375e9.2.2025.08.07.11.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:34 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:33 +0200
Message-ID: <20250807182433.725680-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726055908.3395125-1-bernd@kuhls.net>
References: <20250726055908.3395125-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591074; x=1755195874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QmFoOIZ4qjXC/lJPJ0JmpeUWG/cV8PktTYtAONXSrug=;
 b=Ude0giQ8uBmx53vaMxmaqF4QZiOOAdz3owDEONItoazgquu+yqK2MuHc6gswOtJhC0
 yMCD/gnqIOAyyRfHH0cMgErov7Nffo3gmfxygk4QeC8sDVSqCfytvXrVR+TXAy8K7ZCU
 9XdhRBKs3ltDvbFT3G4F4LNb92IpnJ52c+mExo6T4/HfLHarw+LHtQNliPufZFziVF8V
 rsdwB84fZ2a72ertsE9uYaaQ8ZiGBvnzmxUHiQpFqHj2b6V/28LyU8yeTJOQGwR6g9ki
 K5Qwq5cm4Wp1N1hbvW8DruQSLUNtp4Wh6t5oru4JuicwJsxO20hYecdjVno4oXu6VQ9B
 jxDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ude0giQ8
Subject: Re: [Buildroot] [PATCH 1/3] package/libcurl: remove configure
 option --disable-ntlm-wb
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
> Upstream removed this configure option in version 8.8.0:
> https://github.com/curl/curl/commit/50def7c881ba560ab6e0235990e8f07fa69f4bc8
> which was added to buildroot with commit
> 50bdb2a3b7ace71065dc0b8a81bebc173f84a8c4.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libcurl/libcurl.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index e390c9d1bf..114ff3d70b 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -15,17 +15,11 @@ LIBCURL_LICENSE_FILES = COPYING
>  LIBCURL_CPE_ID_VENDOR = haxx
>  LIBCURL_INSTALL_STAGING = YES
>  
> -# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
> -# support because it uses fork(), which doesn't work on non-MMU platforms.
> -# Moreover, this authentication method is probably almost never used (see
> -# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
> -#
>  # Likewise, there is no compiler on the target, so libcurl-option (to
>  # generate C code) isn't very useful
>  LIBCURL_CONF_OPTS = \
>  	--disable-manual \
>  	--disable-ntlm \
> -	--disable-ntlm-wb \
>  	--with-random=/dev/urandom \
>  	--disable-curldebug \
>  	--disable-libcurl-option \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
