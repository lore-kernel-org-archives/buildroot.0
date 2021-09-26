Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58C0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8152360F94
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8152360F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C87D81A58;
	Sun, 26 Sep 2021 19:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOMWBerF07A7; Sun, 26 Sep 2021 19:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976AF81ABB;
	Sun, 26 Sep 2021 19:48:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 673061BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6386360712
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sdG3MTbwc8Y for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:48:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F42C605A2
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:48:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v10so55458805edj.10
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sg88eHktVydKstfUGAbbORRZskOYEboMyRy1oQgKPZ8=;
 b=KyOY46qUGnIBtHgONjUZjCDOzo2/LNift0PtUQOAdX9Y9vCOp+DxbLMtzqeMxjdtUQ
 qGlNl96ZmEHGez+5POtJHtg/cHRUZ6SjapTXnN/CY4TE0R0Ja5Ko7MMOufT60ptF3JlZ
 MZBr1fogtILKmnRFiR4FEB632OeFNYJVoZLHznVch/1elaPhh76PvmSGovA8kRx7NqUG
 mpzc44TqQ0x4eH/oaM8N8o0wr0LJ+CiT8UNkoEz6D6g3yuQVEK9lhEvcmZWuA00bn5Q3
 LdBDhmaF6czXsA1CGCsqGAAH9r6Ulhlc1wuW2z0IkiqZSxep3/OeU9krwh3hsP0L/s1L
 sF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sg88eHktVydKstfUGAbbORRZskOYEboMyRy1oQgKPZ8=;
 b=qyhbc1AG7RS+OAD2ASzuROEn1rFij1Qx/wplZ2HP4Pakvx+ZvQtzbh4tUT0V4+Ng9Y
 /bbevwRdzsJZXB32ioJhiPMi0hj6SdNpzRbwL+KGHwVguuKryYuuiAipzdlRi0QjmZLq
 i6xUKlWTZ/VVDuyqX57zhDNTQ4R1R5JUKevjDzmFaHAcXU81Rt6n+t4di476pMIb7DF4
 VTfdjxsPU0BIrEMC4okEb4aptebgjMXCn2CveM6QTHC8ZzlLvIgRvKOv52z7MEP/YnAx
 a6t+uXRmJH1adAyKU0NBXz93kAjv40wb5BCCz8VSIq+PviKENxKavfSK3Q/psRw6uqm7
 dDRQ==
X-Gm-Message-State: AOAM532zzIQbByLXiX9PVs19YmD///wEiCnLBeBcOScet/x4B0Vf1nVR
 Pe0AiOkzj5/Ok91SoZJT9uBAfw==
X-Google-Smtp-Source: ABdhPJzhSCWnejHNuNap1h6GsB170xw1hhFfPze8IkksK+Oe3h+beYMVOQRLrlQWxU8P/25IZTwOfA==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id
 cy15mr9034908edb.41.1632685706627; 
 Sun, 26 Sep 2021 12:48:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l18sm9395479edw.78.2021.09.26.12.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:48:26 -0700 (PDT)
Message-ID: <de27ff9f-26de-7940-aaac-f58f606ccd32@mind.be>
Date: Sun, 26 Sep 2021 21:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210925094626.365400-1-asafka7@gmail.com>
 <20210925094626.365400-5-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925094626.365400-5-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to
 version 2.9.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2021 11:46, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-psycopg2/python-psycopg2.hash | 4 ++--
>   package/python-psycopg2/python-psycopg2.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
> index bf73f8ad25..d02ffc2ec8 100644
> --- a/package/python-psycopg2/python-psycopg2.hash
> +++ b/package/python-psycopg2/python-psycopg2.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/psycopg2/json
> -md5  c232ff3e3bfee35e1a0e15bc089cb294  psycopg2-2.8.5.tar.gz
> -sha256  f7d46240f7a1ae1dd95aab38bd74f7428d46531f69219954266d669da60c0818  psycopg2-2.8.5.tar.gz
> +md5  182e3e8cf3381c254f65f70cad4976e5  psycopg2-2.9.1.tar.gz
> +sha256  de5303a6f1d0a7a34b9d40e4d3bef684ccc44a49bbe3eb85e3c0bffb4a131b7c  psycopg2-2.9.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
> diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
> index b6f1f6ab70..de466e2c59 100644
> --- a/package/python-psycopg2/python-psycopg2.mk
> +++ b/package/python-psycopg2/python-psycopg2.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PSYCOPG2_VERSION = 2.8.5
> +PYTHON_PSYCOPG2_VERSION = 2.9.1
>   PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
> -PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/a8/8f/1c5690eebf148d1d1554fc00ccf9101e134636553dbb75bdfef4f85d7647
> +PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/aa/8a/7c80e7e44fb1b4277e89bd9ca509aefdd4dd1b2c547c6f293afe9f7ffd04
>   PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
>   PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
>   PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
