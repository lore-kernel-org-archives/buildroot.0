Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD886C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 721874047B;
	Sun, 11 Dec 2022 20:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721874047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCwMuoyedxy3; Sun, 11 Dec 2022 20:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4502540569;
	Sun, 11 Dec 2022 20:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4502540569
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E27A1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 333CD813D4
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 333CD813D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7jWI5MY8RqS for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:41:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D73B6813AC
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D73B6813AC
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:41:24 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id t5so9388575vsh.8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DIZi6FEMBbGdTTnR6KQ3KErNdccuuvcfYgMCVi+9wjA=;
 b=7hyknSvcD1G8JLVOrF29tWExkHBkdZzV84UUkeyQo4WcYlv/g1HmI5jQ17RHTPWPr8
 DTktsfZanLYERgrhmI6OCJzTW4lY4YN9wHo9bnSUqwYntmweS0AQjsx3Lhq4hDQCynp4
 aS8mf1Yja1M+L+b7o+HPHN8Yy32JrMcBFaCKsAFNiO2uUb/44hvGZ5OMpAf8WvMJLcSi
 IU1Kb065wfEmdzC1CA4gwm/hGLX9dKM8Y9O31m+tmOzzJZ9sOzp9nPAvjVE1KYzlm59Z
 mqGcB5z+o+8+DxYD3Zz0eeglZfNRHEoSR3+KGq4SRrOKHYbDtChe505i0XQA0sR+Z9GL
 joYQ==
X-Gm-Message-State: ANoB5pm/O8yG0QgKrrltz2Y0xaBn8GQXmy798+WGI+YT3eXzBg83mYmW
 LGqjvLLOpZBvydi04SWmQ4pPAPQqPMRMOD9rs9N06g==
X-Google-Smtp-Source: AA0mqf7wc1SMucqtgdD0Jbu8rmH9q00Xux1CrfEmrjw+G9NCjeKv/Bmd24hkF9dQ4gbaEWI5lbdl3elE3Yhd6qkHqCE=
X-Received: by 2002:a67:df06:0:b0:3aa:2cb7:fa41 with SMTP id
 s6-20020a67df06000000b003aa2cb7fa41mr44108745vsk.45.1670791283449; Sun, 11
 Dec 2022 12:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-3-gadiyar@ti.com>
 <20221211210933.19fb5199@windsurf>
In-Reply-To: <20221211210933.19fb5199@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 11 Dec 2022 21:41:11 +0100
Message-ID: <CAB0FRssQAoVA9syt1SM3mwafto722J3rxWXeHwiVRsWFmCyBPw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v7 2/3] boot/ti-k3-image-gen: add new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Anand Gadiyar via buildroot <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============4545476213300697636=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4545476213300697636==
Content-Type: multipart/alternative; boundary="000000000000f1b91205ef936848"

