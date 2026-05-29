Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8093CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2CF4223E;
	Fri, 29 May 2026 08:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr9qgfGHbeTS; Fri, 29 May 2026 08:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DD642246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043363;
	bh=M7VXDcGea0te/xwK2vYBDab3Sx3GkHz3JNp02/7Rf+Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RWeAJb0LCwEIQBj25uuFuzOLzp2EAAyiXgeemfEeXJKT1eWCJIDYFYCi5weedH7HO
	 oc6edAAm5e/hHb/iawfG3imLOlDkjW7k8/uRucH5gy4dkjGZZTGbGgPaOpUoCOh3Jd
	 XzbT16xI20trhpv0wqdcKXjDC5ABYEdcQPko+Af/vRE9GQlu/qCI0Ls7UxZwcGxry+
	 60PIfb/k3vDA/D4suLuklIzx31g7vHsehcOGz87cCgCBpJhgg+U83lLjqvVgGmnYK5
	 w+dgH5MIy7duvnM/pWXpZ/y73NOwnqFIDLS6YfN3CkWsOvNByHp7D6+N9dHJBXBu/g
	 zS8pdTIpMU4hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DD642246;
	Fri, 29 May 2026 08:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9A92E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CAB38421A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43OheHq7MJ3q for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BC2A8420B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC2A8420B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC2A8420B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so62545965e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043355; x=1780648155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R38ig/MrSBZPc9kOZniwitXQ1BJge25z+4xkTBCx9Gw=;
 b=mli9IxXzK3utGeY004E/dJnxtnIp/JnMd8eRjAq1VEGwWgGUt1dzMHGB2xEctzfzV7
 fEs6yFhiHuwyiIYtvw0/4EKB/hk1YuXhzVIMr0p2AgGcP7OrOyRyzCr18bhXv/ccrC3l
 DCTOYqmEvmmJp2fb85bDwrLuFpWmVO5Tx38KBYyJiiq/OLiRkll9WHIIgxwmitbEdTLF
 xSAdWIMpibYCmNZbqBaKX0069PPPD3rkeR/yqMeEok32UEeTd20Irue216dsNjxjXEmY
 nTFQObYX/AXtTa3qKlnChjA4VPqwLa0x87r5NOf602qOWCd9sJyawwHDTDIkqTD+73cz
 meIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ86vyaebAHOZN8qEJHS996V+dnvJA/mhR13sTp6zOBoehVA/EMlHK8R//LtwF3TuOVUUPnOpToLKVg=@buildroot.org
X-Gm-Message-State: AOJu0YwBfWGLsMtpBtFp6l8+1vha1dSmDz/JH1cJb0bcOsYMZym17go6
 caZF/Q067ys3zkNmywIUo54ooDKYaULbZyskDzBDUmKbPuBVJ3UKRl5nkuvtvIqa9+4=
X-Gm-Gg: Acq92OFitu6KsyUMJpzHHMXA8FvWCXkIUtizyX/Pol3Wkay0ovyGztEoAskXL+xBJUN
 CFIFsCK1t3WujBpQhcpH2feJQV+rzUmUttja4IdxzhU9wY6URm4MmKhtdL/QB46GPp4dWw/pUf3
 2ZpQAUbIliSfY+RaNafxtxMOO3Od4bCTgyjh1W3AHGBDHws76YV8uURai9XLvLyr7IJXGOXaG90
 k/Q7C3oX/y7ejDYNS3eD5HDMaf0kIRdX0TYFyBuz2ScexJmRWotlSuzF0pjITykc3JWI184/cRq
 MxJTU6oP9S9H33TLYRTt2hEBe56vwzx/i1GcnXAl5h+esZOV3Q8naecCbxAuLsAD4Cpefw/wv2G
 PSM+pzusS1S9qCAN4aFhLThQVEbdikZfbcEbDpO09UM5qrLcISEEgsAHMP7kpTuvVisMKGQmWpJ
 2Td2KB2TLzWcpaN0dy/fx/EriTtqC4FuWwMEzRwMM64rdDwOHS2XZ+6WS5XnNa/dtocXdO
X-Received: by 2002:a05:600c:574d:b0:490:778:4fe8 with SMTP id
 5b1f17b1804b1-4909c0ba8c9mr21975695e9.25.1780043355268; 
 Fri, 29 May 2026 01:29:15 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12d2c5sm12536645e9.7.2026.05.29.01.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:15 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:14 +0200
Message-ID: <20260529082914.57132-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260304172729.3622901-1-james.hilliard1@gmail.com>
References: <20260304172729.3622901-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043355; x=1780648155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R38ig/MrSBZPc9kOZniwitXQ1BJge25z+4xkTBCx9Gw=;
 b=Cm7KW71RkMzzC11SIlt5I5FyPuXZTzMlgxFHS/xoFntmz/mPkYrZ0n69Xp0jQEc/VV
 MLQcch3g7YPwFVUl/Ela4zpvhTAJMdX+6tFUZiZda8l4oOMH+2sQx13X5eP6JbEYNlZ3
 IZV3vb5AJiJKtepryed0aT1Ag8Igg/rXTOsCg9jYoF/YSGzY0OEds07Ruen5mOKgQRdK
 Uc9LlvVfh1TCIu+8KEAT+xQpV3dyb8jmTT+J679DzlhenDxkohBbyUcOmx1vsdn+fUvq
 D5AJA8EBvhilmSDZtvDrsGcgzLCqWvOO1ScsXT7R4I9syeOIfnC2HDP6vlWVOnHyjBr9
 0nbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cm7KW71R
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version
 4.0.0
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/python-aiodns/python-aiodns.hash | 4 ++--
>  package/python-aiodns/python-aiodns.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
> index a4a242670a..4cde1c4b1d 100644
> --- a/package/python-aiodns/python-aiodns.hash
> +++ b/package/python-aiodns/python-aiodns.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiodns/json
> -md5  c1552fe562a1f9c98ea4c2311a2c75ba  aiodns-3.6.1.tar.gz
> -sha256  b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6  aiodns-3.6.1.tar.gz
> +md5  c69a64f09c0999f63ed759f5046d5bb4  aiodns-4.0.0.tar.gz
> +sha256  17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1  aiodns-4.0.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
> diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
> index 7476c76b72..6befbff203 100644
> --- a/package/python-aiodns/python-aiodns.mk
> +++ b/package/python-aiodns/python-aiodns.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_AIODNS_VERSION = 3.6.1
> +PYTHON_AIODNS_VERSION = 4.0.0
>  PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
> -PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/85/2f/9d1ee4f937addda60220f47925dac6c6b3782f6851fd578987284a8d2491
> +PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
>  PYTHON_AIODNS_SETUP_TYPE = setuptools
>  PYTHON_AIODNS_LICENSE = MIT
>  PYTHON_AIODNS_LICENSE_FILES = LICENSE
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
