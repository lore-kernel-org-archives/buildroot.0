Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832D9C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 07:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B57828BA;
	Tue, 28 Jun 2022 07:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B57828BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3N7JaSJFA-x5; Tue, 28 Jun 2022 07:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B27A882730;
	Tue, 28 Jun 2022 07:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B27A882730
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 966171BF228
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 07:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69B93404AA
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 07:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B93404AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAntX6f7qlf0 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 07:57:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824B84049A
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824B84049A
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 07:57:11 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id cw10so24036727ejb.3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 00:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoMv3zraMcuxsHKByt6jI3IYXIkKy6N/eMjYGNER30Q=;
 b=wp5zbjahWFD71yB4yQXxEqLECjVoCN/lKn5CVidCNdZGWKpSolIgLCBGKtAHkNc+lh
 CX6JQxT5dhGFWpO9h0GkG9GbHGqUuFqu52x7xGt9sCIzxglOMphLM2houUf4Xti1rb7x
 0/Y7cY3NiTq+cD1cZM0IxyESKGI8AngIh/7uX05/ZKlk63LD81JQ1bH3r7tiHLRZ6JfC
 +9kIEyTb3AqyCqrQ1CYqcjr2dlvTv/BGatrdLcRz2PbZk14IDfCY3TXfpj+H/4lGvry0
 GU/jkzjHfXgAYaipQB3b7rXCGTw9MgSDllR6NsYOnWCkdwJ0VXFtIeMEbxUudC2+PbnB
 eBMQ==
X-Gm-Message-State: AJIora+VCg4McSPcAHjuutHPXZvbOZEsj6kahFILv+zSH6FdGTs0tABy
 klJbIWhTh5Oz0aDO06vwA7Ca1A/71YWlA8ECjDtb5Q==
X-Google-Smtp-Source: AGRyM1tKs4TfAimrjEZliRCnj2PCZdRq31IZevg+UeJi49RhcIfdTzSN1bT6saCqCJfvWOZmshTMMwReLBjYgv/Ez0w=
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id
 hr1-20020a1709073f8100b006ff1a3d9092mr16409051ejc.319.1656403029719; Tue, 28
 Jun 2022 00:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
 <f68f04d611f75d87d9fae2a0a04a3896@umbiko.net>
In-Reply-To: <f68f04d611f75d87d9fae2a0a04a3896@umbiko.net>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Jun 2022 09:56:33 +0200
Message-ID: <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VoMv3zraMcuxsHKByt6jI3IYXIkKy6N/eMjYGNER30Q=;
 b=qvVuj21/5fZZgXQRVAPlML/js1wt59Z4v95+3BwCWvSNIMCjeIzYIjSiYO7WvC5QZJ
 chdA3o1HBz5mE0BbnvZpNjxfAdhFu/2o0KgZkl+B7lfvXAmsfSpfX1PnQr0zn8Xe4Q5O
 44fCfPHUZ1MCqN1uU23RqpiGu2y3cpkIqCX6w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qvVuj21/
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: add service to load
 kernel modules at boot
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3602967629111077867=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3602967629111077867==
Content-Type: multipart/alternative; boundary="0000000000003116de05e27d623e"

--0000000000003116de05e27d623e
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 25, 2022 at 7:02 AM Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Angelo,
>
> On 2022-06-21 13:31, Angelo Compagnucci <angelo@amarulasolutions.com>
> wrote:
>
> >>
> >>
> >> On 20/06/2022 23:40, Angelo Compagnucci wrote:
> >> > In cases where no hotplug is available (by choice or by the lack of a
> >> > proper hotplug method for a device), this service can be used to load
> >> > kernel module drivers by reading the /etc/modules file.
> >>
> >>   Do you have a concrete example of something that needs this? It's
> >> kind
> >> of a
> >> hack for e.g. a device connected to a serial port that isn't described
> >> in
> >> DT
> >> (e.g. on an x86 platform), right?
> >>
> >
> > Wifi card connected on SDIO with an out of tree kernel module.
> >
> >
> >>   I'm not altogether sure if it is worth making an init script for
> >> that.
> >>
> >
> > Most distros out there have the /etc/modules loaded at boot time.
> >
> >
> >>   Also, this would belong to the initscripts package because it would
> >> also
> >> be
> >> needed if busybox isn't used at all (it would of course require kmod).
> >>
> >
> > Right, I'll fix it
> >
> >
> >>
> >>
> >> >
> >> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> >> > ---
> >> >   package/busybox/S02modules | 56
> ++++++++++++++++++++++++++++++++++++++
> >> >   package/busybox/busybox.mk |  2 ++
> >> >   2 files changed, 58 insertions(+)
> >> >   create mode 100644 package/busybox/S02modules
> >> >
> >> > diff --git a/package/busybox/S02modules b/package/busybox/S02modules
>
> S02 is a bit early, [mu]dev use S10.
>