--000000000000f1b91205ef936848
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 11 d=C3=A9c. 2022 =C3=A0 21:09, Thomas Petazzoni via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Hello,
>
> On Tue, 6 Dec 2022 11:17:18 -0600
> Anand Gadiyar via buildroot <buildroot@buildroot.org> wrote:
>
> > From: Xuanhao Shi <x-shi@ti.com>
> >
> > This is the image generator that builds the full boot binary,
> > tiboot3.bin, for the R5 core on TI's k3 devices.
> > This requires the R5 spl output from the ti-k3-r5-loader package.
> >
> > https://git.ti.com/cgit/k3-image-gen/k3-image-gen
>
> The commit title should just be:
>
>         boot/ti-k3-image-gen: new package
>
> (not "add new package")
>
>
> > diff --git a/boot/ti-k3-image-gen/Config.in
> b/boot/ti-k3-image-gen/Config.in
> > new file mode 100644
> > index 0000000000..02018f2f78
> > --- /dev/null
> > +++ b/boot/ti-k3-image-gen/Config.in
> > @@ -0,0 +1,30 @@
> > +config BR2_TARGET_TI_K3_IMAGE_GEN
> > +     bool "ti-k3-image-gen"
> > +     select BR2_TARGET_TI_K3_R5_LOADER
>
> Should be a:
>
>         depends on BR2_TARGET_TI_K3_R5_LOADER
>
> > +if BR2_TARGET_TI_K3_IMAGE_GEN
> > +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
> > +     string "SOC type for image gen"
>
>         string "SoC"
>
> > +     help
> > +       The target SoC option for image gen.
> > +       For example, "am64x" for AM64X boards.
> > +
> > +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE
> > +     string "SOC security type for image gen"
>
>         string "SoC security type"
>
> > +     help
> > +       The security type option for image gen.
> > +       Options are "gp", "hs-fs", or "hs-se".
> > +
> > +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
> > +     string "CONFIG type for image gen"
>
>         string "config type"
>
>
> > +define TI_K3_IMAGE_GEN_BUILD_CMDS
> > +     $(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)
> > +endef
>
> There is a serious problem: the build process of this package downloads
> stuff:
>
> Connecting to git.ti.com (git.ti.com)|198.47.28.208|:443... connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/blobs/raw/59=
d6f921b3b562e0aa1f42ce322e4645b1bfc52c/ti-sysfw/ti-sci-firmware-am64x-gp.bi=
n
> [following]
> --2022-12-11 20:53:58--
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/blobs/raw/59=
d6f921b3b562e0aa1f42ce322e4645b1bfc52c/ti-sysfw/ti-sci-firmware-am64x-gp.bi=
n
> Reusing existing connection to git.ti.com:443.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/plain/ti-sys=
fw/ti-sci-firmware-am64x-gp.bin?id=3D59d6f921b3b562e0aa1f42ce322e4645b1bfc5=
2c
> [following]
> --2022-12-11 20:53:59--
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/plain/ti-sys=
fw/ti-sci-firmware-am64x-gp.bin?id=3D59d6f921b3b562e0aa1f42ce322e4645b1bfc5=
2c
> Reusing existing connection to git.ti.com:443.
> HTTP request sent, awaiting response... 200 OK
> Length: 225248 (220K) [application/octet-stream]
> Saving to: =E2=80=98ti-sci-firmware-am64x-gp.bin=E2=80=99
>
> ti-sci-firmware-am64x-gp.bin
> 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] =
219,97K   114KB/s
> in 1,9s
>
> 2022-12-11 20:54:01 (114 KB/s) - =E2=80=98ti-sci-firmware-am64x-gp.bin=E2=
=80=99 saved
> [225248/225248]
>
> Download SUCCESS!
>
> This is not acceptable as it circumvents the download infrastructure of
> Buildroot, but also the legal information collection infrastructure.
>
> This needs to be fixed by downloading this file, either through a
> separate package, or as an _EXTRA_DOWNLOADS of this package, and the
> Makefile needs to be changed to not download this file. My impression
> is that the Makefile will not download the files if they are already
> available. So you could have _EXTRA_DOWNLOADS + some post-extract logic
> to put the files at the right place.
>
>
see
https://patchwork.ozlabs.org/project/buildroot/patch/20221211203826.3117784=
-1-francois.perrad@gadz.org/
this patch does this rework.

