Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MIME_HTML_MOSTLY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6883FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 22:55:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF7761163
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 22:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFF7761163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43E840290;
	Sun, 22 Aug 2021 22:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1OTOMRpy8W0; Sun, 22 Aug 2021 22:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACEC40294;
	Sun, 22 Aug 2021 22:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 252BF1BF46D
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 22:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 136B0400DE
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 22:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWSa47tjHdIA for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 22:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C760C401A4
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 22:55:05 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so22911535otg.11
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 15:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rrBdKuxILvzmPxJnz46o0tIC/NJd/fyXPVK2SIU+YzY=;
 b=efPX5Gt/tzihio1WpRIUFv/xQVCUJ/BrQjXEmty/KLV6i+IYg9B0B/KRzukT2mF1ru
 iAF+A2tB3rso3jGnI/vmrNSZmrKXJbPb+SZ2139pyC8RFS3PNfdKxbqTQCPQ3anhi/YT
 5+ti2qzHd1tDCjZakyI2CIFkguWnpWer5bbM5vKOhWqV5W4rKxYl05rtngfk9Ej1jajl
 WEVoqjOC8/5caFXAf93jDJQCK+l1USoi2X7A768ZqqZWPMJD6KgIbXsLatXMn4ewGoS+
 RwWyJIMEPnU8YRBciru4QlL4wszEuNQIpUZgE2cKkVGYMScFAJ18kB72iexkh1glEGFF
 60bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rrBdKuxILvzmPxJnz46o0tIC/NJd/fyXPVK2SIU+YzY=;
 b=pc1sOOZ8er0i92XUm4cYbK1GIc3HIg82bcxIk2n2tqDt4hWx7b8aS88XP0v2lLPPL5
 Q1pxgOgjyIF+IRnBb9YW14NsCQRGT0Rt0giSF4lll6Lyzsl/QdQDXJ+BMaSP3CPGrbBU
 e/9tIhIWfTjaqFwwC7FzkvTrPEieNnEgtxN8AG5XsQwLZAagWaZYYFggPsoI138Nfj3b
 9/3r7ZYnpMCP0dGTQ/cFFSu5icZkmABgiAgQFg8vyrCvWnY3Vtw/L26ANL0ZzoQEVw+w
 ebYy+N9nT/c8X3ZNltJ9K2iszpmh64xXVUdxX2Dl25hVT1haHVGRJIiC5Fd91XhuuZ46
 j2og==
X-Gm-Message-State: AOAM532fvxuwWGBP4rA7Xwx+pbjeGmczptGIpgU33bxHHSBLhnvCNl1R
 8tPs4mucX9FwTK5FCvsTeCSc9q10s9dkIbSmYwU=
X-Google-Smtp-Source: ABdhPJzzj5tRHmIoH9z1sRqMAyhcrCvSL/ZkL0rL5HUn8c8zYz/wgT+bunak6oySvOMupFTwZjUX6yfjyE5OVB4Cx4M=
X-Received: by 2002:a05:6830:3115:: with SMTP id
 b21mr26514646ots.240.1629672904867; 
 Sun, 22 Aug 2021 15:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
 <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
 <CAH+XeQbHj4sHiUmf3rc1PFHb+BbpLEb4KDbKwkef-7UfDB9=Fg@mail.gmail.com>
 <a6320c62-a68d-6433-9f3b-9e1df87a5c39@gmail.com>
 <CAH+XeQawHERfudB2Hxd8VGpRyckSzQOCjbpGpVg=+bpskzJUsw@mail.gmail.com>
 <cb4c98eb-2f52-1d8a-942e-550ad425e767@gmail.com>
In-Reply-To: <cb4c98eb-2f52-1d8a-942e-550ad425e767@gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Mon, 23 Aug 2021 00:54:53 +0200
Message-ID: <CAH+XeQYBqrMLY8u8+K0gYiyxHF1PgYSyB7Wgvs-f106P5B5-eQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4156729712880956198=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4156729712880956198==
Content-Type: multipart/alternative; boundary="00000000000098421805ca2dca5e"

--00000000000098421805ca2dca5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Romain Naour,

El dom, 22 ago 2021 a las 23:43, Romain Naour (<romain.naour@gmail.com>)
escribi=C3=B3:

> Le 22/08/2021 =C3=A0 23:27, Jos=C3=A9 Luis Salvador Rufo a =C3=A9crit :
> > Hello Romain Naour,
> >
> > El dom, 22 ago 2021 a las 22:52, Romain Naour (<romain.naour@gmail.com
> > <mailto:romain.naour@gmail.com>>) escribi=C3=B3:
> >
> >     Hello Jos=C3=A9 Luis,
> >
> >     Le 22/08/2021 =C3=A0 22:38, Jos=C3=A9 Luis Salvador Rufo a =C3=A9cr=
it :
> >     > Hello Romain,
> >     >
> >     > El dom, 22 ago 2021 a las 22:27, Romain Naour (<
> romain.naour@gmail.com
> >     <mailto:romain.naour@gmail.com>
> >     > <mailto:romain.naour@gmail.com <mailto:romain.naour@gmail.com>>>)
> escribi=C3=B3:
> >     >
> >     >     Hello Jos=C3=A9 Luis,
> >     >
> >     >     Le 22/08/2021 =C3=A0 22:05, Jos=C3=A9 Luis Salvador Rufo a =
=C3=A9crit :
> >     >     > This patch fixes the `make` executed from the `kernel.m4` i=
n
> >     >     > cross-platform-compilations environments:
> >     >     >
> https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588
> >     <https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L58=
8
> >
> >     >     <
> https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588
> >     <https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L58=
8
> >>
> >     >     >
> >     >     > Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <
> salvador.joseluis@gmail.com
> >     <mailto:salvador.joseluis@gmail.com>
> >     >     <mailto:salvador.joseluis@gmail.com <mailto:
> salvador.joseluis@gmail.com>>>
> >     >     > ---
> >     >     > Hello all.
> >     >     >
> >     >     > @Romain Naour, this patch will fix the buildroot gitlab CI.
> >     >
> >     >     Indeed it fix the issue!
> >     >
> >     >     Tested-by: Romain Naour <romain.naour@gmail.com
> >     <mailto:romain.naour@gmail.com> <mailto:romain.naour@gmail.com
> >     <mailto:romain.naour@gmail.com>>>
> >     >
> >     >     >
> >     >     > @Philippe Serbruyns, this patch will fix your issue with
> your rpi4.
> >     >     >
> >     >     >  package/zfs/zfs.mk <http://zfs.mk> <http://zfs.mk <
> http://zfs.mk>>
> >     | 13 +++++++++++++
> >     >     >  1 file changed, 13 insertions(+)
> >     >     >
> >     >     > diff --git a/package/zfs/zfs.mk <http://zfs.mk> <
> http://zfs.mk
> >     <http://zfs.mk>> b/package/zfs/zfs.mk <http://zfs.mk>
> >     >     <http://zfs.mk <http://zfs.mk>>
> >     >     > index 3b1afb419a..24064cba82 100644
> >     >     > --- a/package/zfs/zfs.mk <http://zfs.mk> <http://zfs.mk <
> http://zfs.mk>>
> >     >     > +++ b/package/zfs/zfs.mk <http://zfs.mk> <http://zfs.mk <
> http://zfs.mk>>
> >     >     > @@ -13,6 +13,19 @@ ZFS_CPE_ID_PRODUCT =3D openzfs
> >     >     >
> >     >     >  ZFS_AUTORECONF =3D YES
> >     >     >
> >     >     > +# cross compile environment for linux kernel module
> >     >     > +ZFS_MAKE_ENV =3D \
> >     >     > +     HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> >     >     > +     ARCH=3D$(KERNEL_ARCH) \
> >     >     > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> >     >     > +     DEPMOD=3D$(HOST_DIR)/sbin/depmod
> >     >
> >     >     You can replace all 4 lines with $(LINUX_MAKE_FLAGS) here
> instead.
> >     >
> >     > Sorry, you can not. LINUX_MAKE_FLAGS includes INSTALL_MOD_PATH,
> and must be
> >     > empty for kernel modules. If we use LINUX_MAKE_FLAGS, the module
> output
> >     will be
> >     > TARGET_DIR/INSTALL_MOD_PATH, as you can see in pkg-generic.mk
> >     <http://pkg-generic.mk>
> >     > <http://pkg-generic.mk <http://pkg-generic.mk>> at line 77. I
> already lost
> >     ~1-2h because of this :-(.
> >
> >     This check allow to detect issues on a build system.
> >     Other packages building an out of tree kernel module is able to use
> >     LINUX_MAKE_FLAGS (except linux-fusion).
> >
> >     >
> >     > The alternative to using $(LINUX_MAKE_FLAGS) is empty
> the INSTALL_MOD_PATH as
> >     > follows:
> >     > ZFS_MAKE_ENV =3D \
> >     >      $(LINUX_MAKE_FLAGS) \
> >     >      INSTALL_MOD_PATH=3D
> >     >
> >     > What do you prefer?
> >
> >     If possible, a zfs patch.
> >
> > Here is the "problem":
> >
> > https://github.com/openzfs/zfs/blob/zfs-2.0.5/module/Makefile.in#L79
> > <https://github.com/openzfs/zfs/blob/zfs-2.0.5/module/Makefile.in#L79>
> >> INSTALL_MOD_PATH=3D$(DESTDIR)$(INSTALL_MOD_PATH)
>
> This is the problem. I guess you have to remove DESTDIR when used with
> INSTALL_MOD_PATH.
>
> I found that DESTDIR is already empty. Sorry, my bad.

>
> > and
> >
> >
> https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=3D2021.=
08-rc2#n77
> <
> https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=3D2021.=
08-rc2#n77
> >
> >> $(if $(filter end,$(1)),$(call
> step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))
>

So I made:
```
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 97ee204b80..c406b32acf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -71,6 +71,7 @@ define step_check_build_dir_one
 endef

 define step_check_build_dir
+       echo -e "TARGET_DIR $(TARGET_DIR)\nO $(O)\n" > /tmp/output
        $(if $(filter install-staging,$(2)),\
                $(if $(filter end,$(1)),$(call
step_check_build_dir_one,$(3),$(STAGING_DIR)/$(O))))
        $(if $(filter install-target,$(2)),\
```

And here is the output:
```
TARGET_DIR /home/jlsalvador/src/buildroot-rpi4-tmp/per-package/zfs/target
O /home/jlsalvador/src/buildroot-rpi4-tmp
```

So the installation path will be
`/home/jlsalvador/src/buildroot-rpi4-tmp/per-package/zfs/target//home/jlsal=
vador/src/buildroot-rpi4-tmp`

`/home/jlsalvador/src/buildroot-rpi4-tmp` is an out-of-tree buildroot
directory that was created with the following command:

```
mkdir ~/src/buildroot-rpi4-tmp
cd ~/src/buildroot-rpi4-tmp
make O=3D$(pwd) -C ../buildroot menuconfig
```

Maybe this is the problem? Is `$(TARGET_DIR)/$(O)` right?


> >
> > Buildroot already does that, so when `make modules_install` is executed=
,
> the
> > output modules directory will be TARGET_DIR/TARGET_DIR/INSTALL_MOD_PATH=
.
> >
> > I have no idea who is the one that must change its behavior. :-(
> > Any suggestions on how to proceed?
> >
> > Maybe I can unexport DESTDIR before `make modules_install`...
>
> Yes, DESTDIR is sometime miss used (see buildroot gitlog for example).
>
> It's a bug if DESTDIR and INSTALL_MOD_PATH are used together:
>
> https://www.gnu.org/prep/standards/html_node/DESTDIR.html
>
> https://www.kernel.org/doc/Documentation/kbuild/modules.txt
> (INSTALL_MOD_PATH)
>
> Best regards,
> Romain
>
>
> >
> > Attached alternative patch with LINUX_MAKE_FLAGS and empty
> INSTALL_MOD_PATH.
> >
> >
> >     Otherwise I would suggest to add a comment about the reason why
> LINUX_MAKE_FLAGS
> >     can't be used.
> >
> >     Best regards,
> >     Romain
> >
> >
> >     >
> >     >
> >     >     > +# `./configure` will execute a `make modules` test case
> >     >     > +ZFS_CONF_ENV =3D \
> >     >     > +     HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> >     >     > +     ARCH=3D$(KERNEL_ARCH) \
> >     >     > +     CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> >     >     > +     DEPMOD=3D$(HOST_DIR)/sbin/depmod
> >     >
> >     >     Same here.
> >     >
> >     >
> >     >
> >     >     > +
> >     >     >  ZFS_DEPENDENCIES =3D libaio openssl udev util-linux zlib
> >     >     >
> >     >     >  # sysvinit installs only a commented-out modules-load.d/
> config file
> >     >     >
> >     >
> >
> >
> > Greetings!
>
>

--00000000000098421805ca2dca5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Romain Naour,</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El dom, 22 ago 2021 =
a las 23:43, Romain Naour (&lt;<a href=3D"mailto:romain.naour@gmail.com">ro=
main.naour@gmail.com</a>&gt;) escribi=C3=B3:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Le 22/08/2021 =C3=A0 23:27, Jos=C3=A9 Luis Sal=
vador Rufo a =C3=A9crit=C2=A0:<br>
&gt; Hello Romain Naour,<br>
&gt; <br>
&gt; El dom, 22 ago 2021 a las 22:52, Romain Naour (&lt;<a href=3D"mailto:r=
omain.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank"=
>romain.naour@gmail.com</a>&gt;&gt;) escribi=C3=B3:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello Jos=C3=A9 Luis,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 22/08/2021 =C3=A0 22:38, Jos=C3=A9 Luis Salvador=
 Rufo a =C3=A9crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello Romain,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; El dom, 22 ago 2021 a las 22:27, Romain Naour =
(&lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank">romain.nao=
ur@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:romain.naour@gmail.com=
" target=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:romain.naour@gmai=
l.com" target=3D"_blank">romain.naour@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:romain.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com</a>&=
gt;&gt;&gt;) escribi=C3=B3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hello Jos=C3=A9 Luis,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Le 22/08/2021 =C3=A0 22:05,=
 Jos=C3=A9 Luis Salvador Rufo a =C3=A9crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; This patch fixes the `=
make` executed from the `kernel.m4` in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; cross-platform-compila=
tions environments:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://git=
hub.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/ke=
rnel.m4#L588</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/openzfs/zfs/blob/=
zfs-2.0.5/config/kernel.m4#L588" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gith=
ub.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/ker=
nel.m4#L588</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/openzfs/zfs/blob/=
zfs-2.0.5/config/kernel.m4#L588" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588</a>&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Jos=C3=
=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salvador.joseluis@gmail.com" t=
arget=3D"_blank">salvador.joseluis@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:salvador.joseluis@gmai=
l.com" target=3D"_blank">salvador.joseluis@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:salvador.joseluis@gmail.com" target=3D"_blank">salvador.joseluis@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:salvador.joseluis@gmail.com" target=3D"_=
blank">salvador.joseluis@gmail.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello all.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; @Romain Naour, this pa=
tch will fix the buildroot gitlab CI.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Indeed it fix the issue!<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Tested-by: Romain Naour &lt=
;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank">romain.naour@g=
mail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:romain.naour@gmail.com=
" target=3D"_blank">romain.naour@gmail.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:romain.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:romain.naour@gmail.com=
" target=3D"_blank">romain.naour@gmail.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; @Philippe Serbruyns,=
=C2=A0this patch will fix your issue with your rpi4.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/zfs/<a h=
ref=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<=
a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk=
</a>&gt; &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank"=
>http://zfs.mk</a> &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">http://zfs.mk</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, =
13 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/z=
fs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk</a=
> &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">http:/=
/zfs.mk</a>&gt; &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"=
_blank">http://zfs.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">http://zfs.mk</a>&gt;&gt; b/package/zfs/<a href=3D"http://z=
fs.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<a href=3D"http:=
//zfs.mk" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://zfs.m=
k" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a> &lt;<a href=3D"ht=
tp://zfs.mk" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk</a>&gt;&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 3b1afb419a..2406=
4cba82 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/package/zfs/<a h=
ref=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<=
a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk=
</a>&gt; &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank"=
>http://zfs.mk</a> &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">http://zfs.mk</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/zfs/<a h=
ref=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">zfs.mk</a> &lt;<=
a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank">http://zfs.mk=
</a>&gt; &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=3D"_blank"=
>http://zfs.mk</a> &lt;<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">http://zfs.mk</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -13,6 +13,19 @@ ZFS=
_CPE_ID_PRODUCT =3D openzfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 ZFS_AUTORECONF =
=3D YES<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# cross compile envir=
onment for linux kernel module<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +ZFS_MAKE_ENV =3D \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0H=
OSTCC=3D&quot;$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0A=
RCH=3D$(KERNEL_ARCH) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0C=
ROSS_COMPILE=3D&quot;$(TARGET_CROSS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0D=
EPMOD=3D$(HOST_DIR)/sbin/depmod<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You can replace all 4 lines=
 with $(LINUX_MAKE_FLAGS) here instead.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Sorry, you can not.=C2=A0LINUX_MAKE_FLAGS incl=
udes=C2=A0INSTALL_MOD_PATH, and must be<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; empty for kernel modules. If we use LINUX_MAKE=
_FLAGS, the module output<br>
&gt;=C2=A0 =C2=A0 =C2=A0will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TARGET_DIR/INSTALL_MOD_PATH, as you can see in=
 <a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" target=3D"_blank">pkg=
-generic.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://pkg-generic.mk" rel=3D"norefe=
rrer" target=3D"_blank">http://pkg-generic.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"http://pkg-generic.mk" rel=3D"n=
oreferrer" target=3D"_blank">http://pkg-generic.mk</a> &lt;<a href=3D"http:=
//pkg-generic.mk" rel=3D"noreferrer" target=3D"_blank">http://pkg-generic.m=
k</a>&gt;&gt; at line 77. I already lost<br>
&gt;=C2=A0 =C2=A0 =C2=A0~1-2h because of this :-(.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This check allow to detect issues on a build system=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Other packages building an out of tree kernel modul=
e is able to use<br>
&gt;=C2=A0 =C2=A0 =C2=A0LINUX_MAKE_FLAGS (except linux-fusion).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The alternative to using $(LINUX_MAKE_FLAGS) i=
s empty the=C2=A0INSTALL_MOD_PATH as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; follows:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ZFS_MAKE_ENV =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0$(LINUX_MAKE_FLAGS) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0INSTALL_MOD_PATH=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; What do you prefer?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If possible, a zfs patch.<br>
&gt; <br>
&gt; Here is the &quot;problem&quot;:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/openzfs/zfs/blob/zfs-2.0.5/module/Makefi=
le.in#L79" rel=3D"noreferrer" target=3D"_blank">https://github.com/openzfs/=
zfs/blob/zfs-2.0.5/module/Makefile.in#L79</a><br>
&gt; &lt;<a href=3D"https://github.com/openzfs/zfs/blob/zfs-2.0.5/module/Ma=
kefile.in#L79" rel=3D"noreferrer" target=3D"_blank">https://github.com/open=
zfs/zfs/blob/zfs-2.0.5/module/Makefile.in#L79</a>&gt;<br>
&gt;&gt; INSTALL_MOD_PATH=3D$(DESTDIR)$(INSTALL_MOD_PATH)<br>
<br>
This is the problem. I guess you have to remove DESTDIR when used with<br>
INSTALL_MOD_PATH.<br>
<br></blockquote><div>I found that DESTDIR is already empty. Sorry, my bad.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; and<br>
&gt; <br>
&gt; <a href=3D"https://git.buildroot.net/buildroot/tree/package/pkg-generi=
c.mk?h=3D2021.08-rc2#n77" rel=3D"noreferrer" target=3D"_blank">https://git.=
buildroot.net/buildroot/tree/package/pkg-generic.mk?h=3D2021.08-rc2#n77</a>=
 &lt;<a href=3D"https://git.buildroot.net/buildroot/tree/package/pkg-generi=
c.mk?h=3D2021.08-rc2#n77" rel=3D"noreferrer" target=3D"_blank">https://git.=
buildroot.net/buildroot/tree/package/pkg-generic.mk?h=3D2021.08-rc2#n77</a>=
&gt;<br>
&gt;&gt;=C2=A0$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),=
$(TARGET_DIR)/$(O))))<br></blockquote><div><br></div><div>So I made:</div><=
div>```</div><div>diff --git a/package/<a href=3D"http://pkg-generic.mk">pk=
g-generic.mk</a> b/package/<a href=3D"http://pkg-generic.mk">pkg-generic.mk=
</a><br>index 97ee204b80..c406b32acf 100644<br>--- a/package/<a href=3D"htt=
p://pkg-generic.mk">pkg-generic.mk</a><br>+++ b/package/<a href=3D"http://p=
kg-generic.mk">pkg-generic.mk</a><br>@@ -71,6 +71,7 @@ define step_check_bu=
ild_dir_one<br>=C2=A0endef<br>=C2=A0<br>=C2=A0define step_check_build_dir<b=
r>+ =C2=A0 =C2=A0 =C2=A0 echo -e &quot;TARGET_DIR $(TARGET_DIR)\nO $(O)\n&q=
uot; &gt; /tmp/output<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(filter install-=
staging,$(2)),\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(STAGING_DIR)=
/$(O))))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(filter install-target,$(2)),=
\<br></div><div>```<br></div><div><br></div><div>And here is the output:</d=
iv><div>```</div>TARGET_DIR /home/jlsalvador/src/buildroot-rpi4-tmp/per-pac=
kage/zfs/target<br>O /home/jlsalvador/src/buildroot-rpi4-tmp<br><div>```<br=
></div><div><br></div><div>So the installation path will be `/home/jlsalvad=
or/src/buildroot-rpi4-tmp/per-package/zfs/target//home/jlsalvador/src/build=
root-rpi4-tmp`<br></div><div><br></div><div>`/home/jlsalvador/src/buildroot=
-rpi4-tmp` is an out-of-tree buildroot directory that was created with the =
following command:</div><div><br></div><div>```</div><div>mkdir ~/src/build=
root-rpi4-tmp</div><div>cd ~/src/buildroot-rpi4-tmp</div><div>make O=3D$(pw=
d) -C ../buildroot menuconfig<br></div><div>```</div><div><br></div><div>Ma=
ybe this is the problem? Is `$(TARGET_DIR)/$(O)` right?</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Buildroot already does that, so when `make modules_install` is execute=
d, the<br>
&gt; output modules directory will be TARGET_DIR/TARGET_DIR/INSTALL_MOD_PAT=
H.<br>
&gt; <br>
&gt; I have no idea who is=C2=A0the one that must change its behavior. :-(<=
br>
&gt; Any suggestions on how to proceed?<br>
&gt; <br>
&gt; Maybe I can unexport DESTDIR before `make modules_install`...<br>
<br>
Yes, DESTDIR is sometime miss used (see buildroot gitlog for example).<br>
<br>
It&#39;s a bug if DESTDIR and INSTALL_MOD_PATH are used together:<br>
<br>
<a href=3D"https://www.gnu.org/prep/standards/html_node/DESTDIR.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.gnu.org/prep/standards/html_n=
ode/DESTDIR.html</a><br>
<br>
<a href=3D"https://www.kernel.org/doc/Documentation/kbuild/modules.txt" rel=
=3D"noreferrer" target=3D"_blank">https://www.kernel.org/doc/Documentation/=
kbuild/modules.txt</a> (INSTALL_MOD_PATH)<br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt; <br>
&gt; Attached alternative patch with LINUX_MAKE_FLAGS and empty INSTALL_MOD=
_PATH.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Otherwise I would suggest to add a comment about th=
e reason why LINUX_MAKE_FLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A0can&#39;t be used.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Romain<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# `./configure` will =
execute a `make modules` test case<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +ZFS_CONF_ENV =3D \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0H=
OSTCC=3D&quot;$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0A=
RCH=3D$(KERNEL_ARCH) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0C=
ROSS_COMPILE=3D&quot;$(TARGET_CROSS)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0D=
EPMOD=3D$(HOST_DIR)/sbin/depmod<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Same here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 ZFS_DEPENDENCIES=
 =3D libaio openssl udev util-linux zlib<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 # sysvinit insta=
lls only a commented-out modules-load.d/ config file<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; Greetings!=C2=A0<br>
<br>
</blockquote></div></div>

--00000000000098421805ca2dca5e--

--===============4156729712880956198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4156729712880956198==--
