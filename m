Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35028C4321E
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8374381A9C;
	Sat, 26 Nov 2022 17:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8374381A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riLxXVdaFZdj; Sat, 26 Nov 2022 17:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB6881BB0;
	Sat, 26 Nov 2022 17:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB6881BB0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 548971BF356
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 17:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1258341722
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 17:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1258341722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sADFmC0QNhGC for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 17:16:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B9841706
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95B9841706
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 17:16:04 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id e13so10217397edj.7
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 09:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ubmuFm+HRtAFCYDu5lER14+hipZBNj/LCRQGk4K/k0Y=;
 b=HPPjuITkprU8B1b8QOJgykxmBj1X2kkRJQmZURYPMqKkvaQKwqCfyfMNMfsU++42W8
 j3cjH7MNqq5nS9bywMK+CkOf0NRouN7byp6pSuP5KHQBwmSyUwj/JMGoGQ1ORpeBtCrQ
 GxBHv+MR3dB9pLEzkuOck8OB8TLSWmR/Rs5WDgQIJalwgXgE47EWqG9YnMM/3H3vUPRV
 RPLL2LG0Bki+EPvEWJn9dfCnfp7W5rIr/3vAp3BEpvc13GCU4TbMe2v+Qu/b/t+POgLT
 tKaUsz+C+AMIPoHVRJfi1lVTDlEfjy42bpuOzkj3pYrfqRry0rVJ5xMr0leVroANJp2C
 oWIQ==
X-Gm-Message-State: ANoB5pkfzJMZqZnqHQEGFCBRlA1lTb1KeCOuH0//AFfyrX9Gk+1OLsZ2
 baI3gHfG7aORlFrz/Umfgn3S3eJNzf2/wvrSdz+5/esmWJc=
X-Google-Smtp-Source: AA0mqf5bY09A/awVaLApTLVck0iCDmbTcol/Z0aVBMZVUUYIBDYufnl+VcwVcjX4s7fSsAllELkIEzbmvN0RHlii2P8=
X-Received: by 2002:aa7:dbca:0:b0:458:3f65:4e42 with SMTP id
 v10-20020aa7dbca000000b004583f654e42mr41237880edt.39.1669482962434; Sat, 26
 Nov 2022 09:16:02 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhisX0pmhTi4-QKyhxF5Ccm3FAe__RzbTiEh1UVF0hB3hQ@mail.gmail.com>
 <CA+_SqVb+jueaZgr8pHiMk-EKyNfF+ejOOPOnenVBLy+LHAVRrA@mail.gmail.com>
 <CA+fTLhh=cmdoyq0thmZSv+sWTqUX8xcCa53wH3HZ+Z-wwPNMnA@mail.gmail.com>
In-Reply-To: <CA+fTLhh=cmdoyq0thmZSv+sWTqUX8xcCa53wH3HZ+Z-wwPNMnA@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sat, 26 Nov 2022 19:15:52 +0200
Message-ID: <CA+fTLhjhbfViV4UbcMa=unQ2UrD+8C9SE8AKrqz7TnR7oQoi0A@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ubmuFm+HRtAFCYDu5lER14+hipZBNj/LCRQGk4K/k0Y=;
 b=CJpoBKBa03oW0HEWEDyONuQ/ATwfeWnj5fY3nrWtLsjclI78fv8dTovIRBDS6dBCQF
 JpVFQkjHECf6JhYOvvmD4l1i81bojqj4vugMUD0B3ZmCaFP4zEzqPidWz9GY+nONBdB6
 tDHMvMXf1B7vY+irNqpRdXBdlIXOC+r6JFoHDMO846V+fYMafAvcT/ZIJAxZFTCOA42R
 MZKG1LrOgmRqf8/gsjuhsZBF2T9ErwlH0dZmika9sKTO9lDn9UM/hpqIak8MeuFhTsjX
 YLadD0tmE7+SoQHAUU93q0Oi8GsPURzFe1LQdmSfqL8TEZ2VH/mpe5twuEBMto8Xenog
 URfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CJpoBKBa
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
Content-Type: multipart/mixed; boundary="===============1174347384712550598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1174347384712550598==
Content-Type: multipart/alternative; boundary="000000000000ef3d8205ee62ca53"

