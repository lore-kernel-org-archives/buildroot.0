Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28683C433FE
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7394260F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7394260F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A27B401C3;
	Mon, 27 Sep 2021 14:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnrN2TSxqAd6; Mon, 27 Sep 2021 14:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF0994021C;
	Mon, 27 Sep 2021 14:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AECF11BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EEC560808
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j446xKWZ4E0B for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82A77607EB
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:35:26 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id dj4so70376217edb.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JCHCHuqqbXsZLiKmfZdIheaI/2lnhmdsDVbwq9ETzME=;
 b=JCf4CELgdZYL/6QOX34lNp5yN9OxLO+OLWlqrhhGXDSsBHcaaSoWLCSXY8NTG3UwLT
 KgIvC0vWlkJBTMmc24bS7v6vFwK90QTVTWpNSRdGTUJedfwM4fep2jPD3rg2tv1eLCpX
 0TqRLde+jsmSn4YlMe62jap4kzRvCrCPBeZAs9ky2DVy3ZQGDIjEFa8SZTgCqKFEPUd/
 F5tI12QifRnnKtNOl9nMl8PTfmL07SHViGCWpEZQW2w26Y368hBnTOJBa8IEuK1wN9yC
 JnIkaizQJkfzF4Ng9W3QTRDf2wkQeQ40ltS759MLodZwjBgRZ3/ZWnRG/7OmNYUQTLrr
 wCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JCHCHuqqbXsZLiKmfZdIheaI/2lnhmdsDVbwq9ETzME=;
 b=EP3v4OwE4RiP3PlJBIv4xMPpKk6UHeiPEGO7canSZ+yIWMt8gL/MXxgk3fuXGr5v+H
 6/3cGp6fpLJym4iB9Vkg+Ped6UVVwsDc5Gzh4AbsEfBc82/MiK2lc77bIT2CieV0+WwM
 C+IuVtHGjRfG2jvBgn7JDws31aSZiPa/kRPz5gsbN/fYKIMcunS9L32yvg430pY7aeVQ
 Vioft2dWVn+6NgByoG6n+OV2eCsYu44EABclD+XyKHGNRmBLgaJTWlrB46vsRXGwyjda
 wG1WkXO9pflGpfQ3XtNLaJSyDJDMK9521TEv7mjARGAvCeIHgzDYOb/eZq+PmxmY3eDs
 erKA==
X-Gm-Message-State: AOAM533qqs996o6jkzLHlu5T0ZiLofhdsQOe9jZNyHpfDIEZ/OGimCzA
 u6vPR2JnxsMlslt/l7KfLIw3RuxoRcZ7UZol
X-Google-Smtp-Source: ABdhPJw7K8OgCY/Z4Ejfg5zzFfrEQzCL77hxSS640dJJ7nozDO5mAKviSI40MUqjvzTOVgcQhR0fdw==
X-Received: by 2002:a17:906:8396:: with SMTP id
 p22mr417063ejx.140.1632753324471; 
 Mon, 27 Sep 2021 07:35:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z12sm10604713edx.66.2021.09.27.07.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:35:24 -0700 (PDT)
Message-ID: <b2ddd5e4-3934-1ba5-8ce3-780571ff8c30@mind.be>
Date: Mon, 27 Sep 2021 16:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926212406.914262-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926212406.914262-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liburcu: bump to version 0.13.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 23:24, Fabrice Fontaine wrote:
> Update first patch due to
> https://github.com/urcu/userspace-rcu/commit/3f0dd283a89ab114ffbf5c3dd46463217c6bb2ff
> 
> https://github.com/urcu/userspace-rcu/blob/v0.13.0/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ly-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch | 22 ++++++++++---------
>   package/liburcu/liburcu.hash                  |  4 ++--
>   package/liburcu/liburcu.mk                    |  2 +-
>   3 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
> index 658e1721f0..554c4aba1f 100644
> --- a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
> +++ b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
> @@ -8,17 +8,19 @@ their latest releases based on gcc-4.8.2, then only blacklist gcc 4.8.0
>   and 4.8.1.
>   
>   Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +[Fabrice: update for 0.13.0]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>    urcu/compiler.h | 9 ++++++++-
>    1 file changed, 8 insertions(+), 1 deletion(-)
>   
> -diff --git a/include/urcu/compiler.h b/include/urcu/compiler.h
> +diff --git a/include/urcu/arch/arm.h b/include/urcu/arch/arm.h
>   index 1e30903..56115f1 100644
> ---- a/include/urcu/compiler.h
> -+++ b/include/urcu/compiler.h
> +--- a/include/urcu/arch/arm.h
> ++++ b/include/urcu/arch/arm.h
>   @@ -118,10 +118,17 @@
> - 				+ __GNUC_PATCHLEVEL__)
> -
> +  */
> +
>    /*
>   + * Official gcc releases from 4.8.0 to 4.8.2 have the following bug,
>   + * however, many arm toolchain providers have the included the fix for
> @@ -29,12 +31,12 @@ index 1e30903..56115f1 100644
>   + *
>     * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
>     */
> - # ifdef __ARMEL__
> --#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
> -+#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
> - #   error Your gcc version produces clobbered frame accesses
> - #  endif
> + #ifdef URCU_GCC_VERSION
> +-# if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
> ++# if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
> + #  error Your gcc version produces clobbered frame accesses
>    # endif
> + #endif
>   --
>   1.9.0
>   
> diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
> index da7d12a76c..8ff11623d0 100644
> --- a/package/liburcu/liburcu.hash
> +++ b/package/liburcu/liburcu.hash
> @@ -1,5 +1,5 @@
> -# http://www.lttng.org/files/urcu/userspace-rcu-0.12.1.tar.bz2.sha256
> -sha256  bbfaead0345642b97e0de90f889dfbab4b2643a6a5e5c6bb59cd0d26fc0bcd0e  userspace-rcu-0.12.1.tar.bz2
> +# http://www.lttng.org/files/urcu/userspace-rcu-0.13.0.tar.bz2.sha256
> +sha256  cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20  userspace-rcu-0.13.0.tar.bz2
>   
>   # Hash for license files
>   sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
> diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
> index fa2ad0de83..c0a44764f1 100644
> --- a/package/liburcu/liburcu.mk
> +++ b/package/liburcu/liburcu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBURCU_VERSION = 0.12.1
> +LIBURCU_VERSION = 0.13.0
>   LIBURCU_SITE = http://lttng.org/files/urcu
>   LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
>   LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
