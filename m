Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE2C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 667CD40B70;
	Tue, 21 Feb 2023 20:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 667CD40B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1IYE2jRzcYi; Tue, 21 Feb 2023 20:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E01A340B51;
	Tue, 21 Feb 2023 20:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E01A340B51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5D7B1BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FF4040A02
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF4040A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HT8VIsLMqISH for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:09:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F6E410E6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2F6E410E6
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:09:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9026B5FFAF;
 Tue, 21 Feb 2023 21:08:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Feb 2023 21:08:57 +0100
Date: Tue, 21 Feb 2023 21:08:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230221200857.GG2718518@scaer>
References: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
 <20230221154827.7e737960@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221154827.7e737960@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677010142;
 bh=CKc6KKEZvixc4M/4QRP9PILar4tIxMzKB8WpKdAV99Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IoVCYWZ4FsfsbO1MEn2hR2H+fWlsENMqVOHyAoeJQzV34f1sQtnYHSsyz8VR3/JTB
 TOSg1qdpqU4elcKYfCUCvZSONc9OTZISkrqat6rYoz7SHvJtAmgomSa9uH4/gZ9Dcc
 bm5md4JVCZjfjPUbsgDbSyDWZyfSsypTt8hgPLCbkRVfqIQkRfZF9e0vB19iTiDIi9
 BJER1qdaBRbg1FER5iEUbMSwR3iWZ4wzghhLvBTViX/9fMj5H4nkCQryS0uivnkdbe
 RwanY+gN9gzNwbVyOWmW2zzNzNh98ptK++nZEBflskY0pcdTNK2lmE9ZJxmh4jybHZ
 bm69f2X+zXC/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IoVCYWZ4
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, all,

On 2023-02-21 15:48 +0100, Thomas Petazzoni spake thusly:
> Hello Fabrice,
> 
> On Tue, 21 Feb 2023 15:21:44 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > systemd can't be built with -Ofast since version 252 and
> > https://github.com/systemd/systemd/commit/60f97fee2d2f948c8e8963ea8ff767008cb93cae
> > resulting in the following build failure since bump to version 252.4 in
> > commit a2c823d1f548d5a0120d27d6c000603192360f7b:
> > 
> > ../output-1/build/systemd-252.4/meson.build:397:8: ERROR: Problem encountered: -Ofast, -ffast-math, or -ffinite-math-only is specified in c_args.
> > 
> > While at it, revert changes made by commit 9cd084b54e2223e49c37962b0cbefae7bea26ef5
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/8f41c4984b645851724e554c3162b83bc312bee7
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/systemd/Config.in  | 1 +
> >  package/systemd/systemd.mk | 5 -----
> >  system/Config.in           | 4 ++++
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index 9f4d933779..5bbdbb405f 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
> >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> >  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> >  	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
> > +	depends on !BR2_OPTIMIZE_FAST
> I really dislike this.

Agreed.

> > -SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
> > -ifeq ($(BR2_OPTIMIZE_FAST),y)
> > -SYSTEMD_CFLAGS += -O3
> > -endif
> 
> And this should work. It's really systemd that is stupid to look for
> -Ofast in c_flags without seeing that -O3 later overrides it.

Indeed. Probably something along the lines of:

    SYSTEMD_CFLAGS = $(filter-out -Ofast,$(TARGET_CFLAGS))

would do the trick?

Alternatively, as the upstream commit also implies, maybe we should in
this case keep -Ofast and just add:

    SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-finite-math-only

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
