Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EF1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D25516109E
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D25516109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E05E826EA;
	Sun, 10 Oct 2021 16:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ucES7HUD2fE; Sun, 10 Oct 2021 16:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7AD7817ED;
	Sun, 10 Oct 2021 16:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97F851BF424
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 947B86067D
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGoeEz6YVQJy for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 16:51:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B87CE6062B
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:51:04 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id 5so16951426iov.9
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LyqKjnIDOu5bBq4Kn86+B1VF//OuYsJOHqRkOxV3oxs=;
 b=W6RhrXqeYAkA+CmuLXMC8WgujXLWmbNCqWHvJnOAR94onV2w44k4hpWRcTVvxd9qcX
 tar/bxUt6noTsnhfTu+br3GWHIT2f7zVdskEok9zKndXjPYDp0RdvKKzEyED+14XMUei
 qMZsiTgGguxgxsrlGArePuSItmmYztt30pGFJaPzrH/kp+54zAGieFaNqDc8ZeWk0Z01
 n7pIazKVBME/Iv03yoqa4qgykoVnd6Tz+xGkZ1Cns/pFwQCLbACV+1Rj1QocQ7kJ9cMP
 OdbaFX4+jypDHG+A/uB6oixSoHgzE8laQcTnzQe/jYGZ4BGKr0v4VKJAv8AMThjSCmaM
 50Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LyqKjnIDOu5bBq4Kn86+B1VF//OuYsJOHqRkOxV3oxs=;
 b=kATgAlpk8mh/igx071tttQKeWiN68TTs0hGiN6+BsVDLtqyLFmn3zoGAskvx9ItysK
 PsYtBnG3Kamn0w44LQJVS7rbAgvjT1fcEMwCmxvuK+njaMOniEF08/XvjKLcv2QfULBW
 USTm/dXo3WPJNuh2zlJSWOVJI8ZHSvEH9oxYjGDaLuu23W0o4TVZsr1BcFcWo6QOZTye
 sxSUAfbUib8aLsvgDo7lxWXkZQitSm7Cqua60tQ2AczUF9dLBRx5Dr5jvpkB/1X66qEn
 MqM+jSTnbM8ycnolEzACvMj8fyZJ7BxGSJab76CvnloPIDfyISnJEdFW1JAefUdH43wo
 pl5w==
X-Gm-Message-State: AOAM533JAhYDUW08ervAt4eZyRjqCJQC6zkB/j4N5tIGR4xc7PEIYUuF
 iBERvdxjPn0LUb0GvNs77RJEac0n83L+nBfw7gSgb+09Gw==
X-Google-Smtp-Source: ABdhPJwNNo9/A3sfb/2bEbWK9UDGx9AGDy8uzUMegu4gGCwupbmjs+uBo1vE1fxRy1FNpPC5GMhGsI5WgXzG+e3NS+c=
X-Received: by 2002:a6b:ee0d:: with SMTP id i13mr15831004ioh.166.1633884663785; 
 Sun, 10 Oct 2021 09:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <CA+eej5MyhhGL8GxSxmqoaSB0JpJ_Mxic3SDsNGrTW_NovnH8bQ@mail.gmail.com>
In-Reply-To: <CA+eej5MyhhGL8GxSxmqoaSB0JpJ_Mxic3SDsNGrTW_NovnH8bQ@mail.gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sun, 10 Oct 2021 17:49:41 +0200
Message-ID: <CA+eej5OgdkadyBZMkUs0mZ1dsovEXbn0eW_pW4gNjFmxCF0yag@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Subject: Re: [Buildroot] error when i build buidroot
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
Content-Type: multipart/mixed; boundary="===============6744359179384537401=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6744359179384537401==
Content-Type: multipart/alternative; boundary="000000000000fd2d5c05ce026a1a"

--000000000000fd2d5c05ce026a1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i have taged buildroot on stackoverflow :
https://stackoverflow.com/questions/69420545/buildroot-build-system-errors

