Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC46C4167B
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 01:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2726E60BCF;
	Wed, 30 Nov 2022 01:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2726E60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQRIxAq3PwkZ; Wed, 30 Nov 2022 01:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4453A60B3C;
	Wed, 30 Nov 2022 01:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4453A60B3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49C3E1BF38B
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 01:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C8E60B3C
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 01:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C8E60B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61gAlzUpW9Pl for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 01:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2337E60B13
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2337E60B13
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 01:18:16 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id h33so9711924pgm.9
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 17:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/kCTltWHcsvAnCWZTxTiOQyXFjCPY+fp8xA6kZWW6A=;
 b=vtJqPohZBFV+LrZSsqYwQN03vj0WfdhVIhFDOYqOHh4AbTYrbfuV1SwczTME0Jgi/C
 56R6cZ2tZBcsL3nnmpaSDageZM/RnpZKADYPC2rG9B3XzSDidLM6GSrY1mNV0upbiW8g
 Uh01H0xc41YhwzWbwqx1Bar/l/MJSXQ5J6ngI67bO36OlSa0josFzJLqv32o9dkNSNv+
 14WoedfpKfUszDq6LpQsnPl6oOrpf+olnUDCePVplUTfNU6M/nGTUfUOiZFCx6nFsteg
 Q+S4L+kYBHGHJYwZSH11jsUcmwj4PGW2gMR60R6l8Hlc/b7/LEwpDbuoBGoYG8+DI5RL
 Chdw==
X-Gm-Message-State: ANoB5pk68uJn0/XZQfCJ7PfJewFfF0R4LePMzXMFhKkxixbbPCMQKBYQ
 URAtVhTKqmQsRrDC3ZLMl+83af44Ce7ESA7hC8k=
X-Google-Smtp-Source: AA0mqf4mY7Sw6nT8ne10vVkefOZ2Yb2UYImEkNTX4G80ftTuKpTTLojEOAWuyDUVfTNfaUVtz3+DXPZeFcf48Q3e/WY=
X-Received: by 2002:a62:f24e:0:b0:572:149c:e278 with SMTP id
 y14-20020a62f24e000000b00572149ce278mr61482407pfl.8.1669771095331; Tue, 29
 Nov 2022 17:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <c29e48e0-d7e7-3f61-082a-b7b3fba976f4@mind.be>
 <CADvTj4pwrZziwevuFmhGwMoxjV4JV_T3Rw=2+eHtDJo1erFcOg@mail.gmail.com>
In-Reply-To: <CADvTj4pwrZziwevuFmhGwMoxjV4JV_T3Rw=2+eHtDJo1erFcOg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 29 Nov 2022 21:18:03 -0400
Message-ID: <CADvTj4qTkU1UWnNTKZc9eDut_dLYf1SFotYuTDfE0K4yr4-OMA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/kCTltWHcsvAnCWZTxTiOQyXFjCPY+fp8xA6kZWW6A=;
 b=G5BM95GAxRpIAr+vwiH+QBlQL9y3P0W3QBj8h2wVzvZqve44I9Batk/kxX6Rgpp83d
 Z5NLVwLAFdRa/zWZEK6NA7xdgA0yXeLb5yPNnrcpOnhk5pgUeHa8du3KRcx6I6Kqbj7g
 fZFtHEoOdaf40INZsKFTf0Oqs6lBpMI5Em6nzSV8SCqeuw/y588bJ8iRBhGcMiWHj08Y
 CsfyDoCxoy+cfvu87/+SuazLwOTZCVcjEVNe6efK+yKH1Sftihk1OgD/3wD7uC2qKBio
 F603bwfpYPva1fE3Y/9LL6D9+UJ58V6k9KLaH2Hm3uIacqhC5sgBcX3iXpn5GIpN1J9V
 w9IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G5BM95GA
Subject: Re: [Buildroot] [PATCH v2 1/8] package/flatbuffers: build position
 independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Nov 29, 2022 at 8:42 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Tue, Nov 29, 2022 at 5:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >
> >
> > On 28/11/2022 18:58, James Hilliard wrote:
> > > The upcoming tensorflow-lite package requires flatbuffers to be
> > > built with position independent code.
> > >
> > > Fixes:
> > > /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC
> >
> >   This looks like something that would happen any time you try to link
> > flatbuffers - so it should happen for kodi as well. In that case, the patch
> > should be applied to master. Can you check if this is the case? You
> > unfortunately can't rely on autobuilders, kodi has so many dependencies that it
> > (almost?) never gets built. There were 91 configurations in 2022 that included
> > kodi [1]; all of them failed, and I think all of them failed before reaching kodi...
>
> I tried building kodi manually and ran into build issues as well, so unclear if
> this is needed for kodi, but I think it's probably safe to apply to master.

Fixed the kodi build issues:
https://patchwork.ozlabs.org/project/buildroot/patch/20221130010306.3797360-1-james.hilliard1@gmail.com/

This doesn't seem to be needed for kodi, I did verify it does not cause any
build issues for kodi so should be safe to apply to master.

>
> By the way I think all those autobuilder configs were generated by tweaking
> kconfig probability with this patch using a local override:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/
>
> I think that plus shuffle mode might allow for coverage of packages with more
> dependencies, some fixes related to shuffle mode:
> https://patchwork.ozlabs.org/project/buildroot/patch/20221016193014.3384022-1-james.hilliard1@gmail.com/
> https://patchwork.ozlabs.org/project/buildroot/patch/20221019234655.1097686-1-james.hilliard1@gmail.com/
>
> >
> >   Regards,
> >   Arnout
> >
> > [1]
> > http://autobuild.buildroot.net/index.php?date%5Bfrom%5D=2022-01-01&symbols%5BBR2_PACKAGE_KODI%5D=y
> >
> >
> >
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >   package/flatbuffers/flatbuffers.mk | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> > > index 9d286bf9e1..487d85ee1f 100644
> > > --- a/package/flatbuffers/flatbuffers.mk
> > > +++ b/package/flatbuffers/flatbuffers.mk
> > > @@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
> > >
> > >   FLATBUFFERS_CONF_OPTS += \
> > >       -DCMAKE_CXX_FLAGS="-std=c++11" \
> > > +     -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> > >       -DFLATBUFFERS_BUILD_TESTS=OFF \
> > >       -DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
> > >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
