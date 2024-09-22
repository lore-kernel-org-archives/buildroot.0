Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D18CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAB0540018;
	Sun, 22 Sep 2024 18:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RF0X5QVLP5q3; Sun, 22 Sep 2024 18:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7792A40124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7792A40124;
	Sun, 22 Sep 2024 18:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEBD51BF44A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC2E405AE
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id me4KBwv3DAEF for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67BA440469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67BA440469
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67BA440469
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:06:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B60A55FFB4;
 Sun, 22 Sep 2024 20:06:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 20:06:49 +0200
Date: Sun, 22 Sep 2024 20:06:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <ZvBcucZIbs5oFDxj@landeda>
References: <20240922173522.3283547-1-nemaakhilesh@gmail.com>
 <87h6a7twbr.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6a7twbr.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727028413;
 bh=xNsREHUQTJMXlV4zYImBJe84NWnSVnIZNLs1ePlyZ8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNQKEZPv9gtKtW4voNfo2VOXixaM2KE3y762F45g+fui8q0Na5SZSE0iYNM0awXy7
 Xocnc51vBNrpMzRVDIon1lXmPNxqAF6Bjy0u+bgic/OqLvm7hVggWnCCbAh9j9k1SA
 PFdHR2+bHGifZy9r49UnRfixpvIr4ZpY6CLJG+TPn5AkvDVuk5ARJ5isUH4Owcenqy
 XwIDfyfXliEO3ozFpe0lMKhDpQwFDBFu8fEs+LH7+NdnUaXTDs1Md10ZoPrWvk9aei
 b/q6dX5Dd9SjixHyoiXuQx+DA8LkhffCByByK6co6EguHnrVcnS2R8STe1KqZ3hPNL
 Ys63JZZ0gcTZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HNQKEZPv
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.10.1
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, Akhilesh, All,

On 2024-09-22 20:47 +0300, Baruch Siach via buildroot spake thusly:
> On Sun, Sep 22 2024, Akhilesh Nema wrote:
> > Changelog - https://curl.se/ch/8.10.1.html
> Thanks for the patch.
> This is almost the same as Bernd's patch:
>   https://lore.kernel.org/all/20240917182118.3009727-1-bernd@kuhls.net/
> But Bernd noted that this bump fixes a security issue.

Indeed. I have now applied Bernd's patch, thanks for the heads up!

Regards,
Yann E. MORIN.

> baruch
> 
> > Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> > ---
> >  package/libcurl/libcurl.hash | 4 ++--
> >  package/libcurl/libcurl.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> > index 1d01935501..4817ec11d6 100644
> > --- a/package/libcurl/libcurl.hash
> > +++ b/package/libcurl/libcurl.hash
> > @@ -1,5 +1,5 @@
> >  # Locally calculated after checking pgp signature
> > -# https://curl.se/download/curl-8.9.1.tar.xz.asc
> > +# https://curl.se/download/curl-8.10.1.tar.xz.asc
> >  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> > -sha256  f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5  curl-8.9.1.tar.xz
> > +sha256  73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee  curl-8.10.1.tar.xz
> >  sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
> > diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> > index 3661cbf5bd..b81e355195 100644
> > --- a/package/libcurl/libcurl.mk
> > +++ b/package/libcurl/libcurl.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -LIBCURL_VERSION = 8.9.1
> > +LIBCURL_VERSION = 8.10.1
> >  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
> >  LIBCURL_SITE = https://curl.se/download
> >  LIBCURL_DEPENDENCIES = host-pkgconf \
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
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
