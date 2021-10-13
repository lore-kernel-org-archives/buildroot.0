Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FA9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C2361168
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2C2361168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6362D40804;
	Wed, 13 Oct 2021 19:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmJxSMUMBtAx; Wed, 13 Oct 2021 19:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0B140801;
	Wed, 13 Oct 2021 19:57:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8C81BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE26A81A47
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djZfVgcDZCDp for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E36FE81991
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:57:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p13so15209930edw.0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=30MTyxDAXblyLT6YpfH75XAUpF8Twtw1g/5R95A9vdE=;
 b=dWALKsaJNMbh8CzCPjjj7fh28Q5ih1EDc7zvGSgJHBLkRsntSxO+KWof6NZfKUkqVv
 hUB81tzWKWnwpQCt3QWWanrVgRuOL//oKNViqO27I60HMjOl1v433Nc2011QO9uQD5U1
 tngCJBhxnjcyyS6MgAQyfJblJ2ekbXHVPcU7ktHH8mtJqieIdV9D/jcsuLkKQNKevvWL
 yjd6EN8BABmoYDTBRtnzf1OAenMXcPG1OxPTVnojS1jQkjK5gGYcfrcOo5ScPfLeHDGB
 4Kam0Hxi9Zyv+uVtmoJm2YWqxauDSGFc6dJ6KT6IEbtlQYzyeU6+9aRp35qX3WxqJq+p
 Ev/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=30MTyxDAXblyLT6YpfH75XAUpF8Twtw1g/5R95A9vdE=;
 b=mIEfDVqM4J4nfcKWS0gkA0ed6QNok0jn/hf0FJo5jZ1dBU4/zdrP5IMrXmqPeHAlIV
 aHz0HsVJRUUQih/Tg3eRtv6zrgSYc+xXAXvfhlOm4ibx2IZzNsA/Ieu6SRBOsD0e4nGf
 tcmvB5L58hSrJg0PI48+uBed/zJL5kZXg1HNh7kvbUR20NdNGTFOKZcIA53Z2quC9ZeQ
 yuaP51ZOwg4ybC4+7k9qM4rrK5RTAOJL5ox1dqXdfiqzAMnjV0lAH384xNcmcy1GlPDo
 bIC1/QzzwYswOJZFUGpWl8pd72A9+wpoVUaScecksCOeSQfmZ5ehom1XX2ym23YMoTMI
 XMqA==
X-Gm-Message-State: AOAM533U/873gJrGOL5JNPvuIZuEkGBPt/2ihyp39AQfhom+aKOamE3M
 dPAe/yKHZKCdCH66XleerBobUw==
X-Google-Smtp-Source: ABdhPJzaErPZaDMQhKrGBax+H7RYtxbK6hdgsz7osVn1vTbmQY8u7moiCeIBDVPnhP7HxwbMnEq/4Q==
X-Received: by 2002:aa7:c941:: with SMTP id h1mr2137714edt.128.1634155058146; 
 Wed, 13 Oct 2021 12:57:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w15sm367892ejb.4.2021.10.13.12.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:57:37 -0700 (PDT)
Message-ID: <f7b85724-0592-5bd4-35fe-4587af9cded1@mind.be>
Date: Wed, 13 Oct 2021 21:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211006234450.3228049-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006234450.3228049-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to
 version 1.1.2
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



On 07/10/2021 01:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-greenlet/python-greenlet.hash | 4 ++--
>   package/python-greenlet/python-greenlet.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
> index ad216b0368..c1870c886d 100644
> --- a/package/python-greenlet/python-greenlet.hash
> +++ b/package/python-greenlet/python-greenlet.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/greenlet/json
> -md5  a3fbf41851a6b5e1e823e8c18905877c  greenlet-1.1.1.tar.gz
> -sha256  c0f22774cd8294078bdf7392ac73cf00bfa1e5e0ed644bd064fdabc5f2a2f481  greenlet-1.1.1.tar.gz
> +md5  f424fbd9afeed575dd2ba5f0ac66e30b  greenlet-1.1.2.tar.gz
> +sha256  e30f5ea4ae2346e62cedde8794a56858a67b878dd79f7df76a0767e356b1744a  greenlet-1.1.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
>   sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
> diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
> index e9feec5321..7b983ff0ef 100644
> --- a/package/python-greenlet/python-greenlet.mk
> +++ b/package/python-greenlet/python-greenlet.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_GREENLET_VERSION = 1.1.1
> +PYTHON_GREENLET_VERSION = 1.1.2
>   PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
> -PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/72/7e/d8586068d47adba73afc085249712bd266cd7ffbf27d8bc260c33e9d6133
> +PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea89d0e73f99d60c83754df7cc64db74f47d98ab187669ce341
>   PYTHON_GREENLET_SETUP_TYPE = setuptools
>   PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
>   PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
