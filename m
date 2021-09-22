Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25644C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:25:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99076610A1
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99076610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 416F3614AB;
	Wed, 22 Sep 2021 19:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIsiSGAmeR8M; Wed, 22 Sep 2021 19:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E78614C9;
	Wed, 22 Sep 2021 19:25:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECA271BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC75183F10
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJvd-GYsPhFY for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B5E83F0C
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:25:30 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g8so14040915edt.7
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gN/1qXZm7bX1Y+KuVC/Yb5TffikOMMHxdR91i0BPjcw=;
 b=bGfvBtckPlWyxEQmI5UTgdA8XJ4AfhqW5+2Rp7aBa4+tdiYgA1OcHbCO8GU7vhr9ON
 NL9AHbobDpXEjpvXLp9apolIVEyW/N9oh2S9PWMs9fcts6yYqVQgaJwSb3hOfJ5RpfDF
 0ybiyp4OLudDIuIb3uID4Lr/YHilsK1POjSaDneLLWgzOXk3Hr5IOQsWOWVoLUPK/rxd
 kg9/SVaH0ano9FU5IiwfMEwnADbcXDEcXlbaVIE0So8RL4rZ/4DcAw8/NvUIGQj+XZeh
 vssLMJaISyWIUDl+kRPm6ASaMa/RVQZ6Vi4D5RZ+FfhiT4k80h2+1sXrVd+k7lnCRKc0
 OprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gN/1qXZm7bX1Y+KuVC/Yb5TffikOMMHxdR91i0BPjcw=;
 b=fEq1azfkzIvBFPVmyLL1c9Q/HHrqVXnZbR1exOxOL14t7caKeULIzROq3/c4nZUFoj
 Vk+j8To23rX4irqoaOu0HXvqHz8S4bxKDHqe2llLOqJOmupLsPWHGgPdOU7l/HGd5psC
 Sa7Zh8+3ELZ8rpzEziDvpF02+x+ZNroOyvlOIgTrlZ6peZDaqmFB8QBDjY0DqfvEdtEF
 epgChqyUH8XppIMleg3xFrIV2jRTOW7Hfvb7r22R3bhKYc9xEIoLaQnf/Fuz3cK9H7em
 8CaEWAynrWluGYhxcIgE82LoSUzVdR7eJ2sw2/gg7XlI4//AFOBd8ALgA7AV1ib5a7uo
 ODgw==
X-Gm-Message-State: AOAM532gh7kt5+zadAT+VRGwVxqV1s0w5n5RSrP04hq/0eDMJ+k0m9eS
 I30TKLkoIvu4ZnrGRqHkT4N+QhgdN5BtvQ==
X-Google-Smtp-Source: ABdhPJxP4/efH0voBSuSl8yxws6+0ThRxm2g7aFP9Q9mqn8mKvM8aMCuglJJLJjbCSDMWKIq4b4IMg==
X-Received: by 2002:a17:906:dbe9:: with SMTP id
 yd9mr931567ejb.184.1632338728471; 
 Wed, 22 Sep 2021 12:25:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i2sm1688010edu.48.2021.09.22.12.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:25:28 -0700 (PDT)
Message-ID: <ff3e4920-c966-0cc7-9e55-edea39d763ca@mind.be>
Date: Wed, 22 Sep 2021 21:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210920163031.197937-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920163031.197937-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: fix build with uclibc-ng
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 20/09/2021 18:30, Fabrice Fontaine wrote:
> Fix the following build failure with uclibc-ng raised since bump to
> version 1.17 in commit 9badccc9d4887aa2365d7350e3b26bd4250dad48:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
> sae.c:(.text+0xd74): undefined reference to `reallocarray'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-build-Add-reallocarray-to-missing-h.patch | 55 +++++++++++++++++++
>   package/iwd/iwd.mk                            |  2 +
>   2 files changed, 57 insertions(+)
>   create mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> 
> diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> new file mode 100644
> index 0000000000..ef6114f1af
> --- /dev/null
> +++ b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> @@ -0,0 +1,55 @@
> +From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 19 Sep 2021 21:17:44 +0200
> +Subject: build: Add reallocarray to missing.h
> +
> +reallocarray has been added to glibc relatively recently (version 2.26,
> +from 2017) and apparently not all users run new enough glibc. Moreover,
> +reallocarray is not available with uclibc-ng. So use realloc if
> +reallocarray is not available to avoid the following build failure
> +raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
> +
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
> +sae.c:(.text+0xd74): undefined reference to `reallocarray'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac  | 1 +
> + src/missing.h | 7 +++++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c6250401..51d9da93 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
> +
> + AC_CHECK_FUNCS(explicit_bzero)
> + AC_CHECK_FUNCS(rawmemchr)
> ++AC_CHECK_FUNCS(reallocarray)
> +
> + AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
> +
> +diff --git a/src/missing.h b/src/missing.h
> +index 2cc80aee..a5b92952 100644
> +--- a/src/missing.h
> ++++ b/src/missing.h
> +@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
> + _Pragma("GCC diagnostic pop")
> + }
> + #endif
> ++
> ++#ifndef HAVE_REALLOCARRAY
> ++static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
> ++{
> ++	return realloc(ptr, nmemb * size);
> ++}
> ++#endif
> +--
> +cgit 1.2.3-1.el7
> +
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 9737f2c626..58535b1aa1 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -12,6 +12,8 @@ IWD_LICENSE_FILES = COPYING
>   IWD_CPE_ID_VENDOR = intel
>   IWD_CPE_ID_PRODUCT = inet_wireless_daemon
>   IWD_SELINUX_MODULES = networkmanager
> +# We're patching configure.ac
> +IWD_AUTORECONF = YES
>   
>   IWD_CONF_OPTS = \
>   	--disable-manual-pages \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
