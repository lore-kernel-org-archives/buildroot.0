Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C164C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135C980E97;
	Fri, 12 Jul 2024 19:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbPqfoB_uW93; Fri, 12 Jul 2024 19:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF15780DDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF15780DDD;
	Fri, 12 Jul 2024 19:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45AB21BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31BC980DDD
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbkKx-p7qDg9 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18C9880D60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C9880D60
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18C9880D60
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:08:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so32321331fa.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720811332; x=1721416132;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gdEvaHJ4gG28o/OMF+69/4ubt0KX/gOFfVcY4cSSRbc=;
 b=pDEYSxH0a0QXCix1sxFfrTtrrYvzldpzf6MAQwYIoNeKnsV2PGVE+/IIGLNEqisOzc
 YIC+x58PNPFSVjQFLzmCCDRLNr9WmgfzyxBipgm01kgQ99I33yE889ekOOgzox6vXl2N
 ha6BKoOC/4en+2QFwtJ/IqxBUfef9xkjkPAmoWMrKN6XP3Zi2q6gzwRLboTzGtRMEv0U
 X40Ep3NxOyaeV7x7tXrJH1pryBIM6CoQAZGQSxIcQMA3VvFP6sSclCxBsrs9557OLsLZ
 Nmt8ptXhWwqsXPy+8pNmnS5Eo+LF3zkpZoigy6UnJ4k8/Fw/ra0mPkApx+SU9xdqNH2D
 i7Qg==
X-Gm-Message-State: AOJu0YwLyddgZTHyOVXY1+Yn+xZoqN1cABvo9JjRy4UqGxdQaqswjB6r
 BMM3w2Bm9RMEnuvd+A0ShyK1a5fd+gbATcGs3wXfpgcn0a4kDAuj0BSFORnHmYJQ7K9vVYxFJBA
 3Jj+WTB9XNITL6bievg8pAwGLaDo=
X-Google-Smtp-Source: AGHT+IG88D+1xn34vEgYLCK6jy0alsxrU86dNglCi332VEDYr5PWTZsGYm5rIfsv/jiTWIiNbJ/rDsjlcKwX3wqh7ak=
X-Received: by 2002:a2e:9156:0:b0:2ee:594d:f54b with SMTP id
 38308e7fff4ca-2eeb318df0emr83260611fa.47.1720811331543; Fri, 12 Jul 2024
 12:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
 <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
In-Reply-To: <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 12 Jul 2024 21:08:39 +0200
Message-ID: <CAEyMn7anNnq2aH9EViFjY+ihnmwCXaWXMs9sJAYFBpH=q_WT+Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720811332; x=1721416132; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gdEvaHJ4gG28o/OMF+69/4ubt0KX/gOFfVcY4cSSRbc=;
 b=jkEmxDA+OWm0UOwGSIhFX6lVsOkHimvpgbRMw5eb2fjXlVbV4YdoA/cJyfYKRXEFqn
 M1Car4nJd+QAMjqS5n0nflvii5+N24A7cJPZMETojs36Zl2IvhfuLonmP4XlOroDs4vt
 qCV+cIUsF6C/YVlZQ8f9O8+9ylhHjHmGOfiSWwPih0WoJhluwV3QBMahAnYt2PwGkU2G
 NbV8/7N/uu2F2YmCKAgQMXGNplVrAUofPXsz9EeEAmdCOEnxXW+Ek1A8DJeeAaPD4W8K
 7niP6iDrR33rwBCjyDDuAQ6jEd1yEHBL51V0JorgMlIvGhKkKdKuM+Q0xl8AibEk4eOs
 fW6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jkEmxDA+
Subject: Re: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

