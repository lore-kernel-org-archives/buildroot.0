Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1FBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 09:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D66C40B92;
	Tue, 21 Jun 2022 09:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D66C40B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcuCzmdUkIg8; Tue, 21 Jun 2022 09:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8BCA400E2;
	Tue, 21 Jun 2022 09:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8BCA400E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13C421BF429
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D794E400E2
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D794E400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peqytXO9Srxt for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 09:21:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6B2400C6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E6B2400C6
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 09:21:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c13so14020471eds.10
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 02:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vAmhpCZFesKNq4scFIm4LLjXdc3lb6DY8A+T4AIB2pc=;
 b=agxfHm6s7JfLdASQkYIbGGC+EnUS1plj9bCLT6VFg2Sjx6o1T3FOpJM9f0QS5EQ/fe
 Q8vzbHXUofZyl7CP9ExzNGpchmejmmzUpeCdSn1D0YIoEb+dSRShr5rVhFjXwKiw+3aK
 LGxugW1zAQPdGMWByKbli+7WU4yn2vxBHGKCLV/EuKrGI0Yle9C+Yf/vvbHhiY/hDJOX
 mhxJOwqtKMbcHttlJp5v2tDu2UQC3qLlYotRSBQ8Bsn8L7qnPw026mGCoAYQ6C9MLP+p
 CDfhs/KOtiAoLUA1rH5nGN6Ad9SiMSP8zi2xMoRfOQhLyU3gdlP6zlbKn4ic9ofSND1x
 gAMQ==
X-Gm-Message-State: AJIora9uS36iVtBwUhXj8Q3qnawv78sVCGtcDOkRIEQjWdnh2NVYWpPo
 q9nOYMQW3LU+JBB+A4r4uJtT7BlGK8zIR1wdM0+vMA==
X-Google-Smtp-Source: AGRyM1sMfDrIEXHpJ+/7ApQrqza1MiO82abs9PghHMPz3huC8zIaQkRvUJ/v9P2eYNLx7izpA73KxBfBiTQOXiB5E44=
X-Received: by 2002:a05:6402:11d1:b0:433:4a09:3f49 with SMTP id
 j17-20020a05640211d100b004334a093f49mr33941060edw.357.1655803268397; Tue, 21
 Jun 2022 02:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220620214058.1435436-1-angelo@amarulasolutions.com>
 <20220620214058.1435436-5-angelo@amarulasolutions.com>
 <8dd28bb6-c97f-d152-d2e9-816c2628a86d@mind.be>
In-Reply-To: <8dd28bb6-c97f-d152-d2e9-816c2628a86d@mind.be>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 21 Jun 2022 11:20:32 +0200
Message-ID: <CA+_SqVb1ZN0U6uSNLsFyv-nA+PAUSMxmFWcvfTpGJZFda-OA7w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vAmhpCZFesKNq4scFIm4LLjXdc3lb6DY8A+T4AIB2pc=;
 b=bfkCv6EVRT6/xUFDFNJTntf+Qkj/1+R1eDMsz7FmxVWbY36m7TNNx3C5FHzE1FNBcI
 n2u2XOKloJ3RNj1AzRSolZY2O7G5FVq/oed16STGKa58sOMAxKxWbV3tMuZjFwG50k59
 LbAm4SsA7ClCsoYCnArKVsQeF1Xt7Lxjbims8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bfkCv6EV
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4608221104931889290=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4608221104931889290==
Content-Type: multipart/alternative; boundary="000000000000a1945e05e1f1bd19"

--000000000000a1945e05e1f1bd19
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 9:49 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 20/06/2022 23:40, Angelo Compagnucci wrote:
> > In cases where no hotplug is available (by choice or by the lack of a
> > proper hotplug method for a device), this service can be used to load
> > kernel module drivers by reading the /etc/modules file.
>
>   Do you have a concrete example of something that needs this? It's kind
> of a
> hack for e.g. a device connected to a serial port that isn't described in
> DT
> (e.g. on an x86 platform), right?
>

Wifi card connected on SDIO with an out of tree kernel module.


>   I'm not altogether sure if it is worth making an init script for that.
>

Most distros out there have the /etc/modules loaded at boot time.


>   Also, this would belong to the initscripts package because it would also
> be
> needed if busybox isn't used at all (it would of course require kmod).
>

Right, I'll fix it


