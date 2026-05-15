Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC51CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C81F61572;
	Fri, 15 May 2026 13:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qS0LF83oA6AJ; Fri, 15 May 2026 13:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58EAE615C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852046;
	bh=CsD81wQKjYUVvrJIDxs4Uo+RE+s1v3scxcdmMzs4TKw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CrbNfWAUbaM1ZQqOSYfylRX9/Mq9SYx1aEqSOC9dI0QI0IhptiADJTNt4PUWrn8pf
	 csmBOqSSE8o6xDFA3Zf3WPYBSYk3JOHdq4Oe7oa3s2xlQgjxuboUq/izziBF2jbR7N
	 v7exdoISjUyMl6ZfkJKhmxhM94aSuwwBJHpPWgjpicQmCsbmV+bmOPLRyrZgJMAeCE
	 EHkzW6zIcwMCA0MqEpMwruiBxiYJ1irwwyJ0jvRlIljzkWxwGEhfdELFiEsaUOF7U1
	 13F561gTMam+1/B/73DmN0FVjMlWvEwzOisUQki+uEgCd9UVMKyMVGcDRYcbO0sHw6
	 RtwfLIO7seKnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58EAE615C6;
	Fri, 15 May 2026 13:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4927736E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4640A8432E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmmroQumx3wf for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DE7084326
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE7084326
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DE7084326
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so5934135e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852041; x=1779456841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aBLRRWodFKtoaJbzsfUpapf8p1/88g6vMZbkyqakTnQ=;
 b=JiLJDeGErXO8l2YPUQ+VIvsslkLg890eK1m/z5nVvi3Zxi2qPZ1O/zA0vGI0RLB1Mp
 dyzIZlG//wuhD8AK2ZLFunkQ2TfBOl1MkBFAJOCUgmPOSDc4tl+2pgmetSrAB6L/l0Ay
 frXNFlNBppkCuf+m3c8k8pLMJWk9shgSDXJmO8H2JHZpS/cgUYqG0ySYfVNREcjgux+Z
 ejRPwFKRIwMgdodgICEGWTSGha3RVz2+hlDirdu62ep0Eip22IN1qTKTTuevEZxWyD8n
 iGxPzWpPA8tN2CJO/ImqYMmZNRQ59V0Q3lrZNEIuPisy0wrDSckZJZe2fvQJ9MmVMmJ+
 76Rg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Zl47EC9dTvfGNeOyq0UZSiwrx1NOgLADY/LYe6tSQ5MCEC8RfSrrMCNHulAMebpoxJhscZZOUevM=@buildroot.org
X-Gm-Message-State: AOJu0Yx9QYRv2TqIu9l34c2xcTVldHRanA996/fTLxn1LjSIaqonbXGo
 Ch/iC4SrzgNJ/slCbKWCT7vaNmJGOI+wfKQgTDXB72ICxW+/r88ycNCEfFRyTkQjgU0=
X-Gm-Gg: Acq92OExEp9wz9NlWuOMTCb9MO47cO/y2EJJbyGKH0CFR6JHfn2yeBQw7TRGiC8i3N0
 RPEp+yYLuNWxIUa+i3YpNOxxs87pX1hlcVKia+RYbmw6v3IYyERuhhgnRp6hqmVnwEMzCffPutm
 Stu3AL+61gIajBcK+FZK7xX4ZTDt29mdtN3c6R6dYwuOgPF4zeXG1nO9NTpfSLCdTufXBNI+S4I
 8C6fGD7SA9hTjp+spbqKeX0/sWNorbrmcgSXxYHFeeBEtaQ+AP8lHmD2CI6QFdilDtmnkzS0dkH
 Qp0JdzehQZvjIERKY1xYa1wg6aDH+gbZj40L2OMHAhc1VmrvKKBYKoIOPxno7DfXv1bBlGnnuXK
 NKYADwboJhA3mZjCdv1dkNS3WH9IgJU6T7DN/P0MVZpIgzBe1IYPpGnMIZjwLcL7vYDS43wlHCC
 TtZxcKlL4/4MkZE2Sk+0hhR6uiCq7Z0u0uulagFBsCSA+yZeMR00S3re+YTb47DifebQ==
X-Received: by 2002:a05:600c:1389:b0:489:1d7a:4537 with SMTP id
 5b1f17b1804b1-48fe4cae142mr51199395e9.3.1778852040916; 
 Fri, 15 May 2026 06:34:00 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe79ce3sm14439155e9.31.2026.05.15.06.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:00 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:00 +0200
Message-ID: <20260515133400.315959-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260314140633.2967249-10-bernd@kuhls.net>
References: <20260314140633.2967249-10-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852041; x=1779456841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBLRRWodFKtoaJbzsfUpapf8p1/88g6vMZbkyqakTnQ=;
 b=Dlu9YUVw32MDiwVPwQNb0F4+bQl+qpJwZwvgvpcV+l0DTbhHX/MNkWwiukk6xMTHSd
 Q2ExkDhTR7fn6iLHe6aQNtGfcBN9nEbDZ+i9PAxhzyO4pHPGY+SqDzKyoYStRPFRw38s
 N4OXzvIJQy8Uoe20tnM3IVu0BYmc6whxmWCltdx1WxnlM/M5vc6NG8n6RGXWPDiyr5+d
 6m1xj/K1YQMJXyFt9XRsvVFPje4zSmkc4cD0jv9P0jOtGn13eTlB5Gf2rt18axafGpgu
 fNhVhTDNorPh06lIdtuGOhX154yGQUe+NhAYl1M+f0H5Udl/DpdIXgpSrFD84M+sx76p
 yE7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dlu9YUVw
Subject: Re: [Buildroot] [PATCH 10/96] package/python-certifi: bump version
 to 2026.2.25
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index 176da86300..2a2390eb42 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  d8447ad858fa15af16f91e32f182aa85  certifi-2026.1.4.tar.gz
> -sha256  ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120  certifi-2026.1.4.tar.gz
> +md5  1583dc0160782da8326204a90d7f5861  certifi-2026.2.25.tar.gz
> +sha256  e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7  certifi-2026.2.25.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index fe28f5878b..be6ce924f8 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2026.1.4
> +PYTHON_CERTIFI_VERSION = 2026.2.25
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
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