Am Fr., 12. Juli 2024 um 10:38 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>   Hi Heiko,
>
> On 04/07/2024 14:34, Heiko Thiery wrote:
> > This package is used and required for ccache update.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >
> > v2:
> >      - on change
> >
> > v3:
> >      - fix BLAKE3_LICENSE_FILES and corresponding hash values
> >
> >
> >   DEVELOPERS                 |  1 +
> >   package/blake3/blake3.hash |  3 +++
> >   package/blake3/blake3.mk   | 20 ++++++++++++++++++++
> >   3 files changed, 24 insertions(+)
> >   create mode 100644 package/blake3/blake3.hash
> >   create mode 100644 package/blake3/blake3.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 90d1a111ab..46fe3cd2e1 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1359,6 +1359,7 @@ F:      configs/kontron_bl_imx8mm_defconfig
> >   F:  configs/kontron_smarc_sal28_defconfig
> >   F:  configs/kontron_pitx_imx8m_defconfig
> >   F:  package/altera-stapl/
> > +F:   package/blake3/
> >   F:  package/ipmitool/
> >   F:  package/libnetconf2/
> >   F:  package/libyang/
> > diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
> > new file mode 100644
> > index 0000000000..2a00d19b02
> > --- /dev/null
> > +++ b/package/blake3/blake3.hash
> > @@ -0,0 +1,3 @@
> > +# sha256 computed locally
> > +sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
> > +sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
> > diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
> > new file mode 100644
> > index 0000000000..76e4e32e7a
> > --- /dev/null
> > +++ b/package/blake3/blake3.mk
> > @@ -0,0 +1,20 @@
> > +################################################################################
> > +#
> > +# blake3
> > +#
> > +################################################################################
> > +
> > +BLAKE3_VERSION = 1.5.1
> > +BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
>
>   Why do you put the refs/tags here? It was necessary in one or two packages
> because of a conflict with a branch name, but I don't think that's the case
> here. I admit that there's a certain elegance to making it explicit that we want
> a tag, but then we really should be doing that everywhere...

You are right. I changed it to:
BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))

I think this is what you expect.

>
> > +BLAKE3_SUBDIR = c
> > +BLAKE3_LICENSE = Apache-2.0, CC0-1.0
> > +BLAKE3_LICENSE_FILES = LICENSE
> > +
> > +# We may be a ccache dependency, so we can't use ccache; reset the
> > +# options set by the cmake infra.
> > +HOST_BLAKE3_CONF_OPTS += \
> > +     -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
>
>   Why is this needed? And is it even a good idea? In pkg-cmake, this is defined
> as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any
> ccache. In fact, this changes it from "as" to "gcc" which I expect is not
> correct at all...

When not defining that I got the errror:

[ 25%] Building C object CMakeFiles/blake3.dir/blake3_portable.c.o
[ 37%] Building ASM object CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o
[ 50%] Building C object CMakeFiles/blake3.dir/blake3_dispatch.c.o
Assembler messages:
Fatal error: bad defsym; format is --defsym name=value
make[3]: *** [CMakeFiles/blake3.dir/build.make:117:
CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o] Error 1
make[3]: *** Waiting for unfinished jobs....
[ 62%] Building ASM object CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o
Assembler messages:
Fatal error: bad defsym; format is --defsym name=value
make[3]: *** [CMakeFiles/blake3.dir/build.make:130:
CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o] Error 1
make[3]: Leaving directory
'/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
make[2]: *** [CMakeFiles/Makefile2:83: CMakeFiles/blake3.dir/all] Error 2
make[2]: Leaving directory
'/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
make[1]: *** [Makefile:136: all] Error 2
make[1]: Leaving directory
'/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
make: *** [package/pkg-generic.mk:283:
/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/.stamp_built]
Error 2

So when changing to use gcc instead of as it works.

I tried to build on my host and see that cmake sets the var
"CMAKE_ASM_COMPILER=/usr/bin/cc". When overwriting it with as it also
does not build.

-- 
Heiko

>
>   Since you said you could respin this weekend, I will mark as Changes
> Requested, but it's possible that your respin only has some commit message
> changes of course.
>
>   Regards,
>   Arnout
>
> > +     -UCMAKE_C_COMPILER_LAUNCHER \
> > +     -UCMAKE_CXX_COMPILER_LAUNCHER
> > +
> > +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
