Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA6C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 14:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F98580E94;
	Wed, 24 Jul 2024 14:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqMhMjWaAlYh; Wed, 24 Jul 2024 14:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1973080E49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1973080E49;
	Wed, 24 Jul 2024 14:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C72E1BF20D
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 14:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A10D608DF
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 14:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwwvGb8xr8td for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 14:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABE4060650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE4060650
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABE4060650
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 14:59:47 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6659e81bc68so70469617b3.0
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 07:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721833186; x=1722437986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=svvHoZLZltOcKY0goHCp+me40S5ORjMpFHWWsgevO3Y=;
 b=i4yy6xgjXy9E5NtGUaOuaFKweuT/YyTL0VOpHgG2Uk/yPQ0wBYy8r5KH+jhyPat6pC
 1xlIzVXRZfzcinuxLmoNCmpWkCWkdbJqt8gXYwd+wSvYNUJMXkyLCb3iyVAr6AJwD+Wy
 OUd+96aA5BhtQ9PvLiBQ+tqA1YOFNtxBtP+KG2/rUyJ7OAKl7K/vuSY3QJP9yGOmXkwR
 5tv4oEm9xACbC/5BdG/vjnBGa9e4pkBaxRXinynf4S1Z28IvV9d8ffVfuRNfKxRaPsJD
 igemvNe6pV4XHIy194Ep7mUlmHu9bh8oFh3yLtc8gQvsZzbZB1aJrtHUnn41s63j8gij
 zCJQ==
X-Gm-Message-State: AOJu0Yy4WBHWOsIDoqd7X2PmlSalyBFAEwuj+KP0+GZA1BWuAf+Q1IgI
 6OB0ieRjpnMq1DXTUuoyFMC7eCj8okqf2W7dlE+KgV/f8oKZy5FfXKMl9rccv5uEZ/OPVp31+iH
 Q8IpmNKLlrP5vSmYC7PNAWRlE+tSP
X-Google-Smtp-Source: AGHT+IEvfzQ66jkn2y1C5jDoekJQRofvw8tG3N3eaiFQZdqz/Es1gwGaQlGPGXYNLX7esB5MhtRQ3SogcGl5ps66REI=
X-Received: by 2002:a05:690c:23c8:b0:665:7661:2b7a with SMTP id
 00721157ae682-6727af4338bmr24671427b3.25.1721833186505; Wed, 24 Jul 2024
 07:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFAK9+cph-594kM4jz+4zYV3zTkQZa22o9OwQpsaFBrCrL598g@mail.gmail.com>
 <475db7e5-b2e8-40e9-9547-73b545a33509@gmx.de>
In-Reply-To: <475db7e5-b2e8-40e9-9547-73b545a33509@gmx.de>
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Wed, 24 Jul 2024 16:59:10 +0200
Message-ID: <CAFAK9+eoZ-rncQPW7XqB0Bs77AFCFCRGTxbx=FbLeZxAp+BeQg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721833186; x=1722437986; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=svvHoZLZltOcKY0goHCp+me40S5ORjMpFHWWsgevO3Y=;
 b=e5+8GElOobsWwDH7LbVpxRYfWFLLfw89tLyGpBrKRJfRv8qE+1N8cRicmWcmTPFstz
 Eb7UX7OheehfodUAaKm5663GZ+SP7Y1Z+SIpDOyVTK2m1YkKcxw4rCQ9zX1VQHYRPD7I
 UIuKAxNGHl77FYnJwIGZXk9rXdGpHVMju0hJEFTlcAli9wu3qWzafcmTf5EnPzJGXh6H
 t0WaefCVSjTqq2Sqa83+t4nOzJG6WhTJnbguYT4A8G/AkgzYbn9b7NaOyAJdRjicc591
 KwNPF/PIFpX5PUcd/zoOcE2emrU+JE2zmIoFZ0hehi4M/e3/jUP1ZPeP2U7+lH63aaI5
 9ARw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e5+8GElO
Subject: Re: [Buildroot] RaspberryPi U-Boot watchdog
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
Content-Type: multipart/mixed; boundary="===============4529214271183877312=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4529214271183877312==
Content-Type: multipart/alternative; boundary="00000000000071bb2a061dff8768"

--00000000000071bb2a061dff8768
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fiona,

Your suggestion worked really well.

It helped me figure out I needed to enable the correct watchdog timing
drivers on uboot-buildroot.

