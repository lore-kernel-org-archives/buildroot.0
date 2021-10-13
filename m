Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:55:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5E4611BD
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C5E4611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2B460B06;
	Wed, 13 Oct 2021 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nazGFPVCm7i4; Wed, 13 Oct 2021 19:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CCF60B03;
	Wed, 13 Oct 2021 19:55:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DBE11BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D53A60B03
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-CVZt_sms85 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87B3760605
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:55:06 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i20so14366241edj.10
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rr7m5e8AYTh2e+PUs0MGMQ8DYqc6XXOlFyRznlQu/XQ=;
 b=G9oBxt8vCZUFlGxyTWbh/wyoZ+Uc9EYaUDz7Go4krIv4meMd7UWUED0xkvMzq+ayyd
 QOU14RvYYYIfbjlFRA0P+RE9r9x3cc5dpXlymOVc6bwhxNNgVYzxIVZK4rv8oIWezM73
 o1mHyCdkhJjy2Otk9KpBaCDFLSGX1lbRLuPwrET0xQxpZj0SJhlL6bkuk+5KI+6UB3e0
 FGabCckyDILmFmEOZq8sll/jvNbP2qFXOvxJMDkFIAheOSJOCsUxzyAV4KXXQhhcqZae
 M43pnkM2c9bsMLMV0YmqC9ksJ+BVyuvf3apbyU0zGLjobnM3fef+TT4fQimSpxGaNpkL
 se3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rr7m5e8AYTh2e+PUs0MGMQ8DYqc6XXOlFyRznlQu/XQ=;
 b=MWJVhqwGlU5gImlVcnlWD7sIyDXSeHQzW1FKmsaCfXi2OzbqGPCuw1HBM/NjDbZtnn
 VVZAz7GBSFYT64YV9TcRi0nKCVLQMSUjTU2JBgSwWeRWUQ31OrZnIgQOPo29urkCqTdz
 2llzBmHAxu3k3Ai72j04CQHITXhssjSh7BQHUfKbvTpfox1MZxDkSBSqzbRFE9EiCmwm
 L72Lo4AAfgXKQecFCkK214izKd89wmYr5MJole3ne13xjP5JamVCAE/C+j+7PxwmtXDh
 jV5w2BvI4JHfWfR0/sSws+qEDv1i87NVIxHn30jBKdz256V/nUaC23kwd6xBh2gLW+NN
 xDIw==
X-Gm-Message-State: AOAM5321BdrKDMl/v1UDPtFLYmdz0x97+yJOykEG/fGdE+dEjI45V9JW
 uARnl4FtmHye3zCoB+UHcPPCpg==
X-Google-Smtp-Source: ABdhPJx9bbr+qMZ8TBHg2UGCQZFX3CSvkUeFI2eMIcrk0hiqEzc2pE6rnOarnistat3Eic+nYYlW4w==
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr1406870ejc.413.1634154904659; 
 Wed, 13 Oct 2021 12:55:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k15sm351920eje.37.2021.10.13.12.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:55:04 -0700 (PDT)
Message-ID: <b9bb797c-e535-ac81-2241-e2d202bb34c7@mind.be>
Date: Wed, 13 Oct 2021 21:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211006230854.3218640-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006230854.3218640-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to
 version 1.1.0
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



On 07/10/2021 01:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
>   package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
> index 2398b15424..bddc846a5b 100644
> --- a/package/python-aiorwlock/python-aiorwlock.hash
> +++ b/package/python-aiorwlock/python-aiorwlock.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
> -md5  8d89ed0d80820aad8d9320204779fd62  aiorwlock-1.0.0.tar.gz
> -sha256  4f773e31d78037e3ec27056a22200af482768b43da66e2cc33dd64aa5ea6518a  aiorwlock-1.0.0.tar.gz
> +md5  066260ea2c6798f6e18258d4430031bb  aiorwlock-1.1.0.tar.gz
> +sha256  2aaf1d1cc995abfd5b2f07ca0e9b5c23bd369517c75495a347eb5896bc307f29  aiorwlock-1.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
> diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
> index f6f3c97404..acc6f90158 100644
> --- a/package/python-aiorwlock/python-aiorwlock.mk
> +++ b/package/python-aiorwlock/python-aiorwlock.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIORWLOCK_VERSION = 1.0.0
> +PYTHON_AIORWLOCK_VERSION = 1.1.0
>   PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
> -PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/40/af/e55b3266352f3383c723e0a3304b0df46a59dfc6235b0b1a0a416afd60c1
> +PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/ca/e5/3221d49edb432024f6b1b7e9e36cad6363601973375667477f2130d5da7d
>   PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
>   PYTHON_AIORWLOCK_LICENSE = Apache-2.0
>   PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
