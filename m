Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A60FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 08:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A602760E1A;
	Sat, 26 Nov 2022 08:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A602760E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coMBgtl75r-d; Sat, 26 Nov 2022 08:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19F860E17;
	Sat, 26 Nov 2022 08:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19F860E17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C60161BF328
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 08:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F47841DB9
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 08:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F47841DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SM9H24KpufAh for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 08:27:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4249F41DB4
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4249F41DB4
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 08:27:29 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-14286d5ebc3so7619170fac.3
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 00:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Qx4+mZKRH59KRXEPqlxeLy6u9zDCidLRLqGyHhL0Y8=;
 b=n4VC+41AszHKxt4+7ZsLd0ZQU9RgKi3oBBBLdFc2eP8m/qvVmhvishBZ2yP4nQkCrm
 cfyc6AE55CbcE+w3vfv5ANSnTOCV/VqGBWjO0GrtJqqMyV2j2hQDnZD4YWu3vRXPtN7Z
 OYzyuCR8ZKxtmBeZaOtA6C/so6EoY+7xexAVOMwUO0iFCaafFiTTmISs70bI4Frl2jq8
 Ky7MuilByUBuzAc4rBvRpWj8kfPrK/TPJ8F4KfB6qaDnIpMCTuwbqqvLckq17u+t/z8k
 xkyk0TWiYNdqbvxC86x6rTTX6ZwVePeen6HHDA7285ZfZZ82bFo9iV6R6caBtkGJPnAc
 7bWg==
X-Gm-Message-State: ANoB5pnHrLLxRufdovVrkb12hHkGD+lHP4sLOp/FZM0Z5QtetFHI0WmM
 VcRpVaBCUok88bgb45H9f6w0QZKfulzR+q14Vt9H2V0gUMPRkg==
X-Google-Smtp-Source: AA0mqf66PZVsxeoLqW3ZCUpSfYatUAj3iCh5r52SZZGRJ1vqC+0RU2DHL/CZwB+HRKUsQP3wFuU8+qVEBaltEpKzo4Q=
X-Received: by 2002:a05:6870:e90:b0:141:d8d1:2b2b with SMTP id
 mm16-20020a0568700e9000b00141d8d12b2bmr14998241oab.254.1669451248275; Sat, 26
 Nov 2022 00:27:28 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhisX0pmhTi4-QKyhxF5Ccm3FAe__RzbTiEh1UVF0hB3hQ@mail.gmail.com>
In-Reply-To: <CA+fTLhisX0pmhTi4-QKyhxF5Ccm3FAe__RzbTiEh1UVF0hB3hQ@mail.gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 26 Nov 2022 09:27:16 +0100
Message-ID: <CA+_SqVb+jueaZgr8pHiMk-EKyNfF+ejOOPOnenVBLy+LHAVRrA@mail.gmail.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Qx4+mZKRH59KRXEPqlxeLy6u9zDCidLRLqGyHhL0Y8=;
 b=BLX8CPwDyzMujNPhYbNqC9Ne3eZwnxjMBEaggdtTjK9J8hrAuZSOtyk5tPPsb0Z6vO
 VRSBhDY1+6OgpybNU8N3Z87XFKEp9E91dm9NBC0CmXceT7uXL1c4yVcDsOAMLEhJzmpP
 0oBmV513SiZ9Ht2FAkfFq9+vbXDqwF6tXs3tY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BLX8CPwD
Subject: Re: [Buildroot] Updates for nezha and lichee_rv*
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7754797477785326216=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7754797477785326216==
Content-Type: multipart/alternative; boundary="0000000000009faacf05ee5b68c3"

--0000000000009faacf05ee5b68c3
Content-Type: text/plain; charset="UTF-8"

Il sab 26 nov 2022, 09:15 Indrek Kruusa <indrek.kruusa@gmail.com> ha
scritto:

