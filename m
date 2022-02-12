Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC4E403C5;
	Sat, 12 Feb 2022 20:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vvCjhWtPltRo; Sat, 12 Feb 2022 20:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9033403AC;
	Sat, 12 Feb 2022 20:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BDC51BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A7C6403AC
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0w5CvaTqHedF for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:36:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EFA4403A8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:36:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g7so5344587edb.5
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J9x6/XFUt1NmJVedd2BC5CPr5onaDarY+qDRn+1Clu4=;
 b=QduYsiNv2ayzM/XWu+E0TWN0jOLJuH6PQ3qF9frEtpY5xVMVwcll7Sew+gq4wJ7g+B
 TnftzDcMxSSL50xqRHqjYkvZ2uA+DfwEfzzlLSy8ear4nCOL1mGVbhdCubAgtKUqwcRE
 w/PRl9x5GFwunPoJ1rg+rhz2QnR/txLEKJ/bpRgNAytzutp8MhoTwUPl8jCMTSKgoUu0
 p0jQCTRXUEDlPdyLgVUFh2hbg89bLZYfkAzi1qqCiEGvUkSJ/pVRbX2tIGqNKfYWUGOU
 PJMpe02Z3B/hxQA1ehgna7W0wh/OfeRVXR9glhdH4hEEtRO7snzLfPOKVX/1ElWnJWSp
 av3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J9x6/XFUt1NmJVedd2BC5CPr5onaDarY+qDRn+1Clu4=;
 b=SNQsOfMxBHLQ93ySl+lm9RLHmWw4+2rGGPh/uPoMsw4Fy4+2aB/KyuQgtQVKw2C/LZ
 crtb1glaVz+TCgbeM0yR+5KS0A+QyXpx4qBVACPqUXFCZZfBmTAkSC2CewOWjhCSM8a5
 yx2YuNMJq/2hDF9BXuicJTefvWuVb3mvBRyGT5lYt8ijZZqKUAiEkI94+dBi0siW6Q+0
 At8B0oieCiCoefXijCb0Bumnrja7XXNcX6as4pBDFi4YDgs2Cm2l7uV5b4nGX0P9TxmQ
 1UiF5yqLcdvMWtMbU5Pt7aqHch85kGDCNk8/qYI3GVjCrKjaEFkmr3tN5p/0XYicbSUe
 KDeg==
X-Gm-Message-State: AOAM533QZFcQnrc30v2XG48tNHDOQk5n90lNGjx90u0JQBfgsuTjKMhC
 ofmAl7iQkegV6pp+8v8JNzHSvQ==
X-Google-Smtp-Source: ABdhPJzyAygYpE0d2ui0NeIQTZnTVicTpHdUjXAt5ZjZIPKx98bxOqQDvE8QpRdCeQjC/+S/2Bvf9A==
X-Received: by 2002:a05:6402:5243:: with SMTP id
 t3mr8039252edd.260.1644698187237; 
 Sat, 12 Feb 2022 12:36:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j9sm5420067ejb.189.2022.02.12.12.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 12:36:26 -0800 (PST)
Message-ID: <e8c179f4-af33-ad51-ead3-59a0de8dd44d@mind.be>
Date: Sat, 12 Feb 2022 21:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220201013307.1956972-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220201013307.1956972-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: bump to
 version 2.11.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/2022 02:33, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
>   package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
> index 3842f0c7af..8b44318307 100644
> --- a/package/python-aiohttp-session/python-aiohttp-session.hash
> +++ b/package/python-aiohttp-session/python-aiohttp-session.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
> -md5  d57d463a9db13b681f7924b38aa77f64  aiohttp-session-2.10.0.tar.gz
> -sha256  2af19af9f435937baacbb6420f887b21e5021bb34be146c2702c58e6ebf6b76b  aiohttp-session-2.10.0.tar.gz
> +md5  797273eb5f0ef9e95fa92c6a933cf4ad  aiohttp-session-2.11.0.tar.gz
> +sha256  0fdf39600f6a05c4943ef6c7b099071ca9854413111a26761626244be5015dc4  aiohttp-session-2.11.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
> diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
> index a28b1ae143..3d59b75e3d 100644
> --- a/package/python-aiohttp-session/python-aiohttp-session.mk
> +++ b/package/python-aiohttp-session/python-aiohttp-session.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOHTTP_SESSION_VERSION = 2.10.0
> +PYTHON_AIOHTTP_SESSION_VERSION = 2.11.0
>   PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
> -PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/d6/3f/ab6288e8bbf4a9ae63ea0d3d5711bccc3a6dad1cb85a420c14fdeabc209e
> +PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/3b/a7/0b97b9a2e3a553a86a6703f86b0e9b1afb2b262849700e8f80015c0f643f
>   PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
>   PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
>   PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
