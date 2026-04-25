Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69679FF885A
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 06:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 103738075A;
	Sat, 25 Apr 2026 06:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xp2n3Gc-gXMB; Sat, 25 Apr 2026 06:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250918077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777098307;
	bh=YKy1E6Jq4fFnasTN75wdS29zaeqZt1v/tVNVsC7P/k8=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYK5uAqt0SsCLj9z5sg8s6kJAfJ24pSh6S3kwjsK6nhNd2TpqWc/8HkDQqgYLm81F
	 OnjTaA+ERorA4z3odiQPwuNKXlYBnSjzL24LL/SpC55nWrraadaJgAxBhvLb2L949N
	 wkDjPExXKeK9/B4Xce5vHqRarXohgwFCKGhPE3kjhmW7qfDe3EBrhVKEhmnW5nnspm
	 lnNPiDEOSWBWPuNHEdgWJyufol0l6du3zawfP32neieqFlKsEct86vZm5bbIS30TDZ
	 aZXyvlD2/F2znF0ujEXJlej4aP777weNlT3Py4i6Isi+JmYxsLq7q567pO/1ZkDylB
	 mde5Z7n+EbKxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250918077D;
	Sat, 25 Apr 2026 06:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17828194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 06:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F171F405B6
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 06:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPEWYemzLtvv for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 06:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=maxin.john@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32809405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32809405AB
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32809405AB
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 06:25:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-38e7d984096so93988751fa.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 23:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777098302; x=1777703102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DZiKIi41u5B1VnTxvc4kZpmIpWvF0735k/fEUd5QX3g=;
 b=C46ZYqqqJDxqwmAXPPaXnZFpEfWfSd3wK3q9N9GD8EU3tCTIq3FdoRPFWfPyiNGteQ
 vZUv0B8YiyMCArVFpYY5xuyu1Bl55vsHfw189x6EJV0kil48YRl5eHVRlWag8PmLM1uu
 3bF5O0qi+6mvx61mu3UQP0D0iBzQNvkRZAuj+C1gxtJgfKyQxvdq00pwEUKL5p9m2sFz
 08gxM27xwfdYMeOVa/ZvrxtL8CB6D/fjVsCOUwAUR9fxL4NRvza3/Wne3qWDg73pPDpC
 rta7XkohUnECQah2G1igzcDTQOyAHX+sY59X4lRHzIzb3v0e0efaN9+y6b2Aqp3E9Ob1
 uZDA==
X-Gm-Message-State: AOJu0Ywbv+HipgJstGxYPO+4l6efEgOdkXjdfWbyoC5yFZOtP3IUyhyZ
 e8UL0KFPkdh8aq2lP1sHtTSyNr6sNoJhea/41eNZrXcSs25KYH3mRjC1
X-Gm-Gg: AeBDietQeNKzdEyzIwanOYSUIdgJhVUr/4sbo7tqq2ZuwRGVZmIfeyqQxaeLKbwq0O0
 2xcOVzUy2PM1UMDm042PUt6FX7DC8JjmAdrrCw+UUdZ9djc7m5a103kaouLvxsfmNSw4tG6t6Xp
 T7g0Ufh8TXzFCAdmhYbqbJc602yJNs9irOAzraM2wSGOGxAabadk5nRjvvgc8heED8ptNWG5qH4
 yd1vVirAXc8TsUoeSujHRLdR1MU8twEKYoUTWzIGito/SfHi2q9FB4r0ulkuy452lx1If2IE7fW
 2n4BEo0+jYRcUkwE+sULhiB1kikoCk/ExgE6YOTqF4It8J/yIEsoOvfLFqnzUK4P/RbLHh7brUP
 SscR0lp2Eqoj0xRHuMF5DjvuaBRO2p3u+qeL7abibeFpB252KjLLpC9SI6VKljutYheNFQIWIaO
 qDu9jwwaNJKtY+0uSR+hgNR3azApoF7wf2J+Q9D1D8VSItTCQbANv2Ek2dHszL4JZlGjDL1B2y6
 MTW1RNrDNH7
X-Received: by 2002:ac2:5df2:0:b0:5a4:17a6:9780 with SMTP id
 2adb3069b0e04-5a417a697a4mr8133345e87.14.1777098301363; 
 Fri, 24 Apr 2026 23:25:01 -0700 (PDT)
Received: from Thor.home (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi.
 [2001:99a:a58:9b00:9119:221d:45f0:de83])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb7200a4sm54105101fa.31.2026.04.24.23.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 23:24:59 -0700 (PDT)
