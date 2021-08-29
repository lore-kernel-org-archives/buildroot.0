Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C971C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B9460F38
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4B9460F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9062B40104;
	Sun, 29 Aug 2021 17:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9eA3PmgCSCs; Sun, 29 Aug 2021 17:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06A394020D;
	Sun, 29 Aug 2021 17:08:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31E061BF599
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21375606F1
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ylGeHIRjmgg for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:07:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D36F0606E0
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:07:57 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id dm15so17945366edb.10
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 10:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H6CPuZUGFtj5uBcr8WjVMzybNDVX+f4ra0aDMSRhzuE=;
 b=EWUmqZ13fKhx1dAB6I++2Cnx3k3Wmsj66MiNsA1gWo9x1wePFVhqz34JUqoOPhaE+0
 RXUmGzhoxe1mFjBYSz8hqUkSwuhZ5Z4G0lLKS1DYupG0WmVllbO2uRyCroLeD9ZWgqZT
 YLDuKPmo/Xtf3EH0/RwuuUYsb2qZdgGgiBaYCHy1OqyXHdAZEr2btfhww9nn1iw/MWAS
 tBFQUm8epyDnwOyjlfd4ol8NjqNuReSwuAqV/sh89BrTsBbhYUgWJvUSR5bqZRZUzTDq
 uzWFEsJav+yz+IYuuVcJPDas+QZyL+KV6k9oUS6l6dTvJzd0Sn29wbPoK2tKZQrRJVEn
 GAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H6CPuZUGFtj5uBcr8WjVMzybNDVX+f4ra0aDMSRhzuE=;
 b=aFRfUn6H1N6JMeExZNf2/RHHEkakJGfBOp4Mnz1ONDzJ1IcyruJvk5WtsmuguUljYG
 FnsZZL9NuQXlBT/cU3S35R8/gk84y6X/J1K1R+V62xprOThBAEALfh6GbGSVb8nx0Inq
 qhGVmeUWJCMovLuG6CR/G55sRS6vu1dVKA85L/Vu9tAqdcn+SPZ66Y8NGWe/CbfZ8ojg
 v57SRVyThn8BGLLagOZyGnCmuBWjt6SPBF3rZ/ahyFbaZ/Hq9ZcPSm100Vl/wB25Hd9t
 Rtpu0k63VR0+MedZpVzdfxuMadhAXxX3m3tmjQua/wfqy5cpYUrKQY/35zt8y2gIULM9
 cztA==
X-Gm-Message-State: AOAM533Xv73hLBdZ6ufKCJ+j4/joIn1/tgAHaUCNvDWQZUeh5Jwi3hZZ
 mkkCTmS9/yQnFouqmddAb9PN6A==
X-Google-Smtp-Source: ABdhPJwq74KkF8p7IUdFkIfu46ag6X3PGr9+DR2jpQnBZsANOLNOZmkoAhqUUuok8f2w81CK8Ow4DQ==
X-Received: by 2002:a50:cd93:: with SMTP id p19mr20349528edi.24.1630256874869; 
 Sun, 29 Aug 2021 10:07:54 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p5sm5563965eju.30.2021.08.29.10.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 10:07:54 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210814021223.3883699-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d202d02a-2366-e4fb-6ce0-cfa14f1cda6c@mind.be>
Date: Sun, 29 Aug 2021 19:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814021223.3883699-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioprocessing: new
 package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 14/08/2021 04:12, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 Applied to next, thanks.

 I've taken the liberty of also adding you to DEVELOPERS.

 Regards,
 Arnout

> ---
>  package/Config.in                                  |  1 +
>  package/python-aioprocessing/Config.in             |  8 ++++++++
>  .../python-aioprocessing/python-aioprocessing.hash |  5 +++++
>  .../python-aioprocessing/python-aioprocessing.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-aioprocessing/Config.in
>  create mode 100644 package/python-aioprocessing/python-aioprocessing.hash
>  create mode 100644 package/python-aioprocessing/python-aioprocessing.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 046c04e994..1c656b609b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -897,6 +897,7 @@ menu "External python modules"
>  	source "package/python-aiojobs/Config.in"
>  	source "package/python-aiologstash/Config.in"
>  	source "package/python-aiomonitor/Config.in"
> +	source "package/python-aioprocessing/Config.in"
>  	source "package/python-aioredis/Config.in"
>  	source "package/python-aiorwlock/Config.in"
>  	source "package/python-aiosignal/Config.in"
> diff --git a/package/python-aioprocessing/Config.in b/package/python-aioprocessing/Config.in
> new file mode 100644
> index 0000000000..2e76bc562b
> --- /dev/null
> +++ b/package/python-aioprocessing/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AIOPROCESSING
> +	bool "python-aioprocessing"
> +	depends on BR2_PACKAGE_PYTHON3
> +	help
> +	  A Python 3.5+ library that integrates the multiprocessing
> +	  module with asyncio.
> +
> +	  https://github.com/dano/aioprocessing
> diff --git a/package/python-aioprocessing/python-aioprocessing.hash b/package/python-aioprocessing/python-aioprocessing.hash
> new file mode 100644
> index 0000000000..cf92a72d4a
> --- /dev/null
> +++ b/package/python-aioprocessing/python-aioprocessing.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aioprocessing/json
> +md5  838b6aa073f1373bd42204f86b0e3196  aioprocessing-2.0.0.tar.gz
> +sha256  469dfb746e8c4e0c727ba135cfabf9e034c554f6a73c27f908bfe3625dd74b9e  aioprocessing-2.0.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  53c809e8f0b91a68a39477e5fbdf77fe2b74dd6a1647c2dd9b7b22fed135239e  LICENSE.txt
> diff --git a/package/python-aioprocessing/python-aioprocessing.mk b/package/python-aioprocessing/python-aioprocessing.mk
> new file mode 100644
> index 0000000000..e1e919de2d
> --- /dev/null
> +++ b/package/python-aioprocessing/python-aioprocessing.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aioprocessing
> +#
> +################################################################################
> +
> +PYTHON_AIOPROCESSING_VERSION = 2.0.0
> +PYTHON_AIOPROCESSING_SOURCE = aioprocessing-$(PYTHON_AIOPROCESSING_VERSION).tar.gz
> +PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/8e/3e/54266241660fb026bfd27f660d44cd81a4b7f8a145d8e2db010de12622a0
> +PYTHON_AIOPROCESSING_SETUP_TYPE = setuptools
> +PYTHON_AIOPROCESSING_LICENSE = BSD-2-Clause
> +PYTHON_AIOPROCESSING_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
