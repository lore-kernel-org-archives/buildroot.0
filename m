Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1819C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:58:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C45261165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C45261165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 185F74053E;
	Wed, 13 Oct 2021 19:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOqHY1pVbPFV; Wed, 13 Oct 2021 19:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A4A440219;
	Wed, 13 Oct 2021 19:58:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE5271BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6EF40219
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5DmMOstdxIg for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:58:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71A1740155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:58:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d9so14801792edh.5
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5bScQVhYd2pOXR/N131MJ0viOfT2zOYc/ANu/ckD6EU=;
 b=bq0ePEWyPqLO+EJ0yn6EKbpFnS2xLk7BDPHqHWSGgOtl4MQ5Tlbdv7Askp0DliTf83
 6lZnLMkkPk8/0BPD0qJ1XLpJwAwicY0utJqUW7skURcGzAXPAAzI5BljYUl1Wgu5ffhe
 zKD2eQzOLK4xmXCVM2BhdVhFgtyRhrbQ9R8DlznnFtG+BT5YoYUUPjhF0Chab9zGHkz+
 UwoDdvTdoRDXP8Vaza3gTtvAxgkk8E5AMu9mMDTgwcScEjmif+ePj01rXoLt4htU3o2G
 EW4hnsVuwp5Mo0z+6xIYkPIDeYdAKmnD0kP0WqvT3c7jR/GQIUVzVSnMYcbVjIG2+iCu
 BBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5bScQVhYd2pOXR/N131MJ0viOfT2zOYc/ANu/ckD6EU=;
 b=uAww6pvOHvaOH8q7f+qmArvwaav+ynVMGE4J8xrd41eKX4g+fyLzT+UXy5E5Nkgd+l
 kJ9yH9DBDO+lBjiR3ax49mIz6GekjdgHChPJ5mdJCPcWVAgGpSMgkprgOmNpgEZdOTac
 ZsTN98zGu6xGxddqSBXjRyEvNvI+B9B2TSP0v5ur+7657tKO9869AyTeAPUT7wSgKYod
 rzjSOe6hoYufwhsgxXqhyDnLe0Lhzfz0djX3ub9WV9xcTaux3/KNCe2kr6LestjwDbyR
 FDIEikrJvjDk7e6x3qyE8YVth7+AigpVudFzmdRCrnSBC8kLZHfMRWzlrzLeFFoVUFoj
 CNoA==
X-Gm-Message-State: AOAM532ACv356UQcVjnz9f1cNwC0z/Dww6dsNHJODpLinkwWOAa5u20l
 JtBnhOav1pAtZ64rDof6MZTFSA==
X-Google-Smtp-Source: ABdhPJy8JM6KU/SRi6kcZmAoQoBxOgRk1ADPuZbPbFvfm8V8P1oFje0ngwYkWBNMzF8fhpIATWXvfQ==
X-Received: by 2002:a05:6402:1547:: with SMTP id
 p7mr2046155edx.371.1634155087652; 
 Wed, 13 Oct 2021 12:58:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m9sm409049edl.66.2021.10.13.12.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:58:07 -0700 (PDT)
Message-ID: <0113cad0-a460-15cb-4586-4427db519d74@mind.be>
Date: Wed, 13 Oct 2021 21:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211007180520.3237005-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007180520.3237005-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-serial-asyncio: bump to
 version 0.6
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 20:05, James Hilliard wrote:
> License hash change due to date update:
> https://github.com/pyserial/pyserial-asyncio/commit/0fbea23c7b445e6bbb7491511b3064fd5793ca0a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-serial-asyncio/python-serial-asyncio.hash | 6 +++---
>   package/python-serial-asyncio/python-serial-asyncio.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-serial-asyncio/python-serial-asyncio.hash b/package/python-serial-asyncio/python-serial-asyncio.hash
> index f5d1d9e485..ccbdda89be 100644
> --- a/package/python-serial-asyncio/python-serial-asyncio.hash
> +++ b/package/python-serial-asyncio/python-serial-asyncio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyserial-asyncio/json
> -md5  64d15bfb20982b2129b02070321f49f3  pyserial-asyncio-0.5.tar.gz
> -sha256  1641e5433a866eeaf6464b3ab88b741e7a89dd8cd0f851b3343b15f425138d33  pyserial-asyncio-0.5.tar.gz
> +md5  409f32a35a3b530e6b2224e2a5b367da  pyserial-asyncio-0.6.tar.gz
> +sha256  b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f  pyserial-asyncio-0.6.tar.gz
>   # Locally computed sha256 checksums
> -sha256  ebc84abdbdec7f9fa6962612c110123897db47b79529d5ae41191ef584b88f2c  LICENSE.txt
> +sha256  64f3e548f0300d43c5af90b667150a9c57a4307c0f75fe741f76d0419905224a  LICENSE.txt
> diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
> index bc95f2c44a..6ee215a81c 100644
> --- a/package/python-serial-asyncio/python-serial-asyncio.mk
> +++ b/package/python-serial-asyncio/python-serial-asyncio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SERIAL_ASYNCIO_VERSION = 0.5
> +PYTHON_SERIAL_ASYNCIO_VERSION = 0.6
>   PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
> -PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e1/97/8dd1bf656796668ed4bd86058c815b130303a00a7b70cf79758e4918814a
> +PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/4a/9a/8477699dcbc1882ea51dcff4d3c25aa3f2063ed8f7d7a849fd8f610506b6
>   PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
>   PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
>   PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
