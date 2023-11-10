Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D221C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4DE34288B;
	Fri, 10 Nov 2023 21:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4DE34288B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGuMHECh_0eG; Fri, 10 Nov 2023 21:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083D042887;
	Fri, 10 Nov 2023 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 083D042887
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 366321BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B38042887
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B38042887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zz3B_quzWD7m for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:19:18 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E396C42881
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E396C42881
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so4006611a12.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699651156; x=1700255956;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/gjWri0ETuIEbaeU+P3AMMzsKOsBj+00DoqsF2IGgY=;
 b=wnqn2cIgPywDW89kT+61XJeOjgMOeghxlNp/dAPqGkKEWCXgPvjflMx1S0hvyWHoTc
 EUYoxJQYClinH2G0iX2/eFhrw38XC04teMdjC5xD7vomAA0UYphSdCsdAYLz6FAP1TiO
 kD9m3R1ycv23p5GpdQKVvn6iZfT/Fa/G6nmdxBOfQhA8idMhqdt5+XccS/QUZ3WuH41T
 ZQ4wh5vseTUP5oIAjNpHYBZEOkd6ZZB9dq/va+aj/EEV+j8QKSLxrOLfN+v0t6vAJdsJ
 qxZCFmHWZxkOgPJYs5e7qm8AL8AzV9gN17HzB3gw/pppe3Xv+OrszJfEEqDpI/gOjWfY
 33Hg==
X-Gm-Message-State: AOJu0YwXVyoBEduNkV9YdBZcjO90AjwO6uc0OcgXgOOo3i33gqU6U72h
 mYNR4lOI4ZZ2q6Tg+XwmpQq+BA==
X-Google-Smtp-Source: AGHT+IFXLXqPXJS20amv8m3DTzIyv+BfWJK713bhBbXwiD8x943hGA5bshjoof20YdZdDticmaH0ew==
X-Received: by 2002:a17:906:7d0:b0:9e4:6b2b:35f7 with SMTP id
 m16-20020a17090607d000b009e46b2b35f7mr105261ejc.41.1699651156080; 
 Fri, 10 Nov 2023 13:19:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709063b0900b009cc1e8ed7c5sm97911ejf.133.2023.11.10.13.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:19:15 -0800 (PST)
Message-ID: <dd5390d3-aba4-48a0-bad1-476ff96ffe74@mind.be>
Date: Fri, 10 Nov 2023 22:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231106232926.2972118-1-james.hilliard1@gmail.com>
In-Reply-To: <20231106232926.2972118-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699651156; x=1700255956; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E/gjWri0ETuIEbaeU+P3AMMzsKOsBj+00DoqsF2IGgY=;
 b=CHm8Iw39ufESbNk4t0F44rFavN7Bc1XMa7dSo7qaRc5LtNsyLYVOCmOtvabmE2M0fR
 QaoSwyF0EceA7rinIkt76zPbPOK+8+HPBhh7h++3+muiXfFyV+nPN01YyJL1KGqcJMAJ
 +DmNVjQa/QYWILNNwPrLot7ri+zronftAe/eFWXIvx5Es02pNPsFBcCzjlUPYGj6IXRT
 lvL8a0P5PGko8teuOPfi/f583rdBk56LVqrm37hcAn6X6ONd82eR49SfQNJu57A23d0z
 gQdLxUesMsbEG+qSZB3JIGOWCOIjDotgNANKq7jWOPT/s62PWNebaqV2NH98JGFSphZT
 fH0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CHm8Iw39
Subject: Re: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to
 version 1.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Esben Haabendal <esben@haabendal.dk>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/11/2023 00:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied another 4 python version bumps to master:

90cfa7b1e9       James Hilliard package/python-lmdb: bump to version 1.4.1
d8ae2986a0       James Hilliard package/python-libusb1: bump to version 3.1.0
26b8b6c7cf       James Hilliard package/python-lark: bump to version 1.1.8
b23e072065       James Hilliard package/python-kiwisolver: bump to version 1.4.5


  Regards,
  Arnout

> ---
>   package/python-kiwisolver/python-kiwisolver.hash | 4 ++--
>   package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
> index 7f2e263a5b..900027a88b 100644
> --- a/package/python-kiwisolver/python-kiwisolver.hash
> +++ b/package/python-kiwisolver/python-kiwisolver.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
> -md5  34796908455c3b23c889439b541e424b  kiwisolver-1.4.4.tar.gz
> -sha256  d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955  kiwisolver-1.4.4.tar.gz
> +md5  20dea6992699d6be8a563995d7fe0309  kiwisolver-1.4.5.tar.gz
> +sha256  e57e563a57fb22a142da34f38acc2fc1a5c864bc29ca1517a88abc963e60d6ec  kiwisolver-1.4.5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  26da8d49744796f2601fb5fe9e5d8b9e8102064ca60a8dc1825b6177cb05450c  LICENSE
> diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
> index 2c5db26dbc..04a0779b37 100644
> --- a/package/python-kiwisolver/python-kiwisolver.mk
> +++ b/package/python-kiwisolver/python-kiwisolver.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_KIWISOLVER_VERSION = 1.4.4
> +PYTHON_KIWISOLVER_VERSION = 1.4.5
>   PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
> -PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5f/5c/272a7dd49a1914f35cd8d6d9f386defa8b047f6fbd06badd6b77b3ba24e7
> +PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/b9/2d/226779e405724344fc678fcc025b812587617ea1a48b9442628b688e85ea
>   PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
>   PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
>   PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
