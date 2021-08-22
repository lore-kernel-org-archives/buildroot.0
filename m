Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A517C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 21:27:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C59E61248
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 21:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C59E61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A2D80D4E;
	Sun, 22 Aug 2021 21:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhJ1TdrZY_tm; Sun, 22 Aug 2021 21:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6786D80D72;
	Sun, 22 Aug 2021 21:27:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9C91BF471
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15DA040180
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2C3iK2Kt-L-V for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 21:27:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D73F3400DE
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 21:27:39 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so21229199otc.4
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f6tQfCCENnZ1DhxTKh7Tg6Xx3vnBA40f7tPnbGBD8gY=;
 b=YDX1/kIUzwH0oGos7fTi71+1GXtGYn6MVvwuJNw0JWnl9HD0viQNCRPqfoLkL3IPPF
 w6PpLUs+WoJis4b5mhAMobLpJpBWo1MVlv9xYswvS1K+ixS3rBmuYF9Fc0a2CzeISx/7
 mpHR9biWrSAZn18R1o0PECuaLNKldYOwzC1kCu9vhOmmrKfFuQJhSh6jrT2RhBQwv03P
 3qPvG8KQYq8Ovx+T6GOVygJjt+TasOIQ2gRMBVoDNViAgPH0MukqptvLtmE1lSkd/3/9
 vLZthNKP1yvrAejLasn33H7mfdeN7dKcqBOOp1xcX3/cjV5v9kG8hU/9DYVFaNwXfQXm
 t3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f6tQfCCENnZ1DhxTKh7Tg6Xx3vnBA40f7tPnbGBD8gY=;
 b=BkPbG4zm/2+4lWlggLG8+qUJ/4VrBtM4pdiTZQKUl6ZdQiUe8QytCHEVzfEGXpabdg
 MdxUnKrHQfBGDknF3xlU5Mt4OhSx0vtm8J4rzOrGfEsiFpECUkaFm2QkLpKrjRYd124J
 1is6qvzAv4Dq7szzTEdMBkcILAapBy4bvCKBpQmtHIddaLKSe0UNuuNzj+6toIQxMN6f
 k1whfUUQgyCZOK7GMqRo5BesF+B0A5SRZ9rUE+QvXT5RA7KozEn7czKfA0aIzIvA8j+0
 dAQjbSSYUN+yqEgytebNd32wTJSy33sL57Vw0sFP0kPDZSzddrfYHjbC8j02Neguae2p
 s9mQ==
X-Gm-Message-State: AOAM531PgoVAEMhdPSc8A6CC+8SP66C9YnqFnfi8Qc+oMK4C3U2Pavsu
 mR/iu0FWAptDMOZEPT/ApjZjok2o4WKpwkSDh0w=
X-Google-Smtp-Source: ABdhPJxwgk4PCGu46/WPo9aYOoVdkn9C0FGBJPSkNzCw2jOZZ+hTUIrj8+K7BtWZvL78ka/iT9XCxPNMdDYO35jSpqw=
X-Received: by 2002:a05:6808:220c:: with SMTP id
 bd12mr161626oib.13.1629667658896; 
 Sun, 22 Aug 2021 14:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
 <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
 <CAH+XeQbHj4sHiUmf3rc1PFHb+BbpLEb4KDbKwkef-7UfDB9=Fg@mail.gmail.com>
 <a6320c62-a68d-6433-9f3b-9e1df87a5c39@gmail.com>
In-Reply-To: <a6320c62-a68d-6433-9f3b-9e1df87a5c39@gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 22 Aug 2021 23:27:27 +0200
Message-ID: <CAH+XeQawHERfudB2Hxd8VGpRyckSzQOCjbpGpVg=+bpskzJUsw@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000e9411805ca2c915e"
Subject: Re: [Buildroot] [PATCH] package/zfs: Fix cross-platform-compilations
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--000000000000e9411805ca2c915e
Content-Type: multipart/alternative; boundary="000000000000e9411505ca2c915c"

--000000000000e9411505ca2c915c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Romain Naour,

El dom, 22 ago 2021 a las 22:52, Romain Naour (<romain.naour@gmail.com>)
escribi=C3=B3:

