Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F63C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46A8860C08;
	Mon, 10 Jan 2022 07:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npTalsbncXdt; Mon, 10 Jan 2022 07:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8793760C06;
	Mon, 10 Jan 2022 07:21:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF0B1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BA7D400BF
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6qy2pSMPR3h for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:21:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E284040004
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:21:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t28so18134276wrb.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+c1VsdOVkUAPJwqRfPAAbhzQFfYvvXRRSkojqaLPxCI=;
 b=c9U10ZrBS2uowwJAXxJM0kLnWKJ+k8gG1NobygxtPWtL6T3AMwBc3MaoK2tRSKRXIn
 cGNIJhN0LXMylY2Bgn3L7IcLgp4TfLpPb2u4NyurjCT9v3k8PHErOzbFkE4XBhyEv0g9
 N8KTyIyG+uiz/2Pre71KBiS6//1CjR6EiLl55Q4HLN9cs+YkdJJMtyEVV/xcHS4Oe97D
 Tfs7NTcSZ5iHeO7Ce0++Q2u5+GGHf74ZAryrILpf8AjUu4WxEUh0Os4H0OmmAwsQoBdc
 JYYo5idgbHmpEAx7bu8DI/mAT1eG0tKaiaAzHt8sY1kVEm/xzVIMJsjgS4LutXMLFs7P
 ZcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+c1VsdOVkUAPJwqRfPAAbhzQFfYvvXRRSkojqaLPxCI=;
 b=4Pvz3qJF2pv01FY+apFfCw3OfN7H5zv9dWsI8VDC/BVn/NEt9UyIUhCDkdpyFaGG8Y
 MevMOjK2mfmd78gSvjTwZxxIYFOgRmWwf+3uVGDfFnmcNu1ueNpD4AoflUoWPcydnsQg
 DQUPC2yQ3yMrOlp73BhXm0o68Z0U1aX5I2iamRdGbDSQN8/CQjTmPyhuRfVUpsCCz80j
 fuUZaiV8Nn6CDjTcPENYkBYAetcCthQ3cxq211+Y3beth+JHGrFGcdV9fBRXJW+B5LTs
 fJR2gV0TpuZK9nm11umsbVsVo8v21RNtq70b/PPHMgRms3ZJsstKxPjVp/CIqyrg3vay
 TMVQ==
X-Gm-Message-State: AOAM530Hr8AqmhXqP12/UXRYH20+QixS4aYMF9xC2QTEWEYQsqgsPox7
 0ci0Me/5qxN+uulQMhljra03vg==
X-Google-Smtp-Source: ABdhPJxhmckqWb7Np7DCRo/ipSmC28hIX9qrlxgJJaScm0hcYGCzD7Iwdyd1CtFbWfMQEbsIeOLNww==
X-Received: by 2002:a5d:644a:: with SMTP id d10mr7058298wrw.355.1641799277230; 
 Sun, 09 Jan 2022 23:21:17 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id x8sm2197134wru.102.2022.01.09.23.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:21:16 -0800 (PST)
Message-ID: <b7673799-3b5f-8e07-3625-985b7e1e7933@mind.be>
Date: Mon, 10 Jan 2022 08:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220110062015.1299719-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220110062015.1299719-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-packaging: bump to
 version 21.3
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2022 07:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-packaging/python-packaging.hash | 4 ++--
>   package/python-packaging/python-packaging.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
> index 0c23a5f71c..0f353a9e36 100644
> --- a/package/python-packaging/python-packaging.hash
> +++ b/package/python-packaging/python-packaging.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/packaging/json
> -md5  240ba5823ed31051a1254e74c9d18d55  packaging-21.0.tar.gz
> -sha256  7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7  packaging-21.0.tar.gz
> +md5  e713c1939f294fd729af4a7be40dd141  packaging-21.3.tar.gz
> +sha256  dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb  packaging-21.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
> diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
> index e2fb9b120b..569dc0bf58 100644
> --- a/package/python-packaging/python-packaging.mk
> +++ b/package/python-packaging/python-packaging.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PACKAGING_VERSION = 21.0
> +PYTHON_PACKAGING_VERSION = 21.3
>   PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
> -PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3afd461faecf9955a6501c4999933a48394e90f03cd512aad844
> +PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c
>   PYTHON_PACKAGING_SETUP_TYPE = setuptools
>   PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
>   PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
