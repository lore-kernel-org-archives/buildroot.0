Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAE3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:35:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508C560F44
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 508C560F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 132A7402E9;
	Sun, 17 Oct 2021 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzd-XltLveMe; Sun, 17 Oct 2021 19:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B51040196;
	Sun, 17 Oct 2021 19:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 831D51BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F700401F1
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-WplDp4ipPu for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:35:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43764401D2
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:35:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F08E67802C2;
 Sun, 17 Oct 2021 21:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634499312;
 bh=u0iOubGWsELayE6CwtHeBoQoHXIbz4zQeNYX6JKiP1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4crYx37+qql3RbjH1PSdt/PMwUAKp7BLQxl/hf0Rwrfm4pARRhrNHjmy4TewdyLs
 GEkCwxHKdjFE3PwlLM6Zs7IbuX/K74uY+ciJonoNSgiRYtG/TsYUBHw7IAm/eCEKTN
 SvzO33vn6GELirRyVIMKYuk7VP7Q8NcKYCMW+5HMW/CpvMiXYiLZqxC68aM5fIBxyQ
 IKg8td0UmbigOsTHGRbyMvPU3ZMQL2+iTShzNw6GW3vgU+pKty76nXRvZwwBMnYY7a
 Me1mlOT5vdbiCgiynWAZb2CII14b2yE8J+DJaB9z5nSbzXqgXdCQ/ylb41wWqBmvgc
 b1GD2iGwtbzTg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 21:35:07 +0200
Date: Sun, 17 Oct 2021 21:35:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211017193507.GH2400@scaer>
References: <20211017185415.1407474-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211017185415.1407474-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix libuuid build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-17 20:54 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 2.37.2 in
> commit 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6 and
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=33b09aebf505acfbbb2137319093fbb9ed7eea7d
> 
> libuuid/src/unparse.c:42:73: error: expected ';', ',' or ')' before 'fmt'
>  static void uuid_fmt(const uuid_t uuid, char *buf, char const *restrict fmt)
>                                                                          ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b931a34a47e5faf8ae48fce079747dea0db2563a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nclude-c-h-to-cover-restrict-keyword.patch | 30 +++++++++++++++++++
>  ...nclude-c-h-to-cover-restrict-keyword.patch | 30 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
>  create mode 100644 package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch

I've make the util-libux-libs patch a symlink to the util-linux patch,
like we have for the hash file.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> new file mode 100644
> index 0000000000..3b4f510920
> --- /dev/null
> +++ b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> @@ -0,0 +1,30 @@
> +From 5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Thu, 5 Aug 2021 09:46:21 +0200
> +Subject: libuuid: include c.h to cover restrict keyword
> +
> +References: https://github.com/karelzak/util-linux/issues/1405
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libuuid/src/unparse.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libuuid/src/unparse.c b/libuuid/src/unparse.c
> +index f9a5e4315..ffeed2ed6 100644
> +--- a/libuuid/src/unparse.c
> ++++ b/libuuid/src/unparse.c
> +@@ -33,6 +33,7 @@
> +  */
> + 
> + #include <stdio.h>
> ++#include "c.h"
> + 
> + #include "uuidP.h"
> + 
> +-- 
> +cgit 1.2.3-1.el7
> +
> diff --git a/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> new file mode 100644
> index 0000000000..3b4f510920
> --- /dev/null
> +++ b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> @@ -0,0 +1,30 @@
> +From 5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Thu, 5 Aug 2021 09:46:21 +0200
> +Subject: libuuid: include c.h to cover restrict keyword
> +
> +References: https://github.com/karelzak/util-linux/issues/1405
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libuuid/src/unparse.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libuuid/src/unparse.c b/libuuid/src/unparse.c
> +index f9a5e4315..ffeed2ed6 100644
> +--- a/libuuid/src/unparse.c
> ++++ b/libuuid/src/unparse.c
> +@@ -33,6 +33,7 @@
> +  */
> + 
> + #include <stdio.h>
> ++#include "c.h"
> + 
> + #include "uuidP.h"
> + 
> +-- 
> +cgit 1.2.3-1.el7
> +
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