> Hi!
>
> As Samuel Holland mentioned the boot0/TOC1 is not needed anymore for
> Allwinner D1 soc.
> The latest updates, including proper board files, are included in d1-wip
> branch in uboot repo.
> So, when using this branch, like
>
> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
> github,smaeul,u-boot,d1-wip)/uboot-d1-wip.tar.gz"
>
> , the genimage.cfg can be as simple as :
>
> image sdcard.img {
>         hdimage {
>         }
>
>         partition u-boot-0 {
>                 in-partition-table = "no"
>                 image = "u-boot-sunxi-with-spl.bin"
>                 offset = 128K
>         }
>         partition rootfs {
>                 partition-type = 0x83
>                 image = "rootfs.ext4"
>                 bootable = "true"
>                 offset = 2M
>         }
> }
>
> Also, newer linux kernel (v6.1.0-rc3) can be grabbed from Samuel's repo.
> For testing I was using:
>
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
> You have to update headers:
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
>
> Latest buildroot 2022.11-rc3 includes updated rtl8723ds tree so building
> this module works also with newer kernel now.
>
> I verified this on Sipeed's Lichee RV dock, serial console output is
> attached.
>

Thanks for the update. I'm more than welcome to bump my patches and retest
everything as soon as the patchset is included and validated by the
buildroot developers.

It would be nice if you can provide your feedback for the current patchset

http://patchwork.ozlabs.org/project/buildroot/list/?series=326415

To speedup the revision process.


> Also, for getting working HDMI console you have to append this to the
> kernel command line:
> console=tty0 cma=96M video=HDMI-A-1:D fbcon=map:0
>

Nice!


> Best regards,
> Indrek
>
>

--0000000000009faacf05ee5b68c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 26 nov 2022, 09:15 Indrek Kruusa &lt;<a href=3D=
"mailto:indrek.kruusa@gmail.com">indrek.kruusa@gmail.com</a>&gt; ha scritto=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi!=C2=A0</=
div><div><br></div>As Samuel Holland mentioned the boot0/TOC1 is not needed=
 anymore for Allwinner D1 soc.<br>The latest updates, including proper boar=
d files, are included in d1-wip branch in uboot repo.<br>So, when using thi=
s branch, like<br><br>BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot;$(ca=
ll github,smaeul,u-boot,d1-wip)/uboot-d1-wip.tar.gz&quot;<br><br>, the geni=
mage.cfg can be as simple as :<br><br>image sdcard.img {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 hdimage {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 partition u-boot-0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 in-partition-table =3D &quot;no&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &quot;u-boot-sun=
xi-with-spl.bin&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 offset =3D 128K<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 partition rootfs {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 partition-type =3D 0x83<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &quot;rootfs.ext4&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bootable =3D &quot;true&quot;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 2M<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>}<br>=C2=A0<br>Also, newer linux kernel =
(v6.1.0-rc3) can be grabbed from Samuel&#39;s repo. For testing I was using=
:<br><br>BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,sma=
eul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f8=
5d06311c9e98e1adf46308f.tar.gz&quot;<br>You have to update headers:<br>BR2_=
PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy<br><br>Latest buildroot 2022.11-r=
c3 includes updated rtl8723ds tree so building this module works also with =
newer kernel now.<br><br>I verified this on Sipeed&#39;s Lichee RV dock, se=
rial console output is attached.<br></div></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks for the update. I&#39;m more t=
han welcome to bump my patches and retest everything as soon as the patchse=
t is included and validated by the buildroot developers.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">It would be nice if you can provide your f=
eedback for the current patchset</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><a href=3D"http://patchwork.ozlabs.org/project/buildroot/list/?se=
ries=3D326415">http://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D326415</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">To speedup=
 the revision process.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
br><div>Also, for getting working HDMI console you have to append this to t=
he kernel command line:<div>console=3Dtty0 cma=3D96M video=3DHDMI-A-1:D fbc=
on=3Dmap:0</div></div></div></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Nice!</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div><div><br></div><div>Best regards,<br></div><div>Indrek<br></div>=
</div><div><br></div></div>
</blockquote></div></div></div>

--0000000000009faacf05ee5b68c3--

--===============7754797477785326216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7754797477785326216==--
