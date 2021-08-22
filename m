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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72359C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3783B61246
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3783B61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B704029A;
	Sun, 22 Aug 2021 20:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vQc1rcOefCB; Sun, 22 Aug 2021 20:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7014029B;
	Sun, 22 Aug 2021 20:38:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C65B1BF44C
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0911A4029B
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dN1PbbqkfxKV for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 20:38:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E12F74029A
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:38:25 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so30672216otk.9
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AjhRg6KkPJm87oOuinrQ74VLPYsgHgBsU19sv8gkM9I=;
 b=eZxTBtSDCo5WkTkgiE1j3Z/EOvDpbtQE/pdCdab1JJWXCSZfHu5+oC8tBZ1jNjOlky
 raRulg3tJirUhpTv99q2HeGFHuIQmOGL62gB3vjQ2HCQ5RGUr96JBGvTh1VkrG48RVpu
 WF5ic3JrAOk+AM4YLgZKn+lXOqPmeR70LKvXQfyeLR8eEfWARrZh12TKL+TEzCn+xI9Q
 dTOYgjv12Y1ROdxFw/JFZEVH7lUzjoOch8RK+u/6WoK0p97ld1MXRnBXDnxEJGd+quGH
 bCOIkLp7I8rVtR5zbW2BWGSV4s5HwyL383xK1PJf1cT4C4fKzo82m53Mgx2sfRC/YMzf
 S2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjhRg6KkPJm87oOuinrQ74VLPYsgHgBsU19sv8gkM9I=;
 b=RylWDTZmNMeapaNBucOyhYkksjr6Eym0+Goj5vJoej94uZzLtUl7eB1kEG+dvl1ifa
 rCCxNZFsjyzv/xYZwtxcd0RHvVAMAVD9MEKNc1eHFWDr+0YI7cKiUgscflBh2EGNmShl
 hVZp9GZNQ6vc8O55W14UxVb5pNVZCQyte9qPirDpNubWQjo55pUywqNSZU9QsnQObniP
 lkeSGwPc9jXZjkQVMmysm6jbZlAWzC6Qaa9HeVl/2Mo1wagyn5MII8s7M9j0GnZTYCMy
 EsoYcHTQczwnONZTH8ozvSCoGnPViqq4I32xUdaxfcy7rvw/kQq6rxzkbq+/0vSKgOF6
 ZkLg==
X-Gm-Message-State: AOAM531V2sTQRpid4lAI+87dQaytYEwEWkxGmqOmPUA7o5Uas179Rob+
 8zxWlX5axldvFUct/LspCSO+jysh7iK/D5a1eDU=
X-Google-Smtp-Source: ABdhPJzdw1fXkQ90AlUwxFktphXO+v56QmNx4VfA/Rw3bPAN5H3VCyfkRQwRPG+xJzoq3qDqROvD6wuuHWqahWT0t74=
X-Received: by 2002:a05:6808:220c:: with SMTP id
 bd12mr85174oib.13.1629664704835; 
 Sun, 22 Aug 2021 13:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
 <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
In-Reply-To: <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 22 Aug 2021 22:38:13 +0200
Message-ID: <CAH+XeQbHj4sHiUmf3rc1PFHb+BbpLEb4KDbKwkef-7UfDB9=Fg@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5228501878967442071=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5228501878967442071==
Content-Type: multipart/alternative; boundary="000000000000d5b37605ca2be17e"

--000000000000d5b37605ca2be17e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Romain,

El dom, 22 ago 2021 a las 22:27, Romain Naour (<romain.naour@gmail.com>)
escribi=C3=B3:

