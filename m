Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADC7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C08F60E98
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C08F60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1342B400DE;
	Sun, 10 Oct 2021 16:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMW24q3lSEHd; Sun, 10 Oct 2021 16:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D802400EF;
	Sun, 10 Oct 2021 16:50:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EBC91BF424
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DAAB400EF
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2m9vArXTRkR for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 16:50:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6481B400DE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:50:34 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id g2so14569362ild.1
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SmI8MAJQYs9ui2KAQG5waUoWqPNiagCaegq4wHI+nq4=;
 b=ookZ2+5h2B1qkXwj2hc6MktCn1E0o5rXio3LIE18o18e4huUohOwPx65hL+Ooh4cY/
 oOILPazDtbT+J6K4j1yHNrJ399I22KA/0/fpLrDZpHyt6qqU15fPhQ8IsK9I6yHt7hgz
 V10bGxyssk+fYe/6QrVKbv6HJU0TG9PmgLYoKQvd/R2/D3+rh9pCVLV2w4rcZHrTV6Vb
 rxlalATm6fepqDxt1AZJOIUHA+KgZIE0WTfCdDf1GV8ilghUyXjXnyW+UN68SRZ74o45
 YAI5v0GnaKcDSfvQy2s4Nt2QAq0kqs3qEQHDRlYWfkIGCWcDEhHOh4kVk41/tKHd7fbJ
 4u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmI8MAJQYs9ui2KAQG5waUoWqPNiagCaegq4wHI+nq4=;
 b=hRkE98YV+l7NE/mw/fCEw9zwyKMukedTNTHF73q+9q8y2FUqN/Iv5dOwGtp0P2MW0H
 DYTAMHL+4xFAdOpVBdFFIohHxPpmtdQey99HvWUn7A66hB+3mGcY3UQyAZcc2mH7KyCs
 4CzHwYFA7b9T6QX1g3meZzULFC1t2bfZb9iH5/o83mxdyoSBTVZ1ZW8Kzu8eyLqopSW6
 uvBgB++hUPohs726ZpVIchag9ckJJZ6PbxaP/SAr4lCQABpF0/m4CPBsS+XOAEr7cEVP
 P6XF+1Q7iVeOksS160x735rBeJZLHMnmihWWNQwnbrpm5oGol9q1e2ZnRNnLTQnb1mlN
 3yiQ==
X-Gm-Message-State: AOAM5326TqdhBF26umxMTJm3QkHmw7zczc3+1QYlpSnr1wqZEKZE+24v
 BUv6/czdJCyoyPLrvD3mE6uPk3RmefAlvI2xNcZEjZQP7g==
X-Google-Smtp-Source: ABdhPJxoVU0aNV+dJm/wYHnJBeyL9ZSJ7j7HTj9tE9TwEq9fC7DRT4EACLWl2lGGBhAnLcMEHRlxkhDpS3/j+tndu2Q=
X-Received: by 2002:a05:6e02:1564:: with SMTP id
 k4mr16576544ilu.269.1633884633592; 
 Sun, 10 Oct 2021 09:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
In-Reply-To: <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sun, 10 Oct 2021 17:49:09 +0200
Message-ID: <CA+eej5MyhhGL8GxSxmqoaSB0JpJ_Mxic3SDsNGrTW_NovnH8bQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8642822376032878906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8642822376032878906==
Content-Type: multipart/alternative; boundary="00000000000030792905ce0269dc"

--00000000000030792905ce0269dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i have taged buildroot on stackoverflow :
https://stackoverflow.com/questions/69420545/buildroot-build-system-errors

Le dim. 10 oct. 2021 =C3=A0 17:48, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
kouamdoux@gmail.com> a =C3=A9crit :

> yes , i'm doing this as root
>
> So the file system that i'm using is ext4
>
> Le dim. 10 oct. 2021 =C3=A0 14:01, Edgar Bonet <bonet@grenoble.cnrs.fr> a
> =C3=A9crit :
>
>> Hello!
>>
>> Esa=C3=AFe Ledoux Njongssi Kouam wrote:
>> > build for qemu_x86_64 by typing "qemu_x86_64_defconfig"
>>
>> I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.
>>
>> > rsync [...] system/skeleton/ /root/buildroot/[...]
>>
>> You are doing this as root?
>>
>> > rsync: [generator] failed to set permissions on "[...]":
>> > Function not implemented (38)
>>
>> This sounds like you are using a filesystem that doesn't support
>> Unix-type permissions.[1] Is this the case? What kind of FS is this?
>> Could you try on a Unixish filesystem?
>>
>> Regards,
>>
>> Edgar Bonet.
>>
>> [1] https://unix.stackexchange.com/questions/12203
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--00000000000030792905ce0269dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">i have taged buildroot on stackoverflow : <a href=3D"https=
://stackoverflow.com/questions/69420545/buildroot-build-system-errors">http=
s://stackoverflow.com/questions/69420545/buildroot-build-system-errors</a><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e=C2=A0dim. 10 oct. 2021 =C3=A0=C2=A017:48, Esa=C3=AFe Ledoux NJONGSSI KOUA=
M &lt;<a href=3D"mailto:kouamdoux@gmail.com">kouamdoux@gmail.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>yes , i&#39;m doing this as root</div><div><br></di=
v><div>So the file system that i&#39;m using is ext4<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. =
10 oct. 2021 =C3=A0=C2=A014:01, Edgar Bonet &lt;<a href=3D"mailto:bonet@gre=
noble.cnrs.fr" target=3D"_blank">bonet@grenoble.cnrs.fr</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello!<=
br>
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

--00000000000030792905ce0269dc--

--===============8642822376032878906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8642822376032878906==--
