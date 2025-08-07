Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B1DC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1483F40535;
	Thu,  7 Aug 2025 18:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBzLBDv82S3G; Thu,  7 Aug 2025 18:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06AFB4056D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06AFB4056D;
	Thu,  7 Aug 2025 18:24:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD8B4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7F0D400BE
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pswG9y9qsc5n for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFAAD40087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFAAD40087
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFAAD40087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459e1338565so12541175e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591041; x=1755195841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rq+EKDhUf/TtUREsuGzpTowACG83KIKLIbt59bP8zAY=;
 b=eyW38bAlSnj4Ut8dmTWQr9prli1RuRhbftUrwXy+5sXSxtqq8wCvtrAFS/Ujo5dp5h
 eKT58prdPXSw704PGXN5KKR3SAy23BhyoigfZZ84Xg9qD8UiJqct0uQMSjkq9KcDATu7
 jVIGfn/wfqmO0OiA/KvDJ7jcQqer92fvJoq+sn7Nlo2rOAPKKXrSTXMQ2cP7DdnucKDt
 lxbZwPG0zXRwOifZkJXPo47NX8Pju2PHzeiV02oGlt2cBHq5U3CcNmPr8wIyz3RlloIr
 1r0A67QmUFy6rPl39vYjfB5rLmm/5aO1kbmk+FAX5ep9b8adZ5YFcQ4lmfnxindZR6ql
 vKgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNQf8yh5dm2XRvlkQ0eHYz4HPizfNBMSbWa63xdyyduOmUdi8imQNnHB3Rg55zgcx3anZVh7EeVBk=@buildroot.org
X-Gm-Message-State: AOJu0YzIqxi5h4zD77PKizZIDZScyJrL+4WbYoodmZDfuKAoJPerS9Hj
 LqdhC47UPf6Yrm6bDbtxvqPxyZm93Ya47SLfeQw91lD5ko/FOgVJV2VufcQLsEWIVMM5XVNvCzj
 MKLdd
X-Gm-Gg: ASbGncs+eeWBkYgHDP4f8ndsMXHXGDM/so1DV66i7txLldh5ouSQA2r1OEJceibCZsf
 1otX2l3YdR8EsLIVNZZg2tC2I0Vqk8JvO4AnO+KTwqeMU8RdCghhDgmDQQFGBWB3yUZJR2hShyB
 FVOWFcp5F4ZfIyXi0oEOo7AaBxcwxMiyf0WE/h9PsVzI/oCffSJiAl7RRlvrEaPnFzD4C3qdCvc
 SjcihfDNOnkJCtPj2mOKxVPODPmm2UNoNd1vnGqo6P3hHQaLif+pbBXwbpt8CU/MNBzaDuuslsd
 plVsWzPfw4j11P2qEz9dnlL5VYAyWY3A2NkW9PZjuVT5RUTm15zq6aYffnK32r2pOGP1AAe8JNO
 JX3Dl/0rRgpNKeg==
X-Google-Smtp-Source: AGHT+IEggr5OAAlAwg8btWi4qSYX9AoVF242/X7OAbgL8HUvYBIOXzVLIBB9Nxb+RV97y0yQ5IMyBQ==
X-Received: by 2002:a05:600c:46ca:b0:459:e3f8:9308 with SMTP id
 5b1f17b1804b1-459f4eaf6e4mr200165e9.11.1754591041054; 
 Thu, 07 Aug 2025 11:24:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5862fd9sm112114475e9.16.2025.08.07.11.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:00 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:00 +0200
Message-ID: <20250807182400.724126-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714144618.65723-2-buildroot@bubu1.eu>
References: <20250714144618.65723-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591041; x=1755195841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rq+EKDhUf/TtUREsuGzpTowACG83KIKLIbt59bP8zAY=;
 b=YCGIOWOtiuGV0hvfahLiarqtZ3D1ZV+xscisati5Q+vlGN4j+px31pJ3Phrt89rG1r
 F56noi+sgPwb4y2I1Vh7Tz4NMSfvo6iPcfyRjx4hKrBLJIJ2oxY3utbrKVy+Ks8AKbAX
 EmWNXR2Hqgxm4KLXRpICAy+bbrHgO7KNaj91FLZ3s21nn5emCrQJBpzwcv45lK2W8++u
 11Ue98W28wLJu7pC8ofjE7Gjd0QPpFbSWKRqmB58pmH3TH02Zy3vMp2ijGsaUYqUbdNe
 Iduk1fk7FWSiwMwn2Te2F7yESkuX5pOFHUpxwYI2HU3EdSrVTbB6MEWebk1vgcIFk/lG
 d/qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YCGIOWOt
Subject: Re: [Buildroot] [PATCH 2/2] package/python-starlette: bump to 0.47.1
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
> Release notes:
> * https://github.com/encode/starlette/releases/tag/0.47.0
> * https://github.com/encode/starlette/releases/tag/0.47.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-starlette/python-starlette.hash | 4 ++--
>  package/python-starlette/python-starlette.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
> index ce2ee91bed..be23e4ccb1 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  d745d832d3f585d6144e8cd0c8f06697  starlette-0.46.2.tar.gz
> -sha256  7f7361f34eed179294600af672f565727419830b54b7b084efe44bb82d2fccd5  starlette-0.46.2.tar.gz
> +md5  b876ddd8665f70bb74e45d1fda053699  starlette-0.47.1.tar.gz
> +sha256  aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b  starlette-0.47.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
> index b4d28a6d08..eb49230600 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_STARLETTE_VERSION = 0.46.2
> +PYTHON_STARLETTE_VERSION = 0.47.1
>  PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ce/20/08dfcd9c983f6a6f4a1000d934b9e6d626cff8d2eeb77a89a68eef20a2b7
> +PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/0a/69/662169fdb92fb96ec3eaee218cf540a629d629c86d7993d9651226a6789b
>  PYTHON_STARLETTE_SETUP_TYPE = hatch
>  PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>  PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
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
