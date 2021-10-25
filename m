Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4889CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0F360230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC0F360230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B181D80D55;
	Mon, 25 Oct 2021 20:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 448jw3sQKvqP; Mon, 25 Oct 2021 20:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B5D80D35;
	Mon, 25 Oct 2021 20:16:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EB641BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07550403E5
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEeFi1Xh1euR for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:15:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C235F403D5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:15:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y12so4711878eda.4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yFk6+f/NekFJu05J7AAhjk/sJJ/DGj/a7wPiY2U73aM=;
 b=amQIH8XMZ7L+ZbHLPM/SUP3OUa7LD4LpHIBFYubFQApL3nUrAxFuvwVrEfo3FVWCNC
 +6wEbJRluYQFTP7UqhyXLJ9JcYZU54zP0vx0CR6UHYxezEx/o4MVZ6blCyhL3mwpBldt
 KS2sPopDS4qLzRgd9AU7rnkpi7tqoTuuNkxUF1E/LNkTH3chb0wxJgdNj6WQl2VTC/M7
 dfnP0tOWV4OfJJ/r21SCKV/9MV7Z3Ejhg+zO/JwoQqLhDLU8n18yQWchT8sfR7/ru1M6
 FQFIC2XCmKJpP/K9oJ+NtGUVXegoYuUkLXhcQ22nM76jWHA0OfGD0rHaLzKBnhbdnEpL
 L0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yFk6+f/NekFJu05J7AAhjk/sJJ/DGj/a7wPiY2U73aM=;
 b=M4h1QlJD7hRRPUtVAznf80UY4Ub2jk4ZNIQndQJzBBUg1c3/SDjnHaU48VA/wOBKgd
 CLkd4LW2rvOgisHdKiPYja2yEgRGzwwJp5DUyF1HpW81iNOVvO1ul6DqYUcG8HRNCv7L
 ngcsrpknfZNnI1fAk8n34q/ysmhtrydmpDnsrQaq9Zr76EqggX3ZGseneFi3JNjehBSh
 ve/chieHPW3mckgtsjvTvnqVE7eVh1m3j34clSPMifctXqjzMDU3QTa7pvABHLjTUPwI
 Bbr2IGprdpeooQNDkaeWuFLzLv8qQjlomVRu0dkDPztM4zdMB2PDIWrzxK0U3kKJ6RoC
 ttVg==
X-Gm-Message-State: AOAM530SMiAiukdbgF/HISkVz+/Be4T/nT3HojOeuV5DgyloGx4O5Z2M
 nU/x+/EY008VXlhaoxmoyudlXQ==
X-Google-Smtp-Source: ABdhPJymBDT21gVHmjl/TIkiLntyktni1lVR1WVDPkWMrV+YhkY1sNe9pHUpK0ssyw6kzo0+7Kl9CA==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr29802277edv.384.1635192956072; 
 Mon, 25 Oct 2021 13:15:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s3sm8069956ejm.49.2021.10.25.13.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:15:55 -0700 (PDT)
Message-ID: <5a36ae23-c95f-7653-1b4b-5ac0d5919e8f@mind.be>
Date: Mon, 25 Oct 2021 22:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211016134011.3092826-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211016134011.3092826-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-libusb1: needs python3
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



On 16/10/2021 15:40, Fabrice Fontaine wrote:
> python2 support has been dropped since version 1.10.0 and
> https://github.com/vpelletier/python-libusb1/commit/69fd5a3ed2f674d412131dfaf24bbc2534f3cf13
> resulting in the following build failure since bump to version 2.0.1 in
> commit 6703b94f24320316ddfc2a3ec3e40fe3876dc8c8:
> 
> Traceback (most recent call last):
>    File "setup.py", line 22, in <module>
>      from html.parser import HTMLParser
> ImportError: No module named html.parser
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/fe011ccb7eac1be9762919f9feda35114e752d8a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-libusb1/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-libusb1/Config.in b/package/python-libusb1/Config.in
> index e464a0394d..fbad70c375 100644
> --- a/package/python-libusb1/Config.in
> +++ b/package/python-libusb1/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_LIBUSB1
>   	bool "python-libusb1"
> +	depends on BR2_PACKAGE_PYTHON3
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>   	select BR2_PACKAGE_LIBUSB
> @@ -9,5 +10,6 @@ config BR2_PACKAGE_PYTHON_LIBUSB1
>   	  http://github.com/vpelletier/python-libusb1
>   
>   comment "python-libusb1 needs a toolchain w/ threads, gcc >= 4.9"
> +	depends on BR2_PACKAGE_PYTHON3
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