Best regards,

Jos=C3=A9 Mendes

On Wed, 24 Jul 2024 at 12:58, Fiona Klute <fiona.klute@gmx.de> wrote:

> Hi Jos=C3=A9!
>
> Am 24.07.24 um 12:16 schrieb Jos=C3=A9 Mendes:
> > Hi all,
> >
> > I'm trying to build a system with redundant rootfs partitions for a
> > Raspberry Pi 4 with U-Boot.
> >
> > I'm trying to test the recovery of this system but I can't seem to get
> the
> > raspberry pi to reset after a kernel panic on a non-working rootfs.
> >
> > To provoke this kernel panic I am simply deleting all the files in the
> > particular rootfs. The system seems to just hang there after the panic:
> >
> > .....
> > [    3.374273] Kernel panic - not syncing: No working init found.  Try
> > passing init=3D option to kernel. See Linux
> > Documentation/admin-guide/init.rst for guidance.
> > [    3.388444] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 6.1.61-v8 #2
> > [    3.394627] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
> > [    3.400456] Call trace:
> > [    3.402897]  dump_backtrace.part.0+0xe8/0x100
> > [    3.407264]  show_stack+0x20/0x30
> > [    3.410579]  dump_stack_lvl+0x88/0xb4
> > [    3.414246]  dump_stack+0x18/0x34
> > [    3.417561]  panic+0x1a0/0x370
> > [    3.420618]  kernel_init+0x138/0x140
> > [    3.424197]  ret_from_fork+0x10/0x20
> > [    3.427776] SMP: stopping secondary CPUs
> > [    3.431701] Kernel Offset: 0x1353c00000 from 0xffffffc008000000
> > [    3.437617] PHYS_OFFSET: 0x0
> > [    3.440492] CPU features: 0x80000,2013c080,0000421b
> > [    3.445368] Memory Limit: none
> > [    3.448423] ---[ end Kernel panic - not syncing: No working init
> found.
> > Try passing init=3D option to kernel. See Linux
> > Documentation/admin-guide/init.rst for guidance. ]---
> >
> > What I've tried:
> > - From `Target packages`: watchdog, watchdogd
> > - Busybox watchdog
> > - From linux-menuconfig > device drivers > watchdog
> > - From uboot-menuconfig > device drivers > watchdog
> >
> > None of these seem to be working for me.
>
> The config options in menuconfig (both for U-Boot and Linux) only enable
> the drivers to support the watchdog. The kernel can handle watchdogs
> internally (see CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED and
> CONFIG_WATCHDOG_OPEN_TIMEOUT in the kernel config), but generally you
> want that only as a transitory thing during boot before a watchdog
> service (whether watchdogd or Busybox watchdog) takes over.
>
> If you want the watchdog to reset no matter how broken the kernel or
> userspace may be, enable the watchdog in U-Boot *before* starting the
> kernel using the "wdt" command:
> https://docs.u-boot.org/en/latest/usage/cmd/wdt.html
>
> Excerpt from my boot.scr that configures the watchdog of an RPi CM4 (so,
> the device may be different for you, and you need the matching driver
> enabled in the U-Boot config) to expect a pet every 15 seconds:
>
> wdt dev watchdog@7e100000
> wdt start 15000
>
> Of course the system then needs to boot up far enough to handle the
> watchdog before that time is over.
>
> Best regards,
> Fiona
>
>

--00000000000071bb2a061dff8768
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Fiona,<br><br>Your suggestion worked really well.<=
br><br>It helped me figure out I needed to enable the correct watchdog timi=
ng drivers on uboot-buildroot.=C2=A0<br><br>Best regards,<br><br>Jos=C3=A9 =
Mendes</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, 24 Jul 2024 at 12:58, Fiona Klute &lt;<a href=3D"mailto:fiona=
.klute@gmx.de">fiona.klute@gmx.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Jos=C3=A9!<br>
<br>
Am 24.07.24 um 12:16 schrieb Jos=C3=A9 Mendes:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m trying to build a system with redundant rootfs partitions for =
a<br>
&gt; Raspberry Pi 4 with U-Boot.<br>
&gt;<br>
&gt; I&#39;m trying to test the recovery of this system but I can&#39;t see=
m to get the<br>
&gt; raspberry pi to reset after a kernel panic on a non-working rootfs.<br=
>
&gt;<br>
&gt; To provoke this kernel panic I am simply deleting all the files in the=
<br>
&gt; particular rootfs. The system seems to just hang there after the panic=
:<br>
&gt;<br>
&gt; .....<br>
&gt; [=C2=A0 =C2=A0 3.374273] Kernel panic - not syncing: No working init f=
ound.=C2=A0 Try<br>
&gt; passing init=3D option to kernel. See Linux<br>
&gt; Documentation/admin-guide/init.rst for guidance.<br>
&gt; [=C2=A0 =C2=A0 3.388444] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 6.1=
.61-v8 #2<br>
&gt; [=C2=A0 =C2=A0 3.394627] Hardware name: Raspberry Pi 4 Model B Rev 1.5=
 (DT)<br>