--000000000000ef3d8205ee62ca53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Indrek Kruusa (<indrek.kruusa@gmail.com>) kirjutas kuup=C3=A4eval L=
, 26.
november 2022 kell 17:29:

>
> Kontakt Angelo Compagnucci (<angelo@amarulasolutions.com>) kirjutas
> kuup=C3=A4eval L, 26. november 2022 kell 10:27:
>
>>
>>
>> Il sab 26 nov 2022, 09:15 Indrek Kruusa <indrek.kruusa@gmail.com> ha
>> scritto:
>>
>>> Hi!
>>>
>>> As Samuel Holland mentioned the boot0/TOC1 is not needed anymore for
>>> Allwinner D1 soc.
>>> The latest updates, including proper board files, are included in d1-wi=
p
>>> branch in uboot repo.
>>> So, when using this branch, like
>>>
>>> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call
>>> github,smaeul,u-boot,d1-wip)/uboot-d1-wip.tar.gz"
>>>
>>> , the genimage.cfg can be as simple as :
>>>
>>> image sdcard.img {
>>>         hdimage {
>>>         }
>>>
>>>         partition u-boot-0 {
>>>                 in-partition-table =3D "no"
>>>                 image =3D "u-boot-sunxi-with-spl.bin"
>>>                 offset =3D 128K
>>>         }
>>>         partition rootfs {
>>>                 partition-type =3D 0x83
>>>                 image =3D "rootfs.ext4"
>>>                 bootable =3D "true"
>>>                 offset =3D 2M
>>>         }
>>> }
>>>
>>> Also, newer linux kernel (v6.1.0-rc3) can be grabbed from Samuel's repo=
.
>>> For testing I was using:
>>>
>>> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call
>>> github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca6=
7838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
>>> You have to update headers:
>>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy
>>>
>>> Latest buildroot 2022.11-rc3 includes updated rtl8723ds tree so buildin=
g
>>> this module works also with newer kernel now.
>>>
>>> I verified this on Sipeed's Lichee RV dock, serial console output is
>>> attached.
>>>
>>
>> Thanks for the update. I'm more than welcome to bump my patches and
>> retest everything as soon as the patchset is included and validated by t=
he
>> buildroot developers.
>>
>> It would be nice if you can provide your feedback for the current patchs=
et
>>
>> http://patchwork.ozlabs.org/project/buildroot/list/?series=3D326415
>>
>> To speedup the revision process.
>>
>
>
> Why not. I just have to figure out how to reply to those messages while
> not having them in my mailbox.Gmail and mbox and stuff.
>

Altough, I would say you should update to newer uboot anyway. After that
you can completely drop p
0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch (as
uboot gained SPL support). Then you can simplify genimage.cfg. Also you
have to fix board/sipeed/lichee_rv/readme.txt to reflect path change
(currently there is $ make lichee_rv_defconfig). I hope this helps.


>
>>
>>
>>> Also, for getting working HDMI console you have to append this to the
>>> kernel command line:
>>> console=3Dtty0 cma=3D96M video=3DHDMI-A-1:D fbcon=3Dmap:0
>>>
>>
>> Nice!
>>
>>
>>> Best regards,
>>> Indrek
>>>
>>>

