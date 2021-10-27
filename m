Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4E0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:29:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1CD60C40
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C1CD60C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E71C3605E9;
	Wed, 27 Oct 2021 20:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iaLyeMjP-R8; Wed, 27 Oct 2021 20:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A9D607AF;
	Wed, 27 Oct 2021 20:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D06B1BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D2140219
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBqwW2wyszzF for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 523BA40207
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:28:58 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g10so15195742edj.1
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t2ujk/gqT6VClILc38ZN5PG8QLZwP7KYdqh2U2+f1tk=;
 b=bGtnJrqFyxp+WKbXsfCFuWwLEWlVzJuuX4BjpsoigRHx6iHP2np3AVMeivwIDUn303
 j3g1WRchBHTLHC5bnr60Ha9l4cyKWnthRH8L3m0M8AQf29/XU0YJOxQ9N75Efg5+8aea
 4D6emtW1RGx68byiAyomvn6CyZkgfiw9Zkt079teV2F4DjqWrZG0rqvGV/OdFNcQnJ2p
 J0IJk4ZgL1mLbTvDJtuPVMOvwt+8Ag2EA4w4tFFsXE+IN9u10D5nQhLUuNFCbFNlDuSk
 bSH0SjODwTv4ea19zm7TaVg5aXtZJbBSBxY4vPsRkOUohw2Vq5T8m475jKZds5daqb3V
 FIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t2ujk/gqT6VClILc38ZN5PG8QLZwP7KYdqh2U2+f1tk=;
 b=ppw8S8k04zD06Sy0Wat1Z6mDbhQ4b2Fx/mEzMzr4wl6CBf0GfcMHU5YaRH0Zbs0ZXF
 QGLjphXLy2PEQ7Br1OML7tmEUpCj4a6kZZyqQHIIcfppJ+0jtIbn79/XSWD2lFffRWD7
 3CWtKGXbw+N4NlbnIk8flaaFaf0I0JxgCkb/R6JkoDkenU7UUbzsdDcbmybErYD83myH
 iKxbjR/Tz/+mR2f/MABNLNfoHiev+hikjTA88urFhkDZdalblKst4/tL5oFXYOk+eCIL
 am9t0Nm8MLUdCdQeVUJwrpcFnbdW4G4eU8z5yKWQsfY1D3PvSDdLo2MxVzKBlNW4U+/o
 zt6A==
X-Gm-Message-State: AOAM531yWzREPQ5MIXS/TR4ZogkAsqe3iozAPue11QvUIqnTpYOWqG6J
 OkmrQN5rd4EPXyvwLYtl4KUIqw==
X-Google-Smtp-Source: ABdhPJxiCZa/95WqqW96F2kviseZ23Cag+NLxGJZ7pHeTy4gYMUYmlIxjO72LAb1VsYE+8mKJk4jOw==
X-Received: by 2002:a17:907:c0e:: with SMTP id
 ga14mr31650097ejc.297.1635366536453; 
 Wed, 27 Oct 2021 13:28:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n1sm541349edf.45.2021.10.27.13.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:28:56 -0700 (PDT)
Message-ID: <e8298ff7-b2ef-0cfb-8039-3631fd3f612f@mind.be>
Date: Wed, 27 Oct 2021 22:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025024233.2153770-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025024233.2153770-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-charset-normalizer: new
 package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 04:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/Config.in                                  |  1 +
>   package/python-charset-normalizer/Config.in        |  8 ++++++++
>   .../python-charset-normalizer.hash                 |  5 +++++
>   .../python-charset-normalizer.mk                   | 14 ++++++++++++++
>   4 files changed, 28 insertions(+)
>   create mode 100644 package/python-charset-normalizer/Config.in
>   create mode 100644 package/python-charset-normalizer/python-charset-normalizer.hash
>   create mode 100644 package/python-charset-normalizer/python-charset-normalizer.mk

  I've taken the liberty of adding this to your set in DEVELOPERS as well, and 
applied both to master, thanks.

  Regards,
  Arnout

> 
> diff --git a/package/Config.in b/package/Config.in
> index d40eb9dabc..e23feb49aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -950,6 +950,7 @@ menu "External python modules"
>   	source "package/python-channels-redis/Config.in"
>   	source "package/python-characteristic/Config.in"
>   	source "package/python-chardet/Config.in"
> +	source "package/python-charset-normalizer/Config.in"
>   	source "package/python-cheetah/Config.in"
>   	source "package/python-cheroot/Config.in"
>   	source "package/python-cherrypy/Config.in"
> diff --git a/package/python-charset-normalizer/Config.in b/package/python-charset-normalizer/Config.in
> new file mode 100644
> index 0000000000..c4c40fc99b
> --- /dev/null
> +++ b/package/python-charset-normalizer/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER
> +	bool "python-charset-normalizer"
> +	depends on BR2_PACKAGE_PYTHON3
> +	help
> +	  The Real First Universal Charset Detector. Open, modern and
> +	  actively maintained alternative to Chardet.
> +
> +	  https://github.com/ousret/charset_normalizer
> diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
> new file mode 100644
> index 0000000000..f506fa85ed
> --- /dev/null
> +++ b/package/python-charset-normalizer/python-charset-normalizer.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
> +md5  b28e4463613ff3911d5a2dc62b96233f  charset-normalizer-2.0.7.tar.gz
> +sha256  e019de665e2bcf9c2b64e2e5aa025fa991da8720daa3c1138cadd2fd1856aed0  charset-normalizer-2.0.7.tar.gz
> +# Locally computed sha256 checksums
> +sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
> diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
> new file mode 100644
> index 0000000000..e1b805fbfb
> --- /dev/null
> +++ b/package/python-charset-normalizer/python-charset-normalizer.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-charset-normalizer
> +#
> +################################################################################
> +
> +PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.7
> +PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
> +PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/334c019f92c26e59637bb42bd14a190428874b2b2de75a355da394cf16c1
> +PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
> +PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
> +PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
