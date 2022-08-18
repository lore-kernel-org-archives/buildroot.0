Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09CEC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 23:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D394408DC;
	Thu, 18 Aug 2022 23:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D394408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUptdOZ-XBv1; Thu, 18 Aug 2022 23:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DBC400A8;
	Thu, 18 Aug 2022 23:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12DBC400A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53E5F1C116E
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 23:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B3F5401DF
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 23:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B3F5401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6aX3itOdq6vc for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 23:23:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D6C40129
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17D6C40129
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 23:23:03 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id r141so2216877iod.4
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 16:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=DhpA/lb4hvN114w6scQz3tZxxIoQCO6Yu761DcTkjFY=;
 b=MIAziSFyNWkaAOEBoCnJxyeKP07npLq4R9VSlZEtHKVgSV+TKc+Z4GFcK106gNP5zE
 3R5zRuwWViVX7XB+IC1xqIcTS5urWN+MMfzKTtg0QVQJwWYEB/O/5p2bJWBJRT9MEAwP
 QhUUjERVjTJ+y/GpRO9fD7E3MAkO3oc52NuGquaxVzx1B4EYbiU7W2tCjhgyxNZ4X/X2
 bxJoRnt7vIIWH0NOjoLMSjzmrL+2pOndoGnFe/mL2sf5+ngDoY6Gdfolp6KM8SiFITF6
 PdlI3LaTpGavkQ1aSt52srqxbIEAJ2nDphYWVVwHRPWigldeIJm9E52o6G/EO/64V6xH
 Qm+Q==
X-Gm-Message-State: ACgBeo2AR5XOd9w/8MEqbPKmP8Z1C4IUxfc4IPZ2ssi4v/96I2p5MfmB
 ypGHOwg0w40zlF5u0yo4m6iQwV6+iVTQMps=
X-Google-Smtp-Source: AA6agR48y8z3cs+/yAji/SBRbf1sE+Q4SDHSC5ApOG00kGrSiUnMvtK+RmzKuX75PYLJbt01A5yuTA==
X-Received: by 2002:a05:6638:430d:b0:343:69f4:2016 with SMTP id
 bt13-20020a056638430d00b0034369f42016mr2377483jab.90.1660864982990; 
 Thu, 18 Aug 2022 16:23:02 -0700 (PDT)
Received: from bixby.lan ([76.130.90.80]) by smtp.gmail.com with ESMTPSA id
 f1-20020a02a101000000b0034377bca601sm1094487jag.119.2022.08.18.16.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 16:23:02 -0700 (PDT)
Message-ID: <4e7927d6257e67f66cff14a7b2a86fd395931518.camel@egauge.net>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Thu, 18 Aug 2022 17:23:02 -0600
In-Reply-To: <4b4140d7-6242-765c-8bf7-c27740764413@mind.be>
References: <a616e2b3d0edf64b98a2114dad8086fcdd1088f4.camel@egauge.net>
 <4b4140d7-6242-765c-8bf7-c27740764413@mind.be>
Organization: eGauge Systems LLC
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egauge.net; s=google;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc;
 bh=DhpA/lb4hvN114w6scQz3tZxxIoQCO6Yu761DcTkjFY=;
 b=CvmoJ5I8b6E9bA8317zthJaP2/Wk41YNyp18YnObZ+FrC6eNwPkdcVh48Eqj5UIJ9e
 GsGBicvyOIsKjr7rU1dcKndprzOi6K5I8ASWwT5IuO68OyJYEJNM4FpvNLkaR+604tYL
 xNo0kNjdAmOQvV2g4iQaLw6EaIAtWjRRv7s22J8dFquLVqRnBxup9C52GlnL7Ko0tpOx
 dZ42w99NjQKFrucGUHk6pu6OsCgGyYHUxLUwcca28S24FcNNxldL795nxXfs+t9fbDGt
 HHQl9FnjhvpYdXqJmBVJMolsTD6UcQs+5FleDPLg2HtPAGy5uNBsWH8EJ7J+uKIQCqUD
 XfhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=egauge.net header.i=@egauge.net
 header.a=rsa-sha256 header.s=google header.b=CvmoJ5I8
Subject: Re: [Buildroot] add support for generating multiple UBI images
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
From: David Mosberger-Tang via buildroot <buildroot@buildroot.org>
Reply-To: David Mosberger-Tang <davidm@egauge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout,

Thanks for the quick response.

On Thu, 2022-08-18 at 23:10 +0200, Arnout Vandecappelle wrote:
> 
> On 18/08/2022 21:02, David Mosberger-Tang via buildroot wrote:
> > We have a need to be able to support multiple NAND devices with distinct flash
> > parameters.  For example, one device uses an erase block size of 128KiB while
> > another uses 256KiB.  Depending on supply-chain availability, we may get boards
> > with one device or the other.  Because of this, we'd like the ability to create
> > multiple UBI images with a single "make" command so that we can be sure all
> > images are always up-to-date.
> 
>   That situation sucks pretty hard... It makes upgrades a bit tricky because you 
> have to choose a different upgrade image too depending on the hardware...

That part we can handle fine, fortunately.

>   My advise would be not to use ubifs. Use squashfs, which doesn't care about 
> the LEB size.

Ah, that would solve the problem.  I don't think it's a viable option for us at
this point though.

>  Writeable rootfs is generally not a good idea anyway. With 
> squashfs, you still have the problem for ubinize, but ubinize is anyway just an 
> add-on for the simplest case; you can easily add a post-build script that runs 
> ubinize twice.
> 
>   Also, as an aside: if you don't want to patch buildroot itself, you can also 
> add fs options to BR2_EXTERNAL.

Got it, thanks for the suggestion!

> > To accomplish this, I modified the build environment as per attached patch.  The
> > patch is relative to version 2017.02.5 and I see that, in the meantime, ubifs.mk
> > and ubi.mk have been split into separate directories.  Thus, the attached patch
> > won't apply directly.  However, I thought I'd share it as a basis for discussion
> > in case anyone else has similar needs.  I'm sure there are better ways of
> > accomplishing the same, but the patch works for our purposes and, if this is of
> > interest to others, I'd be happy on rework it for the latest buildroot version
> > and incorporate other feedback.
> 
>   I think for upstream Buildroot, the patch is a bit too complicated and the use 
> case too rare and specific. In addition, in its current form, it makes the usual 
> case less user-friendly.

Makes sense.  And if someone does have the need for it, hopefully they'll find
the patch in the mailing list archive.

Thanks and best regards,

  --david

> 
> 
>   Regards,
>   Arnout
> 
> > With the patch applied, the NAND flash parameters can be specified with a single
> > config option BR2_TARGET_ROOTFS_UBIFS_PARAMS.  It expects a blank-separated list
> > of triplets which specify the Logical Erase Block size, the minimum I/O size,
> > and the Physical Erase Block size in bytes (as hex strings).  For example, with:
> > 
> >   BR2_TARGET_ROOTFS_UBIFS_PARAMS="0x1f000-0x800-0x20000 0x3e000-0x1000-0x40000"
> > 
> > You'd get two images:
> > 
> >   rootfs.ubi-eb128k-pg2k and rootfs.ubi-eb256k-pg4
> > 
> > with:
> > 
> >   Logical Erase Block size: 0x1f000 and 0x3e000, respectively
> >   Minimum I/O size: 0x800 and 0x1000, respectively
> >   Physical Erase Block size: 0x20000 and 0x40000, respectively
> > 
> > (The patch assumes the subpage size is constant across the images.)
> > 
> > Best regards,
> > 
> >    --david
> > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
