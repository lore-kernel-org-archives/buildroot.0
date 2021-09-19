Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8FAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB2961268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BB2961268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55E0D60706;
	Sun, 19 Sep 2021 12:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1bWDESHp3Kg; Sun, 19 Sep 2021 12:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EB4606F6;
	Sun, 19 Sep 2021 12:35:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A061BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D41882C9C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QE-pLIueDb9K for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:35:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AF2782B93
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:35:51 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v10so3715669oic.12
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aktPzSeUs6ZNoANRHdLUyNOTwZuW1Y6KESpv6xB7yYg=;
 b=M9k5axopJ1y0B9q81rZWSRMtmzS1TcV9AHq/QaamZ8JFs9DYQi2Q+fvyfEJlYUWfH1
 rkFjfJqLw/RpYYghi7Y3QJjaCrjHR/eoMVucoNdAQnA7kXX5z6L2qWc2SXYvFKm3/329
 ETJ+nk+rF7QFbl0BEu6Ly5tq/HpnzeI9KLBU9O6/8g61I/CU89oftiFi604cEh34DPD7
 qqZ6AuhDK5IVXgFGStdkGfSHoQHSlOyWmRaGvDePgJhbCVN0xr4HBQNXQLfb2TerIjYI
 l+ZOaorNaJKGfVYgFHoL6plGLvEBAUOzD45948LdGAJ7naw7Km9z9C77ZlzBdqXo9eOa
 7FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aktPzSeUs6ZNoANRHdLUyNOTwZuW1Y6KESpv6xB7yYg=;
 b=RtoBTt5+ywrgCnYcl7IRQw5b+NCFWspaDIWprAzJmbKo1pcEvPNaCwIOvVPK61B+C9
 rq4yMXfWvImLDtV5WEaUe5wcbwo5flLqAi8E8Si9hEeBORf9mTFKDMT4mTaaUqg+vxTm
 9HEm0JEb/eRsJqwfAt6dwPtE5rgj7kSAF18Pak7L7GhfPhNp/eeOcXlWOFCg+PD5r0OK
 l9gVCX0vA4qAJIFwwudcaG4uL341b/ccoOIOH9LMrh/ML1L2Syqvl3oz4j6opLVdOhyl
 wf6OtZZQ1dZ9f6bgAfh7093CESZw92g8liNVWoMn0gg8mOj72F2kAmdrqy15mvWHj68k
 PUyQ==
X-Gm-Message-State: AOAM532L2NbRxBEXMmQ5jWrVxpvoO0B7f+JNxK+pu0CGN5f/Wgn+84EB
 IGJQlg2j8dJAHoFCsX6aWyjVViDIKUP7Z2kqCew=
X-Google-Smtp-Source: ABdhPJzmJb7ovGAxqAqZDgQFiWX0RR9Fu1ta3F2qK9fe5B5Jf3EJDiyB9NZBprAzJ+5mH4MT+kNGg4Scu/KTgGTmnJ8=
X-Received: by 2002:a05:6808:a09:: with SMTP id
 n9mr18894914oij.67.1632054950953; 
 Sun, 19 Sep 2021 05:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210907114556.3977493-1-james.hilliard1@gmail.com>
 <145608bf-0236-3052-a668-6225c27070a8@mind.be>
In-Reply-To: <145608bf-0236-3052-a668-6225c27070a8@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Sep 2021 06:35:40 -0600
Message-ID: <CADvTj4oQ2jVSLMzpyw_+13qH5Pc4o5d2p08p6oNs0yRGWE2=Kw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.69.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Sun, Sep 19, 2021 at 6:27 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
> On 07/09/2021 13:45, James Hilliard wrote:
> > Rebase remove cpp requirement patch.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
>   AFAIK, glib2's odd releases, like 2.69, are experimental, and the even
> releases, i.e. 2.68, are the stable ones. Normally we'd track only the stable
> releases. Any reason to switch to the experimental one now?

I think there was a bug this contained a fix for but I recall the patch was
backported already so this probably isn't needed.