&gt; [=C2=A0 =C2=A0 3.400456] Call trace:<br>
&gt; [=C2=A0 =C2=A0 3.402897]=C2=A0 dump_backtrace.part.0+0xe8/0x100<br>
&gt; [=C2=A0 =C2=A0 3.407264]=C2=A0 show_stack+0x20/0x30<br>
&gt; [=C2=A0 =C2=A0 3.410579]=C2=A0 dump_stack_lvl+0x88/0xb4<br>
&gt; [=C2=A0 =C2=A0 3.414246]=C2=A0 dump_stack+0x18/0x34<br>
&gt; [=C2=A0 =C2=A0 3.417561]=C2=A0 panic+0x1a0/0x370<br>
&gt; [=C2=A0 =C2=A0 3.420618]=C2=A0 kernel_init+0x138/0x140<br>
&gt; [=C2=A0 =C2=A0 3.424197]=C2=A0 ret_from_fork+0x10/0x20<br>
&gt; [=C2=A0 =C2=A0 3.427776] SMP: stopping secondary CPUs<br>
&gt; [=C2=A0 =C2=A0 3.431701] Kernel Offset: 0x1353c00000 from 0xffffffc008=
000000<br>
&gt; [=C2=A0 =C2=A0 3.437617] PHYS_OFFSET: 0x0<br>
&gt; [=C2=A0 =C2=A0 3.440492] CPU features: 0x80000,2013c080,0000421b<br>
&gt; [=C2=A0 =C2=A0 3.445368] Memory Limit: none<br>
&gt; [=C2=A0 =C2=A0 3.448423] ---[ end Kernel panic - not syncing: No worki=
ng init found.<br>
&gt; Try passing init=3D option to kernel. See Linux<br>
&gt; Documentation/admin-guide/init.rst for guidance. ]---<br>
&gt;<br>
&gt; What I&#39;ve tried:<br>
&gt; - From `Target packages`: watchdog, watchdogd<br>
&gt; - Busybox watchdog<br>
&gt; - From linux-menuconfig &gt; device drivers &gt; watchdog<br>
&gt; - From uboot-menuconfig &gt; device drivers &gt; watchdog<br>
&gt;<br>
&gt; None of these seem to be working for me.<br>
<br>
The config options in menuconfig (both for U-Boot and Linux) only enable<br=
>
the drivers to support the watchdog. The kernel can handle watchdogs<br>
internally (see CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED and<br>
CONFIG_WATCHDOG_OPEN_TIMEOUT in the kernel config), but generally you<br>
want that only as a transitory thing during boot before a watchdog<br>
service (whether watchdogd or Busybox watchdog) takes over.<br>
<br>
If you want the watchdog to reset no matter how broken the kernel or<br>
userspace may be, enable the watchdog in U-Boot *before* starting the<br>
kernel using the &quot;wdt&quot; command:<br>
<a href=3D"https://docs.u-boot.org/en/latest/usage/cmd/wdt.html" rel=3D"nor=
eferrer" target=3D"_blank">https://docs.u-boot.org/en/latest/usage/cmd/wdt.=
html</a><br>
<br>
Excerpt from my boot.scr that configures the watchdog of an RPi CM4 (so,<br=
>
the device may be different for you, and you need the matching driver<br>
enabled in the U-Boot config) to expect a pet every 15 seconds:<br>
<br>
wdt dev watchdog@7e100000<br>
wdt start 15000<br>
<br>
Of course the system then needs to boot up far enough to handle the<br>
watchdog before that time is over.<br>
<br>
Best regards,<br>
Fiona<br>
<br>
</blockquote></div>

--00000000000071bb2a061dff8768--

--===============4529214271183877312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4529214271183877312==--