> Hello Jos=C3=A9 Luis,
>
> Le 22/08/2021 =C3=A0 22:38, Jos=C3=A9 Luis Salvador Rufo a =C3=A9crit :
> > Hello Romain,
> >
> > El dom, 22 ago 2021 a las 22:27, Romain Naour (<romain.naour@gmail.com
> > <mailto:romain.naour@gmail.com>>) escribi=C3=B3:
> >
> >     Hello Jos=C3=A9 Luis,
> >
> >     Le 22/08/2021 =C3=A0 22:05, Jos=C3=A9 Luis Salvador Rufo a =C3=A9cr=
it :
> >     > This patch fixes the `make` executed from the `kernel.m4` in
> >     > cross-platform-compilations environments:
> >     >
> https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588
> >     <https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L58=
8
> >
> >     >
> >     > Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <
> salvador.joseluis@gmail.com
> >     <mailto:salvador.joseluis@gmail.com>>
> >     > ---
> >     > Hello all.
> >     >
> >     > @Romain Naour, this patch will fix the buildroot gitlab CI.
> >
> >     Indeed it fix the issue!
> >
> >     Tested-by: Romain Naour <romain.naour@gmail.com <mailto:
> romain.naour@gmail.com>>
> >
> >     >
> >     > @Philippe Serbruyns, this patch will fix your issue with your rpi=
4.
> >     >
> >     >  package/zfs/zfs.mk <http://zfs.mk> | 13 +++++++++++++
> >     >  1 file changed, 13 insertions(+)
> >     >
> >     > diff --git a/package/zfs/zfs.mk <http://zfs.mk> b/package/zfs/
> zfs.mk
> >     <http://zfs.mk>
> >     > index 3b1afb419a..24064cba82 100644
> >     > --- a/package/zfs/zfs.mk <http://zfs.mk>
> >     > +++ b/package/zfs/zfs.mk <http://zfs.mk>
> >     > @@ -13,6 +13,19 @@ ZFS_CPE_ID_PRODUCT =3D openzfs
> >     >
> >     >  ZFS_AUTORECONF =3D YES
> >     >
> >     > +# cross compile environment for linux kernel module
> >     > +ZFS_MAKE_ENV =3D \
> >     > +     HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> >     > +     ARCH=3D$(KERNEL_ARCH) \
> >     > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> >     > +     DEPMOD=3D$(HOST_DIR)/sbin/depmod
> >
> >     You can replace all 4 lines with $(LINUX_MAKE_FLAGS) here instead.
> >
> > Sorry, you can not. LINUX_MAKE_FLAGS includes INSTALL_MOD_PATH, and mus=
t
> be
> > empty for kernel modules. If we use LINUX_MAKE_FLAGS, the module output
> will be
> > TARGET_DIR/INSTALL_MOD_PATH, as you can see in pkg-generic.mk
> > <http://pkg-generic.mk> at line 77. I already lost ~1-2h because of
> this :-(.
>
> This check allow to detect issues on a build system.
> Other packages building an out of tree kernel module is able to use
> LINUX_MAKE_FLAGS (except linux-fusion).
>
> >
> > The alternative to using $(LINUX_MAKE_FLAGS) is empty
> the INSTALL_MOD_PATH as
> > follows:
> > ZFS_MAKE_ENV =3D \
> >      $(LINUX_MAKE_FLAGS) \
> >      INSTALL_MOD_PATH=3D
> >
> > What do you prefer?
>
> If possible, a zfs patch.
>
Here is the "problem":

https://github.com/openzfs/zfs/blob/zfs-2.0.5/module/Makefile.in#L79
> INSTALL_MOD_PATH=3D$(DESTDIR)$(INSTALL_MOD_PATH)

and

https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=3D2021.08=
-rc2#n77
> $(if $(filter end,$(1)),$(call
step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))

Buildroot already does that, so when `make modules_install` is executed,
the output modules directory will be TARGET_DIR/TARGET_DIR/INSTALL_MOD_PATH=
.

I have no idea who is the one that must change its behavior. :-(
Any suggestions on how to proceed?

Maybe I can unexport DESTDIR before `make modules_install`...

Attached alternative patch with LINUX_MAKE_FLAGS and empty INSTALL_MOD_PATH=
.

>
> Otherwise I would suggest to add a comment about the reason why
> LINUX_MAKE_FLAGS
> can't be used.
>
> Best regards,
> Romain
>
>
> >
> >
> >     > +# `./configure` will execute a `make modules` test case
> >     > +ZFS_CONF_ENV =3D \
> >     > +     HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> >     > +     ARCH=3D$(KERNEL_ARCH) \
> >     > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> >     > +     DEPMOD=3D$(HOST_DIR)/sbin/depmod
> >
> >     Same here.
> >
> >
> >
> >     > +
> >     >  ZFS_DEPENDENCIES =3D libaio openssl udev util-linux zlib
> >     >
> >     >  # sysvinit installs only a commented-out modules-load.d/ config
> file
> >     >
> >
>
>
Greetings!

--000000000000e9411505ca2c915c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Romain Naour,</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El dom, 22 ago 2021 =
a las 22:52, Romain Naour (&lt;<a href=3D"mailto:romain.naour@gmail.com">ro=
main.naour@gmail.com</a>&gt;) escribi=C3=B3:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello Jos=C3=A9 Luis,<br>
<br>
Le 22/08/2021 =C3=A0 22:38, Jos=C3=A9 Luis Salvador Rufo a =C3=A9crit=C2=A0=
:<br>
&gt; Hello Romain,<br>
&gt; <br>
&gt; El dom, 22 ago 2021 a las 22:27, Romain Naour (&lt;<a href=3D"mailto:r=
omain.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank"=
>romain.naour@gmail.com</a>&gt;&gt;) escribi=C3=B3:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello Jos=C3=A9 Luis,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 22/08/2021 =C3=A0 22:05, Jos=C3=A9 Luis Salvador=
 Rufo a =C3=A9crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This patch fixes the `make` executed from the =
`kernel.m4` in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; cross-platform-compilations environments:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://github.com/openzfs/zfs/blob=
/zfs-2.0.5/config/kernel.m4#L588" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/openzfs/zfs/blob/=
zfs-2.0.5/config/kernel.m4#L588" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &l=
t;<a href=3D"mailto:salvador.joseluis@gmail.com" target=3D"_blank">salvador=
.joseluis@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:salvador.joseluis@gmai=
l.com" target=3D"_blank">salvador.joseluis@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello all.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @Romain Naour, this patch will fix the buildro=
ot gitlab CI.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Indeed it fix the issue!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Tested-by: Romain Naour &lt;<a href=3D"mailto:romai=
n.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com</a> &lt;mailto:=
<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank">romain.naour@gm=
ail.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @Philippe Serbruyns,=C2=A0this patch will fix =
your issue with your rpi4.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/zfs/<a href=3D"http://zfs.mk" re=
l=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<a href=3D"http://zfs.mk"=
 rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a>&gt; | 13 ++++++++++=
+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/zfs/<a href=3D"http://zfs=
.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<a href=3D"http://=
zfs.mk" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a>&gt; b/packag=
e/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">http://zfs.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 3b1afb419a..24064cba82 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/package/zfs/<a href=3D"http://zfs.mk" re=
l=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<a href=3D"http://zfs.mk"=
 rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/zfs/<a href=3D"http://zfs.mk" re=
l=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<a href=3D"http://zfs.mk"=
 rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -13,6 +13,19 @@ ZFS_CPE_ID_PRODUCT =3D open=
zfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 ZFS_AUTORECONF =3D YES<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# cross compile environment for linux kernel =
module<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +ZFS_MAKE_ENV =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0HOSTCC=3D&quot;$(HOSTCC) =
$(HOST_CFLAGS) $(HOST_LDFLAGS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0ARCH=3D$(KERNEL_ARCH) \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D&quot;$(T=
ARGET_CROSS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0DEPMOD=3D$(HOST_DIR)/sbin=
/depmod<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You can replace all 4 lines with $(LINUX_MAKE_FLAGS=
) here instead.<br>
&gt; <br>
&gt; Sorry, you can not.=C2=A0LINUX_MAKE_FLAGS includes=C2=A0INSTALL_MOD_PA=
TH, and must be<br>
&gt; empty for kernel modules. If we use LINUX_MAKE_FLAGS, the module outpu=
t will be<br>
&gt; TARGET_DIR/INSTALL_MOD_PATH, as you can see in <a href=3D"http://pkg-g=
eneric.mk" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk</a><br>
&gt; &lt;<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" target=3D"_bl=
ank">http://pkg-generic.mk</a>&gt; at line 77. I already lost ~1-2h because=
 of this :-(.<br>
<br>
This check allow to detect issues on a build system.<br>
Other packages building an out of tree kernel module is able to use<br>
LINUX_MAKE_FLAGS (except linux-fusion).<br>
<br>
&gt; =C2=A0<br>
&gt; The alternative to using $(LINUX_MAKE_FLAGS) is empty the=C2=A0INSTALL=
_MOD_PATH as<br>
&gt; follows:<br>
&gt; ZFS_MAKE_ENV =3D \<br>
&gt; =C2=A0 =C2=A0 =C2=A0$(LINUX_MAKE_FLAGS) \<br>
&gt; =C2=A0 =C2=A0 =C2=A0INSTALL_MOD_PATH=3D<br>
&gt; <br>
&gt; What do you prefer?<br>
<br>
If possible, a zfs patch.<br></blockquote><div>Here is the &quot;problem&qu=
ot;:</div><div><br></div><div><a href=3D"https://github.com/openzfs/zfs/blo=
b/zfs-2.0.5/module/Makefile.in#L79">https://github.com/openzfs/zfs/blob/zfs=
-2.0.5/module/Makefile.in#L79</a><br></div><div>&gt; INSTALL_MOD_PATH=3D$(D=
ESTDIR)$(INSTALL_MOD_PATH)<br></div><div><br></div><div>and</div><div><br><=
/div><div><div><a href=3D"https://git.buildroot.net/buildroot/tree/package/=
pkg-generic.mk?h=3D2021.08-rc2#n77">https://git.buildroot.net/buildroot/tre=
e/package/pkg-generic.mk?h=3D2021.08-rc2#n77</a><br></div><div>&gt;=C2=A0$(=
if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(=
O))))<br></div><div><br></div></div><div>Buildroot already does that, so wh=
en `make modules_install` is executed, the output modules directory will be=
 TARGET_DIR/TARGET_DIR/INSTALL_MOD_PATH.<br></div><div><br></div><div>I hav=
e no idea who is=C2=A0the one that must change its behavior. :-(</div><div>=
Any suggestions on how to proceed?<br></div><div><br></div><div>Maybe I can=
 unexport DESTDIR before `make modules_install`...<br></div><div><br></div>=
<div>Attached alternative patch with LINUX_MAKE_FLAGS and empty INSTALL_MOD=
_PATH.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Otherwise I would suggest to add a comment about the reason why LINUX_MAKE_=
FLAGS<br>
can&#39;t be used.<br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# `./configure` will execute a `make modules`=
 test case<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +ZFS_CONF_ENV =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0HOSTCC=3D&quot;$(HOSTCC) =
$(HOST_CFLAGS) $(HOST_LDFLAGS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0ARCH=3D$(KERNEL_ARCH) \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D&quot;$(T=
ARGET_CROSS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0DEPMOD=3D$(HOST_DIR)/sbin=
/depmod<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Same here.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 ZFS_DEPENDENCIES =3D libaio openssl udev=
 util-linux zlib<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 # sysvinit installs only a commented-out=
 modules-load.d/ config file<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
<br></blockquote><div><br></div><div>Greetings!=C2=A0</div></div></div>

--000000000000e9411505ca2c915c--

--000000000000e9411805ca2c915e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="package-zfs-Fix-cross-platform-compilations.patch"
Content-Disposition: attachment; 
	filename="package-zfs-Fix-cross-platform-compilations.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ksnq0tki0>
X-Attachment-Id: f_ksnq0tki0

ZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRl
eCAzYjFhZmI0MTlhLi5iMjQ0NDYzNGI2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsK
KysrIGIvcGFja2FnZS96ZnMvemZzLm1rCkBAIC0xMyw2ICsxMywxNSBAQCBaRlNfQ1BFX0lEX1BS
T0RVQ1QgPSBvcGVuemZzCiAKIFpGU19BVVRPUkVDT05GID0gWUVTCiAKKyMgY3Jvc3MgY29tcGls
ZSBlbnZpcm9ubWVudCBmb3IgbGludXgga2VybmVsIG1vZHVsZQorWkZTX01BS0VfRU5WID0gXAor
CSQoTElOVVhfTUFLRV9GTEFHUykgXAorCUlOU1RBTExfTU9EX1BBVEg9CisjIGAuL2NvbmZpZ3Vy
ZWAgd2lsbCBleGVjdXRlIGEgYG1ha2UgbW9kdWxlc2AgdGVzdCBjYXNlCitaRlNfQ09ORl9FTlYg
PSBcCisJJChMSU5VWF9NQUtFX0ZMQUdTKSBcCisJSU5TVEFMTF9NT0RfUEFUSD0KKwogWkZTX0RF
UEVOREVOQ0lFUyA9IGxpYmFpbyBvcGVuc3NsIHVkZXYgdXRpbC1saW51eCB6bGliCiAKICMgc3lz
dmluaXQgaW5zdGFsbHMgb25seSBhIGNvbW1lbnRlZC1vdXQgbW9kdWxlcy1sb2FkLmQvIGNvbmZp
ZyBmaWxlCg==
--000000000000e9411805ca2c915e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--000000000000e9411805ca2c915e--
