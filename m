Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8999CCF042D
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 00:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3185480584;
	Wed,  9 Oct 2024 00:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGj_mthj-CBu; Wed,  9 Oct 2024 00:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F7580A9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F7580A9F;
	Wed,  9 Oct 2024 00:14:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF111BF47F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 00:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49EF080584
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 00:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isuSWHRRhWwe for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 00:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=andrew.2.622266@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4DA2804E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DA2804E5
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4DA2804E5
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 00:14:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9951fba3b4so423589766b.1
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 17:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728432881; x=1729037681;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZ80TpUoqnWILbxxyrOqpzP4pMPGW7XLEM/7Ik65KNo=;
 b=nV2qyAcMc7e3OBLZb/icbYLFwC/yRD+UcZ2mQhJ4/nqKquagZl9//Cm8ipar6n3lti
 2KhrDx3k8LeAUyGIn6XJrDLCoE9H6Ga3UTnuzGN4li255F7crnuEX+Na3g+zfh6lL7yO
 kq8eVbTUA5f/KpNw8wfHJQE+W00Dz1EVdFjD4JKBg6B7ZVR/ZawEOqbRszj937I0uW8h
 OhEaoYvM78eLXkvMpzuBYjJ2LWqY+eOA8aesVkeHe5wxSYmW72dEcyvNPFseloAqV89+
 Y0ZJttNqjP/Ukob3Wf9hR5y+5ltPGDRC8k3LutPQ7OYXwwkUQ78Dbio061YrvVjw7Gk6
 JS5w==
X-Gm-Message-State: AOJu0YwmHg/+2o3kn7wUfkz9GCBMfQQfkAJto514zbcsIUrR48n6EUhl
 qLdz6P67mGV00X7INHsGWmBIs8kCn+TqX/3Uhj3LaDJripmtNsv2CP1ug14m3gF2yU8ADuJHdme
 HhMKfpQYqYUM2ls6zYR3z9Igbs4mW+Q==
X-Google-Smtp-Source: AGHT+IHDn7QiuiDGc9ekZLGdOxu+d7IYed+BSeNedDJPHfCod+VV+FPoBRM8kQEZp332+YLAZlxF9C6qCvRqkKtS2qE=
X-Received: by 2002:a17:906:bc1d:b0:a99:55e7:9721 with SMTP id
 a640c23a62f3a-a998d313b4emr42276366b.46.1728432880262; Tue, 08 Oct 2024
 17:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.4865.1728357518.52868.buildroot@buildroot.org>
 <7912d41040377bdd1c1da93e511c9694@umbiko.net>
In-Reply-To: <7912d41040377bdd1c1da93e511c9694@umbiko.net>
From: Andrew McCann <andrew.2.622266@gmail.com>
Date: Tue, 8 Oct 2024 20:14:28 -0400
Message-ID: <CAPKzRz9JUw_HsATU6jxqxC7eVsDZeQCm_Ru53hPTubFwFjTpWQ@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728432881; x=1729037681; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ80TpUoqnWILbxxyrOqpzP4pMPGW7XLEM/7Ik65KNo=;
 b=AgpnPjjDTTN5nLOzXOKffrL79F7C89YTA133k9ltsGp68Z8QumY92kl69kpd3rEejB
 fpIqTbyGMipXa67ipA9ndpr7LBwHrRM6WnE0QyAbEcWbNPYf2t8pMN3meT11BQshPVjn
 ZyD5BUgn7VBDcUIaRnbvhh/t7eUBogccedMYYVm/BEquz9toL5GXrRWA2eM03wjW3nJ1
 lWjAtxWl7+wNsbZA7KvEDwR8VUYsd+ETr2Rz1WDsey9rswdeWn+6CaUiFGP74tfrWwcI
 zdco7s3DX229mhSbdfzZel25jd65xcHdWl9dmXj3Elmmsi4ySHt1DGjSNKKevral8uFl
 WmLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AgpnPjjD
Subject: Re: [Buildroot] Ethernet Connection
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1629303970657033291=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1629303970657033291==
Content-Type: multipart/alternative; boundary="000000000000d8a5040624002356"

--000000000000d8a5040624002356
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Andreas
Thanks for your detailed reply and for the sources. I will try your
recommendations and see if I can get this to work.
Regards
Andy

On Tue, Oct 8, 2024 at 5:01=E2=80=AFAM Andreas Ziegler <br015@umbiko.net> w=
rote:

> Hi Andy,
>
> On 2024-10-07 20:39, Andrew McCann wrote:
> >
> > Can anyone comment on whether you expect the default rpi3b+
> > configuration
> > to connect to LAN?
> > Regards
> > Andy
>
> It should work. I use a custom configuration, but it was derived from
> the Buildroot standard originally.
>
> > On Wed, Oct 2, 2024 at 5:24?PM Andrew McCann
> > <andrew.2.622266@gmail.com>
> > wrote:
> >
> >> Hi All
> >>
> >> I'm trying to get basic networking working with a Rpi-3b+.  I note
> >> that
> >> with the default config, raspberrypi3_64_defconfig, eth0 is setup as
> >> the
> >> network interface to configure through DHCP.  Also
> >> BR2_PACKAGE_IFUPDOWN_SCRIPTS are enabled by default.
>
> Don't you use a bespoke kernel? Check if the necessary modules are
> enabled.
>
> ifupdown-scripts provides an init.d script and generates
> network/interfaces. Check if the latter matches your system.
>
> Run '/etc/init.d/S40network restart' and follow up on any error
> messages.
>
> >> However, when I boot the system with sdcard.img, the pi does not
> >> connect
> >> to my network. Are there are things that I need to enable that are not
> >> part
> >> of the default configuration?
> >>
> >> My longer term goal is to ssh (using dropbear) into my pi via the LAN,
> >> and
> >> use iwctl to configure iwd for wireless connectivity.  But first I
> >> need to
> >> establish the LAN connection.  Please let me know any advice that you
> >> have,
> >> or any documentation that you can recommend.
>
> I relied on linux-from-scratch [1] and linux-wireless [2] while setting
> up wireless networking, but you might succeed just by adding
> wpa_supplicant and supplying the necessary configuration details.
>
> The Buildroot package handles wpa_supplicant via an ifup/down script; if
> you use a (custom, via skeleton) init.d script instead, you need to
> adapt network/interfaces.
>
> Kind regards,
> Andreas
>
> >> Regards
> >> Andy
>
> [1] https://www.linuxfromscratch.org/
> [2] https://wireless.wiki.kernel.org/
>

--000000000000d8a5040624002356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Andreas</div><div>Thanks for your detailed reply a=
nd for the sources. I will try your recommendations and see if I can get th=
is to work.</div><div>Regards</div><div>Andy<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 8, 2024 =
at 5:01=E2=80=AFAM Andreas Ziegler &lt;<a href=3D"mailto:br015@umbiko.net">=
br015@umbiko.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Andy,<br>
<br>
On 2024-10-07 20:39, Andrew McCann wrote:<br>
&gt; <br>
&gt; Can anyone comment on whether you expect the default rpi3b+ <br>
&gt; configuration<br>
&gt; to connect to LAN?<br>
&gt; Regards<br>
&gt; Andy<br>
<br>
It should work. I use a custom configuration, but it was derived from <br>
the Buildroot standard originally.<br>
<br>
&gt; On Wed, Oct 2, 2024 at 5:24?PM Andrew McCann <br>
&gt; &lt;<a href=3D"mailto:andrew.2.622266@gmail.com" target=3D"_blank">and=
rew.2.622266@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi All<br>
&gt;&gt; <br>
&gt;&gt; I&#39;m trying to get basic networking working with a Rpi-3b+.=C2=
=A0 I note <br>
&gt;&gt; that<br>
&gt;&gt; with the default config, raspberrypi3_64_defconfig, eth0 is setup =
as <br>
&gt;&gt; the<br>
&gt;&gt; network interface to configure through DHCP.=C2=A0 Also<br>
&gt;&gt; BR2_PACKAGE_IFUPDOWN_SCRIPTS are enabled by default.<br>
<br>
Don&#39;t you use a bespoke kernel? Check if the necessary modules are <br>
enabled.<br>
<br>
ifupdown-scripts provides an init.d script and generates <br>
network/interfaces. Check if the latter matches your system.<br>
<br>
Run &#39;/etc/init.d/S40network restart&#39; and follow up on any error <br=
>
messages.<br>
<br>
&gt;&gt; However, when I boot the system with sdcard.img, the pi does not <=
br>
&gt;&gt; connect<br>
&gt;&gt; to my network. Are there are things that I need to enable that are=
 not <br>
&gt;&gt; part<br>
&gt;&gt; of the default configuration?<br>
&gt;&gt; <br>
&gt;&gt; My longer term goal is to ssh (using dropbear) into my pi via the =
LAN, <br>
&gt;&gt; and<br>
&gt;&gt; use iwctl to configure iwd for wireless connectivity.=C2=A0 But fi=
rst I <br>
&gt;&gt; need to<br>
&gt;&gt; establish the LAN connection.=C2=A0 Please let me know any advice =
that you <br>
&gt;&gt; have,<br>
&gt;&gt; or any documentation that you can recommend.<br>
<br>
I relied on linux-from-scratch [1] and linux-wireless [2] while setting <br=
>
up wireless networking, but you might succeed just by adding <br>
wpa_supplicant and supplying the necessary configuration details.<br>
<br>
The Buildroot package handles wpa_supplicant via an ifup/down script; if <b=
r>
you use a (custom, via skeleton) init.d script instead, you need to <br>
adapt network/interfaces.<br>
<br>
Kind regards,<br>
Andreas<br>
<br>
&gt;&gt; Regards<br>
&gt;&gt; Andy<br>
<br>
[1] <a href=3D"https://www.linuxfromscratch.org/" rel=3D"noreferrer" target=
=3D"_blank">https://www.linuxfromscratch.org/</a><br>
[2] <a href=3D"https://wireless.wiki.kernel.org/" rel=3D"noreferrer" target=
=3D"_blank">https://wireless.wiki.kernel.org/</a><br>
</blockquote></div>

--000000000000d8a5040624002356--

--===============1629303970657033291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1629303970657033291==--
