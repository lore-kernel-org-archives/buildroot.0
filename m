Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0A010987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BA184877;
	Fri, 20 Mar 2026 15:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUsmh5GUHtbp; Fri, 20 Mar 2026 15:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B85A8487A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022133;
	bh=cUbeCFr7MYQOURkQqI2QS8WU8H5dpbwHKk7T7LWETDg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rl+WDW18LvEt8XG7kjlOt74AdDTWZjlO2gYs2wOftK3qawSfBaCQWdwHyMADT7q0N
	 wRzeLAChtOUf6pYjVUtl9k8bBCB1jFXd/LKKxzuYpKp5vFgDGwAzin4HiOl4Mp3Rqb
	 zL3QQIP7GcSHAcbBMSMOa9qRO6mxt1G4uAdnMkrpvJCGe/HiGwr3X1Dm0g7ocbLYPD
	 KdiJsaVhxVgtuEmPseXMDmgzzwFEjxZSyl9C5hHEzKCvJAPPELaT8bqDdUjA522dmA
	 bW5tO0fRBXjfLS4ZHrOj48GYEIfRt4N719PjADhY2jyb2JPplwJHtRYKHZurLpuzeK
	 stbkGZD7AMiIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B85A8487A;
	Fri, 20 Mar 2026 15:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FD3B1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF22040336
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bha7pzxYbDt for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D376140139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D376140139
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D376140139
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48541edecf9so22176245e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022116; x=1774626916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9XJ/ZY6ZtCO3ug95FFYatXt006IEZB72RTWTd9mNQk=;
 b=Cf9Ots4v6m8iydqOGMaTkhX7rwQYWFoBYv3zn2e0+jxSVI1tmxfZrDFHF3s7piEGsP
 XwLUllGBtdekXHe3Y2B2iHrgVTt3AF3qVNFkqNVzMbN3PtFvIl3NZK5YNNE9NigGoY9I
 7f0OOvHTRqpvz25uhDBym3TZwnb9vQeMUKwab5hGqkLqz1Gvoa6MvdrxPPeWvX/Xqq/l
 Fp7HuB8Mzdo2dtKNTCWGGBN0zXF3IMLuo5OEKIMTcOeo/pwo6VGSclZv/fhz66cRBrVa
 wCka21c3AouoUQsxqLbCcBbeRbxf7hXktxnXjlHzO3I1LnNgAuniJvJ7VL7b3v0KnQeC
 dMWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0YzZHyiHN/i2+bV6nR3gyorNriP4EZytiEsFgC79POwniAQs+Lw9aq6hMTMdyuuhFMntwigkyDZc=@buildroot.org
X-Gm-Message-State: AOJu0Yyod4VWvr4LAC4unBHofKRxnFa4LXbsfnzQ6/LrInrs47Nalkyp
 ZdAZ64nG+EJ2ygILQ0ygXN+m1c9ZfL0FYFKkU6JTLdCTJqz3XiG6YYGThDQCUrJxDyLBfTisYe9
 E3MeGsGk=
X-Gm-Gg: ATEYQzy/YJMoRO0+zP5fe058+3X9bfv6VPmTEVXL9oxDBuzy54MHe8e4Q5u3NhbFps4
 3n0+YY1jtOjGZVORgL/8QQwg5rUDKeEyAXbo/JTngFeBcEf5DTi/5Byu75AYZUQMbIA1kZCZECd
 vJPwAFNHBzFdxIWhEV21Mok1L5SE78w4SQekyd4NKPYaWW1nkYprIOcfKDijaK9JzYmZyikPttW
 x121/JqKvBXuxlmMliPo6UT3nGMiexmMOh8gzRG/qxKRY4WCmhHKgBUlmTa0La6nunAGH4wAekb
 BrkyOLZqw8yPBdPRy3SJH4xUvNK6Mc8yphVFkQNv6QIwl7aB5/4HnHNm7eRASMWfOxuZVVtPx5U
 0IQTttpyToSBaAt6GpAB9AZxZwxRB+a1cqjZzrSb2dJRDCdSsPFznLcmFCnc/q3BJLNbDjCnUd9
 CkeP0aP7uqCgE4agcE
X-Received: by 2002:a05:600c:42d2:b0:485:3c05:24dc with SMTP id
 5b1f17b1804b1-48703064edcmr3318145e9.33.1774022115737; 
 Fri, 20 Mar 2026 08:55:15 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8b1fe65sm134861305e9.5.2026.03.20.08.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:15 +0100
Message-ID: <20260320155515.177113-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314140633.2967249-49-bernd@kuhls.net>
References: <20260314140633.2967249-49-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022116; x=1774626916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9XJ/ZY6ZtCO3ug95FFYatXt006IEZB72RTWTd9mNQk=;
 b=JBgs6kRqx9OSbyXrtZ3tvkcCK/wMFwHWpjaTyp8NQu4dbBGe0N3Zbwhy57LueIXLk1
 pY+CdzXZbqvKQU5/x2KWyynkzH4si/Mb4UL2vTj1QNfq+Ams3+FaVmxCrYiuuCX47qOH
 ZbZI+GiU5Kh11YOUo3RgfcgtlvLR9euWtHWCxzKEoGFLilMkjG7yMK2EOZ1zFZZCWERn
 TdH7iFQCBvYibSznbQRo7vBqy15r31qN2nvFdo+4JVdlvgQ93ZZM8EbIyRUAZhVu1MSd
 14DbX7y3UljoeEoIYkZZkuErGMGQPDLdzn5KyM0KPXDxlbcWRwvYOumKxSpEs5pUwRNZ
 30Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JBgs6kRq
Subject: Re: [Buildroot] [PATCH 49/96] package/python-pyasn1: security bump
 version to 0.6.2
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
> https://github.com/pyasn1/pyasn1/blob/v0.6.2/CHANGES.rst
> 
> Fixes CVE-2026-23490: https://nvd.nist.gov/vuln/detail/CVE-2026-23490
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-pyasn1/python-pyasn1.hash | 4 ++--
>  package/python-pyasn1/python-pyasn1.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
> index 4268d82c38..4977abf4bd 100644
> --- a/package/python-pyasn1/python-pyasn1.hash
> +++ b/package/python-pyasn1/python-pyasn1.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyasn1/json
> -md5  75cdc260597f112fdfefec85379e710d  pyasn1-0.6.1.tar.gz
> -sha256  6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034  pyasn1-0.6.1.tar.gz
> +md5  93dbc09023fbd1b724fd8233ffe2a343  pyasn1-0.6.2.tar.gz
> +sha256  9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b  pyasn1-0.6.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
> diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
> index 7a5cde40fb..2dc9470ef0 100644
> --- a/package/python-pyasn1/python-pyasn1.mk
> +++ b/package/python-pyasn1/python-pyasn1.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYASN1_VERSION = 0.6.1
> +PYTHON_PYASN1_VERSION = 0.6.2
>  PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
> -PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018
> +PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/fe/b6/6e630dff89739fcd427e3f72b3d905ce0acb85a45d4ec3e2678718a3487f
>  PYTHON_PYASN1_SETUP_TYPE = setuptools
>  PYTHON_PYASN1_LICENSE = BSD-2-Clause
>  PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
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
