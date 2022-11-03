Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938B9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2597A40BED;
	Thu,  3 Nov 2022 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2597A40BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ga9rYXIRj2ME; Thu,  3 Nov 2022 21:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CFBC40BD3;
	Thu,  3 Nov 2022 21:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFBC40BD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 601611BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2898781FCB
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2898781FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82UEBtPxCZXp for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:38:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBA681FC2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCBA681FC2
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:38:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 80C5540006;
 Thu,  3 Nov 2022 21:38:36 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:38:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221103223834.1e9564a5@windsurf>
In-Reply-To: <20221103174818.1469409-1-fontaine.fabrice@gmail.com>
References: <20221103174818.1469409-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667511517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijEhRUVgNj6b5/seu7+BBSSoLUeAqYaEjOSYs7me5ac=;
 b=l8fTzAnuugYVJwYBj3PSs7yr2gApCPZmJlAu0B/wPL8KO8sMdHgGSaKh1icqdmWvHvJpTy
 f658V4EW4IbS4sffRuL+7D1DQBEtWEDWyL/87Fqrq8eXfDPkbwTXUBuGOnpbiZTWjNDgTv
 31OOMlWxeVl5DWNnrBbCXFQtV8wz24m2S3ieCiy2JCaUbEXTw6rRTPdeffCS6YKCgTSZxa
 D91y6XA+K2t9h9zLEGng3gUORas7OJJjCTQjW/zEeX8c3Df0FFkRShSRCZ0bzdihasugor
 sPHtBbw/oZgseQI4x4rqF8m+hM40VBRJ9v83yzhlpxwRg0ughyl63NNB1qOdPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l8fTzAnu
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: fix build without
 __NR_pidfd_open
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 18:48:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without __NR_pidfd_open raised since
> bump to version 3.3.17 in commit
> cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220 and
> https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da:
> 
> pgrep.c: In function 'pidfd_open':
> pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
>   748 |  return syscall(__NR_pidfd_open, pid, flags);
>       |                 ^~~~~~~~~~~~~~~
>       |                 pidfd_open
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../procps-ng/0003-fix-pifd_open-check.patch  | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/procps-ng/0003-fix-pifd_open-check.patch
> 
> diff --git a/package/procps-ng/0003-fix-pifd_open-check.patch b/package/procps-ng/0003-fix-pifd_open-check.patch
> new file mode 100644
> index 0000000000..7152901e70
> --- /dev/null
> +++ b/package/procps-ng/0003-fix-pifd_open-check.patch
> @@ -0,0 +1,59 @@
> +From 0cce3e981540c28d2f703b9ab16c04d0df8fa03d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 3 Nov 2022 18:24:53 +0100
> +Subject: [PATCH] fix pifd_open check
> +
> +Replace AC_CHECK_FUNC by AC_CHECK_FUNCS otherwise HAVE_PIDFD_OPEN will
> +never be defined resulting in the following build failure if pidfd_open
> +is available but __NR_pidfd_open is not available:
> +
> +pgrep.c: In function 'pidfd_open':
> +pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
> +  748 |  return syscall(__NR_pidfd_open, pid, flags);
> +      |                 ^~~~~~~~~~~~~~~
> +      |                 pidfd_open
> +
> +This build failure is raised since the addition of pwait in version
> +3.3.17 and
> +https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.com/procps-ng/procps/-/merge_requests/166]
> +---
> + configure.ac | 2 +-
> + src/pgrep.c  | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 629881a6..1a3ccdb8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -160,7 +160,7 @@ AC_TRY_COMPILE([#include <errno.h>],
> + 		AC_MSG_RESULT(yes),
> + 		AC_MSG_RESULT(no))
> + 
> +-AC_CHECK_FUNC([pidfd_open], [enable_pwait=yes], [
> ++AC_CHECK_FUNCS([pidfd_open], [enable_pwait=yes], [
> +   AC_MSG_CHECKING([for __NR_pidfd_open])
> +   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
> + #include <sys/syscall.h>
> +diff --git a/pgrep.c b/pgrep.c
> +index c4ad5da3..29cfedf7 100644
> +--- a/pgrep.c
> ++++ b/pgrep.c
> +@@ -38,7 +38,7 @@
> + #include <stdbool.h>
> + #include <time.h>
> + 
> +-#if defined(ENABLE_PWAIT) && !defined(HAVE_PIDFD_OPEN)
> ++#if defined(ENABLE_PWAIT)
> + #include <sys/epoll.h>
> + #include <sys/syscall.h>
> + #endif

I think here the change should have been:

#if defined(ENABLE_PWAIT)
#include <sys/epoll.h>
#if !defined(HAVE_PIDFD_OPEN)
#include <sys/syscall.h>
#endif /* !HAVE_PIDFD_OPEN */
#endif

Indeed, the <sys/epoll.h> is needed for the pwait functionality.
However, the <sys/syscall.h> is only needed when the replacement
pidfd_open() function is provided, i.e when !HAVE_PIDFD_OPEN.

Anyway, I've applied as-is to Buildroot, but maybe for upstream this
change would be more correct.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
