Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53440C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D9160E8F
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7D9160E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5D440555;
	Tue, 26 Oct 2021 19:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8gmQ35ceOm9; Tue, 26 Oct 2021 19:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289B740535;
	Tue, 26 Oct 2021 19:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 076C91BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA69340130
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjYcs-avLQO9 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:36:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C66CA4011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:36:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r4so911905edi.5
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QcIiy2N5Rwg0fA9s57ia6/ts7wzzkqE8IALjFNWZjaU=;
 b=OmuweF2G7oGIGIFps91ELCnfQR0HSvFj1zeQS9P+ptC5ezgnX4MX1kobac4ycuMohE
 D1h+yLa40/mGkHgLyTWtVVPTOlIXwCX6fK9HjjPZStelY/z5WTMbgATP7lG3r90YDGiD
 zU0mMuSx6ZApc+rjbwdFy4Tc4V+qiqoxQd/lnkG7vyZJsyfXs/h4Ksl5LKQEs+qwnrYE
 xFUiPwK9h/GqsyI0A6q5ISmKmTkBT0jloh6RUkP2TAtgfp+qFjlHuvOEq41zCzeHVcJ2
 krcFFLNvY13fldzM0+0Jm74L6fSXitMZrDSqSx+gONlxguyldqLHecQVa2gss4T7r9EN
 Sy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QcIiy2N5Rwg0fA9s57ia6/ts7wzzkqE8IALjFNWZjaU=;
 b=6F5U0z9Oa0EXtdo2yCmh/9J15gDaKaAcmFg2qwPkh5NeV/5ZU4FyJdFcSe8xowS80F
 PNVxkSTV1nHE2EKh+KZ40CrFzCqzqf9/VdS1DAynqlO/Fkf0zYQrI1dXYGHV5chfY2+0
 5SRldB2WDT0yoMyTbGJxosqMXRm4g1ZIMTWYZKLSDVCPm38y+RYu8InDkznUzXGhRQ2G
 g9c2ycoNYymYDt3G4Klm3OVwLJRkJHAoPOvZ+h6fwk3QMvbYrPJIrhWa04UvR1Q7j3FW
 qTrFAUs4gSz7s332Dd+4385Ex8f+GEtud8gZuihsh0LVIqgam8lLDdn1iAr+TpXoZJWG
 Yj4Q==
X-Gm-Message-State: AOAM531K1uvQsbWbT5cdiY8sOeTu01b18vkHYVGSqHthAhD/jUB/BkAf
 VixsGGX3jRGWaFo2Cx/RtfJ99g==
X-Google-Smtp-Source: ABdhPJwfSkin77W//HNwhIMRLxKHUBGMqH/KbX/gxwujpII0S1cStN3pIvcyJLbCi00ogDbfBoxilg==
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr2113373eds.219.1635276966081; 
 Tue, 26 Oct 2021 12:36:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t22sm143348edt.40.2021.10.26.12.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:36:05 -0700 (PDT)
Message-ID: <a3bc28a4-150d-d9f1-b5aa-dcfaaab2c26d@mind.be>
Date: Tue, 26 Oct 2021 21:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211024235207.2139485-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024235207.2139485-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiozipkin: bump to
 version 1.1.1
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



On 25/10/2021 01:52, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiozipkin/python-aiozipkin.hash | 4 ++--
>   package/python-aiozipkin/python-aiozipkin.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
> index 356d83786f..d1563b20bc 100644
> --- a/package/python-aiozipkin/python-aiozipkin.hash
> +++ b/package/python-aiozipkin/python-aiozipkin.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiozipkin/json
> -md5  0e98374ea561e4e4e589ffabc0ba6471  aiozipkin-1.1.0.tar.gz
> -sha256  bf46a065f87ba51eeb49fed756e285c7faa560f89e0c7ad4bc891d5ae4b5364d  aiozipkin-1.1.0.tar.gz
> +md5  0fea8a200ab2a94fe9a2340a8cbf8512  aiozipkin-1.1.1.tar.gz
> +sha256  9b82619d9ef309e72627a81ab3fda0c9b83e530844cf59f2e9a011e9a2a1293f  aiozipkin-1.1.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
> diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
> index 37812f2752..06ea9ef1a4 100644
> --- a/package/python-aiozipkin/python-aiozipkin.mk
> +++ b/package/python-aiozipkin/python-aiozipkin.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOZIPKIN_VERSION = 1.1.0
> +PYTHON_AIOZIPKIN_VERSION = 1.1.1
>   PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
> -PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/0a/46/5f328fb8163163f0d4401a1c07585cdf567e56305cb12ce54c9bb62e3f74
> +PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/f2/fe/26a60a7c9e91c968eac5dacab2948ed931a676880a6878695ff281c72b8f
>   PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
>   PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
>   PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
