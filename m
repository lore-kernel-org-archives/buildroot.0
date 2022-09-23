Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BCECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 16:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCDB418FB;
	Fri, 23 Sep 2022 16:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCDB418FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fs5UU3B3GNu; Fri, 23 Sep 2022 16:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B491A418AB;
	Fri, 23 Sep 2022 16:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B491A418AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47FB31BF263
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 239B783EFD
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 16:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 239B783EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jF51k64xGM5 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 16:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB85783E61
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB85783E61
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 16:29:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n12so769643wrx.9
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 09:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=kN8uWDBiwaFsUSoRFjb1A8Bc4pOrnFi7Ne6GSVPssH4=;
 b=F/wNuCXExtVZx0G606Jk/hjjKdHcJC/WxHcMzMv6xPC4zfHUIAG4dOdiRLAX2MzWH9
 l7MJ6JJBbBoBu8/CZ37gkDW997gTwtLivEADzlD1bx4YuEU44xcVXN94mx/X0XfKP3aB
 B6My5L5r/IFlEePca/6I47cKtCtR/TiKNwaOCUrTkWzY02T/+z4BgQ1k5KbS1yq2Bq2T
 RJWmJat4H6azkIv/H97r4wcxmZp+piLarawVqH6RCBTa3npumkA3551IS4xgMjW8mpa9
 mgfvLp7smPuFYOdVIqBEbqkdZoHexfwxdJ9L1/nG2m4rWlyXTrACwQLuXcAeWznJ6DPx
 7xNw==
X-Gm-Message-State: ACrzQf2+6bRSTdlCW1tnOh9jeHi1kAen6Sr5Nwjk0ymn/IeBusQJZBQ/
 cW6G1iNQ8NcF1o4ohDaNR/c=
X-Google-Smtp-Source: AMsMyM4Pgc/HvJP9BbjHuQ5uDdadq9t55Qz8HJCvW1ilRTJc9DDAwsCu0hJEMU+5mIT/RIodbpC6gg==
X-Received: by 2002:a5d:4b05:0:b0:22b:ff0:fa9 with SMTP id
 v5-20020a5d4b05000000b0022b0ff00fa9mr5522328wrq.585.1663950582829; 
 Fri, 23 Sep 2022 09:29:42 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a5d6b42000000b00225307f43fbsm7870371wrw.44.2022.09.23.09.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:29:42 -0700 (PDT)
Date: Fri, 23 Sep 2022 16:29:41 +0000
From: Stafford Horne <shorne@gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <Yy3e9fTSv19Zxq9T@oscomms1>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
 <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=kN8uWDBiwaFsUSoRFjb1A8Bc4pOrnFi7Ne6GSVPssH4=;
 b=GowlVL0U9gtaU503Ob194naBMSYy7g58jaDIrF8Ah0I4GUkoAcN67B9feaZHJmzKuA
 irt2O8H4wzFh5QflqefOwY7BW/4bHCQhX5iknFMnFUj6RTVlBfqwTCsB5ccxebuFy8Xu
 38A8p02RQxiBhV1LsbJ7VWVEmm+li5RrYmCZtdv9x2mKx8g7v5kg5SLPgF9VSI/r/134
 L9nYMlulw+QVgs49En6ddycBWJ7FVkqw/hOc+CfoialOR+fHJA+SnMuUwNS+cHjwDsxb
 sE3jjZopyww5oCsX4CmawP920uHIOOVC9DKH8+EGUSjROmxiobB9/3RpBTYl3y7s6mj6
 o1Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GowlVL0U
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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
Cc: yann.morin@orange.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Sep 23, 2022 at 05:23:11PM +0200, Waldemar Brodkorb wrote:
> Hi Yann,
> yann.morin@orange.com wrote,
> 
> > Waldemar, All,
> > 
> > On 2022-09-23 14:13 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
> > > >     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
> > > 
> > > This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.
> > > 
> > > So, I'm not sure to make of this issue:
> > > 
> > >     ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
> > >     ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> > 
> > So, here are a few other tests I did (each independtly):
> > 
> >   - revert uclibc-ng from 1.0.42 back to 1.0.41 -> still fails
> >   - revert libusb from 1.0.26 back to 1.0.25 -> still fails
> >   - revert gpsd from 3.24 back to 3.23.1 -> still fails
> > 
> > So, from the look of it, the __tls_get_addr has alwaus been injected in
> > libusb [0] on or1k with uclibc-ng and linuxthreeads.
> > 
> > Now, is that a valid combo?
> 
> Normally I would say it is. May be this is an gcc/binutils issue?
> Maybe the uClibc-ng or1k maintainer knows more? Stafford do you have
> a plausible explanation for this phenomenon?

I don't, I haven't looked at __tls_get_addr for a year or more so I forget the
details.  I will have to dic in.  As I remember the symbol is provided by libc.
So perhaps the way libusb linker flags are getting set with uClibc-ng is cauing
an issue.

>  
> > Do we want to keep LT even for those arch where NPTL exists? I.e. when
> > uclibc is configured with threads, use NPTL is there is an NPTL
> > implementation for the arch, otherwise use LT. Thoughts?
> 
> It might be a solution, yes. But do not forget it is not that
> simple, as it also depends on the binary format used, as for ARM
> where pending patches for FDPIC will use NPTL and FLAT is
> Linuxthreads only. Sometimes it might be useful to use Linuxthreads
> to see if it is a NPTL bug or not. May be Stafford have an idea.

I am pretty sure uClibc-ng with NPTL enabled alone should "just work" and
provide the __tls_get_addr symbol, the gcc version might have something to do
with it, but it should be working since or1k was ported to gcc.  But again I
will have to play with the build to see where it is going wrong.

I will have a look at this over the weekend.

-Stafford
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
