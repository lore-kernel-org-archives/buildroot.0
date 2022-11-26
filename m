Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0515BC4321E
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 15:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5983360812;
	Sat, 26 Nov 2022 15:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5983360812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Po7oKgyqtFMg; Sat, 26 Nov 2022 15:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61A8660A8B;
	Sat, 26 Nov 2022 15:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61A8660A8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71B371BF4E4
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 15:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D15140522
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 15:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D15140522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lYkJ0jMeov0 for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 15:29:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21D0400FD
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E21D0400FD
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 15:29:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s12so9981945edd.5
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 07:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0w2W58oTOwL5KXcYcuAITjuQ1Kjtej4BPNhYfhUM/04=;
 b=jSZk2UbJB+tJ78fZuzNdkFyglI45OKks9FM3Wy3BNq6ez+aVP6bj0gY7XNVXjo6CSK
 4fCiDSFhRRerJYovGLFkgTexcNPqdOcCcTwHzt0PFClqfwmIcx3iiWHmhGxfOKatF77d
 8QqInD/HMV5fFICSC5khX120QQwLn0MMGcqpKP3G35/4Yv2L3l0Xof4Ns0YqOYNLiua8
 +SZp0jlhuv6C3eToNQsqGnFvmNa7qeXYPFX2zuzyDV3Ty1wMJN2OwuM+RiVDHe+bCBsh
 XX96MS5a7yCwsS9vArulUix6KC+WZooIUXa5dbmLev6Tt30JlUv9JaBnsigbvIxvU2FJ
 BQtA==
X-Gm-Message-State: ANoB5plJduO29OyOMc2zKRudV80FTezuzA69r/KNKbSoDKHjoJwOwUnr
 +7uNPVl0JBik3Ocqnb/AmWteDAmdxIQt6B8UAcffh5u5
X-Google-Smtp-Source: AA0mqf765RAitE3t2MeLXUtjyaJYQz6EP3r0MWSwEZZKGRkjTmI5jxs3fYrjrwS0qdK59/WN/+EoycfCXOMaQPbHT6E=
X-Received: by 2002:a50:ee96:0:b0:469:d815:6b09 with SMTP id
 f22-20020a50ee96000000b00469d8156b09mr23113797edr.288.1669476551924; Sat, 26
 Nov 2022 07:29:11 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhisX0pmhTi4-QKyhxF5Ccm3FAe__RzbTiEh1UVF0hB3hQ@mail.gmail.com>
 <CA+_SqVb+jueaZgr8pHiMk-EKyNfF+ejOOPOnenVBLy+LHAVRrA@mail.gmail.com>
In-Reply-To: <CA+_SqVb+jueaZgr8pHiMk-EKyNfF+ejOOPOnenVBLy+LHAVRrA@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sat, 26 Nov 2022 17:29:01 +0200
Message-ID: <CA+fTLhh=cmdoyq0thmZSv+sWTqUX8xcCa53wH3HZ+Z-wwPNMnA@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0w2W58oTOwL5KXcYcuAITjuQ1Kjtej4BPNhYfhUM/04=;
 b=LXv83lrLFbDPzf6EEPTx2DSVUwOx8L8JR9ur1j6kQ1mDeKnNOaCcpxJeajZA1Qy2Fz
 rQAXQFe3Gu6Ot4voYvYuApn4K1oUln5XyOoIAu20xz6knawGtnW/pthq06mVara9mBjI
 WVjN8IflUr3YcxlSaQxkPfDaOoh27njKWlrHMxW68aWJ0lpE12J/DFrfuVRlN1kTJf7W
 trWOBXuQgrIzuLHmFcrBu7u4cYLzJOlyESVEr8HXSvgWaBJ5rNvXJZYFelFXfMKSQcY6
 XS4tIZjrXOaDlQlu6X+EthxDh25imw+ivb1sKFAUSRhbjbsk+Fvn7wBm/I6ohX22LUwJ
 4Tmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LXv83lrL
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
Content-Type: multipart/mixed; boundary="===============7927810363680063904=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7927810363680063904==
Content-Type: multipart/alternative; boundary="000000000000d69ec805ee614cf2"

--000000000000d69ec805ee614cf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Angelo Compagnucci (<angelo@amarulasolutions.com>) kirjutas
kuup=C3=A4eval L, 26. november 2022 kell 10:27:

