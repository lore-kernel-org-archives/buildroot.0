Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41D2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:51:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FE86105A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49FE86105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0D1403B8;
	Wed,  4 Aug 2021 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJabKIDPS-Hr; Wed,  4 Aug 2021 21:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36909403A0;
	Wed,  4 Aug 2021 21:51:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 909191BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 801EA605C8
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKWlJ8BaIHDa for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37E53605C2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:51:34 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id n16so4631964oij.2
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6QIlXaEQMlkvRO5ngNjF7+LIJJO6++5l1EqTsms03o=;
 b=IWN1P2IKnVnvr7D6B97vfjnQKkzfHYw6G8sZPF2Sp8JAto0gj7sj+vCMKwXEzKpneT
 2uYQtM3zYKlDsGakMh6ERcfVqp9V7EGFbavF3EF9OknNfjECUBS9gpwRYhHC+3bpHebV
 Kpc4Q0VHPd8Pu1KsdhphedYmakdraCowxTBWYEChfc49xc4oifttyS5uJoI0rCULHI92
 p+SmqriRhF5KKEFHE9nztWHRFBL07gqNX3dOAcmUlIlXVJTMM9wW3t/NjYDZrQYqMeRi
 z38XeYXQvmF8FwJVikXV/HjSwxw2kgA/gG3ksD3aGVC3OD46t8SriqZnehdtVByBey1i
 wrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6QIlXaEQMlkvRO5ngNjF7+LIJJO6++5l1EqTsms03o=;
 b=W56cmQpweLKdIpNw4iKbXmpfMufjRoEUjHMvW7yPCYn8zjk5T7O05dwi1tka1uyXZw
 KcELT0z6VUu0E/lZ4NnhMB8BJ00YXBinCu1xv4Mi7BIVpMwHlfQsHIp+Mr7WZgf9DDrb
 HjTGL6wdjRqiKIo9wm5FsWXORoeCLs0ocLOYsvquHUCvDh2wNWMbm/nbbMUt+E4HDmIy
 JOHxKe8Oz0o5kt4IHKkEOPML/SZ3chOXp38zdUDnCoqUiNHgnSwTD9CRnBXsiO8N3MuE
 15wO9oornQJrrwZgtthCeq8ou8gHuGtCz7LDjuyaN6CygERi8rTUU5TIal1vSVjQBvli
 VUiQ==
X-Gm-Message-State: AOAM532u7rV/53eU3eLFA70Y6Vj6Usdxl2/8M/vFsTgTw4semOiendak
 Y5IU+sSIJZVQeOwK45cxyiv4bTlJpsF3hsG9ykY=
X-Google-Smtp-Source: ABdhPJy4ao+962J1sFu0hF5fRrgl2K6nyyGzk6v/B3TRscqkJ5MhwvKsv151MgKOIUHl8rssfu9gwROzWVVswIm2kxE=
X-Received: by 2002:a05:6808:1807:: with SMTP id
 bh7mr1088898oib.157.1628113893267; 
 Wed, 04 Aug 2021 14:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210617091456.272611-1-nolange79@gmail.com>
 <20210617091456.272611-4-nolange79@gmail.com>
 <8319327f-3d70-6ce0-b478-f53ae14013f4@mind.be>
In-Reply-To: <8319327f-3d70-6ce0-b478-f53ae14013f4@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 4 Aug 2021 23:51:21 +0200
Message-ID: <CADYdroM-qUgwmw9STdnPG6SM0rEL9_=crWX1zb_X5WZHws5srw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v4 1/3] package/zstd: rework build and
 install
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Am Mi., 4. Aug. 2021 um 15:01 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>  Hi Norbert,
>
>  Sorry for not responding earlier - I apparently mis-filed this series and it
> went off my backlog. It's only by looking at Fabrice's later patch that I
> discovered this one again.
>
>
> On 17/06/2021 11:14, Norbert Lange wrote:
> > 1.5.0 uses Threads by default for cli tool and DSO,
> > so override that in case the toolchain has none.
>
>  It helps if you include a Fixes: tag in the commit message - that way it's
> visible in patchwork that this patch fixes something and it's going to be
> applied faster. Also the subject line suggests that the patch is just
> refactoring, not fixing anything.

It was a fix for a part of the series, so nothing to fix
unless only a part gets applied.
>
>
> > make sure that everything is built in the build step,
> > and fail the install if files are missing
> > instead of lazily building them.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> >
> > ---
> > v3->v4:
> > *   revert to previous scheme of BR2_TOOLCHAIN_HAS_THREADS
> >     fixing build options for both static and shared libs.
> > v2->v3:
> > *   use normal = for assignment
> > v1->v2:
> > *   rebased against upstream/master
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/zstd/zstd.mk | 45 ++++++++++++++++++++++++--------------------
> >  1 file changed, 25 insertions(+), 20 deletions(-)
> >
> > diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> > index 2a876376a2..5674e85bfe 100644
> > --- a/package/zstd/zstd.mk
> > +++ b/package/zstd/zstd.mk
> > @@ -12,11 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
> >  ZSTD_CPE_ID_VENDOR = facebook
> >  ZSTD_CPE_ID_PRODUCT = zstandard
> >
> > -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > -ZSTD_OPTS += HAVE_THREAD=1
> > -else
> > -ZSTD_OPTS += HAVE_THREAD=0
> > -endif
> > +ZSTD_OPTS += PREFIX=/usr
>
>  I think that this is not just refactoring, but is actually needed for the .pc
> file which is now built during the build step instead of the install step. Is
> that correct? In that case, please mention it in the commit message.

