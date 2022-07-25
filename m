Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226E3C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5A3F40A6D;
	Mon, 25 Jul 2022 10:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A3F40A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCTucqTHVXGH; Mon, 25 Jul 2022 10:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D94C4067B;
	Mon, 25 Jul 2022 10:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D94C4067B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1790B1BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2F5F60C23
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F5F60C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxFRsK1i6Ki7 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:29:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1C560BDF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E1C560BDF
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:29:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h8so15302811wrw.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ywiMxWI551SzGcRE72gTC+fJVg/2ZDk/ia7Y/GIwjJI=;
 b=0iu7pCyiI6PdylOMsvsvkJCbxecz4+b6goz3UaZqJHXyqxbwfK5ICfzhpd0ZHxhM1K
 blLKCPbTOlF5cBQ3NzhgslChN/VdSkJxP5fsk+RgQ1T2hAizBZwGywvEcsaBXmR3kTu6
 SGAPyC2Sf5UK1E73Kw+V33Xujld9s/44il1QFp6hFk0OtJHUkB+wzB95F1/iv/XnDpLU
 0Hmqcuu5MfEGfEyzDzt89EWide9r0/wYU7mkOd5aFTrqPUEJFG5KoNxFePs421Ab7aLv
 6+I2TY3umy3H9SjvCTieV7VrVGvl6oJ4OZLOirfqRsitbC080B022diWvTmHbT13OZ/v
 c7qg==
X-Gm-Message-State: AJIora9VfAtm4azjxuno3Y+8+3jeKhGSM9w2vCkdVNxZykt5ugr8iiHo
 ua71pS1XMClMzpS5xcb4jo5B1Q==
X-Google-Smtp-Source: AGRyM1tq8oEMFV2QGFE8Qb0455zgOhUCA0ug7WkumMyZ76W2MXaOwlBGtiFu7XhYTL8B1+vkXiLa6w==
X-Received: by 2002:a05:6000:15ca:b0:21d:a72d:beb8 with SMTP id
 y10-20020a05600015ca00b0021da72dbeb8mr7224752wry.624.1658744965451; 
 Mon, 25 Jul 2022 03:29:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm15145369wmc.9.2022.07.25.03.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 03:29:25 -0700 (PDT)
Message-ID: <5b32170d-e789-2a6c-1649-e07be99d81cb@mind.be>
Date: Mon, 25 Jul 2022 12:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220725094456.15051-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725094456.15051-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ywiMxWI551SzGcRE72gTC+fJVg/2ZDk/ia7Y/GIwjJI=;
 b=fpNH05P+YQQXLgR66CJRz+ZnRKWEDxS6c2zhej3Kx7fnAnt1wpyFagpIJfaMUPok7f
 +mAXwclV2aZPG5tRgiqd9r3Yanrvu1Sjwjp5AAR+qrqfW8rUnkum1riOA+41VQgKzWVX
 1u3UxvC680VqcLQejTRy4z4YJRisGsOe3Fl/ehedU3BHYBgOVUn0JmWqS27iXZhLJR9y
 9/NmMbor6cEw8FsXHaKOcfQf4Ih8CM8GFqoD/QTM5V1vCgVaK/6TQH4cH7N5TZ1YOUgc
 XukbH8Mx+1g2x0X6Zq5ZuSoASJnRmhh0Z/uDlLBcMeGQN3JFyMloe+e4wFSCp03EZXAm
 n4HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fpNH05P+
Subject: Re: [Buildroot] [PATCH] package/gcc: disable split-stack for
 non-thread builds
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 11:44, Romain Naour wrote:
> Since commit [1], the autobuilder script generate fully random
> configurations that can triggers configuration that was not tested
> before.
> 
> Here, the toolchain build with uClibc-ng without threads support
> (BR2_PTHREADS_NONE=y) fail to build due to missing pthread.h header.
> 
> ../../../libgcc/generic-morestack-thread.c:42:10: fatal error: pthread.h: No such file or directory
>     42 | #include <pthread.h>
> 
> This issue was actually fixed by this commit [2] adding a patch for
> gcc 4.8, 4.9, 5.3. But it get lost when gcc 6 was added to Buildroot [3].

  So, why don't we send it upstream then? Waldemar might need to do a copyright 
assignment to GCC then however.


