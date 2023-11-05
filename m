Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34806C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9661F4182B;
	Sun,  5 Nov 2023 21:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9661F4182B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nl8PaCuxO8at; Sun,  5 Nov 2023 21:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D0741952;
	Sun,  5 Nov 2023 21:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D0741952
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D701BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FA7881A0D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA7881A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jy1ycCzB2FKC for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:06:19 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE1D6818D0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1D6818D0
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-542d654d03cso6212867a12.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218377; x=1699823177;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89mDLpfZ2xRPhYL4Z/DAT62VT+xRLDxOcgXXG18z7H8=;
 b=cnPLyi3MFZb2A5TbmzujntIWArd6/apUpge9/9n0WjtphN54niqM1jEs1iRMlrhRNV
 xME6e71810dg+gtcxAXHFvDVx+NPp+JBA6mfqQDd1eno4WcQm4vAZxNjPHd0OS9Y6cjN
 9hSEyoKC/8PHtObIkY5A80ZODFkn/HY1CCuM1dlYY8NjQXqIoniD5fJdEhtuXI6FWH3a
 nHif0Yn7eXjkyFN1KGuA85oDC+6ay1kPMdp+67T9WhYMPSDCVgMB2ydLcrY+RAkXDsU7
 RfHzX6GMwmx+GFjZluu4d6sfDfzAEnAjb6A5r3NzAX2MELQHqa5SK/j1jQnGdBMs0Y20
 iGHw==
X-Gm-Message-State: AOJu0YyTtH1OEqk4CaKIy1/4Ww96OGmUdCC2eybsyP4KqMJsMci+xefF
 GXtAft5oHNZOmBWw7tRneeSZWQ==
X-Google-Smtp-Source: AGHT+IFl4BpMJSs/MRQ8g72WhDYRSNukQ3nMuy6Mf3HDmk4OqvjE3AJiHg3LIRusph6LF5eOoLDjiQ==
X-Received: by 2002:a17:907:2d12:b0:9ad:7890:b4c0 with SMTP id
 gs18-20020a1709072d1200b009ad7890b4c0mr12315492ejc.56.1699218376944; 
 Sun, 05 Nov 2023 13:06:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a170906c1c400b00992e94bcfabsm3343523ejb.167.2023.11.05.13.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:06:16 -0800 (PST)
Message-ID: <c3cd2309-39a6-45eb-82cb-4021abbb0ef4@mind.be>
Date: Sun, 5 Nov 2023 22:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104232318.2673701-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104232318.2673701-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218377; x=1699823177; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=89mDLpfZ2xRPhYL4Z/DAT62VT+xRLDxOcgXXG18z7H8=;
 b=WLgGRwQGrqisPJEaL27m0sLnfJAgur7jPdvZs8Ypa9/Os/V8NPNer4YGiVepVXkMml
 0GCoSmt+/q3Kvq8l3qTBb8klz9rAXfuZW/IKbOfj/XfZJT0uZiaYk+gLDuOgh4bYGkxl
 nOyVEyF2+rqyp0ifGN3sGwVq6XWaNcTSAjunp50rIeIt7Xv+hyX3efxnzTasxRco141J
 Arh23iwdWL6rHBpQAtcV4Y3WfOxgPpSuP8PzftxXX8QjPp4hYi0bPy+IK81S/BbGNGpK
 uFV587PlxKv+6BtVCRL5O5mJYd97qdOuN8l1skDy2CjWFpleVwHCWI0RTuLXSXSA3v7i
 9aFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WLgGRwQG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to
 version 23.2.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 00:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiofiles/python-aiofiles.hash | 4 ++--
>   package/python-aiofiles/python-aiofiles.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
> index e7799c7ff7..3dc9281de7 100644
> --- a/package/python-aiofiles/python-aiofiles.hash
> +++ b/package/python-aiofiles/python-aiofiles.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiofiles/json
> -md5  d648a31366030470c97401741747065f  aiofiles-23.1.0.tar.gz
> -sha256  edd247df9a19e0db16534d4baaf536d6609a43e1de5401d7a4c1c148753a1635  aiofiles-23.1.0.tar.gz
> +md5  ab5dfab3180f56a21b46e1e90b16c6e6  aiofiles-23.2.1.tar.gz
> +sha256  84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a  aiofiles-23.2.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
> index 96bd636a4a..582f7908cd 100644
> --- a/package/python-aiofiles/python-aiofiles.mk
> +++ b/package/python-aiofiles/python-aiofiles.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOFILES_VERSION = 23.1.0
> +PYTHON_AIOFILES_VERSION = 23.2.1
>   PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
> -PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/40/a0/07be94aecba162ed5147359f9883e82afd2ac13aed33678a008fc8c36f8b
> +PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
>   PYTHON_AIOFILES_SETUP_TYPE = setuptools
>   PYTHON_AIOFILES_LICENSE = Apache-2.0
>   PYTHON_AIOFILES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