> Hello Jos=C3=A9 Luis,
>
> Le 22/08/2021 =C3=A0 22:05, Jos=C3=A9 Luis Salvador Rufo a =C3=A9crit :
> > This patch fixes the `make` executed from the `kernel.m4` in
> > cross-platform-compilations environments:
> > https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588
> >
> > Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.co=
m>
> > ---
> > Hello all.
> >
> > @Romain Naour, this patch will fix the buildroot gitlab CI.
>
> Indeed it fix the issue!
>
> Tested-by: Romain Naour <romain.naour@gmail.com>
>
> >
> > @Philippe Serbruyns, this patch will fix your issue with your rpi4.
> >
> >  package/zfs/zfs.mk | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> > index 3b1afb419a..24064cba82 100644
> > --- a/package/zfs/zfs.mk
> > +++ b/package/zfs/zfs.mk
> > @@ -13,6 +13,19 @@ ZFS_CPE_ID_PRODUCT =3D openzfs
> >
> >  ZFS_AUTORECONF =3D YES
> >
> > +# cross compile environment for linux kernel module
> > +ZFS_MAKE_ENV =3D \
> > +     HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> > +     ARCH=3D$(KERNEL_ARCH) \
> > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> > +     DEPMOD=3D$(HOST_DIR)/sbin/depmod
>
> You can replace all 4 lines with $(LINUX_MAKE_FLAGS) here instead.
>
Sorry, you can not. LINUX_MAKE_FLAGS includes INSTALL_MOD_PATH, and must be
empty for kernel modules. If we use LINUX_MAKE_FLAGS, the module output
will be TARGET_DIR/INSTALL_MOD_PATH, as you can see in pkg-generic.mk at
line 77. I already lost ~1-2h because of this :-(.

The alternative to using $(LINUX_MAKE_FLAGS) is empty the INSTALL_MOD_PATH
as follows:
ZFS_MAKE_ENV =3D \
     $(LINUX_MAKE_FLAGS) \
     INSTALL_MOD_PATH=3D

What do you prefer?

>
> > +# `./configure` will execute a `make modules` test case
> > +ZFS_CONF_ENV =3D \
> > +     HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> > +     ARCH=3D$(KERNEL_ARCH) \
> > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> > +     DEPMOD=3D$(HOST_DIR)/sbin/depmod
>
> Same here.
>
>
>
> > +
> >  ZFS_DEPENDENCIES =3D libaio openssl udev util-linux zlib
> >
> >  # sysvinit installs only a commented-out modules-load.d/ config file
> >
>
>

--000000000000d5b37605ca2be17e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Romain,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">El dom, 22 ago 2021 a las 22:27, Romain =
Naour (&lt;<a href=3D"mailto:romain.naour@gmail.com">romain.naour@gmail.com=
</a>&gt;) escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello Jos=C3=A9 Luis,<br>
<br>
Le 22/08/2021 =C3=A0 22:05, Jos=C3=A9 Luis Salvador Rufo a =C3=A9crit=C2=A0=
:<br>
&gt; This patch fixes the `make` executed from the `kernel.m4` in<br>
&gt; cross-platform-compilations environments:<br>
&gt; <a href=3D"https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel=
.m4#L588" rel=3D"noreferrer" target=3D"_blank">https://github.com/openzfs/z=
fs/blob/zfs-2.0.5/config/kernel.m4#L588</a><br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salv=
ador.joseluis@gmail.com" target=3D"_blank">salvador.joseluis@gmail.com</a>&=
gt;<br>
&gt; ---<br>
&gt; Hello all.<br>
&gt; <br>
&gt; @Romain Naour, this patch will fix the buildroot gitlab CI.<br>
<br>
Indeed it fix the issue!<br>
<br>
Tested-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" targe=
t=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
<br>
&gt; <br>
&gt; @Philippe Serbruyns,=C2=A0this patch will fix your issue with your rpi=
4.<br>
&gt; <br>
&gt;=C2=A0 package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a> | 13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" =
target=3D"_blank">zfs.mk</a> b/package/zfs/<a href=3D"http://zfs.mk" rel=3D=
"noreferrer" target=3D"_blank">zfs.mk</a><br>
&gt; index 3b1afb419a..24064cba82 100644<br>
&gt; --- a/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a><br>
&gt; +++ b/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a><br>
&gt; @@ -13,6 +13,19 @@ ZFS_CPE_ID_PRODUCT =3D openzfs<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ZFS_AUTORECONF =3D YES<br>
&gt;=C2=A0 <br>
&gt; +# cross compile environment for linux kernel module<br>
&gt; +ZFS_MAKE_ENV =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HOSTCC=3D&quot;$(HOSTCC) $(HOST_CFLAGS) $(HOST_LD=
FLAGS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ARCH=3D$(KERNEL_ARCH) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D&quot;$(TARGET_CROSS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DEPMOD=3D$(HOST_DIR)/sbin/depmod<br>
<br>
You can replace all 4 lines with $(LINUX_MAKE_FLAGS) here instead.<br></blo=
ckquote><div>Sorry, you can not.=C2=A0LINUX_MAKE_FLAGS includes=C2=A0INSTAL=
L_MOD_PATH, and must be empty for kernel modules. If we use LINUX_MAKE_FLAG=
S, the module output will be TARGET_DIR/INSTALL_MOD_PATH, as you can see in=
 <a href=3D"http://pkg-generic.mk">pkg-generic.mk</a> at line 77. I already=
 lost ~1-2h because of this :-(.</div><div>=C2=A0</div><div>The alternative=
 to using $(LINUX_MAKE_FLAGS) is empty the=C2=A0INSTALL_MOD_PATH as follows=
:</div><div>ZFS_MAKE_ENV =3D \<br></div><div>=C2=A0 =C2=A0 =C2=A0$(LINUX_MA=
KE_FLAGS) \<br></div><div>=C2=A0 =C2=A0 =C2=A0INSTALL_MOD_PATH=3D<br></div>=
<div><br></div><div>What do you prefer?</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; +# `./configure` will execute a `make modules` test case<br>
&gt; +ZFS_CONF_ENV =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HOSTCC=3D&quot;$(HOSTCC) $(HOST_CFLAGS) $(HOST_LD=
FLAGS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ARCH=3D$(KERNEL_ARCH) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D&quot;$(TARGET_CROSS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DEPMOD=3D$(HOST_DIR)/sbin/depmod<br>
<br>
Same here.<br>
<br>
<br>
<br>
&gt; +<br>
&gt;=C2=A0 ZFS_DEPENDENCIES =3D libaio openssl udev util-linux zlib<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # sysvinit installs only a commented-out modules-load.d/ config =
file<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000d5b37605ca2be17e--

--===============5228501878967442071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5228501878967442071==--
