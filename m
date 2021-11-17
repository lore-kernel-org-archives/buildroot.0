Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8082C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:36:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6528161452
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6528161452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339AC40910;
	Wed, 17 Nov 2021 20:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QcyzNDEuEng; Wed, 17 Nov 2021 20:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A29B40919;
	Wed, 17 Nov 2021 20:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDA981BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF5B81D5F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEr6wAYU7fQ0 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:35:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85FCF81BC5
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:35:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w1so16674583edc.6
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+pLKOwNTEBRHOuIe0/diy4EkLfZxFoErPCjPEF1liX4=;
 b=d/P34Avy1JjmzlOaQOpc9zdtmla+xX2ge7AIJWZTyNFzIc22FvjxbOTKmIUMJzTvQw
 mWXIPh09eFYLGI/3HpkKePo8JI1hAKsu6h2eKGEuB0AhRkTYwQl2HRA5dT0j2VjaNCpX
 yTqsrAMpZplTuJ/0kWRihbg4kRLu8YUIFYv08n3gmU9u11qDD21Utj7sVEYGWrFjfGPp
 OZ45zg78k60BXkV63LWUEjkWh78JM9x4iZJHmLVThxuKmQAhndFA9+7eTz9bM8BXx3Pw
 zRtBZA5ejravkg2f6LT4QS6JWws6NDJmRubklw5G/RXIn95zLPbmthPX1bIigY9j7yXx
 GDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+pLKOwNTEBRHOuIe0/diy4EkLfZxFoErPCjPEF1liX4=;
 b=nhD+anSPq6jr2OGBdvBR7IChU8sYhy08V3Gxj4leQSTvWlsmb5Z4TM9q0T58bBZOpA
 qEVMjZa7ohZjZgFD2UuKL6XVYF5EwScMU3kyin+3uGahjd0NhMqFuApwrgJSbvZvpw8x
 3YrxQ3n2Gv6rYViNWcwzuI1Kg21I1vQCzqn11nHqrtBMN6kT8DRFg4vSASENbKd412YQ
 gVxY+X73Sx0MvYpWC9nJf5TL9T8gdRGkkO7vsGDKj8UBPoHcoSsbfSs4vA8IWptPZlyh
 74XEHsP4VOlFgteNxSOImagQUT8udfB3R4QXs/woPdzYqQFbDyJYZEjsnw4LRsI6OOiZ
 znlQ==
X-Gm-Message-State: AOAM533smuooNoQLQYQ5NbPkXVJkZRRXw/puMzprnyKS+UTUiBfu//vO
 WHQmGw7nAcdU6UGnlbl4NFn9qw==
X-Google-Smtp-Source: ABdhPJxFHH90BdWGqXHDB9nV/0ufwptlrm7jg5abs5gjaR7WzsQNppDgaEZf/yLDzUfxjLJ4Bhagxg==
X-Received: by 2002:a17:907:7250:: with SMTP id
 ds16mr25455997ejc.54.1637181351438; 
 Wed, 17 Nov 2021 12:35:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q7sm473660edr.9.2021.11.17.12.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:35:50 -0800 (PST)
Message-ID: <2cdf8dc7-dd9a-2044-a116-cb0198184c6a@mind.be>
Date: Wed, 17 Nov 2021 21:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211116171313.4146113-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211116171313.4146113-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sg3_utils: fix uclibc-ng build
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/11/2021 18:13, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.47 in
> commit 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
> sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...002-configure.ac-fix-uclibc-ng-build.patch | 36 +++++++++++++++++++
>   package/sg3_utils/sg3_utils.mk                |  2 ++
>   2 files changed, 38 insertions(+)
>   create mode 100644 package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
> 
> diff --git a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
> new file mode 100644
> index 0000000000..4c475ee1ff
> --- /dev/null
> +++ b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
> @@ -0,0 +1,36 @@
> +From 1e95d5b8c507a49f6d15d2795dc46d82b4d1ded0 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 16 Nov 2021 08:41:48 +0100
> +Subject: [PATCH] configure.ac: fix uclibc-ng build
> +
> +Fix the following build failure with uclibc-ng raised because SG_IO is
> +not defined:
> +
> +/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
> +sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/8]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0a65d94..23378ad 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -107,7 +107,7 @@ case "${host}" in
> + 		AC_DEFINE_UNQUOTED(HAVE_NVME, 1, [Found NVMe])
> + 		check_for_getrandom
> +                 CFLAGS="$CFLAGS -D__USE_MINGW_ANSI_STDIO";;
> +-        *-*-linux-gnu* | *-*-linux*)
> ++        *-*-linux-gnu* | *-*-linux* | *-*-uclinux-gnu* | *-*-uclinux*)
> +                 AC_DEFINE_UNQUOTED(SG_LIB_LINUX, 1, [sg3_utils on linux])
> + 		check_for_linux_sg_v4_hdr
> + 		check_for_getrandom
> +--
> +2.33.0
> +
> diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
> index 055f7befb9..e357fc1dde 100644
> --- a/package/sg3_utils/sg3_utils.mk
> +++ b/package/sg3_utils/sg3_utils.mk
> @@ -13,6 +13,8 @@ ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
>   SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
>   endif
>   SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
> +# We're patching configure.ac
> +SG3_UTILS_AUTORECONF = YES
>   
>   # install the libsgutils2 library
>   SG3_UTILS_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
