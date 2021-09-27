Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D872C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D4B60F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15D4B60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB008176F;
	Mon, 27 Sep 2021 14:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_ojGRj1sm25; Mon, 27 Sep 2021 14:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F9E814B6;
	Mon, 27 Sep 2021 14:36:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDB421BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCC92403AA
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PmGu1YH4zoK for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:36:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A66AD401C3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:36:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id ba1so12212780edb.4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lBNk1lXWHJtxStyCz0vIWWDvHa7zRi1wFmPSAcfcmxA=;
 b=Sk4O9OupT+JfYSX92+couwDslUc3RK9706D+IeatpJOQvlGzxrSVTcgVWFzCIFujts
 OSPN5tAPtK99SnVKsI32tdjLwBMLrr44dbKMzq7HxwCtgznUk7DfoIze7/7Q57eDYjr8
 v5UjqdChlHjxrGObxAWw4dtGBQ8dMm7NVse7Tf3qRMDkkF7DJDhNuYmlZesEvkTW4kpD
 V7GxVCWbh/ss5DOgbNOHWrM8Fr2vkc3i4IXhzDRY3sKREqVF2MTWRBu5+P5HkZ7eRecs
 KrP/H4+I4dyv8XOx3s1F8UV37ufrnoTLkiML0OrteCcRLEOMZZfdIKVQmGGwCeFoqot9
 Cy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lBNk1lXWHJtxStyCz0vIWWDvHa7zRi1wFmPSAcfcmxA=;
 b=PcSzicnMnXiLWb9J6EjG/eyHmtnMRFX61Lmqgp3ArvvKo52QYSsj5jybfS0duHVV+v
 6dq3Zr5hxSs16nicKw4oZ3BOvw6dz+2eJv8L7+50JpGp2Iio2wCr9ze4TG7cRfS19J56
 5x8OTxvuatKpXo0UaLzrtlXM7fRePA8rCaMwfi5WRFtJcdP5ALOzw2piZ86dR4DcrE56
 qWlmRN9667A44KJlCtE0z3kJkWJf0e8rVqVmRGWvk4rtLX66ar5R4naGIj3CtOveGsxb
 /EOIVp74knherNr1uXfFwp2nkBgBt3JKtQaW7Ptx4bLY64qix0y1B1dvNrwzfmLHWv8U
 KN9g==
X-Gm-Message-State: AOAM532u3zO1vhH0GSL3auBgxD+9CIgrSewx19Vxp9hTUyndvtc32ZbV
 GT/JSmz0DzCmN/KEltr69HwCgw==
X-Google-Smtp-Source: ABdhPJx9QodF4TEeIDGX1/+J5uE9MG3BmZJjTXkrd9xK0j8BcH3oURiXWE0+U8HVTcDOybX6MXs+Rg==
X-Received: by 2002:aa7:c50e:: with SMTP id o14mr145440edq.96.1632753382914;
 Mon, 27 Sep 2021 07:36:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e28sm2124652ejy.119.2021.09.27.07.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:36:22 -0700 (PDT)
Message-ID: <6698fb18-4131-b07d-b684-b17c2df24247@mind.be>
Date: Mon, 27 Sep 2021 16:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927053848.1061202-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927053848.1061202-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: needs
 python3
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 07:38, Fabrice Fontaine wrote:
> python2 support has been removed since version 4.9.3 resulting in the
> following build failure since bump to version 4.10.0 in commit
> 109ea1a4a2f9154c5d9502ba814a09e1e1bbd9f5:
> 
>    File "/tmp/instance-1/output-1/build/python-beautifulsoup4-4.10.0/bs4/__init__.py", line 36, in <module>
>      raise ImportError('You are trying to use a Python 3-specific version of Beautiful Soup under Python 2. This will not work. The final version of Beautiful Soup to support Python 2 was 4.9.3.')
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/57e6677932f587c279cc0ed671895740d0cf2304
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  I've also updated the comment in the reverse dependency.

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-beautifulsoup4/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-beautifulsoup4/Config.in b/package/python-beautifulsoup4/Config.in
> index eb7d2ba673..93fa540a73 100644
> --- a/package/python-beautifulsoup4/Config.in
> +++ b/package/python-beautifulsoup4/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4
>   	bool "python-beautifulsoup4"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_SOUPSIEVE # runtime
>   	help
>   	  Beautiful Soup is a Python library for pulling data out of
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
