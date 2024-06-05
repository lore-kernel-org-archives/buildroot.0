Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD053C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 15:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6CC8488D;
	Wed,  5 Jun 2024 15:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tr-ubaOANFsF; Wed,  5 Jun 2024 15:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E9788488F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E9788488F;
	Wed,  5 Jun 2024 15:32:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 739901BF5D7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60296415CD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlOSayb9j1dr for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 15:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA25D415EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA25D415EF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA25D415EF
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 15:32:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2157313FA48;
 Wed,  5 Jun 2024 17:32:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jun 2024 17:32:01 +0200
Date: Wed, 5 Jun 2024 17:32:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>
Message-ID: <ZmCE8TZi-mvZoj9o@landeda>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
 <e0b686dc7ac91465e02ba7d6e18635404a93ca24.1717597094.git.yann.morin.1998@free.fr>
 <BN0P110MB1673E9E877CBA8E08D780D53EBF9A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN0P110MB1673E9E877CBA8E08D780D53EBF9A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717601524;
 bh=cFpfdsWG9LGZYKpFi868meKp+jLqOFk42m7Wbfo7OnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C0jNBY/pi/2oS7BVpFbYSw/XplPj5QqsVFuKGmAFIbvmM2TNL4LRBRf54RHsBiWFc
 ZOU6LkC6a+8OmqwlVocG47EPqJ18PofFIb/6Qe5ZWZuP+T7fbV6LfzVzSB+/RIRl0h
 CVdRsn8xAXW7EzChjFfuOnH8OEOaqNfhcl0odclvDIxGwf/fcGxQYPHoRr+ovWw4yD
 RFRDJ+Hnwxyna5Zl9xePRiYR9dsrYjPAFxp7JUFW9cEReWhAzmzruc9hlLB40Ak39h
 fmunRQZHlBUGKNGfXN9IPRbtcoD0sVAd3SoBHPVV0ynxc7oSMZ5zC90CH21eP/lc4H
 Whwe1lfUbaiBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C0jNBY/p
Subject: Re: [Buildroot] [External] [PATCH 8/9]
 support/scripts/apply-patches: use appropriate TAR
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2024-06-05 15:22 +0000, Maier, Brandon L                            Collins spake thusly:
[--SNIP--]
> > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-
> > patches.sh
> > index 6da83f6826..39a0c050d6 100755
> > --- a/support/scripts/apply-patches.sh
> > +++ b/support/scripts/apply-patches.sh
> > @@ -146,7 +146,7 @@ function scan_patchdir {
> >                  unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
> >                  rm -rf "$unpackedarchivedir" 2> /dev/null
> >                  mkdir "$unpackedarchivedir"
> > -                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
> > +                $(TAR) -C "$unpackedarchivedir" -xaf "${path}/$i"
> 
> Shouldn't this be `${TAR}` since it's a shell script?

Damned, one I missed... Thanks!

I tried to find a case where I could exercise that code path, but I
could not find a package with uses a tarball as a patch...

I'll respin a bit later; thanks for your eagle eyes! :-)

Regards,
Yann E. MORIN.

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
