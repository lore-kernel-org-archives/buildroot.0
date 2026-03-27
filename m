Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5575610ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A42C61427;
	Fri, 27 Mar 2026 10:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYH-KWoKmRtZ; Fri, 27 Mar 2026 10:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88DEE613D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605794;
	bh=3ysJiNTyqc7EpdlF6jIk2cpSpgWAcjg5ArgtOU4FQT8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VVaQB71DWfKJsPPV8+mfjGGGHl2VOhpbHb6hcjSfIeY+nrgxR6WtqHm/HGz09B3rG
	 x8xwzynFvde7c4rUQRRxHP86ucbJFjWZLZsZihMmGBvsS6xdlTDT2OUjwrInSu1Agp
	 UkyCAxV8LWPESybzy8y/JUY3bg9SXY7irIzYol5YPGH9joTeiE5Skw6YCcUhEZ+xfm
	 jD++KKx9Ycbz8mU3p2bt7UYB9iAxUEIBMDas1s3nCfOEbz4eIPIsqkeUQ1uI/usltT
	 QNORWFt2jtN5VKZnWaHx0zrFkvpA1nwlmRkn3qwyJ4BjlzhK+vOGiFhARJpZElArzC
	 j6TotSIF5fJ1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DEE613D3;
	Fri, 27 Mar 2026 10:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8295B249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8016483D62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8TOk-buNhJQ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6653F83D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6653F83D5E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6653F83D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48541edecf9so23828495e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605789; x=1775210589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=irnYmWpMZFtUd26fZczXty+fp2/Jb+0ZBynQlcdkt6k=;
 b=ibT5HGSiwWenzPENGF2oa4jpjKGVDm96+3kD4AeMhKkXPYtsXEXV0ke+tbaP592uku
 RH4GCuU2gKmAcYbE2RHPexsSWBKKVIZm9MBLNXi7eaMHGFAIev0tA7fvJiEF6dTwpDM6
 jK9m+DhA0q5YhJM+h9Nx159gtaRnWQw3BI8tfgoAWkIrweCEzexplo9/KGWSJUwCfsPO
 LlK/IZ0UP09c2CL5Rb2fkxygNnbsIfZnSW+n40ic7pG2wMikzYISTuZ0k51GWXx7Qmqh
 gXyb7k6XZVvoeeCT2eat0H2Eq7DzgbGx6qAqo1qqDwB6tbz9QJIII1hdXTv40ifGlGdn
 GJXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjaIy28kfwIm1nH/m6ESIvGZiKvB8lIg27LK97Ag9Zo/ByNkSBAkyYmX8Z6yePH2UGvjSl9NmrXJ8=@buildroot.org
X-Gm-Message-State: AOJu0YxoxLzU+kGsTyvr/VeE8HxPLILYc5wqlQcfpn+LS6cNw8+Sn49L
 TB68xQCmN5hQ1TCvhI5ygSUNuRufTT9BssnyT/yZgzsf2wJHFYw8axqRBUDrdwqhIB0=
X-Gm-Gg: ATEYQzxDm59N4JusiM2H1chVYyFev7UQfv5a+vDEEPS/1sCa7PkyKTW0BTWuxO0B+5n
 kzYGZkNKvestHf5LhtIUE49HYWPnwru9mGGZQXnWfJtCLEIyU8mgNskpXK83n7jISHvEHfRuuKB
 ZVOTEuINKqqUFseFhpzO8en0DXM5s12VcY62erjibrlqo/il1aN0eBD67nwEUQlPpMlAk/tiCY5
 5emAswBfrPerojcHHZeFmgr5ooU01sxETjUkTqYiLRdkVRoC8jjIbNXxE7q2OTUNKu9oRV4f2dQ
 HCEUkxTOw06LiKxUGyR7rKscg6z/phpigbaob1PRn7bcAvnyJdkQ/uyTaRIcCr7Ged9SvPwHZ4Q
 gIIn5vyLWSydYEXTEzuNqu0F1YnH9aGm3H6IAYJrRFXnVW7yGNIDXr7Js3x4F1WccjZMTJ56e3p
 gjgbPcoWAfmXVMh/L1
X-Received: by 2002:a05:600c:45c4:b0:486:fe45:483 with SMTP id
 5b1f17b1804b1-48727efbed2mr31024765e9.22.1774605789420; 
 Fri, 27 Mar 2026 03:03:09 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c95041sm80464545e9.6.2026.03.27.03.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:03:09 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:03:08 +0100
Message-ID: <20260327100308.46896-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314140633.2967249-90-bernd@kuhls.net>
References: <20260314140633.2967249-90-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605789; x=1775210589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irnYmWpMZFtUd26fZczXty+fp2/Jb+0ZBynQlcdkt6k=;
 b=axyoX7aCQYFkLkuxmcT3I31w9ChRFz/dukoQF2tD2uVkDCyy+9pkIdyIJRw52QaXZy
 s8P+a7jo3gseprZPCAts0dZV5oxtRPtNXbTGA18BspD0LBwIJM/bIoI35ljNDBAT0F0o
 10YjsE1NTMprd8x3T118nj4n9G1DsyI7SnHjo6kO9jeug/FsNeyDUsW3iAA1og6OHi7q
 VlPTLCMdjz1UM6L0EQxqkBTvoLk7KvMp3fOjv5R5HzOGJoEcdJQm7uSo4T4QSrA27UE4
 K87TNXxbi0V5q0F7+TfmSI9AmxlD3Q489Ewi06d0zA6X6z15eaWiBxcDpK9fUatK0kz6
 e31A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=axyoX7aC
Subject: Re: [Buildroot] [PATCH 90/96] package/python-wheel: bump version to
 0.46.3
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
> https://github.com/pypa/wheel/blob/0.46.3/docs/news.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/python-wheel/python-wheel.hash | 4 ++--
>  package/python-wheel/python-wheel.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
> index 40836a5d1c..7ec38ec86b 100644
> --- a/package/python-wheel/python-wheel.hash
> +++ b/package/python-wheel/python-wheel.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/wheel/json
> -md5  dddc505d0573d03576c7c6c5a4fe0641  wheel-0.45.1.tar.gz
> -sha256  661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729  wheel-0.45.1.tar.gz
> +md5  61fb0c9633fe7492933a8f338db23508  wheel-0.46.3.tar.gz
> +sha256  e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803  wheel-0.46.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
> diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
> index 417db7c167..b68a1c102b 100644
> --- a/package/python-wheel/python-wheel.mk
> +++ b/package/python-wheel/python-wheel.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_WHEEL_VERSION = 0.45.1
> +PYTHON_WHEEL_VERSION = 0.46.3
>  PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
> -PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c
> +PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/89/24/a2eb353a6edac9a0303977c4cb048134959dd2a51b48a269dfc9dde00c8a
>  PYTHON_WHEEL_SETUP_TYPE = flit
>  PYTHON_WHEEL_LICENSE = MIT
>  PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
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