Le dim. 10 oct. 2021 =C3=A0 17:49, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
kouamdoux@gmail.com> a =C3=A9crit :

> i have taged buildroot on stackoverflow :
> https://stackoverflow.com/questions/69420545/buildroot-build-system-error=
s
>
> Le dim. 10 oct. 2021 =C3=A0 17:48, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
> kouamdoux@gmail.com> a =C3=A9crit :
>
>> yes , i'm doing this as root
>>
>> So the file system that i'm using is ext4
>>
>> Le dim. 10 oct. 2021 =C3=A0 14:01, Edgar Bonet <bonet@grenoble.cnrs.fr> =
a
>> =C3=A9crit :
>>
>>> Hello!
>>>
>>> Esa=C3=AFe Ledoux Njongssi Kouam wrote:
>>> > build for qemu_x86_64 by typing "qemu_x86_64_defconfig"
>>>
>>> I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.
>>>
>>> > rsync [...] system/skeleton/ /root/buildroot/[...]
>>>
>>> You are doing this as root?
>>>
>>> > rsync: [generator] failed to set permissions on "[...]":
>>> > Function not implemented (38)
>>>
>>> This sounds like you are using a filesystem that doesn't support
>>> Unix-type permissions.[1] Is this the case? What kind of FS is this?
>>> Could you try on a Unixish filesystem?
>>>
>>> Regards,
>>>
>>> Edgar Bonet.
>>>
>>> [1] https://unix.stackexchange.com/questions/12203
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>
>>

--000000000000fd2d5c05ce026a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">i have taged buildroot on stackoverflow : <a href=3D"https=
://stackoverflow.com/questions/69420545/buildroot-build-system-errors" targ=
et=3D"_blank">https://stackoverflow.com/questions/69420545/buildroot-build-=
system-errors</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Le=C2=A0dim. 10 oct. 2021 =C3=A0=C2=A017:49, Esa=C3=AFe Le=
doux NJONGSSI KOUAM &lt;<a href=3D"mailto:kouamdoux@gmail.com">kouamdoux@gm=
ail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr">i have taged buildroot on stackoverflo=
w : <a href=3D"https://stackoverflow.com/questions/69420545/buildroot-build=
-system-errors" target=3D"_blank">https://stackoverflow.com/questions/69420=
545/buildroot-build-system-errors</a></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 10 oct. 2021 =C3=A0=C2=A0=
17:48, Esa=C3=AFe Ledoux NJONGSSI KOUAM &lt;<a href=3D"mailto:kouamdoux@gma=
il.com" target=3D"_blank">kouamdoux@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div>yes , i&#39;m doing this as root</div><div><br></div><div>So the file =
system that i&#39;m using is ext4<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 10 oct. 2021 =C3=A0=
=C2=A014:01, Edgar Bonet &lt;<a href=3D"mailto:bonet@grenoble.cnrs.fr" targ=
et=3D"_blank">bonet@grenoble.cnrs.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello!<br>
<br>
Esa=C3=AFe Ledoux Njongssi Kouam wrote:<br>
&gt; build for qemu_x86_64 by typing &quot;qemu_x86_64_defconfig&quot;<br>
<br>
I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.<br>
<br>
&gt; rsync [...] system/skeleton/ /root/buildroot/[...]<br>
<br>
You are doing this as root?<br>
<br>
&gt; rsync: [generator] failed to set permissions on &quot;[...]&quot;:<br>
&gt; Function not implemented (38)<br>
<br>
This sounds like you are using a filesystem that doesn&#39;t support<br>
Unix-type permissions.[1] Is this the case? What kind of FS is this?<br>
Could you try on a Unixish filesystem?<br>
<br>
Regards,<br>
<br>
Edgar Bonet.<br>
<br>
[1] <a href=3D"https://unix.stackexchange.com/questions/12203" rel=3D"noref=
errer" target=3D"_blank">https://unix.stackexchange.com/questions/12203</a>=
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000fd2d5c05ce026a1a--

--===============6744359179384537401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6744359179384537401==--
