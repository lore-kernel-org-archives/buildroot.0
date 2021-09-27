Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F54C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8287F61157
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8287F61157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 111CB400DB;
	Mon, 27 Sep 2021 09:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPKNkd9DS_YS; Mon, 27 Sep 2021 09:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4EFC400F5;
	Mon, 27 Sep 2021 09:49:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2061BF2F1
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 563A780C98
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaK2rbHFS3BQ for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 09:49:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97F6180C95
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 09:49:23 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 bj3-20020a17090b088300b0019e6603fe89so11385101pjb.4
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVrZ/0ymr992zRiRAvqCEZfsXyQFs/Vx6PtuF4Wxx+8=;
 b=TKzmuRzfIN9sV8tVnHGnyC8J1xlhN4WJEEXyrgbj1IDI6biHUpMKr+Nreu3BzdfPJR
 DF/T2rpN/Dm3lHtHU3Xw+VPjz39PYuEYAnS8WtU8f58d7r4Pj6g0HuLN7nokFh/yHuSt
 k9kbhuzBNu5oTA98uzhntEnSzdq5+AWgb+Ikz78kFJAu6NvCh/u6F/i3NBbI32obeEk2
 0tVNYoLrPrdqY5Q+0zz50bSxiuFpMGNCWRjzceDRUljmqeD0Gwu8E06eiD6GtRjnEgj1
 mhSLFAWvwf7lDU4JpYiayPELnuNKwVugrpW37toClPI2dtSPkDJgnDLolQO8Mb7e/3do
 igNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVrZ/0ymr992zRiRAvqCEZfsXyQFs/Vx6PtuF4Wxx+8=;
 b=CGbEp5KXfQmnxvo0xQx9ZVlbP9ikXyEG+xtPIIT0oJwIYHgq20jntKHqFcqBzWIFmd
 b5cGhIvn+mS59r+tK6Y328PBqmXA0REqxOs/RD1PDbsu5sEeVfzjuIHtOUF4CpSAg9qB
 O7VkqI9Jw8eq+dfZJt1R8HEhR6Jcpr5rXYtnAttwrOKgsWxoVS4cz1TZANe7g/TVY9+W
 eShVYKXJ7Ohzp2Z6D8I6pDtBpnbHNDDX4lRofy4umeofT++NPJcoKncc+CHHVCCEL/y3
 BL0dNaNmxPYlccN+UKioiQhvojHEhrooAoN2jLUb5WIFvEiNXtaL+azsYzUsIeM4Ye81
 R1LA==
X-Gm-Message-State: AOAM530UxeUvDtPItB5WyKnDeMrRZVlFT/An9/9hfCaGsT3OWdNC3cHd
 7Tri+ik1Mq7oX5tzg5CK0Izbv+X/gNmPwxw0iudf2fxkeIs=
X-Google-Smtp-Source: ABdhPJzcPNMvZdY7amHwshIOh5v0lrXWjmPtVsa4TfpNAyNron0iUgityeKqpC8fhEND6SvtGTldXy6Xzu7GogagVA4=
X-Received: by 2002:a17:902:c204:b0:13d:c6ef:7cf2 with SMTP id
 4-20020a170902c20400b0013dc6ef7cf2mr22096973pll.33.1632736162782; Mon, 27 Sep
 2021 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHpv4cOfQv_PoRU0YN3NANLjcK9tooxUM-zFcQm-t2Xc0zP5xQ@mail.gmail.com>
 <76537c4d-163e-7947-5956-69969420e083@green-communications.fr>
 <20210922194047.32914074@gmx.net>
In-Reply-To: <20210922194047.32914074@gmx.net>
From: Jeremy Fleischman <jeremyfleischman@gmail.com>
Date: Mon, 27 Sep 2021 02:49:11 -0700
Message-ID: <CAHpv4cOFqnbiXZwpYNKBxn7fvnJ26GsKsFXcHXsPAXpXjtbf_A@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] Recommended way to auto-reconnect wifi?
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============3626430877642887805=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3626430877642887805==
Content-Type: multipart/alternative; boundary="000000000000fe9ffe05ccf70255"

--000000000000fe9ffe05ccf70255
Content-Type: text/plain; charset="UTF-8"

Thanks! I've gone ahead with Nicolas's suggestion to create a
custom busybox configuration with CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS
tweaked to include the -b option.

