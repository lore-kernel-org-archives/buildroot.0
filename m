Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DD0C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97087404A9;
	Sun, 24 Mar 2024 15:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZKst9_q4oal; Sun, 24 Mar 2024 15:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56523405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56523405F0;
	Sun, 24 Mar 2024 15:09:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58D5F1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 343AE606EA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tW3VMaMvw73E for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1622F606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1622F606D4
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1622F606D4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:09:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-341c9926f98so408191f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292988; x=1711897788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jgHkCW1EEiYX2J7erF0nh/bYtSOciigVqyxc7lX1gVQ=;
 b=pHSCQB9Y79xjKn0zdzijrYqNQjHugPPHnzaXQrSpyNUDQ2AONVfZc1ziIUqXlIFv3C
 SBIAI+ZWd6hEL3RTNAJvTOdmgHuMlJSJkxsj89BkFcelbAiIijooq1WDTKpgi+hhg5Qk
 Q/P0jFKfclgVZPgLMBiTVlcUJxGRVaArKfMBvF/PqFJr+b4lVeAHlB5uc+T0rfSo+6yn
 h88ruYV5e5R6SWPhVNCeSDGXv0iUU4VBGqQqYOGNixPNOBsXPeow9Vcr3/bz4N3uWosd
 Sm+6+g5uIFydVDJPYFL46VA6Rt/0HAabBemkkm4Cd6b980X0ranHgOJlCD6z8CgWlgBg
 sZMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzRDpmhZlnRfln3bQNeT5VOw5cMVHcXv5HvB4HG60Kpq/Xobg07R4FYSaFeCNv9Jr08t04R45rLm70EonstCJeKE/LvLXJNQ==
X-Gm-Message-State: AOJu0YyMfcFL/nSzioOsugJEDHcTg1p3EzcVYS0vmYxFJEe7GAo7FfX6
 SqvJ1aaJPNopJDaoT2n23iqFTHLMPsfY9ap6q2fbYAqg3NcbowpGSEFAbHe0Q0vQJe+wBRrxDFe
 C
X-Google-Smtp-Source: AGHT+IFzelaZV7f9BOxfBWQpwngsm8I48/1Qo3RzH4X4g7rnaayc3AhpQto8VEVZJTS7lfcCV84cGQ==
X-Received: by 2002:a5d:5401:0:b0:33e:ca29:5a3 with SMTP id
 g1-20020a5d5401000000b0033eca2905a3mr2822901wrv.23.1711292987888; 
 Sun, 24 Mar 2024 08:09:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:09:47 -0700 (PDT)
Message-ID: <b5921b35-68d0-4b2d-bb73-74e2fc801b85@mind.be>
Date: Sun, 24 Mar 2024 16:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20240324032857.1286232-1-nemaakhilesh@gmail.com>
In-Reply-To: <20240324032857.1286232-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292988; x=1711897788; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jgHkCW1EEiYX2J7erF0nh/bYtSOciigVqyxc7lX1gVQ=;
 b=aG2HwGaln/O6q8YP8xZokyoQZT+383AJit2qIoQIpPkvSTiA0NI2honi73JRShMji7
 CjWdaYCbE63eI41UpmBnbop1070nl3jKdKtfL00Wu3VxMVeQSy1WcOkghTwX06axOLrs
 RqFSYB9TeBt4mjuqKiOQ2IwWQDIXQIG1B0HXbiaLb9J+swEWqr7DAB535Vt8QNh2XMw1
 hgf1QPyAE693pUCJ+UKJaly/ab6OyczKDYzYnK+mK+CjC11ueUCNtkHhyZI1GF+4D1qS
 talE6C3T/NBh5+Omf9ZJXhLPEkGcnYaB5dXHeDOCAh0VIXfhLKFfjY1QzC8Q9WmkMk2F
 HbHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aG2HwGal
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 04:28, Akhilesh Nema wrote:
> Changelog - https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?id=0aadd41eab7ea76501e557ccba705a08c07ce088
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> 
> ethtool.config
> BR2_PACKAGE_ETHTOOL=y
> BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
> 
> $ ./utils/test-pkg -k -c ethtool.config  -p ethtool
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: OK
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: OK
>                               arm-aarch64 [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> $ utils/docker-run make check-package
> 398423 lines processed
> 0 warnings generated
> 
> $ ethtool --version
> ethtool version 6.7
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>   package/ethtool/ethtool.hash | 2 +-
>   package/ethtool/ethtool.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
> index a37c800015..b9bc768e8f 100644
> --- a/package/ethtool/ethtool.hash
> +++ b/package/ethtool/ethtool.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
> -sha256  833a8493cb9cd5809ab59743092d9a38742c282290800e9626407511bbcebf9e  ethtool-6.6.tar.xz
> +sha256  c3ae526b01ce4d8df6c794ab170de4a4104d111ea8d8db3f1fd7c25fcb905619  ethtool-6.7.tar.xz
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index c9c2856612..77a7e16937 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ETHTOOL_VERSION = 6.6
> +ETHTOOL_VERSION = 6.7
>   ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
>   ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
>   ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