--000000000000ef3d8205ee62ca53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Kontakt Indrek Kruusa (&lt;<a href=3D=
"mailto:indrek.kruusa@gmail.com">indrek.kruusa@gmail.com</a>&gt;) kirjutas =
kuup=C3=A4eval L, 26. november 2022 kell 17:29:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Kontakt =
Angelo Compagnucci (&lt;<a href=3D"mailto:angelo@amarulasolutions.com" targ=
et=3D"_blank">angelo@amarulasolutions.com</a>&gt;) kirjutas kuup=C3=A4eval =
L, 26. november 2022 kell 10:27:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il sab 26 nov 2022, 09:15 Indrek Kruu=
sa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indrek.=
kruusa@gmail.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>Hi!=C2=A0</div><div><br></div>As=
 Samuel Holland mentioned the boot0/TOC1 is not needed anymore for Allwinne=
r D1 soc.<br>The latest updates, including proper board files, are included=
 in d1-wip branch in uboot repo.<br>So, when using this branch, like<br><br=
>BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,smaeul,u-bo=
ot,d1-wip)/uboot-d1-wip.tar.gz&quot;<br><br>, the genimage.cfg can be as si=
mple as :<br><br>image sdcard.img {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 hdimage =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 parti=
tion u-boot-0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
in-partition-table =3D &quot;no&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 image =3D &quot;u-boot-sunxi-with-spl.bin&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 128K<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition root=
fs {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-t=
ype =3D 0x83<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ima=
ge =3D &quot;rootfs.ext4&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bootable =3D &quot;true&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 2M<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>}<br>=C2=A0<br>Also, newer linux kernel (v6.1.0-rc3) can be grabbed fro=
m Samuel&#39;s repo. For testing I was using:<br><br>BR2_LINUX_KERNEL_CUSTO=
M_TARBALL_LOCATION=3D&quot;$(call github,smaeul,linux,ca67838d84af4c9f85d06=
311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz&=
quot;<br>You have to update headers:<br>BR2_PACKAGE_HOST_LINUX_HEADERS_CUST=
OM_6_0=3Dy<br><br>Latest buildroot 2022.11-rc3 includes updated rtl8723ds t=
ree so building this module works also with newer kernel now.<br><br>I veri=
fied this on Sipeed&#39;s Lichee RV dock, serial console output is attached=
.<br></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks for the update. I&#39;m more than welcome to bump my patches =
and retest everything as soon as the patchset is included and validated by =
the buildroot developers.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">It would be nice if you can provide your feedback for the current patchse=
t</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"http://patc=
hwork.ozlabs.org/project/buildroot/list/?series=3D326415" target=3D"_blank"=
>http://patchwork.ozlabs.org/project/buildroot/list/?series=3D326415</a></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">To speedup the revision pr=
ocess.</div></div></blockquote><div><br></div><div><br></div><div>Why not.=
=C2=A0I just have to figure out how to reply to those messages while not ha=
ving=C2=A0them in my mailbox.Gmail=C2=A0and mbox and stuff.</div></div></di=
v></blockquote><div><br></div><div>Altough, I would say you should update t=
o newer uboot anyway. After that you can completely drop p<span style=3D"co=
lor:rgb(51,51,51);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;=
,monospace;font-size:13px">0001-Makefile-HACK-Support-building-u-boot.toc1-=
for-lichee-rv.patch=C2=A0</span>(as uboot=C2=A0gained SPL support). Then yo=
u can simplify genimage.cfg. Also you have to fix board/sipeed/lichee_rv/re=
adme.txt to reflect path change (currently there is=C2=A0<span style=3D"col=
or:rgb(0,139,139);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;=
,monospace;font-size:13px">$ make lichee_rv_defconfig</span>). I hope this =
helps.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><br><div>Also, for getting wo=
rking HDMI console you have to append this to the kernel command line:<div>=
console=3Dtty0 cma=3D96M video=3DHDMI-A-1:D fbcon=3Dmap:0</div></div></div>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Nice=
!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v><div><br></div><div>Best regards,<br></div><div>Indrek<br></div></div><di=
v><br></div></div>
</blockquote></div></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000ef3d8205ee62ca53--

--===============1174347384712550598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1174347384712550598==--