On Wed, Sep 22, 2021 at 10:40 AM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Jeremy, Nicolas,
>
> On Wed, 22 Sep 2021 10:19:27 +0200, Nicolas Cavallari <
> nicolas.cavallari@green-communications.fr> wrote:
>
> > On 22/09/2021 02:16, Jeremy Fleischman wrote:
> > > I've been happily using buildroot for a growing number of Raspberry
> PIs at
> > > home. However, I've noticed that whenever our wifi cuts out, they do
> not
> > > reconnect when it comes back.
> > >
> > > I've got them configured using BusyBox init + mdev + ifupdown +
> > > wpa_supplicant. I've skimmed through /etc/inittab, and I think I
> understand
> > > how everything is wired together:
> > >
> > >    - /etc/init.d/S10mdev: mdev starts up, and asynchronously starts
> > > discovering devices.
> > >    - /etc/init.d/S40network: This runs /sbin/ifup -a. I think this runs
> > > while mdev is still discovering devices, which is fine, because
> there's a
> > > wait-delay configured in /etc/network/interfaces:
> > >
> > > # cat /etc/network/interfaces
> > > auto lo
> > > iface lo inet loopback
> > >
> > > auto wlan0
> > > iface wlan0 inet dhcp
> > >      hostname thermometer
> > >      pre-up wpa_supplicant -D nl80211 -i wlan0 -c
> /etc/wpa_supplicant.conf -B
> > >      post-down killall -q wpa_supplicant
> > >      *wait-delay 15*
> > >
> > > iface default inet dhcp
> > >
> > > As far as I can tell, this all only ever happens at startup, and there
> > > isn't any mechanism that would attempt to reconnect to a wifi network
> after
> > > a disconnect. I've done some googling, and here's what I've learned:
> > >
> > >    - I'm pretty sure that wpa_supplicant is not supposed to handle
> this.
> > >    - It looks like some people write scripts to handle this for
> themselves.
> > > See this SO answer <https://raspberrypi.stackexchange.com/a/5121> and
> > > this dweeber/WiFi_Check
> > > repo <https://github.com/dweeber/WiFi_Check>.
> > >
> > > Am I correct that this is something I should fix by adding some sort of
> > > background/cron process to do something like the WiFi_Check script
> above?
> > > Or is this something buildroot does have baked in support for, and I
> just
> > > haven't found it yet?
> >
> > Buildroot has nothing out of the box for this, short of
> > NetworkManager/connman or the likes.
> >
> > In your case, wpasupplicant should reconnect automatically if it is
> > disconnected, but the busybox DHCP client, udhcpc  won't retry
> > indefinitely by default. If you use a custom busybox configuration, you
> > can modify CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS to make udhcpc go into
> > background and retry indefinitely.
>
> Alternatively use the following patch [1] to change the
> ifupdown-scripts...,
> or do a complete change away from wpasupplicant and use iwd (see [2])
> providing AutoConnect and DHCP...
>
> Regards,
> Peter
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20210216202022.27264-1-ps.report@gmx.net/
> [2] https://iwd.wiki.kernel.org/start
>
>
> >
> > Also, note that you can copy the Debian ifupdown scripts into your image
> > and then use the Debian's wpa-* options in /etc/network/interface. You
> > will have to tweak them a bit because buildroot install wpasupplicant in
> > /usr/sbin instead of /sbin.
> > _______________________________________________
> > buildroot mailing list
> > buildroot@lists.buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000fe9ffe05ccf70255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! I&#39;ve gone ahead with=C2=A0Nicolas&#39;s sugges=
tion to create a custom=C2=A0busybox configuration with=C2=A0CONFIG_IFUPDOW=
N_UDHCPC_CMD_OPTIONS tweaked to include the -b option.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021=
 at 10:40 AM Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net">ps.rep=
ort@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello Jeremy, Nicolas,<br>
<br>
On Wed, 22 Sep 2021 10:19:27 +0200, Nicolas Cavallari &lt;<a href=3D"mailto=
:nicolas.cavallari@green-communications.fr" target=3D"_blank">nicolas.caval=
lari@green-communications.fr</a>&gt; wrote:<br>
<br>
&gt; On 22/09/2021 02:16, Jeremy Fleischman wrote:<br>
&gt; &gt; I&#39;ve been happily using buildroot for a growing number of Ras=
pberry PIs at<br>
&gt; &gt; home. However, I&#39;ve noticed that whenever our wifi cuts out, =
they do not<br>
&gt; &gt; reconnect when it comes back.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve got them configured using BusyBox init + mdev + ifupdown=
 +<br>
