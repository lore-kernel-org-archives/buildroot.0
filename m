Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD29AC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7560D404CC;
	Wed, 27 Jul 2022 07:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7560D404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIxZ2Vw7Ktty; Wed, 27 Jul 2022 07:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00858404AA;
	Wed, 27 Jul 2022 07:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00858404AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1914F1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D0A60ACC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D0A60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zldoh6eYsTaJ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAA7560AC0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAA7560AC0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:18:51 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 v40-20020a056830092800b0061d0ac9ebb2so4100747ott.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 00:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06vog0A1cyad8hUsZc2pTRn7nn+qVTaHUenTM39Vido=;
 b=uZjyFzrDosQDgkz+RLSN9RaSYvRpTN7U5F/gozgMHNsfwxHounfpaivQ3jmAKVYSwK
 fn/n8o/AlklUAnAHRHtcSvIHkqS+9uNC7Wa1a9bvss2cO3RUV7/Q9j5+IiZSgISokwlI
 JdLBVmMeIxHqR1HmePRDwUfF9EnX5zqQUWQCiQkxyISubWMLqsv1e9JD01Hkh4L5Ccg1
 5nFjDKw10gyXrO4+hSmooU6qm9hPI5IX9VfSBNpAy8OM2aY8oU4caAEgHgs3pp9xQm6/
 ZBORrKZih0MlF+INJ2zEnpvIrvn9trVDps+B7FBQ1vxfi7cOd6g67h2uLSrnZ7RIW2bc
 q1kA==
X-Gm-Message-State: AJIora+pEUFdN85vrwz2toqJ7keT3mGGr0+4J4JYkCSQfOus8P0bi8TB
 /6kwMXNLg3z7/ICSHHvJoGl1co4LPviLOLEl+Os=
X-Google-Smtp-Source: AGRyM1v2EynOgtQXPTzcWhEcdFdfV0zZsyhuwFcWreTZlMUZ4PZvFZxHUIlUW0wgc5rrkkW/sDnvC8MbyYQsf5QMi9A=
X-Received: by 2002:a9d:76c4:0:b0:61c:bddb:364d with SMTP id
 p4-20020a9d76c4000000b0061cbddb364dmr7719948otl.371.1658906331000; Wed, 27
 Jul 2022 00:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
 <20220726044425.72570-2-james.hilliard1@gmail.com>
 <20220726082503.48ce118f@windsurf>
 <CADvTj4ob3JZmsB=jdW3kM4mTQ30jsDXWTOEG5FUG1b=vwfRB8g@mail.gmail.com>
 <20220726090755.2ec1a4a8@windsurf>
 <CADvTj4oay+SKPqUojKnuoG-XKk7D+GaiAgcT4Pj-mCic8SKXhw@mail.gmail.com>
 <20220726193402.4df88a69@windsurf>
In-Reply-To: <20220726193402.4df88a69@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Jul 2022 01:18:39 -0600
Message-ID: <CADvTj4r_qs7B5nzD-FAE9=LGqK8WzvizoNRNXWQ-ugPKh7A9Ww@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=06vog0A1cyad8hUsZc2pTRn7nn+qVTaHUenTM39Vido=;
 b=U8+lLYsSKZLjy6S1nPLboBpBVGFperCj2cXi+BwQgbaGo8yjSOMGDmaPGma4l6YeSg
 DOuQ5UzHajfmU1OMGh38jdv4JXxH5/OXRoSjqqSkzs2mLmzQhpBNgY41Cr0TBJ36crvt
 n6zqG/JCTEV3t3LGpomHkIjIPJcfvgS5JHOR+gWN0Sn0Y+7sukxvVwrIN94xkm0LioWW
 +mCijhHh/ILPMGtNBrTGJ0gQ3LyASuSgHC4yL1aI5Kh0GWZeVktTLYy4KL3W+1mr29OX
 umH3j/RQlzfW3j3sPnF+/F4/UyaHfr+Hz3a840CnG/xqit6aZZ8fhWvEwi3/Q7ykvcLX
 228A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U8+lLYsS
Subject: Re: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 26, 2022 at 11:34 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 26 Jul 2022 11:26:50 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > prefix is the path where the software will be located when executed.
> >
> > We install to the package's per-package directory $(HOST_DIR) but
> > we don't actually execute it from there AFAIU.
> >
> > Since the execution location changes for each per-package build I thought
> > we wanted the prefix to be independent of the absolute installation path.
> >
> > >
> > > DESTDIR is here to divert the installation.
> > >
> > > For host packages, we use prefix=$(HOST_DIR) and no DESTDIR because the
> > > software will be located in $(HOST_DIR) when executed.
> >
> > But the $(HOST_DIR) it's installed to is not the same $(HOST_DIR) it's executed
> > from when BR2_PER_PACKAGE_DIRECTORIES is enabled, at least when
> > it's executed from a reverse dependency.
>
> That is indeed true, but this usage of prefix/DESTDIR is also what we
> do in CMake, autotools, and everywhere else, and it did work fine until
> now with Meson. I wouldn't want Meson to stand out from
> CMake/autotools, unless we have a solid reason to do so. It's not clear
> why switching to calling meson to do the build/install requires this
> change.

Seems to work if I make sure all the prefix based paths are under $(HOST_DIR):
https://patchwork.ozlabs.org/project/buildroot/patch/20220727071557.3434892-2-james.hilliard1@gmail.com/

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
