Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5CDC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211FA417F8;
	Mon,  5 Feb 2024 10:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 211FA417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WufkJneCVsI; Mon,  5 Feb 2024 10:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452584179D;
	Mon,  5 Feb 2024 10:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 452584179D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68B001BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 418CE82661
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 418CE82661
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uuPYRjbxFwM for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:25:48 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 570F982656
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570F982656
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3394b892691so1616417f8f.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128746; x=1707733546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdv45qQz+RifC8DztmXYKJLQohiHV4qL2/3R2kVr8S0=;
 b=ESgKfJ3IKSvXwdF0yQTBxHCVssNZNp6QoyPFEmJWWpW1sjcutMZruUGOJexMukxLAo
 f1sxS3EXksi1cYLhhUXpp4t0c+T+YqkwECqsYAR+gIB06AHtWF59Gn/PdCX+2TQpVYpr
 4BvQGMgkjhg45D+CF/5b0VWERh/99Vo6JJR+MyxOm0QMnsYC+g0yeQpYaNzvuI7Le7UQ
 liGxdMR8WqZ6oUslegOgzDwknaXlqqPsrVKRYNIURYlV5t9a+TPu/2zGzpBpwHyRLxfS
 apFq9AiC5c58Co/8RFcKzZMiH6MRM3H3YhReOOKx4nZRqK1W0gpytqPXoONZ4KlnOwSS
 VTEw==
X-Gm-Message-State: AOJu0YxnNp5eHR9FTb5ngYZkGx3FFLJnthRUJnUGaRzkh2WRRlmM5E7e
 61tyKZm3SbPZWoTnHIjKkFsEBDg+/AWCF40K3I4vIlvjxuwKzSW1JXF110vsDSQ=
X-Google-Smtp-Source: AGHT+IHvi3gZm0B3so3NneX0hoqpM/3vNOJ8oRH0SLqmFq6/T0K4sPv0nRFsqkjeCXA+CixbNMe7Bg==
X-Received: by 2002:a5d:457a:0:b0:337:68df:5426 with SMTP id
 a26-20020a5d457a000000b0033768df5426mr4092820wrc.34.1707128746450; 
 Mon, 05 Feb 2024 02:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWF6GqYHqK01WiZ5cFWo5XchEjida1XbcFdwPpyhxgD2+QA6QqmZAyWBFCThf8b6RDNYt2RHbStjfmp0CG1f5ZC7sGhtK8Mng==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0040fb0c90da6sm8099964wmq.14.2024.02.05.02.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:25:45 -0800 (PST)
Message-ID: <600a04b9-5378-47b8-9483-17d65718ac75@mind.be>
Date: Mon, 5 Feb 2024 11:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111023429.2663712-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111023429.2663712-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707128746; x=1707733546; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gdv45qQz+RifC8DztmXYKJLQohiHV4qL2/3R2kVr8S0=;
 b=aO/sWv7Yv4Wm6lGhYeNeveVXCKkD1dfjIJjHgX5sYOXUOHFfBTYwiTjHQKqIRM+T8I
 JeTbsek88fxWvMoXNsJQuigffCbcEorKH49lKZw2T1tU7XGSjuck5nufzrlgn1zstUcy
 +UjL2M4KqnVSlFmYhFp2ULv9jKidc1ZUZHABR+AnY7S7vEQWZ+YMQT89OHmakq+OQIpC
 A+GCMNBpGMxgQVaxukbW9vjps5yYcx70hu86bO87TRUoG2WEiamEfviTvuotUIgSeBrJ
 tcKIeGVLdtgXzxPt2ZDC24kbKJP+QF+uzNiMsh73uCD65ig17IhaXAdUfzvTjz6bFpzf
 58dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aO/sWv7Y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to
 version 0.10.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 03:34, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyspnego/python-pyspnego.hash | 7 +++----
>   package/python-pyspnego/python-pyspnego.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
> index 0ae6cf1d4e..dc808d4204 100644
> --- a/package/python-pyspnego/python-pyspnego.hash
> +++ b/package/python-pyspnego/python-pyspnego.hash
> @@ -1,6 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyspnego/json
> -md5  93ab1a088d65e6a7c97efdb567ba37b0  pyspnego-0.7.0.tar.gz
> -sha256  da78096fd7c9f40e716f6fbe3e30d913103d75fd676f839f98fc3a6fee92fbe3  pyspnego-0.7.0.tar.gz
> -
> -# Locally computed
> +md5  b633cab73a1481c5dbc2d6f6857569d0  pyspnego-0.10.2.tar.gz
> +sha256  9a22c23aeae7b4424fdb2482450d3f8302ac012e2644e1cfe735cf468fcd12ed  pyspnego-0.10.2.tar.gz
> +# Locally computed sha256 checksums
>   sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
> diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
> index 2fbb779d98..740e6eec15 100644
> --- a/package/python-pyspnego/python-pyspnego.mk
> +++ b/package/python-pyspnego/python-pyspnego.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYSPNEGO_VERSION = 0.7.0
> +PYTHON_PYSPNEGO_VERSION = 0.10.2
>   PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
> -PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/97/f3/bdf3cd5f4c5a1bf9e1d4bb771c133850ee08241c18cafd90a6d872937a9f
> +PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/3a/c3/401a5ae889b51f80e91474b6acda7dae8d704c6fe8424fd40e0ff0702812
>   PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
>   PYTHON_PYSPNEGO_LICENSE = MIT
>   PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
