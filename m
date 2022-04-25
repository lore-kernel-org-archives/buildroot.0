Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE22DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775D660EC0;
	Mon, 25 Apr 2022 21:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiC0IOVBmKlg; Mon, 25 Apr 2022 21:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC8A60E85;
	Mon, 25 Apr 2022 21:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F06351BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCEA14047D
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BL_wCD_AQMVc for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:34:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17DFD40119
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:34:43 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g23so13025747edy.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hlda0A0othybfbyuoSPBQh/HIzu1zTV0veE0HQupKWA=;
 b=OVx7vnPIGi8XRIDDhIthCZjgUygnaacec9eG8ZvV/li5AnKZDN6VFxwfKJVO0RjYb8
 oTPfDkKdsjCNrxtV3hq8HeeFldD5qpE0gVSWkgKSWbGN1OWgmafPaxXZ9YsKXI+hdezz
 +ah7wgosyLTIhVFfDHa5RTd/V5puSaLzU9YevfWl++LhNKneK3phZUZvQhFaEOSMuyAN
 XNoQ0cnVDK6NQpA7xEBcmUccyABwTTcx6EtyBo6ghnW+8TUizPVwGBH9MdhhPTqIQOmt
 9nKSfh9ZRGUw7PzJJPqHnEn6ApmWm/SbdO/65H7rFMzr+lElx5NKuiWoXTH9opPpINT6
 q5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hlda0A0othybfbyuoSPBQh/HIzu1zTV0veE0HQupKWA=;
 b=2GWwlx35wB5TDFWtCEdiAUx42k+zhrzPr5NSEWfGyN+ce/ia8Dq8OA7roHcpt1c5n3
 piwsTsRwh9+TIrpvCUqKmAku0Gte+n9t9M3wx0tr66eu4ZmS8kn9tUsISM7LX4Ykrdh5
 MPZrROcfdM/Wuw3Agkg+pTiAHd2pQLmY9dsrRgjslne6LGjG7Xi0TUELUY1zEZ67Z8qe
 KMEzEQP8FUZd3El8PyBRJ8LPX/PhSC2SXaErRl6IRuXnDw/xIJBZksfMGNdqYgAgvk+t
 4OWDr06bLj56RoUZUHY7ZPofILn5CM4qzx8qv5zpKtBUEUD4CwHttKQK4X4BCvNt7nRU
 1dPw==
X-Gm-Message-State: AOAM533J1aQgwu6KhGulHkx1jinLwdUJVS7kCiVLDScLSWCon35vjUwZ
 NenKOcdjqHRE7KyW6v9s8gOY0g==
X-Google-Smtp-Source: ABdhPJzi4fUtOw49hNOMarzSnL5+8LVo5djiluocCKkrqG0UZPH82XeqLUcYoRyzhI2FBcMdMLTlfQ==
X-Received: by 2002:a50:d78e:0:b0:416:2cd7:7ac5 with SMTP id
 w14-20020a50d78e000000b004162cd77ac5mr21235944edi.320.1650922481363; 
 Mon, 25 Apr 2022 14:34:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ci21-20020a170906c35500b006f394323ccesm1580631ejb.34.2022.04.25.14.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:34:40 -0700 (PDT)
Message-ID: <3641180a-8321-a68d-8931-c1de5f90b4bb@mind.be>
Date: Mon, 25 Apr 2022 23:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-3-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424213958.1747120-3-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v7 3/5] package/python-flit-core: migrate
 setup type to flit bootstrap
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 23:39, James Hilliard wrote:
> This package needs to use flit-bootstrap since it is a dependency
> of host-python-pypa-build.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-flit-core/python-flit-core.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> index 0e058a1f17..aaf4c77c6a 100644
> --- a/package/python-flit-core/python-flit-core.mk
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
>   PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
>   PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
>   PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
> -PYTHON_FLIT_CORE_SETUP_TYPE = pep517
> +PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap

  So here I added

HOST_PYTHON_FLIT_CORE_BASE_INSTALL_CMD = -m bootstrap_install dist/* 
$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS)

  Applied to master, thanks.

  Regards,
  Arnout


>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
