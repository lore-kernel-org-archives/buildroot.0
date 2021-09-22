Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F72C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3AD610D1
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA3AD610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9DC40770;
	Wed, 22 Sep 2021 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dy1EuabE7VHy; Wed, 22 Sep 2021 20:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDD9415B6;
	Wed, 22 Sep 2021 20:27:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 747761BF37F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6471880F1B
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBiL6XPHJ5-Z for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 20:27:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DE5A80F17
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 20:27:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c22so14409201edn.12
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NZOFnmqAoRL0JjMCAinCYcLiNVvv2Gr+2jDph3x1smo=;
 b=WO3YLizbGNlW9Swe9wc34XC5VBVh/EkFDJiF3CMf+SbMzpEzidy5VRGb+x08n+Xy1A
 pLxL5wo0K8K968gMTSDCXtJo/Rjh70zOZxg8hemeEiKViIzFfhCtYTqY/JajVtx1eU8r
 raS5peE7RDzkRpIG69CrDfN88qrcoOSwAjCG8kZFypy0zSyKfXI+vVm+vcf/nNLiv1Rk
 gfXizeAqXEdeYYoGB8oClljQjJWqEzMRoCM3FNr1pvk9NzQOCVogipAoAXWq+X/AU4Tn
 bNIVHDYiYReL+7kpxTFrAtfD3HP5xl0QlrHR0CFgaZzJ+5ZmC5N3xf9OSmwDHeURVHfe
 n/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NZOFnmqAoRL0JjMCAinCYcLiNVvv2Gr+2jDph3x1smo=;
 b=7edmuz5VvnrcvzQZyjK+HIP2IpgL1vDHQAbBU91aDly4OF/qgRgOoK/x9vkXggMx4w
 l3rwthifps/JHxHgk55tLhlD7RM90KeuyGQymG2Ka0pUeD+MLJ6ESUu8mrxwsLsZABF4
 /cWtnJoFI+IjzWZDjMK+PwOLmFKRWziwtx0dYlOGe8NGLnbMR54HC+B4OCbN18Dh0yb+
 bZULsA0MZ59e6VI6rFDcriiZiFLIFVBhhchTGjmWFEZBdr0zhH21X/XmJnsd8TE4xJCv
 iBRuyryl8gxrKSM03tXD41jzMOW13XvuTDYRshnkldw5TMnOVpmtqMDB+zmgKEoNI5oR
 /wcw==
X-Gm-Message-State: AOAM533lExe2XOPSCT00p7LcjgSeg/Vu7aB/m5mE7JHzeT1qKQUQzOoi
 77hB40BDmYFdEKbz8oEqKzcGMS0P9trV+A==
X-Google-Smtp-Source: ABdhPJxIAbKUiixfNGtijDWcve33iOLFaRjDyxyMUOrsuHvfhRXzCwIj0HHG5Q7YDVnP8mVtTYBqkg==
X-Received: by 2002:a50:d713:: with SMTP id t19mr1491533edi.2.1632342448027;
 Wed, 22 Sep 2021 13:27:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r2sm1717633edo.59.2021.09.22.13.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 13:27:27 -0700 (PDT)
Message-ID: <ed3325a7-7721-51e6-913f-6916bb2b9525@mind.be>
Date: Wed, 22 Sep 2021 22:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
References: <20210913125911.52199-1-abrodkin@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210913125911.52199-1-abrodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/ntp: Fix building with glibc 2.34+
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
Cc: arc-buildroot@synopsys.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 13/09/2021 14:59, Alexey Brodkin via buildroot wrote:
> On attempt to build ntp with glibc 2.34 the following error happens:
> -------------------------------->8------------------------------
> In file included from .../output/host/lib/gcc/i586-buildroot-linux-gnu/10.3.0/include-fixed/pthread.h:42,
>                   from work_thread.c:13:
> work_thread.c:45:57: error: missing binary operator before token "("
>     45 | #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
>        |                                                         ^~~~~~~~~~~~~~~~~
> -------------------------------->8------------------------------
> 
> That's because starting from glibc 2.34 PTHREAD_STACK_MIN gets determined
> dynamically in runtime via sysconf(), see [1].
> 
> Original fix proposed by Khem Raj in OpenEmbedded, see [2].

  I was looking for an upstream fix instead, since ntp is supposed to be a 
maintained project, but there seems to be no public git repository (the one on 
github hasn't been touched for 6 years), so I guess this is the best we can do...

  Applied to master, thanks.

  Regards,
  Arnout


> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=5d98a7dae955bafa6740c26eaba9c86060ae0344
> [2] https://github.com/openembedded/meta-openembedded/commit/7055c764c83150f9310ce04bcfb19330460582fc
> 
> Suggested-by: Artem Panfilov <artemp@synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>   ...ntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
> 
> diff --git a/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
> new file mode 100644
> index 0000000000..da03ad4aac
> --- /dev/null
> +++ b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
> @@ -0,0 +1,33 @@
> +From 082a504cfcc046c3d8adaae1164268bc94e5108a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 31 Jul 2021 10:51:41 -0700
> +Subject: [PATCH] libntp: Do not use PTHREAD_STACK_MIN on glibc
> +
> +In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
> +could mean different stack sizes at runtime on different architectures
> +and it also causes compile failure. Default glibc thread stack size
> +or 64Kb set by ntp should be good in glibc these days.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +[Copied from https://github.com/openembedded/meta-openembedded/blob/master/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch]
> +Signed-off-by: Alexey Brodkin <abrokdin@synopsys.com>
> +---
> + libntp/work_thread.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libntp/work_thread.c b/libntp/work_thread.c
> +index 03a5647..3ddd751 100644
> +--- a/libntp/work_thread.c
> ++++ b/libntp/work_thread.c
> +@@ -41,7 +41,7 @@
> + #ifndef THREAD_MINSTACKSIZE
> + # define THREAD_MINSTACKSIZE	(64U * 1024)
> + #endif
> +-#ifndef __sun
> ++#if !defined(__sun) && !defined(__GLIBC__)
> + #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
> + # undef THREAD_MINSTACKSIZE
> + # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
> +--
> +2.32.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