>
>
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> >   package/busybox/S02modules | 56 ++++++++++++++++++++++++++++++++++++++
> >   package/busybox/busybox.mk |  2 ++
> >   2 files changed, 58 insertions(+)
> >   create mode 100644 package/busybox/S02modules
> >
> > diff --git a/package/busybox/S02modules b/package/busybox/S02modules
> > new file mode 100644
> > index 0000000000..f25712e1ca
> > --- /dev/null
> > +++ b/package/busybox/S02modules
> > @@ -0,0 +1,56 @@
> > +#!/bin/sh
> > +
> > +MODULES="modules"
> > +
> > +load_unload() {
> > +     [ ! -f /etc/${MODULES} ] && echo ' OK' && exit 0
> > +
> > +     while read module args; do
> > +
> > +             case "$module" in
> > +                     ""|"#"*) continue ;;
> > +             esac
> > +
> > +             if [ "$1" = "load" ]; then
> > +                     modprobe -q ${module} ${args} >/dev/null && \
> > +                             printf ' %s success,' "$module" ||
> > +                             printf ' %s failed,' "$module"
> > +             else
> > +                     rmmod ${module} >/dev/null
> > +             fi
> > +
> > +     done < /etc/${MODULES}
> > +}
> > +
> > +start() {
> > +     printf 'Starting %s:' "$MODULES"
> > +
> > +     load_unload load
> > +
> > +     echo ' OK'
> > +}
> > +
> > +stop() {
> > +     printf 'Stopping %s: ' "$MODULES"
> > +
> > +     load_unload unload
> > +
> > +     echo 'OK'
> > +}
> > +
> > +restart() {
> > +     stop
> > +     sleep 1
> > +     start
> > +}
> > +
> > +case "$1" in
> > +     start|stop|restart)
> > +             "$1";;
> > +     reload)
> > +             # Restart, since there is no true "reload" feature.
> > +             restart;;
> > +     *)
> > +             echo "Usage: $0 {start|stop|restart|reload}"
> > +             exit 1
> > +esac
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index 3e49de0a84..40490e866a 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
> >       $(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
> >       $(BUSYBOX_INSTALL_ZCIP_SCRIPT)
> >       $(BUSYBOX_INSTALL_MDEV_CONF)
> > +     $(INSTALL) -m 0755 -D package/busybox/S02modules \
> > +                     $(TARGET_DIR)/etc/init.d/S02modules;
>
>   This is a sysvinit script, so it should be installed in
> BUSYBOX_INSTALL_INIT_SYSV.
>
>
>
>   Regards,
>   Arnout
>
> >   endef
> >
> >   # Install the sysvinit scripts, for the moment, but not those that
> already
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

--000000000000a1945e05e1f1bd19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 21, 2022 at 9:49 AM Arnou=
t Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 20/06/2022 23:40, Angelo Compagnucci wrote:<br>
&gt; In cases where no hotplug is available (by choice or by the lack of a<=
br>
&gt; proper hotplug method for a device), this service can be used to load<=
br>
&gt; kernel module drivers by reading the /etc/modules file.<br>
<br>
=C2=A0 Do you have a concrete example of something that needs this? It&#39;=
s kind of a <br>
hack for e.g. a device connected to a serial port that isn&#39;t described =
in DT <br>
(e.g. on an x86 platform), right?<br></blockquote><div><br></div><div>Wifi =
card connected on SDIO with an out of tree kernel module.<br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 I&#39;m not altogether sure if it is worth making an init script for=
 that.<br></blockquote><div><br></div><div>Most distros out there have the =
/etc/modules loaded at boot time.<br></div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 Also, this would belong to the initscripts package because it would =
also be <br>
needed if busybox isn&#39;t used at all (it would of course require kmod).<=
br></blockquote><div><br></div><div>Right, I&#39;ll fix it</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/busybox/S02modules | 56 ++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0package/busybox/<a href=3D"http://busybox.mk" rel=3D"noref=
errer" target=3D"_blank">busybox.mk</a> |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 58 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/busybox/S02modules<br>
&gt; <br>
&gt; diff --git a/package/busybox/S02modules b/package/busybox/S02modules<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..f25712e1ca<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/busybox/S02modules<br>
&gt; @@ -0,0 +1,56 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +MODULES=3D&quot;modules&quot;<br>
&gt; +<br>
&gt; +load_unload() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -f /etc/${MODULES} ] &amp;&amp; echo &#39; OK=
&#39; &amp;&amp; exit 0<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while read module args; do<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$module&qu=
ot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;&quot;|&quot;#&quot;*) continue ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$1&quot; =
=3D &quot;load&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0modprobe -q ${module} ${args} &gt;/dev/null &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39; %s success,&#39; &quot;$mod=
ule&quot; ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39; %s failed,&#39; &quot;$modu=
le&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rmmod ${module} &gt;/dev/null<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done &lt; /etc/${MODULES}<br>
&gt; +}<br>
&gt; +<br>
&gt; +start() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s:&#39; &quot;$MODULES&quot=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0load_unload load<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &#39; OK&#39;<br>
&gt; +}<br>
&gt; +<br>
&gt; +stop() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &quot;$MODULES&quo=
t;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0load_unload unload<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &#39;OK&#39;<br>
&gt; +}<br>
&gt; +<br>
&gt; +restart() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt; +}<br>
&gt; +<br>
&gt; +case &quot;$1&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&quot;;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, since ther=
e is no true &quot;reload&quot; feature.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $0 =
{start|stop|restart|reload}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; +esac<br>
&gt; diff --git a/package/busybox/<a href=3D"http://busybox.mk" rel=3D"nore=
ferrer" target=3D"_blank">busybox.mk</a> b/package/busybox/<a href=3D"http:=
//busybox.mk" rel=3D"noreferrer" target=3D"_blank">busybox.mk</a><br>
&gt; index 3e49de0a84..40490e866a 100644<br>
&gt; --- a/package/busybox/<a href=3D"http://busybox.mk" rel=3D"noreferrer"=
 target=3D"_blank">busybox.mk</a><br>
&gt; +++ b/package/busybox/<a href=3D"http://busybox.mk" rel=3D"noreferrer"=
 target=3D"_blank">busybox.mk</a><br>
&gt; @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_ZCIP_SCRIPT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_MDEV_CONF)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D package/busybox/S02modules =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(TARGET_DIR)/etc/init.d/S02modules;<br>
<br>
=C2=A0 This is a sysvinit script, so it should be installed in BUSYBOX_INST=
ALL_INIT_SYSV.<br>
<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt;=C2=A0 =C2=A0endef<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Install the sysvinit scripts, for the moment, but not th=
ose that already<br>
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

--000000000000a1945e05e1f1bd19--

--===============4608221104931889290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4608221104931889290==--