>
>
> Il sab 26 nov 2022, 09:15 Indrek Kruusa <indrek.kruusa@gmail.com> ha
> scritto:
>
>> Hi!
>>
>> As Samuel Holland mentioned the boot0/TOC1 is not needed anymore for
>> Allwinner D1 soc.
>> The latest updates, including proper board files, are included in d1-wip
>> branch in uboot repo.
>> So, when using this branch, like
>>
>> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call
>> github,smaeul,u-boot,d1-wip)/uboot-d1-wip.tar.gz"
>>
>> , the genimage.cfg can be as simple as :
>>
>> image sdcard.img {
>>         hdimage {
>>         }
>>
>>         partition u-boot-0 {
>>                 in-partition-table =3D "no"
>>                 image =3D "u-boot-sunxi-with-spl.bin"
>>                 offset =3D 128K
>>         }
>>         partition rootfs {
>>                 partition-type =3D 0x83
>>                 image =3D "rootfs.ext4"
>>                 bootable =3D "true"
>>                 offset =3D 2M
>>         }
>> }
>>
>> Also, newer linux kernel (v6.1.0-rc3) can be grabbed from Samuel's repo.
>> For testing I was using:
>>
>> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call
>> github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67=
838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
>> You have to update headers:
>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy
>>
>> Latest buildroot 2022.11-rc3 includes updated rtl8723ds tree so building
>> this module works also with newer kernel now.
>>
>> I verified this on Sipeed's Lichee RV dock, serial console output is
>> attached.
>>
>
> Thanks for the update. I'm more than welcome to bump my patches and retes=
t
> everything as soon as the patchset is included and validated by the
> buildroot developers.
>
> It would be nice if you can provide your feedback for the current patchse=
t
>
> http://patchwork.ozlabs.org/project/buildroot/list/?series=3D326415
>
> To speedup the revision process.
>


Why not. I just have to figure out how to reply to those messages while not
having them in my mailbox.Gmail and mbox and stuff.


>
>
>> Also, for getting working HDMI console you have to append this to the
>> kernel command line:
>> console=3Dtty0 cma=3D96M video=3DHDMI-A-1:D fbcon=3Dmap:0
>>
>
> Nice!
>
>
>> Best regards,
>> Indrek
>>
>>

--000000000000d69ec805ee614cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Kontakt Angelo Compagnucci (&lt;<a href=
=3D"mailto:angelo@amarulasolutions.com">angelo@amarulasolutions.com</a>&gt;=
) kirjutas kuup=C3=A4eval L, 26. november 2022 kell 10:27:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><br><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il sab 26 n=
ov 2022, 09:15 Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com"=
 target=3D"_blank">indrek.kruusa@gmail.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi!=C2=
=A0</div><div><br></div>As Samuel Holland mentioned the boot0/TOC1 is not n=
eeded anymore for Allwinner D1 soc.<br>The latest updates, including proper=
 board files, are included in d1-wip branch in uboot repo.<br>So, when usin=
g this branch, like<br><br>BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot=
;$(call github,smaeul,u-boot,d1-wip)/uboot-d1-wip.tar.gz&quot;<br><br>, the=
 genimage.cfg can be as simple as :<br><br>image sdcard.img {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 hdimage {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 partition u-boot-0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 in-partition-table =3D &quot;no&quot;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &quot;u-boot-su=
nxi-with-spl.bin&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
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
ries=3D326415" target=3D"_blank">http://patchwork.ozlabs.org/project/buildr=
oot/list/?series=3D326415</a></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">To speedup the revision process.</div></div></blockquote><div><br></d=
iv><div><br></div><div>Why not.=C2=A0I just have to figure out how to reply=
 to those messages while not having=C2=A0them in my mailbox.Gmail=C2=A0and =
mbox and stuff.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><br><div>Also, for getting working HDMI console you ha=
ve to append this to the kernel command line:<div>console=3Dtty0 cma=3D96M =
video=3DHDMI-A-1:D fbcon=3Dmap:0</div></div></div></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Nice!</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><br></div><div>Bes=
t regards,<br></div><div>Indrek<br></div></div><div><br></div></div>
</blockquote></div></div></div>
</blockquote></div></div>

--000000000000d69ec805ee614cf2--

--===============7927810363680063904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7927810363680063904==--