Can you point me to these  [mu]dev scripts?


> >> > new file mode 100644
> >> > index 0000000000..f25712e1ca
> >> > --- /dev/null
> >> > +++ b/package/busybox/S02modules
> >> > @@ -0,0 +1,56 @@
> >> > +#!/bin/sh
> >> > +
> >> > +MODULES="modules"
> >> > +
> >> > +load_unload() {
> >> > +     [ ! -f /etc/${MODULES} ] && echo ' OK' && exit 0
> >> > +
> >> > +     while read module args; do
> >> > +
> >> > +             case "$module" in
> >> > +                     ""|"#"*) continue ;;
> >> > +             esac
> >> > +
> >> > +             if [ "$1" = "load" ]; then
> >> > +                     modprobe -q ${module} ${args} >/dev/null && \
> >> > +                             printf ' %s success,' "$module" ||
> >> > +                             printf ' %s failed,' "$module"
> >> > +             else
> >> > +                     rmmod ${module} >/dev/null
> >> > +             fi
> >> > +
> >> > +     done < /etc/${MODULES}
> >> > +}
> >> > +
> >> > +start() {
> >> > +     printf 'Starting %s:' "$MODULES"
> >> > +
> >> > +     load_unload load
> >> > +
> >> > +     echo ' OK'
> >> > +}
> >> > +
> >> > +stop() {
> >> > +     printf 'Stopping %s: ' "$MODULES"
> >> > +
> >> > +     load_unload unload
> >> > +
> >> > +     echo 'OK'
> >> > +}
> >> > +
> >> > +restart() {
> >> > +     stop
> >> > +     sleep 1
> >> > +     start
> >> > +}
> >> > +
> >> > +case "$1" in
> >> > +     start|stop|restart)
> >> > +             "$1";;
> >> > +     reload)
> >> > +             # Restart, since there is no true "reload" feature.
> >> > +             restart;;
> >> > +     *)
> >> > +             echo "Usage: $0 {start|stop|restart|reload}"
> >> > +             exit 1
> >> > +esac
> >> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> >> > index 3e49de0a84..40490e866a 100644
> >> > --- a/package/busybox/busybox.mk
> >> > +++ b/package/busybox/busybox.mk
> >> > @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
> >> >       $(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
> >> >       $(BUSYBOX_INSTALL_ZCIP_SCRIPT)
> >> >       $(BUSYBOX_INSTALL_MDEV_CONF)
> >> > +     $(INSTALL) -m 0755 -D package/busybox/S02modules \
> >> > +                     $(TARGET_DIR)/etc/init.d/S02modules;
>
> Since this is intended for systems without dynamic device handling, you
> might use an optional script, similar to BUSYBOX_INSTALL_*_SCRIPT:
>
> # Copy S22modules to /etc/init.d if no dynamic device handling is used
> ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> define BUSYBOX_INSTALL_MODULES_SCRIPT
>         $(INSTALL) -m 0755 -D package/busybox/S22modules \
>                 $(TARGET_DIR)/etc/init.d/S22modules;
> endef # BUSYBOX_INSTALL_MODULES_SCRIPT
>
> Probably a default /etc/modules could also be installed.
>

Yes, but it is not the only usecase here. A usecase could be a userspace
software that needs a special kernel module to be loaded on boot or a
hardware which cannot be hotplugged.
My usecase was for a wifi card connected via sdio running only with an out
of tree kernel module. The wifi card is soldered and doesn't have a CS to
trigger an hotplug event and the only sensible way I found to load the
module at boot was to have a proper way to load modules at boot.
I'm not aware normal distros does so much tinkering about loading a kernel
module at boot: /etc/modules or the newly /etc/modules-load.d/ for systemd
are widely adopted and are usually working out of the box.


>
> Kind regards,
> Andreas
>
> >>
> >>   This is a sysvinit script, so it should be installed in
> >> BUSYBOX_INSTALL_INIT_SYSV.
> >>
> >>
> >>
> >>   Regards,
> >>   Arnout
> >>
> >> >   endef
> >> >
> >> >   # Install the sysvinit scripts, for the moment, but not those that
> >> already
> >>
> >
> >
> > --
> >
> > Angelo Compagnucci
> >
> > Software Engineer
> >
> > angelo@amarulasolutions.com
> > __________________________________
> > Amarula Solutions SRL
> >
> > Via le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 (0)42 243 5310
> > info@amarulasolutions.com
> >
> > www.amarulasolutions.com
> > [`as] https://www.amarulasolutions.com|
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--0000000000003116de05e27d623e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 25, 2022 at 7:02 AM Andre=
as Ziegler &lt;<a href=3D"mailto:br015@umbiko.net">br015@umbiko.net</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Angel=
o,<br>
<br>
On 2022-06-21 13:31, Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarul=
asolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt; <br>
wrote:<br>
<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; On 20/06/2022 23:40, Angelo Compagnucci wrote:<br>
&gt;&gt; &gt; In cases where no hotplug is available (by choice or by the l=
ack of a<br>
&gt;&gt; &gt; proper hotplug method for a device), this service can be used=
 to load<br>
&gt;&gt; &gt; kernel module drivers by reading the /etc/modules file.<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0Do you have a concrete example of something that needs=
 this? It&#39;s <br>
&gt;&gt; kind<br>
&gt;&gt; of a<br>
&gt;&gt; hack for e.g. a device connected to a serial port that isn&#39;t d=
escribed <br>
&gt;&gt; in<br>
&gt;&gt; DT<br>
&gt;&gt; (e.g. on an x86 platform), right?<br>
&gt;&gt; <br>
&gt; <br>
&gt; Wifi card connected on SDIO with an out of tree kernel module.<br>
&gt; <br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0I&#39;m not altogether sure if it is worth making an i=
nit script for <br>
&gt;&gt; that.<br>
&gt;&gt; <br>
&gt; <br>
&gt; Most distros out there have the /etc/modules loaded at boot time.<br>
&gt; <br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0Also, this would belong to the initscripts package bec=
ause it would <br>
&gt;&gt; also<br>
&gt;&gt; be<br>
&gt;&gt; needed if busybox isn&#39;t used at all (it would of course requir=
e kmod).<br>
&gt;&gt; <br>
&gt; <br>
&gt; Right, I&#39;ll fix it<br>
&gt; <br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angel=
o@amarulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&g=
t;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0package/busybox/S02modules | 56 +++++++++++++++++=
+++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 =C2=A0package/busybox/<a href=3D"http://busybox.mk" rel=
=3D"noreferrer" target=3D"_blank">busybox.mk</a> |=C2=A0 2 ++<br>
&gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 58 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0create mode 100644 package/busybox/S02modules<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/package/busybox/S02modules b/package/busybox/S02=
modules<br>
<br>
S02 is a bit early, [mu]dev use S10.<br></blockquote><div><br></div><div>Ca=
n you point me to these=C2=A0 [mu]dev scripts?</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..f25712e1ca<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/package/busybox/S02modules<br>
&gt;&gt; &gt; @@ -0,0 +1,56 @@<br>
&gt;&gt; &gt; +#!/bin/sh<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +MODULES=3D&quot;modules&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +load_unload() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0[ ! -f /etc/${MODULES} ] &amp;&amp; echo=
 &#39; OK&#39; &amp;&amp; exit 0<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0while read module args; do<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$=
module&quot; in<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;&quot;|&quot;#&quot;*) continue ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$=
1&quot; =3D &quot;load&quot; ]; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0modprobe -q ${module} ${args} &gt;/dev/null &amp;&amp; \<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39; %s success,&#39; =
&quot;$module&quot; ||<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39; %s failed,&#39; &=
quot;$module&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rmmod ${module} &gt;/dev/null<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0done &lt; /etc/${MODULES}<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +start() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s:&#39; &quot;$MOD=
ULES&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0load_unload load<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0echo &#39; OK&#39;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +stop() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &quot;$MO=
DULES&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0load_unload unload<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0echo &#39;OK&#39;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +restart() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +case &quot;$1&quot; in<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&quo=
t;;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, s=
ince there is no true &quot;reload&quot; feature.<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<br=
>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;U=
sage: $0 {start|stop|restart|reload}&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt;&gt; &gt; +esac<br>
&gt;&gt; &gt; diff --git a/package/busybox/<a href=3D"http://busybox.mk" re=
l=3D"noreferrer" target=3D"_blank">busybox.mk</a> b/package/busybox/<a href=
=3D"http://busybox.mk" rel=3D"noreferrer" target=3D"_blank">busybox.mk</a><=
br>
&gt;&gt; &gt; index 3e49de0a84..40490e866a 100644<br>
&gt;&gt; &gt; --- a/package/busybox/<a href=3D"http://busybox.mk" rel=3D"no=
referrer" target=3D"_blank">busybox.mk</a><br>
&gt;&gt; &gt; +++ b/package/busybox/<a href=3D"http://busybox.mk" rel=3D"no=
referrer" target=3D"_blank">busybox.mk</a><br>
&gt;&gt; &gt; @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_ZCIP_SCRIPT)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_MDEV_CONF)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D package/busybox/S0=
2modules \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/init.d/S02modules;<br>
<br>
Since this is intended for systems without dynamic device handling, you <br=
>
might use an optional script, similar to BUSYBOX_INSTALL_*_SCRIPT:<br>
<br>
# Copy S22modules to /etc/init.d if no dynamic device handling is used<br>
ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)<br>
define BUSYBOX_INSTALL_MODULES_SCRIPT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -m 0755 -D package/busybox/S22module=
s \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/etc/i=
nit.d/S22modules;<br>
endef # BUSYBOX_INSTALL_MODULES_SCRIPT<br>
<br>
Probably a default /etc/modules could also be installed.<br></blockquote><d=
iv><br></div><div>Yes, but it is not the only usecase here. A usecase could=
 be a userspace software that needs a special kernel module to be loaded on=
 boot or a hardware which cannot be hotplugged.</div><div>My usecase was fo=
r a wifi card connected via sdio running only with an out of tree kernel mo=
dule. The wifi card is soldered and doesn&#39;t have a CS to trigger an hot=
plug event and the only sensible way I found to load the module at boot was=
 to have a proper way to load modules at boot.</div><div>I&#39;m not aware =
normal distros does so much tinkering about loading a kernel module at boot=
: /etc/modules or the newly /etc/modules-load.d/ for systemd are widely ado=
pted and are usually working out of the box.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Andreas<br>
<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0This is a sysvinit script, so it should be installed i=
n<br>
&gt;&gt; BUSYBOX_INSTALL_INIT_SYSV.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0Regards,<br>
&gt;&gt;=C2=A0 =C2=A0Arnout<br>
&gt;&gt; <br>
&gt;&gt; &gt;=C2=A0 =C2=A0endef<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# Install the sysvinit scripts, for the moment, b=
ut not those that<br>
&gt;&gt; already<br>
&gt;&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; Angelo Compagnucci<br>
&gt; <br>
&gt; Software Engineer<br>
&gt; <br>
&gt; <a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angel=
o@amarulasolutions.com</a><br>
&gt; __________________________________<br>
&gt; Amarula Solutions SRL<br>
&gt; <br>
&gt; Via le Canevare 30, 31100 Treviso, Veneto, IT<br>
&gt; <br>
&gt; T. +39 (0)42 243 5310<br>
&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@am=
arulasolutions.com</a><br>
&gt; <br>
&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=
=3D"_blank">www.amarulasolutions.com</a><br>
&gt; [`as] <a href=3D"https://www.amarulasolutions.com" rel=3D"noreferrer" =
target=3D"_blank">https://www.amarulasolutions.com</a>|<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--0000000000003116de05e27d623e--

--===============3602967629111077867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3602967629111077867==--