>
>   Regards,
>   Arnout
>
> > ---
> >   .../libglib2/0002-remove-cpp-requirement.patch   | 16 ++++++++--------
> >   package/libglib2/libglib2.hash                   |  4 ++--
> >   package/libglib2/libglib2.mk                     |  4 ++--
> >   3 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
> > index 9393bd258a..691f3147ef 100644
> > --- a/package/libglib2/0002-remove-cpp-requirement.patch
> > +++ b/package/libglib2/0002-remove-cpp-requirement.patch
> > @@ -1,4 +1,4 @@
> > -From 2f168951df1feebeac549ada1ea44ea092484c54 Mon Sep 17 00:00:00 2001
> > +From 36f4c37fb2a27d93cd58460fa9cc54a0c1cd957e Mon Sep 17 00:00:00 2001
> >   From: Adam Duskett <Aduskett@gmail.com>
> >   Date: Mon, 16 Sep 2019 10:12:38 -0700
> >   Subject: [PATCH] remove cpp requirement
> > @@ -17,7 +17,7 @@ https://gitlab.gnome.org/GNOME/glib/issues/1748
> >    3 files changed, 1 insertion(+), 23 deletions(-)
> >
> >   diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
> > -index 7ef8c48..128e65d 100644
> > +index 873cb0314..5ada525f7 100644
> >   --- a/glib/glibconfig.h.in
> >   +++ b/glib/glibconfig.h.in
> >   @@ -117,7 +117,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
> > @@ -29,13 +29,13 @@ index 7ef8c48..128e65d 100644
> >    /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
> >     * is passed ISO vararg support is turned off, and there is no work
> >   diff --git a/meson.build b/meson.build
> > -index 4bbf4c2..ac59f4e 100644
> > +index 4f1178aa4..a087d6e27 100644
> >   --- a/meson.build
> >   +++ b/meson.build
> >   @@ -1,4 +1,4 @@
> >   -project('glib', 'c', 'cpp',
> >   +project('glib', 'c',
> > -   version : '2.68.2',
> > +   version : '2.69.3',
> >      # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
> >      meson_version : '>= 0.49.2',
> >   @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> > @@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
> >
> >    cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
> >
> > -@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
> > +@@ -1697,20 +1696,6 @@ if g_have_iso_c_varargs
> >    #endif''')
> >    endif
> >
> > @@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
> >    g_have_gnuc_varargs = cc.compiles('''
> >      void some_func (void) {
> >        int a(int p1, int p2, int p3);
> > -@@ -2330,7 +2315,6 @@ subdir('gobject')
> > +@@ -2340,7 +2325,6 @@ subdir('gobject')
> >    subdir('gthread')
> >    subdir('gmodule')
> >    subdir('gio')
> > @@ -76,7 +76,7 @@ index 4bbf4c2..ac59f4e 100644
> >      subdir('tests')
> >    endif
> >   diff --git a/tests/meson.build b/tests/meson.build
> > -index e4ea226..7fd974c 100644
> > +index 6741f8f52..316cf2527 100644
> >   --- a/tests/meson.build
> >   +++ b/tests/meson.build
> >   @@ -55,11 +55,6 @@ tests = {
> > @@ -92,5 +92,5 @@ index e4ea226..7fd974c 100644
> >
> >    test_extra_programs = {
> >   --
> > -2.23.0
> > +2.25.1
> >
> > diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> > index 15e0085f78..b045a74a46 100644
> > --- a/package/libglib2/libglib2.hash
> > +++ b/package/libglib2/libglib2.hash
> > @@ -1,4 +1,4 @@
> > -# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
> > -sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
> > +# https://download.gnome.org/sources/glib/2.69/glib-2.69.3.sha256sum
> > +sha256  47af2c6e06becee44d447ae7d1212dbab255b002b5141d9b62a4357c0ecc058f  glib-2.69.3.tar.xz
> >   # License files, locally calculated
> >   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> > diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> > index 4f13622e36..4315ceca52 100644
> > --- a/package/libglib2/libglib2.mk
> > +++ b/package/libglib2/libglib2.mk
> > @@ -4,8 +4,8 @@
> >   #
> >   ################################################################################
> >
> > -LIBGLIB2_VERSION_MAJOR = 2.68
> > -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> > +LIBGLIB2_VERSION_MAJOR = 2.69
> > +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
> >   LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
> >   LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
> >   LIBGLIB2_LICENSE = LGPL-2.1+
> >
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
