Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48DAC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 17:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C04882C7C;
	Wed, 21 Sep 2022 17:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C04882C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZzv4Gi_z9G3; Wed, 21 Sep 2022 17:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5885081B9A;
	Wed, 21 Sep 2022 17:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5885081B9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19BD31BF4D7
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 17:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9755607FF
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 17:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9755607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eM5Cw7jaEGv for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 17:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB9386006A
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB9386006A
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 17:38:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a14so7905932ljj.8
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 10:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tCpFlb8nG8oLAJkDUXXN7h9fQt6aNDMwtWahmHKNv8E=;
 b=crwpHbBRwyx2KApR0hPLYJdDMfEgqKQaVNKpr83CI6fk/qGFNPHn/D9zFDuU+jdsWi
 fuxWImSxnfihWBTBnxXwc7dGv1/FBwweipFEEkbpgPoZiSATeA7g7WM/Q8F2OBguax4V
 w0ssrkm8Ld+b66DXEhHh1PG6Lc4WH3cRdWOEVncJ0NjAyHmYXhwQ6/iSZ8riPPb3WSvQ
 PJzyaAryFwekOUIJAuPwbxEt7uZKC2wMFpgH10FX97ds1/m45JJgyEZQIUcTI/nmX19p
 zAjOwaOWrVO07q92G9LAQ6uJER7HzupWZeR4k5BzilCrWE6SJn3gLavSQNWS5SC/hff8
 9d+w==
X-Gm-Message-State: ACrzQf0DB+kpXjpe/GRIOP+RolPQxOy6kCzEH/dXWNc5myGWRLQ6ZLtw
 QkzMylnsVIjQj7STeHGC0y9bvHM6isPJydEKWiQ=
X-Google-Smtp-Source: AMsMyM7cY0BNMR9NMUBrZ5wWXjaej/OX+JgIGtPqGxnMPAAfF3Jd13UCA0YNjXIPA3R80kcwY9Tbb3YuldfSKmUULXk=
X-Received: by 2002:a2e:9ed1:0:b0:26c:252a:91aa with SMTP id
 h17-20020a2e9ed1000000b0026c252a91aamr8947055ljk.349.1663781896261; Wed, 21
 Sep 2022 10:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20220814123748.167ebb02@windsurf> <20220820112842.7bcd12f2@windsurf>
In-Reply-To: <20220820112842.7bcd12f2@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Sep 2022 10:38:04 -0700
Message-ID: <CAFSsvmq9vNbvrORfhtv8HvCtq20xrtZg9a4Autt2XDNGamUKkA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tCpFlb8nG8oLAJkDUXXN7h9fQt6aNDMwtWahmHKNv8E=;
 b=mo9T5J4s6dTQ8PVkqfkGjwLGGtgMT8SCw2YK+q7DNAhaa8X60XQm9kGZu6RsvG8DRk
 nNd0cq7jz18PQx7g0PCAbcC+ADOV1aCpOU8PN8ggBN0xdr+VhOLXnGi2zQFRYZutjybT
 D+qUfxlkoT94ARjOQslRJMVpIsdpIvLEKZws8Tt6X7IDgAe0Wgy/JgPoGLu30VSZIdW8
 9C27xSbYRkQpz82jtHhaIrzzX+oeimuHoJNa2oNu5dGpQgNqkbWfOr2DNzTUqHGDcnQg
 uhSxswaHQRJznFsHQIO3gz90DvtoJJhG4YhbIyuHkHHUMhV3tgWcbUw4Yy0sr2zmxVtL
 l0Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mo9T5J4s
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello;

The above patch (and the existing patch currently in package/poppler)
are both in the latest version of poppler, so this is probably safe to
apply.
However; it may be more advantageous to instead simply bump the
poppler package instead of applying more patches.

Thoughts?

Adam

On Sat, Aug 20, 2022 at 2:28 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Fabrice,
>
> Do you have some feedback? Or perhaps Adam?
>
> Thanks!
>
> Thomas
>
> On Sun, 14 Aug 2022 12:37:48 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
>
> > Hello Fabrice,
> >
> > +Adam Duskett for GOI expertise.
> >
> > On Fri, 12 Aug 2022 12:17:18 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> > > index b54262e7c4..db6da25d39 100644
> > > --- a/package/poppler/poppler.mk
> > > +++ b/package/poppler/poppler.mk
> > > @@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES += gobject-introspection
> > >  POPPLER_CONF_OPTS += \
> > >     -DENABLE_GOBJECT_INTROSPECTION=ON \
> > >     -DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
> > > -   -DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
> > > +   -DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler \
> > > +   -DINTROSPECTION_COMPILER_ARGS="--includedir=$(STAGING_DIR)/usr/share/gir-1.0"
> > >  else
> > >  POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
> > >  endif
> >
> > I am really not familiar with all the gobject-introspection stuff, but
> > I'm wondering if this is the right solution for this problem.
> >
> > In package/gobject-introspection/, I can see that we create and install
> > a g-ir-scanner wrapper that passes --add-include-path="$(dirname
> > "$0")"/../share/gir-1.0.
> >
> > In this same directory, we also have a g-ir-compiler wrapper, which is
> > used to execute things in Qemu. If a special path is needed, why don't
> > we pass it within this wrapper, so that the solution works for all
> > packages?
> >
> > Apparently, according to
> > package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> > there are some packages that set girdir in their .pc file so that other
> > packages now where to find the GIR files.
> >
> > Really not clear in my mind how all of this should work. My only
> > concern is that I would like us to find and use the same solution
> > everywhere to solve the same problem, rather than having 10 different
> > solutions for each package encountering the same issue.
> >
> > Thomas
>
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
