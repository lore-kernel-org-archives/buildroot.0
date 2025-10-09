Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D517DCCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A51C381173;
	Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_ptXreNz6ku; Thu,  9 Oct 2025 14:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C868101F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C868101F;
	Thu,  9 Oct 2025 14:54:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F9E119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B0B80F2F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXyiFeVWPmo4 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54D9880E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D9880E18
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54D9880E18
 for <buildroot@busybox.net>; Thu,  9 Oct 2025 14:54:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so7647905e9.1
 for <buildroot@busybox.net>; Thu, 09 Oct 2025 07:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021682; x=1760626482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EBVqsnfbbH/d9RZ5O9K8lFNr8rBbjsYNXpFbtz8wBEI=;
 b=h2lUt3t6OZ0MKSqsxkJlJTLPyOUXyErIrs64AI12UTQUudV2AJotOKuEkMXB6rt6ho
 m4I2cdFGKw1zucs4gUtD3z9RlxMU7SCAXxhNbUCv03QKdV55IlUSGC8NV6BfWRxZQSgU
 t82QOwnVNjZFf8pYTBfoZ8z5O2QOrupNgrESf6y+Ye8FFP5j26I5FiRlgDKHgEZM87En
 54UYhoKRDj3qz0ax5QuPIuraSHvpbf7EuZFVpDd8NCXdmotEpwV1ejn6aZtkwf2b8vWD
 AHZ+0tZsdoXj9UxB3xxmdxflPjXLAkanRr8GOuRGd8GmWIsmgj8/Yt3Y+cCXhpLTr5u9
 WGFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtQHLUEacTeDXsMKpZKGj09NuDMwVKuqOKHTBDSAKvKGzHF1jX/EpcYOCohz1vzVUKes4RbGB4TqA=@busybox.net
X-Gm-Message-State: AOJu0YwTlQa08BFftPVhb0RE86tXEKnrgKdIJ3MVZmFs9diUEnIlGYk0
 kpgBMuQEORJoDtNmkXyZWLcOypQaHLFJCar3pSBIWIw01+gKAg8OG5HRWA9gtx6/lHE=
X-Gm-Gg: ASbGnct7ZYgb6ePu900DlvhpHzdpJAMVuSjBmEt9bZ/9NokYrr/dYgbD3n4tSdOgXd2
 T67CpA1fT/UAx7avHNls3IKiGDm6e9E8Ps7TpwTR88wgyZUP5bIg8HJ5sjh3OHVzmxarUa93jV+
 VN3VlUG39hYbwn4gi4pXIwNaN7U5RyN6/Jkf83zXYQFtrF0vHp8V2u2T+5flTCuRhsrQScjHRyC
 Kn2v9kN+Q7DnRWV4UeHswx+iEuYC+l33ARL5atV/a9CCyqWZRE2kE8eA6NtCjYywoJAvLCnupPp
 FP+/XDgQ7N7dCjdo6wkfeEb+9/PfeXkG7OK2GXcgNi6PTNDgHtvEGp32C3dEsEEixgCBmz63T9H
 emADLXQMQ0h6QpphTwvzFORuYnLjMt/jAio35UQdB9U9w/95/+jU=
X-Google-Smtp-Source: AGHT+IH9s1ISooPCkELcrU32cKK4fbLMqzBYrJc/zgYcQ9tqeX1nbQoXOML1DTJIkXoOKpX3xM6rgw==
X-Received: by 2002:a05:600c:3f08:b0:46e:4b42:1dbe with SMTP id
 5b1f17b1804b1-46fa9b075f3mr47853935e9.32.1760021682170; 
 Thu, 09 Oct 2025 07:54:42 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ad27sm797375e9.15.2025.10.09.07.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:41 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Thu,  9 Oct 2025 16:54:41 +0200
Message-ID: <20251009145441.482254-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001143714.981725-1-francois.perrad@gadz.org>
References: <20251001143714.981725-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021682; x=1760626482; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBVqsnfbbH/d9RZ5O9K8lFNr8rBbjsYNXpFbtz8wBEI=;
 b=BsHHlgaB11Tg9mXeaIZXL9olFeIID+MP5N8QElnEIKXpxE1UpmmhyO7XNKYzlftR9g
 BTdgIskFLaddZ0j4xeB7adHzA0BJ4LRwsqe+OPbUtf+RVc4JZL78M25FqPitxWhQUFbE
 TTEEMM/6VZ9hmq2ftTiQocZGxBamvdiPT9C2Icl9WGRYYGtOcT9BgmMvWz7YzunqUUEz
 cRQmyd8AAERS6QoMgzZqpQFH5hbbmFbAXHEbLv6JSgxGKfX2Ykj5puBQTFeFNoocXviN
 u/RrAKbZZx4h59Ff0O5my+9m/OXmG++TI78ctgXzRLUYX8ZNpGrQG9QGqATroqsgITGz
 75hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BsHHlgaB
Subject: Re: [Buildroot] [PATCH] package/luaossl: bump to version 20250929
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
> diff LICENSE:
> -    2015-2019  Daurnimator <quae@daurnimator.com>
> +    2015-2025  Daurnimator <quae@daurnimator.com>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/luaossl/luaossl.hash | 4 ++--
>  package/luaossl/luaossl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
> index bf08fbd51..734c916f5 100644
> --- a/package/luaossl/luaossl.hash
> +++ b/package/luaossl/luaossl.hash
> @@ -1,3 +1,3 @@
>  # computed by luarocks/buildroot
> -sha256  d711c86f433def90f63cb6747fe0bebaac604b868de6a9a35e4da2bb4e0967be  luaossl-20220711-0.src.rock
> -sha256  7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20220711/LICENSE
> +sha256  19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bfd30  luaossl-20250929-0.src.rock
> +sha256  421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098756  luaossl-rel-20250929/LICENSE
> diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
> index a6283a520..079d1e0ca 100644
> --- a/package/luaossl/luaossl.mk
> +++ b/package/luaossl/luaossl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LUAOSSL_VERSION_UPSTREAM = 20220711
> +LUAOSSL_VERSION_UPSTREAM = 20250929
>  LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
>  LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
>  LUAOSSL_LICENSE = MIT
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
