Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161B9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2E1A40607;
	Sun,  3 Jul 2022 16:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2E1A40607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuO9-tweVDqC; Sun,  3 Jul 2022 16:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC986405F7;
	Sun,  3 Jul 2022 16:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC986405F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3801BF3A1
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 16:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE26405F7
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 16:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE26405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dk3lw4PTAnX for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 16:03:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA3EB405E7
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA3EB405E7
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 16:03:45 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BCC9444028D;
 Sun,  3 Jul 2022 19:03:33 +0300 (IDT)
References: <20220703155356.1356910-1-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 03 Jul 2022 19:02:29 +0300
In-reply-to: <20220703155356.1356910-1-fontaine.fabrice@gmail.com>
Message-ID: <87fsjitc82.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1656864213;
 bh=JH4c7F/j4zhJVf2jVMoH09p/K+D/NlQT2f7cKzKPpxM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=DLCWUbTTAAQKc5sbX7h3xq+qUlkctQsNeZcqXV7jW1BoG864gxzHSlztcmyzmXAhG
 FC1D7YjfXdeMBQ5lFEq0CgMe5yP5srQ4i7AmdTD8JPSNOLGWlLL1UCLZINOt0Bxhhm
 slX9Nr+M8Lh+LbU+Z3KKcDnzBPtI3X7bygQLmzs0fvTakaWKr48LUIyd5zcB5fY74x
 kvlfO5nO6aaJUC2QjfEww7a8BRaJtSEoQH0WgvwK6gyyOUk7GAlA//e4HmWqRd8B3s
 7NfXee16/WHuGcXnk+L5r7/4Xue+5kL0se9BO4ZIFWINyiGxmo5cliDTVUwwVeRJp5
 +c3fDtCU5maXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=DLCWUbTT
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix build without
 sched_yield
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Sun, Jul 03 2022, Fabrice Fontaine wrote:

> Fix the following build failure without sched_yield raised since bump to
> version 7.84.0 in commit b034109dd60a429690acf9c5501c6658c53eae13:
>
> In file included from easy.c:89:
> easy_lock.h: In function 'curl_simple_lock_lock':
> easy_lock.h:56:7: error: implicit declaration of function 'sched_yield' [-Werror=implicit-function-declaration]
>    56 |       sched_yield();
>       |       ^~~~~~~~~~~
>
> Fixes:
>  - http://autobuild.buildroot.org/results/fbc80a0002d640210c81a4c518856c02669059b7
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  ...de-sched-h-if-available-to-fix-build.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
>
> diff --git a/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
> new file mode 100644
> index 0000000000..b5f0a87218
> --- /dev/null
> +++ b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
> @@ -0,0 +1,30 @@
> +From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 27 Jun 2022 08:46:21 +0200
> +Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
> +
> +Patched-by: Harry Sintonen
> +
> +Closes #9054
> +
> +[Retrieved from:
> +https://github.com/curl/curl/commit/e2e7f54b7bea521fa8373095d0f43261a720cda0]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/easy_lock.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> +index 819f50ce815b8..1f54289ceb2d3 100644
> +--- a/lib/easy_lock.h
> ++++ b/lib/easy_lock.h
> +@@ -36,6 +36,9 @@
> + 
> + #elif defined (HAVE_ATOMIC)
> + #include <stdatomic.h>
> ++#if defined(HAVE_SCHED_YIELD)
> ++#include <sched.h>
> ++#endif
> + 
> + #define curl_simple_lock atomic_bool
> + #define CURL_SIMPLE_LOCK_INIT false


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
