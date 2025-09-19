Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16BBCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61A381011;
	Fri, 19 Sep 2025 12:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMZ-rJO1TBIE; Fri, 19 Sep 2025 12:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BD3780F65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BD3780F65;
	Fri, 19 Sep 2025 12:57:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C99D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B89640C23
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CI8S067eeMa for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D5E040C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D5E040C14
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D5E040C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso2141313f8f.2
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286672; x=1758891472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nr/2I4B+CWQo4vDIYdO5xr3z9C1bzuPRAd1bcpqEW04=;
 b=ivfU+XXipgVnLfjkldKJAFWH86ty7PWKzIukEk81vCyMNu8sDX2RK2BJ4InZlZozs7
 NvsluyPMdk3rTXHOvjQTIieydMrXt9EAkFWkzb4p1wt41HFK6SxMnUwVJFhIBlvLmDkp
 AfgYuR98wJdE9yMaYVD4h8B8X3Z4GVahr5FvAnuvSX6p0wDpLYQDrvOsGX13aM8sFNft
 JCZ9ynUPnsYyssNWsgZtRJu8e6oEALEpUd1sxUm3sWpZutAnJWqEXsEtu+Cd+x56W+IR
 Wh9fmjLrqiuNfSEVh3BKnu/+UtpDaGKSKIyaRzbttxNWM+IoCIh/5qt4Vq+KpvjQTy3W
 r6+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR5HblVlqhrQShPZbJCt6a1ui9RO2UBXKtiS5Oi/IS66q85UQvBv9ZJFDY/Xx6tiF7L4eZBCi0wvY=@buildroot.org
X-Gm-Message-State: AOJu0YzaMOH2x+VV2qRBszPEGbQSCYx+r/tc46YLGq2WmQaKy8/3gGx9
 GJ0g5RXXscnrHmYpmi7RqlycbTUycpVlB7WngfQPuJKq3Iy+pTVnOWf1wFixIsDEdAU=
X-Gm-Gg: ASbGncvvrYGK+jqpQBKRdotqFOLHXvGQktEKhscA3Ip/yEeQVIe8p2f4BbtDOK5pefF
 QNTJ/9V9rCezE9GMTz/2iElAO2Ek6EuZ1Lnzpa/GnEcTe5ep79HYnh4LtUaD52lKt2N7gtP7Qv6
 83bOfW0AgF8uecYJ78VnlqBBg420PZhN0rnddc9WmseDYQzB9OZ4KMtPTziYd076qScbgI2/q8Y
 b6ojvTX5MXe/j6lhEX92KceAOTLcKtpMHjLQKwC2NZXxLBuY96lP2gj7qIs6Wc9TqHIV0tXt3CO
 UegEnUq6VKBhnUJQIyCpZTnKeJ4ewszBFBUjzc5QdYD6vjxJySMZXWvAlI7fjctEYYA2mPlg+JR
 JwAbB201E6bYiPss=
X-Google-Smtp-Source: AGHT+IEGWkTIJ8c+XxRqmZRxfwFQo7SBuMFC83APRwNZ2uyOwZ4zVljAOz3EBxjmlbPzaN1ZiH/zwg==
X-Received: by 2002:a05:6000:1862:b0:3ec:df2b:14ff with SMTP id
 ffacd0b85a97d-3ee841718cfmr2263529f8f.40.1758286672189; 
 Fri, 19 Sep 2025 05:57:52 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-467fc818e00sm37592295e9.0.2025.09.19.05.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:57:51 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:51 +0200
Message-ID: <20250919125751.137413-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908192435.214306-3-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286672; x=1758891472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nr/2I4B+CWQo4vDIYdO5xr3z9C1bzuPRAd1bcpqEW04=;
 b=d9LUmNUN9vSFnJvZvqOew2QqvVEK92QXk2ohOYAyrv8A7+uJIsk2DLAlg/Vs7hPpYA
 kcOp6HmmyqLS1OYgRalFUj74MXDJO6q+I4xgUkepeqDxbaxFxdFIGhaMMRD8mstotXi/
 +XmuLehfiIzTkvmY753HMr7lpwBLu1TjW5AJ678C378P75LIIrAzpPl0+hAY1SnzUVWP
 yDmaj7tykPZU2AeO158ZsaUjilUPJOHv5hL07f1fdcNv3TxRJECqVV1bcdmt0ZTuC92T
 nMllvhsZXhyYnrha9wKYTNC09YY/e9sUnTKKk/qjLtxPHX38UY3eNkInHxmODgGAqySi
 wjJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d9LUmNUN
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: bump to 2025-09-08
 version
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
> This version allows to build with Linux 6.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.08.x. Thanks

> ---
>  package/rtl8723ds/rtl8723ds.hash | 2 +-
>  package/rtl8723ds/rtl8723ds.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
> index d647f9ff28..fa3c472f57 100644
> --- a/package/rtl8723ds/rtl8723ds.hash
> +++ b/package/rtl8723ds/rtl8723ds.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  97231efcd0e36b8a95c7baf2aa387fd9cf8303ddd66ce463f25c83f9f989e405  rtl8723ds-97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a.tar.gz
> +sha256  6cbe12b9ea2b816f52075cbcb402054ecd2cd984852b0da7bc82dfa2baa760e9  rtl8723ds-3ffabeef5e1af54ce3c19ce975ffd0dab731fd73.tar.gz
>  sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index 67104fd5d7..e3e020eb7b 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
> +RTL8723DS_VERSION = 3ffabeef5e1af54ce3c19ce975ffd0dab731fd73
>  RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
>  RTL8723DS_LICENSE = GPL-2.0
>  RTL8723DS_LICENSE_FILES = COPYING
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
