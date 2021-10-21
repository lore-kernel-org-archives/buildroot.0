Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06744C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:47:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660DA60FD9
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 660DA60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FCA580E76;
	Thu, 21 Oct 2021 20:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkHDc-xUVgAA; Thu, 21 Oct 2021 20:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DFFE81A2B;
	Thu, 21 Oct 2021 20:47:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64BB01BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F62940100
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yfdqnen98TB4 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:47:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D377400C9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:47:42 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e19so1706695edy.0
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F+7FyJGCSkfS3h279oagOccpCmvrYoJLUPFHbjwlKXc=;
 b=B0G1YwAXrKNTlRnJH/8y7ADEcNVUQTApk//8lmuWwIenKunsfs0D3OvO6IeKvSxC7w
 E/Aryc1J3v2aSn2zkpsQahZPDWZFhXktcWwsDCXkDi3cMz8XiRxdo1nHOsPsuMw1SiBa
 cyp37IxxZNaB9eDfWFMrebu9pt/Pza7l/HCg9cO8h2S10BwNLaCRAF2Rq0grh2TiRpHX
 xDI8VYtOn96I23DCST+GkufpN+q7sThVgyLN1b4NISMz2MZ+HbwRv7xnuPg1D3ejMDDT
 seE3+ocTMtpoVXtE2J3hvlyKLss5owdapcOU5az20hJt35FVy4dIOXYtNIJOLZWj5nY6
 bOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F+7FyJGCSkfS3h279oagOccpCmvrYoJLUPFHbjwlKXc=;
 b=7ZVnQxYt+IffLa9ouyZSQ84x3TvlMHrx1dTnyLdyJPFwS09emh70VhXNVgz+/cjjz4
 Rry/pQekmrhv9gOv7vwZEBWEd0aTBuRdxOhQPclsWCDHhea5AtpyYnlu5E8kdaOJdJ/u
 RGqFhdt1Udo26EKq28/SCPeR3TjYeJw/2W8dBbM3p1L/LzeFonsdTM0zX9mM52h02cP2
 QGI2qdTdTZKwFHL47ia5wf2dtbXdHIBhBsJwQMkK9O+4VOi0Vg7lWCpHWYypG4V/LTAt
 s57In/LCcQHqogK8bC+Q0fWOjahrYYlVhdAZ9kbRlCu5IFQ21KO0ugns+mPbvTxXtyHe
 0Fxg==
X-Gm-Message-State: AOAM531wnTVY0xYlvv9FQnAjzWGIKzZuaVMtig94ALanZw73I7n/Tvd8
 Q+s2fbYvp3YM4vttWLcIY2aQ0w==
X-Google-Smtp-Source: ABdhPJzuvit0sW3PeAir02mo/HL2cGVa1uB63vFAS3lai0pkgYQl02147NBq/QsAE9TTbJhT0exDJg==
X-Received: by 2002:a17:906:28cd:: with SMTP id
 p13mr850666ejd.568.1634849261385; 
 Thu, 21 Oct 2021 13:47:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n6sm3279021eds.10.2021.10.21.13.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:47:41 -0700 (PDT)
Message-ID: <d35dc9ed-ae26-6bc3-b0f9-ffb4ec12dcce@mind.be>
Date: Thu, 21 Oct 2021 22:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211012174838.1222576-1-aduskett@gmail.com>
 <20211012174838.1222576-2-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012174838.1222576-2-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/4] package/python-xmljson: new package
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
 Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 19:48, Adam Duskett wrote:
> This package is a dependency for pyndiff
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                          |  1 +
>   package/python-xmljson/Config.in           |  6 ++++++
>   package/python-xmljson/python-xmljson.hash |  5 +++++
>   package/python-xmljson/python-xmljson.mk   | 14 ++++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-xmljson/Config.in
>   create mode 100644 package/python-xmljson/python-xmljson.hash
>   create mode 100644 package/python-xmljson/python-xmljson.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index ba1ee4005c..09e9665f48 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1276,6 +1276,7 @@ menu "External python modules"
>   	source "package/python-xlsxwriter/Config.in"
>   	source "package/python-xlutils/Config.in"
>   	source "package/python-xlwt/Config.in"
> +	source "package/python-xmljson/Config.in"
>   	source "package/python-xmltodict/Config.in"
>   	source "package/python-xmodem/Config.in"
>   	source "package/python-yarl/Config.in"
> diff --git a/package/python-xmljson/Config.in b/package/python-xmljson/Config.in
> new file mode 100644
> index 0000000000..486f344361
> --- /dev/null
> +++ b/package/python-xmljson/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_XMLJSON
> +	bool "python-xmljson"
> +	help
> +	  Converts XML into JSON/Python dicts/arrays and vice-versa.
> +
> +	  https://github.com/sanand0/xmljson
> diff --git a/package/python-xmljson/python-xmljson.hash b/package/python-xmljson/python-xmljson.hash
> new file mode 100644
> index 0000000000..245a74a33e
> --- /dev/null
> +++ b/package/python-xmljson/python-xmljson.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/xmljson/json
> +md5  fc4df2390ad209928ee4311a3540cb17  xmljson-0.2.1.tar.gz
> +sha256  b4158e66aa1e62ee39f7f80eb2fe4f767670ba3c0d5de9804420dc53427fdec8  xmljson-0.2.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  5ce42ba7d76e81428bdacef83658eb6213dbd1ad4a3b6d380bb6e0e8c73f0fb7  LICENSE
> diff --git a/package/python-xmljson/python-xmljson.mk b/package/python-xmljson/python-xmljson.mk
> new file mode 100644
> index 0000000000..913dce2670
> --- /dev/null
> +++ b/package/python-xmljson/python-xmljson.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-xmljson
> +#
> +################################################################################
> +
> +PYTHON_XMLJSON_VERSION = 0.2.1
> +PYTHON_XMLJSON_SOURCE = xmljson-$(PYTHON_XMLJSON_VERSION).tar.gz
> +PYTHON_XMLJSON_SITE = https://files.pythonhosted.org/packages/e8/6f/d9f109ba19be510fd3098bcb72143c67ca6743cedb48ac75aef05ddfe960
> +PYTHON_XMLJSON_SETUP_TYPE = setuptools
> +PYTHON_XMLJSON_LICENSE = MIT
> +PYTHON_XMLJSON_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
