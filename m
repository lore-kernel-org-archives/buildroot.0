Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA35C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 21:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A072B400DD;
	Sun, 18 Feb 2024 21:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkXf169QlU_U; Sun, 18 Feb 2024 21:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 432DA40125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 432DA40125;
	Sun, 18 Feb 2024 21:34:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 195B81BF3BB
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05BC440125
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bnflihc-ihbt for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 21:34:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EEED400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EEED400DD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EEED400DD
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 21:34:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 72AF413F879;
 Sun, 18 Feb 2024 22:34:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 22:34:43 +0100
Date: Sun, 18 Feb 2024 22:34:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <ZdJ385N4sxgnZc1n@landeda>
References: <20240218062707.1056854-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218062707.1056854-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708292085;
 bh=9l+i/C0KisP9N5cv9JDJFjbwMJAYXu8ekZZ7hmTcFtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSUi8ZCjyWHHuGf15Td0JQl7uikb+U3yq+kCKjbufi6TmynHhVtIlC9RO39otsiSS
 EmASuz2+HqNIh2raB+7kXXJCWDx0WUXyytkwnBx32Poyr2hx4B7V0K3FQQAa5iXD5R
 4StlFS4mg8miWQ9TdRmtgjldgZLA9IzTTiTp2xcfXKCrs7wgbg293v9ppclIReR8oG
 y35jUAEIRB0AMbNZFAewsviCVBZxyGYskw4TIra7/GTBFYcMgTLbXjegHZJ3acfwZ4
 hDTFdp8FD61wtq9LTg+OA5ympupVF6uivEQNwR80gI0XqsEslTb7uQISMjZcpbtZfF
 SZDpZ/r54PyAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bSUi8ZCj
Subject: Re: [Buildroot] [PATCH 1/1] package/sysstat: bump version to 12.7.5
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

On 2024-02-17 22:27 -0800, Kadambini Nema spake thusly:
> Release notes: https://sysstat.github.io/2023/12/17/sysstat-12.7.5.html
> 
> ./utils/test-pkg -c sysstat.config  -p sysstat
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysstat/sysstat.hash | 6 +++---
>  package/sysstat/sysstat.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
> index b47f000e57..31821d9e3f 100644
> --- a/package/sysstat/sysstat.hash
> +++ b/package/sysstat/sysstat.hash
> @@ -1,5 +1,5 @@
> -# From: http://sebastien.godard.pagesperso-orange.fr/download.html
> -sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
> +# From: https://sysstat.github.io/2023/12/17/sysstat-12.7.5.html
> +sha1  f329edff36f462385a7c20d2a136b667ab8db735  sysstat-12.7.5.tar.xz
>  # Locally calculated
> -sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
> +sha256  57664040a549d33bb06a1121c7124d4cadd9b8b35f815856c194393047cd4d6b  sysstat-12.7.5.tar.xz
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index f77a60b1da..cfa97834c3 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSSTAT_VERSION = 12.6.1
> +SYSSTAT_VERSION = 12.7.5
>  SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
>  SYSSTAT_SITE = https://sysstat.github.io/sysstat-packages
>  SYSSTAT_CONF_OPTS = --disable-file-attr
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
