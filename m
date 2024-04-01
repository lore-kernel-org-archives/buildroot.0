Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3253CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4D240255;
	Mon,  1 Apr 2024 18:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3Im2rDXajRk; Mon,  1 Apr 2024 18:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314B540655
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314B540655;
	Mon,  1 Apr 2024 18:54:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7001BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 445A9608F4
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqUddYRC2crO for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D71D608B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D71D608B8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D71D608B8
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:54:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C94313F89A;
 Mon,  1 Apr 2024 20:54:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 20:54:30 +0200
Date: Mon, 1 Apr 2024 20:54:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZgsC5rCA_xLB2k8Q@landeda>
References: <20240331203354.815139-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331203354.815139-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711997674;
 bh=AUo0yN0l7YRIlz7ExyxmotcBGMiDmrgj6IkTFtCWzso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfTk3PdSxxpHu3sTuslA7/00hiWjqx5wBrTldpDk+nirwkkL9S7H5blVin5sHFTwJ
 3Bxp7T6b59kGB4Y/kUAWYbJfZXrQuadTJrYKPjSw3wJGEaLPrh2Rc7a7Lf+2bWYQvP
 cv6RZA1rQ7kXO1gI4YCZ4gai7sNWzhIOiFZKx5YVzWf7RLuazV4d9G4eL82BWjfzHx
 DDa3Sng5rfpN4gtRyGAbPm2z6lGx+ab/CC+gb1ddbzv6tvfV1sw4EeWPsAnDhqGrdN
 WS2RViPr/xSYsbUieb1PT7JvQRY1orBzH03hFeQRyJDggHfD5b2YyTOW2fsv2pDj7n
 4RZVR9Mmbuv5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PfTk3PdS
Subject: Re: [Buildroot] [PATCH] utils/check-package: emit library name
 along with check function name
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-03-31 22:33 +0200, Yann E. MORIN spake thusly:
> Although we currently do not have two check libs that have same-name
> check functions, there is nothing that would prevent that, and there
> is no reason why two unrelated libs could not implement checks with
> the same name.
[--SNIP--]
> Fix that by storing both the library and function names together. The
> leading "checkpackagelib." (with the trailing dot, 16 chars) is removed
> for brevity, because it's present in all libs' names.
[--SNIP--]
> diff --git a/utils/check-package b/utils/check-package
> index de41891b56..373bc63f52 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -224,7 +224,7 @@ def check_file_using_lib(fname):
>          print("{}: would run: {}".format(fname, functions_to_run))
>          return nwarnings, nlines
>  
> -    objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
> +    objects = [[f"{lib.__name__[16:]}::{c[0]}", c[1](fname, flags.manual_url)] for c in internal_functions]

As suggested by Arnout, s/::/./, and applied to master.

Regards,
Yann E. MORIN.

>  
>      for name, cf in objects:
>          warn, fail = print_warnings(cf.before(), name in xfail)
> -- 
> 2.44.0
> 

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