&gt; &gt; wpa_supplicant. I&#39;ve skimmed through /etc/inittab, and I thin=
k I understand<br>
&gt; &gt; how everything is wired together:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - /etc/init.d/S10mdev: mdev starts up, and asynchron=
ously starts<br>
&gt; &gt; discovering devices.<br>
&gt; &gt;=C2=A0 =C2=A0 - /etc/init.d/S40network: This runs /sbin/ifup -a. I=
 think this runs<br>
&gt; &gt; while mdev is still discovering devices, which is fine, because t=
here&#39;s a<br>
&gt; &gt; wait-delay configured in /etc/network/interfaces:<br>
&gt; &gt;<br>
&gt; &gt; # cat /etc/network/interfaces<br>
&gt; &gt; auto lo<br>
&gt; &gt; iface lo inet loopback<br>
&gt; &gt;<br>
&gt; &gt; auto wlan0<br>
&gt; &gt; iface wlan0 inet dhcp<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 hostname thermometer<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pre-up wpa_supplicant -D nl80211 -i wlan0 -c =
/etc/wpa_supplicant.conf -B<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 post-down killall -q wpa_supplicant<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 *wait-delay 15*<br>
&gt; &gt;<br>
&gt; &gt; iface default inet dhcp<br>
&gt; &gt;<br>
&gt; &gt; As far as I can tell, this all only ever happens at startup, and =
there<br>
&gt; &gt; isn&#39;t any mechanism that would attempt to reconnect to a wifi=
 network after<br>
&gt; &gt; a disconnect. I&#39;ve done some googling, and here&#39;s what I&=
#39;ve learned:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - I&#39;m pretty sure that wpa_supplicant is not sup=
posed to handle this.<br>
&gt; &gt;=C2=A0 =C2=A0 - It looks like some people write scripts to handle =
this for themselves.<br>
&gt; &gt; See this SO answer &lt;<a href=3D"https://raspberrypi.stackexchan=
ge.com/a/5121" rel=3D"noreferrer" target=3D"_blank">https://raspberrypi.sta=
ckexchange.com/a/5121</a>&gt; and<br>
&gt; &gt; this dweeber/WiFi_Check<br>
&gt; &gt; repo &lt;<a href=3D"https://github.com/dweeber/WiFi_Check" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/dweeber/WiFi_Check</a>&gt=
;.<br>
&gt; &gt;<br>
&gt; &gt; Am I correct that this is something I should fix by adding some s=
ort of<br>
&gt; &gt; background/cron process to do something like the WiFi_Check scrip=
t above?<br>
&gt; &gt; Or is this something buildroot does have baked in support for, an=
d I just<br>
&gt; &gt; haven&#39;t found it yet?<br>
&gt;<br>
&gt; Buildroot has nothing out of the box for this, short of<br>
&gt; NetworkManager/connman or the likes.<br>
&gt;<br>
&gt; In your case, wpasupplicant should reconnect automatically if it is<br=
>
&gt; disconnected, but the busybox DHCP client, udhcpc=C2=A0 won&#39;t retr=
y<br>
&gt; indefinitely by default. If you use a custom busybox configuration, yo=
u<br>
&gt; can modify CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS to make udhcpc go into<b=
r>
&gt; background and retry indefinitely.<br>
<br>
Alternatively use the following patch [1] to change the ifupdown-scripts...=
,<br>
or do a complete change away from wpasupplicant and use iwd (see [2])<br>
providing AutoConnect and DHCP...<br>
<br>
Regards,<br>
Peter<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2021021=
6202022.27264-1-ps.report@gmx.net/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://patchwork.ozlabs.org/project/buildroot/patch/20210216202022.27264-1-p=
s.report@gmx.net/</a><br>
[2] <a href=3D"https://iwd.wiki.kernel.org/start" rel=3D"noreferrer" target=
=3D"_blank">https://iwd.wiki.kernel.org/start</a><br>
<br>
<br>
&gt;<br>
&gt; Also, note that you can copy the Debian ifupdown scripts into your ima=
ge<br>
&gt; and then use the Debian&#39;s wpa-* options in /etc/network/interface.=
 You<br>
&gt; will have to tweak them a bit because buildroot install wpasupplicant =
in<br>
&gt; /usr/sbin instead of /sbin.<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@lists.buildroot.org" target=3D"_blank">bui=
ldroot@lists.buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div>

--000000000000fe9ffe05ccf70255--

--===============3626430877642887805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3626430877642887805==--