yes, pragmatically it should be around for build and install,
even if its just used in one sport for now.

>
> >
> >  ifeq ($(BR2_PACKAGE_ZLIB),y)
> >  ZSTD_DEPENDENCIES += zlib
> > @@ -39,43 +35,52 @@ else
> >  ZSTD_OPTS += HAVE_LZ4=0
> >  endif
> >
> > -ifeq ($(BR2_STATIC_LIBS),y)
> > -ZSTD_BUILD_LIBS = libzstd.a
> > -ZSTD_INSTALL_LIBS = install-static
> > -else ifeq ($(BR2_SHARED_LIBS),y)
> > -ZSTD_BUILD_LIBS = libzstd
> > -ZSTD_INSTALL_LIBS = install-shared
> > -else
> > -ZSTD_BUILD_LIBS = libzstd.a libzstd
> > -ZSTD_INSTALL_LIBS = install-static install-shared
> > +ZSTD_BUILD_PROG_TARGET = zstd-release
> > +
> > +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> > +ZSTD_BUILD_LIBS += libzstd.a
> > +ZSTD_INSTALL_LIBS += install-static
> > +endif
> > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> > +ZSTD_BUILD_LIBS += libzstd
> > +ZSTD_INSTALL_LIBS += install-shared
>
>  AFAICS this change doesn't actually change anything, it's just rewriting. You
> may claim the result is better, but it's really a matter of taste. We generally
> want to avoid making changes that are just "it looks nicer" if there's no real
> benefit (which can be, for example, a follow-up patch makes use of the new
> structure and would be more complicated in the old structure).
>
>  For sure, such a change should be in a separate patch that doesn't do any
> functional change at the same time.

Ack

>
> >  endif
> >
> > +# Since v1.5.0 the dynamic library is built for
> > +# multithreading, while the static library is not.
> > +#
> >  # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
> >  # one. Building a multi-threaded binary with a library (which defaults to
> >  # single-threaded) gives a runtime error when compressing files.
> >  # The 'lib' makefile provides specific '%-mt' targets for this purpose.
> >  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > +ZSTD_OPTS += HAVE_THREAD=1
> >  ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
> > +else
> > +ZSTD_OPTS += HAVE_THREAD=0
> > +ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
> >  endif
> >
> >  define ZSTD_BUILD_CMDS
> >       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > -             -C $(@D)/lib $(ZSTD_BUILD_LIBS)
> > +             -C $(@D)/lib $(addsuffix -release,$(ZSTD_BUILD_LIBS) libzstd.pc)
>
>  There's no explanation about the -release suffix in the commit message.

the 'default' target is lib-release zstd-release. No big functional effect.

>
>  Since we already do override assignment to ZSTD_BUILD_LIBS, I think it would be
> nicer to put
>
> ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
>
> just after the threads condition above.

Ack
>
>
> >       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > -             -C $(@D) zstd
> > +             -C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
>
>  This change of building top-level to building in the programs subdirectory is
> also not clearly explained in the commit message (I mean *why* this is changed,
> not simply that it is changed).
>
> >  endef
> >
> >  define ZSTD_INSTALL_STAGING_CMDS
> > +     [ -e $(@D)/lib/libzstd.pc ]
>
>  This command serves no purpose.
>
>  I understand that it's a way for you to "assert" that the pc file is indeed
> built, but because you added it in the build commands we can be pretty sure that
> it's going to be there.
>
>  We normally don't have any assert like that in our install commands. It's also
> pretty pointless - you probably discovered that it was being built at
> installation time by looking at the build log, and that's the only way that
> you'd discover that *that* is the file that needs to be checked. If this ever
> breaks again, it's more than likely due to a different file.

its supposed to be a reminder to check if things break later, you easily
miss if some things are build during installation.
But ok.
>
>
> >       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > -             DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
> > -             install-pc install-includes $(ZSTD_INSTALL_LIBS)
> > +             -C $(@D)/lib DESTDIR=$(STAGING_DIR) $(ZSTD_INSTALL_LIBS) \
> > +             install-pc install-includes
>
>  Other than the PREFIX which is now part of ZSTD_OPTS, I believe nothing
> actually changed here, right? Please try to keep the diff small in such a case.

Ack

>
> >  endef
> >
> >  define ZSTD_INSTALL_TARGET_CMDS
> > +     [ -e $(@D)/programs/zstd ]
>
>  Again, not needed.
>
> >       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > -             DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
> > +             -C $(@D)/programs DESTDIR=$(TARGET_DIR) install
>
>  Again, spurious reordering of the options.
>
>
>  Regards,
>  Arnout
>
> >       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > -             DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
> > +             -C $(@D)/lib DESTDIR=$(TARGET_DIR) $(ZSTD_INSTALL_LIBS)
> >  endef
> >
> >  HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
> >

Norbert
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