Fran=C3=A7ois


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000f1b91205ef936848
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 11 d=C3=A9c. 2022 =C3=A0=
=C2=A021:09, Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot=
@buildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Tue, 6 Dec 2022 11:17:18 -0600<br>
Anand Gadiyar via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org" =
target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; From: Xuanhao Shi &lt;<a href=3D"mailto:x-shi@ti.com" target=3D"_blank=
">x-shi@ti.com</a>&gt;<br>
&gt; <br>
&gt; This is the image generator that builds the full boot binary,<br>
&gt; tiboot3.bin, for the R5 core on TI&#39;s k3 devices.<br>
&gt; This requires the R5 spl output from the ti-k3-r5-loader package.<br>
&gt; <br>
&gt; <a href=3D"https://git.ti.com/cgit/k3-image-gen/k3-image-gen" rel=3D"n=
oreferrer" target=3D"_blank">https://git.ti.com/cgit/k3-image-gen/k3-image-=
gen</a><br>
<br>
The commit title should just be:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot/ti-k3-image-gen: new package<br>
<br>
(not &quot;add new package&quot;)<br>
<br>
<br>
&gt; diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Con=
fig.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..02018f2f78<br>
&gt; --- /dev/null<br>
&gt; +++ b/boot/ti-k3-image-gen/Config.in<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +config BR2_TARGET_TI_K3_IMAGE_GEN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ti-k3-image-gen&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_TARGET_TI_K3_R5_LOADER<br>
<br>
Should be a:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TARGET_TI_K3_R5_LOADER<br>
<br>
&gt; +if BR2_TARGET_TI_K3_IMAGE_GEN<br>
&gt; +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;SOC type for image gen&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 string &quot;SoC&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The target SoC option for image gen.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0For example, &quot;am64x&quot; for AM64X b=
oards.<br>
&gt; +<br>
&gt; +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;SOC security type for image gen&quot=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 string &quot;SoC security type&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The security type option for image gen.<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Options are &quot;gp&quot;, &quot;hs-fs&qu=
ot;, or &quot;hs-se&quot;.<br>
&gt; +<br>
&gt; +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;CONFIG type for image gen&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 string &quot;config type&quot;<br>
<br>
<br>
&gt; +define TI_K3_IMAGE_GEN_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GE=
N_MAKE_OPTS)<br>
&gt; +endef<br>
<br>
There is a serious problem: the build process of this package downloads<br>
stuff:<br>
<br>
Connecting to <a href=3D"http://git.ti.com" rel=3D"noreferrer" target=3D"_b=
lank">git.ti.com</a> (<a href=3D"http://git.ti.com" rel=3D"noreferrer" targ=
et=3D"_blank">git.ti.com</a>)|198.47.28.208|:443... connected.<br>
HTTP request sent, awaiting response... 301 Moved Permanently<br>
Location: <a href=3D"https://git.ti.com/cgit/processor-firmware/ti-linux-fi=
rmware/blobs/raw/59d6f921b3b562e0aa1f42ce322e4645b1bfc52c/ti-sysfw/ti-sci-f=
irmware-am64x-gp.bin" rel=3D"noreferrer" target=3D"_blank">https://git.ti.c=
om/cgit/processor-firmware/ti-linux-firmware/blobs/raw/59d6f921b3b562e0aa1f=
42ce322e4645b1bfc52c/ti-sysfw/ti-sci-firmware-am64x-gp.bin</a> [following]<=
br>
--2022-12-11 20:53:58--=C2=A0 <a href=3D"https://git.ti.com/cgit/processor-=
firmware/ti-linux-firmware/blobs/raw/59d6f921b3b562e0aa1f42ce322e4645b1bfc5=
2c/ti-sysfw/ti-sci-firmware-am64x-gp.bin" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/blobs/raw/=
59d6f921b3b562e0aa1f42ce322e4645b1bfc52c/ti-sysfw/ti-sci-firmware-am64x-gp.=
bin</a><br>
Reusing existing connection to <a href=3D"http://git.ti.com:443" rel=3D"nor=
eferrer" target=3D"_blank">git.ti.com:443</a>.<br>
HTTP request sent, awaiting response... 301 Moved Permanently<br>
Location: <a href=3D"https://git.ti.com/cgit/processor-firmware/ti-linux-fi=
rmware/plain/ti-sysfw/ti-sci-firmware-am64x-gp.bin?id=3D59d6f921b3b562e0aa1=
f42ce322e4645b1bfc52c" rel=3D"noreferrer" target=3D"_blank">https://git.ti.=
com/cgit/processor-firmware/ti-linux-firmware/plain/ti-sysfw/ti-sci-firmwar=
e-am64x-gp.bin?id=3D59d6f921b3b562e0aa1f42ce322e4645b1bfc52c</a> [following=
]<br>
--2022-12-11 20:53:59--=C2=A0 <a href=3D"https://git.ti.com/cgit/processor-=
firmware/ti-linux-firmware/plain/ti-sysfw/ti-sci-firmware-am64x-gp.bin?id=
=3D59d6f921b3b562e0aa1f42ce322e4645b1bfc52c" rel=3D"noreferrer" target=3D"_=
blank">https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/plain/t=
i-sysfw/ti-sci-firmware-am64x-gp.bin?id=3D59d6f921b3b562e0aa1f42ce322e4645b=
1bfc52c</a><br>
Reusing existing connection to <a href=3D"http://git.ti.com:443" rel=3D"nor=
eferrer" target=3D"_blank">git.ti.com:443</a>.<br>
HTTP request sent, awaiting response... 200 OK<br>
Length: 225248 (220K) [application/octet-stream]<br>
Saving to: =E2=80=98ti-sci-firmware-am64x-gp.bin=E2=80=99<br>
<br>
ti-sci-firmware-am64x-gp.bin=C2=A0 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;] 219,97K=C2=A0 =C2=A0114KB/s=C2=A0 =C2=
=A0 in 1,9s=C2=A0 =C2=A0 <br>
<br>
2022-12-11 20:54:01 (114 KB/s) - =E2=80=98ti-sci-firmware-am64x-gp.bin=E2=
=80=99 saved [225248/225248]<br>
<br>
Download SUCCESS!<br>
<br>
This is not acceptable as it circumvents the download infrastructure of<br>
Buildroot, but also the legal information collection infrastructure.<br>
<br>
This needs to be fixed by downloading this file, either through a<br>
separate package, or as an _EXTRA_DOWNLOADS of this package, and the<br>
Makefile needs to be changed to not download this file. My impression<br>
is that the Makefile will not download the files if they are already<br>
available. So you could have _EXTRA_DOWNLOADS + some post-extract logic<br>
to put the files at the right place.<br>
<br></blockquote><div><br></div><div>see <a href=3D"https://patchwork.ozlab=
s.org/project/buildroot/patch/20221211203826.3117784-1-francois.perrad@gadz=
.org/">https://patchwork.ozlabs.org/project/buildroot/patch/20221211203826.=
3117784-1-francois.perrad@gadz.org/</a></div><div>this patch does this rewo=
rk.</div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000f1b91205ef936848--

--===============4545476213300697636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4545476213300697636==--