Date: Sat, 25 Apr 2026 09:24:58 +0300
From: Maxin John <maxin.john@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aexeOjSZZAxX_yV4@Thor.home>
References: <20260423205432.1832982-1-maxin.john@gmail.com>
 <2388ac7c764d3229465afec26080faf9@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2388ac7c764d3229465afec26080faf9@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777098302; x=1777703102; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DZiKIi41u5B1VnTxvc4kZpmIpWvF0735k/fEUd5QX3g=;
 b=Q9A0/w9AiwUZcQARH3EFnhv91aaa1c9uVGK1N+w4+XnUJTLIBfeD5YH/C2CycKgSAs
 gOj8nmSJ4FvyMkg1HQdKN42DFQaP1L4Fy2K75220tJASJyJ5PzJi6VpnaJpfcianIjOf
 YCBD52xsrBn9yUB6cRGGjx4IkR5bQukrCPq9ohemZ8qsaGbsYQWUxWE2MkYfVd8YYKST
 juNWbN3p9WZRCq8xVPalryh8hDT2JEGD7uAGwLwRUBs2YmNOuCW1rL+25XM2NzrXbrO1
 DDZMwaR8IVoxzX3dUeZh1Nnqg0KjsbafpbklKV+W30GbzLs7op2g7DGzTa8SilJi21LB
 3oVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Q9A0/w9A
Subject: Re: [Buildroot] [PATCH] package/mdadm: bump to version 4.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Fri, Apr 24, 2026 at 10:45:21PM +0200, Julien Olivain wrote:
> Hi Maxin,
> 
> Thanks for the patch. I have few comments, see below.
> 
> On 23/04/2026 22:54, Maxin John wrote:
> > Drop upstreamed/backported patches.
> > 
> > Release mail:
> > https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/
> 
> Since this patch updates from 4.3 to 4.6, could you also include the
> announces for 4.4 and 4.5, please?
> For example:
> 
> 4.6:
> https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/
> 
> 4.5:
> https://lore.kernel.org/linux-raid/CALTww293wnLE2+eZsZ42oyNZhS_cc2agB4GNqTz8j3xiP0ALWA@mail.gmail.com/
> 
> 4.4:
> https://lore.kernel.org/linux-raid/20241213121438.7ed6a0fd@mtkaczyk-private-dev/
> 
> 
> > 
> > Signed-off-by: Maxin John <maxin.john@gmail.com>
> > ---
> >  ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 ---------------
> >  ...ts-h-include-for-NAME_MAX-definition.patch | 32 --------------
> >  .../0003-Create.c-fix-uclibc-build.patch      | 42 -------------------
> >  .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 ------------------
> >  package/mdadm/mdadm.hash                      |  5 ++-
> >  package/mdadm/mdadm.mk                        |  6 +--
> >  6 files changed, 6 insertions(+), 153 deletions(-)
> >  delete mode 100644
> > package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
> >  delete mode 100644 package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
> >  delete mode 100644 package/mdadm/0003-Create.c-fix-uclibc-build.patch
> >  delete mode 100644
> > package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
> [...]
> > diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
> > index 421f06d6953f..a6d7f98f0eb2 100644
> > --- a/package/mdadm/mdadm.mk
> > +++ b/package/mdadm/mdadm.mk
> > @@ -4,9 +4,9 @@
> >  #
> > ################################################################################
> > 
> > -MDADM_VERSION = 4.3
> > -MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
> > -MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
> > +MDADM_VERSION = 4.6
> > +MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.gz
> 
> This MDADM_SOURCE line is no longer needed and can be removed. This is
> because the .tar.gz name is the default value set by the package infra.
> 
> > +MDADM_SITE =
> > https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/snapshot
> 
> Also, since commit:
> https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/README.md?id=3f90be087fa62c0c7ed76c2ac26752f0ac3a89e7
> 
> The README.md mention:
> """
> Effective immediately [Github](https://github.com/md-raid-utilities/mdadm)
> is the primary
> location for **mdadm**. Use pull request to contribute.
> """
> 
> Could you add this information in the commit log and change and
> change _SITE to use this primary github repo? For example, use:
> 
> MDADM_SITE = https://github.com/md-raid-utilities/mdadm/archive/refs/tags
> 
> 
> >  MDADM_LICENSE = GPL-2.0+
> >  MDADM_LICENSE_FILES = COPYING
> >  MDADM_CPE_ID_VALID = YES
> > --
> > 2.47.3
> 
> Could you send an updated patch please?

Thanks a lot for the review. I will send a v2.
 
> Best regards,
> 
> Julien.

Best Regards,
Maxin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