> Since then the issue was present in Buildroot but has not been noticed.
> 
> [1] https://git.buildroot.net/buildroot-test/commit/?id=27b18dcb1686a98ce718b6a816e98f8505957a6c
> [2] 2631219f648f4aa13fa36d06a483e4507cb6f3d7
> [3] 519d83bfa0442439026db4e71e605a5c1347e566
> 
> Fixes:
> http://autobuild.buildroot.org/results/5ec/5ec9eefacd27ef4fa73066013188796b43a30428
> https://bugs.busybox.net/show_bug.cgi?id=8766
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> 
>  From Peter's comments (2016):
> "I also doubt the no-thread option gets used very much.
> Perhaps the way forward is to deprecate it and then make
> threads always available, similar to how we did for
> largefile/IPv6?"
> 
> https://bugs.busybox.net/show_bug.cgi?id=8766#c4
> 
> We are now in 2022, do we still want to support the no-thread
> option?

  There is a reason to use nothread: it can make code slightly more efficient 
because mutexes are elided. However, that would only work for really really 
small applications, where I doubt there's much use of using Buildroot.

  So in the end, I wouldn't be opposed at all to get rid of nothread.

  However, there is currently (but hopefully not forever) one more reason to 
keep nothreads: NPTL is only implemented for MMU, and LinuxThreads is not 
implemented for RISCV_64. So the RISCV_64 NOMMU architecture doesn't support 
threads at all at the moment. This will hopefully be fixed in uClibc at some 
point, but for the moment we still need it.

  Regards,
  Arnout


> ---
>   ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
>   ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
>   ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
>   3 files changed, 78 insertions(+)
>   create mode 100644 package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
>   create mode 100644 package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
>   create mode 100644 package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
> 
> diff --git a/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch b/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
> new file mode 100644
> index 0000000000..668b1cd9d7
> --- /dev/null
> +++ b/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
> @@ -0,0 +1,26 @@
> +From cdb76d638e91cc53949585d98fa653d3671b92ac Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Mon, 25 Jul 2022 00:29:55 +0200
> +Subject: [PATCH] disable split-stack for non-thread builds
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +[Romain: convert to git format]
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + libgcc/config/t-stack | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
> +index cc0366b4cd8..f3f97e86d60 100644
> +--- a/libgcc/config/t-stack
> ++++ b/libgcc/config/t-stack
> +@@ -1,4 +1,6 @@
> + # Makefile fragment to provide generic support for -fsplit-stack.
> + # This should be used in config.host for any host which supports
> + # -fsplit-stack.
> ++ifeq ($(enable_threads),yes)
> + LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
> ++endif
> +--
> +2.34.3
> +
> diff --git a/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
> new file mode 100644
> index 0000000000..dba2d02d7f
> --- /dev/null
> +++ b/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
> @@ -0,0 +1,26 @@
> +From 3b9d7d397fa6dc290eb05bffca80968efb6ec2e5 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Mon, 25 Jul 2022 00:29:55 +0200
> +Subject: [PATCH] disable split-stack for non-thread builds
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +[Romain: convert to git format]
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + libgcc/config/t-stack | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
> +index cc0366b4cd8..f3f97e86d60 100644
> +--- a/libgcc/config/t-stack
> ++++ b/libgcc/config/t-stack
> +@@ -1,4 +1,6 @@
> + # Makefile fragment to provide generic support for -fsplit-stack.
> + # This should be used in config.host for any host which supports
> + # -fsplit-stack.
> ++ifeq ($(enable_threads),yes)
> + LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
> ++endif
> +--
> +2.34.3
> +
> diff --git a/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
> new file mode 100644
> index 0000000000..e801085dad
> --- /dev/null
> +++ b/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
> @@ -0,0 +1,26 @@
> +From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Mon, 25 Jul 2022 00:29:55 +0200
> +Subject: [PATCH] disable split-stack for non-thread builds
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +[Romain: convert to git format]
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + libgcc/config/t-stack | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
> +index cc0366b4cd8..f3f97e86d60 100644
> +--- a/libgcc/config/t-stack
> ++++ b/libgcc/config/t-stack
> +@@ -1,4 +1,6 @@
> + # Makefile fragment to provide generic support for -fsplit-stack.
> + # This should be used in config.host for any host which supports
> + # -fsplit-stack.
> ++ifeq ($(enable_threads),yes)
> + LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
> ++endif
> +--
> +2.34.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
