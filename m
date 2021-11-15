Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62746C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 17:11:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D321363253
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 17:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D321363253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AA6740224;
	Mon, 15 Nov 2021 17:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3EIQ1F08lIU; Mon, 15 Nov 2021 17:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB0540211;
	Mon, 15 Nov 2021 17:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 691951BF40F
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 17:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 655FE40211
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 17:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKWo1onxTtrW for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 17:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E03540209
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 17:11:32 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id n66so36117390oia.9
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 09:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ezEmuxE1o2QXYibs8wPGT0/01Ifj34DqgH95XgYLdFw=;
 b=qSsz2HC2GSwcg+4slKF1MeVxw9eTvFGpm9Z/AIDUWqjfqeTWU0MCsaUpWqXMyKlsTW
 CSuWxHOAca7CoA7jK0AIXNP+rJ+yVFBVFYAe/+q6hKDNBxPRAT10IceRYRL0g+vizyGU
 +kJ8CwCTQE8WCyTcXZ1/WHv02xJIH3Z5ZPWyi/5KC/EX9i/nLdF46HtDE24WRVUvArzM
 BGDx2Is+lS9qDTSWpCJSTNTMcYFO5eAayF3QE41648YQs5Dv/4uepfPkPrf71VtvEN1Z
 iOlvMzPAMveFmfZPPwKRQf6wVnlXZzPEOFuusWBmEYXKXOhC71DdkZUsnRgPvZ+iVDnD
 ycew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ezEmuxE1o2QXYibs8wPGT0/01Ifj34DqgH95XgYLdFw=;
 b=5ypcTuhSXxISBfqeW42JOnQeaQ6ujBe24v/oaVg/AHpNMg9kJqVc3VOE2/aX/IeUmG
 SqNcxf3lg9cG4uoAHPGkhQUFDcA24D/i0+xTqplL5jgs5rsCqND7KOW35NMeI2pCuqCk
 AxGPxMB54Gdumt3B5FypxD0pYgPtu8xhWKiLCQGbDIqerHJGfdvZ/QeDLr3TYwYWz6Ax
 I8BY7IrmeEZg133tzCZNiDmPRLgSuJgR/A3gxDXrG2moHlxBspWPuaKZ5UwMv37CNlog
 P+FH3W3Iy/RAmb/b0dkTUQzbVcSdncylHe/KEFL9esylxFi0KlfWzjLip1Z4vF6sICUV
 CJ/A==
X-Gm-Message-State: AOAM532V7pqyL2hn95I+dcTiSCVFgxEIFbbw3D99fpu6RQk2Z/rjm3VB
 suVBhf/kfCskULEaqxRIcYDnG6ViNn/1wA56fJE=
X-Google-Smtp-Source: ABdhPJzbtz4vA1ubobzh+djtXkWX9ELV7VOYclgFayfWlJ1TZifUH9cdzURHgsJlM8owgAtTMGwMB9DTjxAE09yK7oQ=
X-Received: by 2002:a05:6808:171c:: with SMTP id
 bc28mr47046201oib.18.1636996291382; 
 Mon, 15 Nov 2021 09:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
 <20211112232739.6211b3b0@windsurf>
In-Reply-To: <20211112232739.6211b3b0@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 15 Nov 2021 09:11:20 -0800
Message-ID: <CAFSsvmqcOr2M3iuNkRSWMMpAWVXb8_TXmLOp5dZyzdKoovLeng@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: add girdir to
 glib-2.0.pc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello;

On Fri, Nov 12, 2021 at 2:27 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I'm adding Adam Duskett in Cc of this one, to get his review on this
> GOI related patch.
>
> Thanks!
>
> Thomas
>
> On Fri, 12 Nov 2021 19:08:02 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Add girdir to glib-2.0.pc to fix the following build failure with atk,
> > gcr or harfbuzz:
> >
> > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> > Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> >
> > This build failure could also be fixed by removing our update of girdir
> > in gobject-introspection.mk but this will have side effects as gir files
> > won't be installed in the correct directory. So patch glib-2.0.pc
> > instead.
> >
> > Note: autotools-based packages have already been fixed by
> > https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
> >  - http://autobuild.buildroot.org/results/67a47386019c2a700df348ad6846064e0950e87b
> >  - http://autobuild.buildroot.org/results/2c6a4470542af574f9407fa5867f0408ec2b4880
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...eson.build-add-girdir-to-glib.2.0.pc.patch | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> >
> > diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> > new file mode 100644
> > index 0000000000..7eeecbe336
> > --- /dev/null
> > +++ b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> > @@ -0,0 +1,33 @@
> > +From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Fri, 12 Nov 2021 18:01:05 +0100
> > +Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
> > +
> > +Add girdir to glib-2.0.pc to fix the following build failure with atk:
> > +
> > +/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> > +Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + glib/meson.build | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/glib/meson.build b/glib/meson.build
> > +index f78f32969..6c5486699 100644
> > +--- a/glib/meson.build
> > ++++ b/glib/meson.build
> > +@@ -377,6 +377,7 @@ pkg.generate(libglib,
> > +   subdirs : ['glib-2.0'],
> > +   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
> > +   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
> > ++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
> > +                'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
> > +                'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
> > +                'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
> > +--
> > +2.33.0
> > +
>
I am wondering if this could be upstreamed by adding a meson option?
Other than that, it looks good to me!

Adam
>
>
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
