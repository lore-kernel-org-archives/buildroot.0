Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C617C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C274150F;
	Mon, 14 Feb 2022 20:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjRnhCyiojBO; Mon, 14 Feb 2022 20:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC9441504;
	Mon, 14 Feb 2022 20:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCC11BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5AC981858
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J55LDnP2l-gx for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA4FC8186E
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k41so9143784wms.0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xELJ/geG+2+V1SAB/bdrBUdEieL2k8n7P0jAntunzkE=;
 b=ILathfxq47gzzJkVtLjlgCSHxWR3VyLXs16BqR7yHf7Rd3Of7hrwjbErRN6OMz3odo
 XSRNnKt8moGUSRwJBNLPqFjtTbZvwms6MDCqi20zsGNUUigFJHuTtzjUYXjyQuEXjM1q
 pG/eqz9GPQC6s30HoDFHO4OcXDTmkv577TLHxM9NmNJjO9Dqo8z6fr1FAKfgefnUrDNd
 9GsxJc9UE4fF1jZXIdE/WR2QItERY3hiKWzmuNVXmNFE4+G2ttJTAjz4t3aS0p3br+Gq
 oVu8YqgD4s+5GFdnP8ev/ec6DY0mwwPsYT0CPmFFedGEjJ9tfxJBZVCcUIcoDoTegEFm
 zG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xELJ/geG+2+V1SAB/bdrBUdEieL2k8n7P0jAntunzkE=;
 b=Qqz5KJAbwBl6B80JTSOIbqR5tUHo9K/HMFqBU16JV712kIXMdxLIba8ljbjtTuFzqb
 2PhMSy2Zmtsc0J/Qq9xk0OTFQqyoJrlMqLL7OC4ZnSuthhjfPkdlKhW9ukBxj1vSjzvP
 0l0iDjrtXZq05slFVJw7dYeDxERmEK3GIyX4w9J6fpJpFNBanBd6v7s5oG8mYk4CgRXP
 oUzX+jZmrjfjDaL6WQEgylsdw7mXuAwD8RZ6bk+vXPhXOnKm8alWES+ResT4ks5y5ofU
 tjbgfGtx/JNNcftZOqPuzHtrUUb5rR4EoNJar+xKxbh8znD+OTp02J2JPxBfMwfT4LPr
 vEmw==
X-Gm-Message-State: AOAM531WJuYOb7PB3b3PWLZ218T1WVkmS4Qcq33aK53jxhugsqeTlgI6
 +0u+XMLDUdH1Uq3/pW+I5v1amZGebLDMDw==
X-Google-Smtp-Source: ABdhPJylR49aiMpAMj4HaDGEaKGrmwfkvir7bHrnvzfQPsfM6aPsk8KvD7uSSnuAmB6aylMpSRJJXw==
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr465438wmc.70.1644871349983;
 Mon, 14 Feb 2022 12:42:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q76sm14206656wme.1.2022.02.14.12.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:42:29 -0800 (PST)
Message-ID: <767362e6-ba7e-ff9f-81ef-787f325067e7@mind.be>
Date: Mon, 14 Feb 2022 21:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220206220814.2580975-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206220814.2580975-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-regex: fix license
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



On 06/02/2022 23:08, Fabrice Fontaine wrote:
> License is Apache-2.0 since bump to version 2021.4.4 in commit
> d973fac7ca2e7c0c4864e8045e5205764e84c45b and
> https://github.com/mrabarnett/mrab-regex/commit/b693a1fba731a9aa0dc6ae37b441267d4b7b0419
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-regex/python-regex.hash | 2 ++
>   package/python-regex/python-regex.mk   | 3 ++-
>   package/python3-regex/python3-regex.mk | 3 ++-
>   3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
> index 4749cd6167..b0f5bb05da 100644
> --- a/package/python-regex/python-regex.hash
> +++ b/package/python-regex/python-regex.hash
> @@ -1,3 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/regex/json
>   md5  cd206281327b4c087bb20bf93cee4ab9  regex-2021.4.4.tar.gz
>   sha256  52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb  regex-2021.4.4.tar.gz
> +# Locally computed sha256 checksums
> +sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
> diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
> index c46c4d1614..4019bcdd3e 100644
> --- a/package/python-regex/python-regex.mk
> +++ b/package/python-regex/python-regex.mk
> @@ -9,6 +9,7 @@ PYTHON_REGEX_VERSION = 2021.4.4
>   PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
>   PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
>   PYTHON_REGEX_SETUP_TYPE = setuptools
> -PYTHON_REGEX_LICENSE = CNRI-Python
> +PYTHON_REGEX_LICENSE = Apache-2.0
> +PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
>   
>   $(eval $(python-package))
> diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
> index 0b71768e9d..5c08338437 100644
> --- a/package/python3-regex/python3-regex.mk
> +++ b/package/python3-regex/python3-regex.mk
> @@ -9,7 +9,8 @@ PYTHON3_REGEX_VERSION = 2021.4.4
>   PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
>   PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
>   PYTHON3_REGEX_SETUP_TYPE = setuptools
> -PYTHON3_REGEX_LICENSE = CNRI-Python
> +PYTHON3_REGEX_LICENSE = Apache-2.0
> +PYTHON3_REGEX_LICENSE_FILES = LICENSE.txt
>   HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
>   HOST_PYTHON3_REGEX_NEEDS_HOST_PYTHON = python3
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
