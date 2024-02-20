Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE26C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A762360645;
	Tue, 20 Feb 2024 21:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0YTXbMmZ8KV; Tue, 20 Feb 2024 21:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABDC960ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDC960ADF;
	Tue, 20 Feb 2024 21:17:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFF9E1BF955
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D93F9414D0
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VffVkBkIE5tc for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6163A400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6163A400F9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6163A400F9
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:17:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5596B13F838;
 Tue, 20 Feb 2024 22:17:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:17:01 +0100
Date: Tue, 20 Feb 2024 22:17:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <ZdUWzeSOvKrKIQ42@landeda>
References: <20240219191934.41982-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219191934.41982-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708463823;
 bh=ESjLYglrYpEIrqV3EiUcR0+I3ukA2BgGkKHhwE2ycFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZt8LxQ0pm1ykZFQUVx5YfRRKse4+3U53xhjMPUJiIbvlZc85r6UnBvZDoz4TZizG
 zWSS9rdCARU+khzpQzFG/f2gk7VtqMcBpA2E3LE2b84MygUrxTaTwaFvi17ceYC5eG
 Ms6rpOc5r4exL5vfvyFlUEwccVzrF4JunI/16HM5Rs7jlEOnADWWG4f60GYnrJUV+M
 +LYjxHmfBX2h8GwdJQI/pMjKGVgySDjU44KPG7bQRDOd/n1Rsj+A5Ql7L+vLZlAP5s
 Sd2HCWjUUDvnO+b+wc891GYyjXX/kWMOHXwTagG8qkH/eBKpvwLOdYGVCq1TYKwGnu
 neyqtq8Rt7P9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aZt8LxQ0
Subject: Re: [Buildroot] [PATCH 1/1] package/dos2unix: bump to version 7.5.2
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

Kadambini, All,

On 2024-02-19 11:19 -0800, Kadambini Nema spake thusly:
> - Update hash of the COPYING.txt (update in year)
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changelog: https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt
> 
> $ ./utils/test-pkg -d br_test -k -c  dos2unix.config -p dos2unix
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: OK
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>  package/dos2unix/dos2unix.hash | 6 +++---
>  package/dos2unix/dos2unix.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
> index 032c8ea2d2..d4d682cd0c 100644
> --- a/package/dos2unix/dos2unix.hash
> +++ b/package/dos2unix/dos2unix.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
> -sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
> -sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
> +# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz.asc
> +sha256  264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a  dos2unix-7.5.2.tar.gz
> +sha256  03b60fa2cf28b2c6dd585a13b32377c1f87b8f016db44ce2ab6bc7eb306220e2  COPYING.txt
> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
> index 6d1e70cf26..e30fc999d4 100644
> --- a/package/dos2unix/dos2unix.mk
> +++ b/package/dos2unix/dos2unix.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOS2UNIX_VERSION = 7.5.0
> +DOS2UNIX_VERSION = 7.5.2
>  DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
>  DOS2UNIX_LICENSE = BSD-2-Clause
>  DOS2UNIX_LICENSE_FILES = COPYING.txt
> -- 
> 2.25.1
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
