Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBE7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:28:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDADC601FA
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDADC601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97379400DD;
	Sun, 24 Oct 2021 18:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pI_QgrDVVYRB; Sun, 24 Oct 2021 18:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9289D401BE;
	Sun, 24 Oct 2021 18:28:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E31201BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3EF6063A
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EeBDJ2EC49u for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 18:28:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 929D660617
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:28:31 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id n7so5273831ljp.5
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XALAD0h+MTVFoFFPla1bcJiJARAfENb3riVx9KkSh0U=;
 b=JtbYXQefuR4dJkMiS79Zyf3+bkYY3iPreXWW6RFZjvx8Rxumsvg2iw1546a+QiyN8F
 CmJic6vqjBUQyhYhCNuts4MI88/mOUmiuXPWqMNNZrfCp8haZrvDSnBtamw0aUh0/ZtL
 6EDLSFOsBj3hxsSEwDy4G5OoMnNESvQfc4+0abE38pZAQCRyiRelhX7TBnm1RjirXJ5k
 XD+lsbQQ4qu0dvE8RiMHVoyHn+ICxBQC4yPERovwEF2C/UUQvwOH/UeVCYuk8gS67SGo
 6mIQ0FMWFI02NA4GEchRcI3C5tExJpoz2nZzpVSqnHcJ+eabpEt4zybvduksn2MdQmRW
 gAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XALAD0h+MTVFoFFPla1bcJiJARAfENb3riVx9KkSh0U=;
 b=2xPbMwyj/blfyYTNhB7xsxc+VMnlSym0j4zzLjrI3VR0hP32MTYDJOmSqFw5N98eXu
 J/OJvtCJwUfcVS23vFFO/jVFiMfMP6N76gWu4ic4OxWPfKFIyRDqoSzDbyx3EMcCnUw0
 gdRMaGWmSyRbfWtmgYcXIDhI9znlMLf4MUKqnGNuPxZSbIr/GVmNMadq5s28ysFj+9hu
 UZiP5X1RTSqia0xLS1OYTBZr61j3ijUVsoEIEwfKAA3h1C8hP7iRFc0xa0FxyAQGU4hZ
 2QLHxW+Vsr6+QQLrXrvKWnaKsqBxASzheqZlK4biXjkB+jT49SCLFIWU8v37S5KkaoaU
 UFnw==
X-Gm-Message-State: AOAM531nQk6WNcqN+PxmzIBQib3Q4a+pdCcJoqXhctIeWBXkkUAwhz7O
 u0OCu08opwxF1ch5s0oe2IzC+eWuFxJV7G/WbdKgCFUS4uA=
X-Google-Smtp-Source: ABdhPJzeczHQted//5hHLG6fYbyTcLHuyS3Ep8IgGbX3f9zOW4TKGHrEV9FQG/JUSogMf/crMZWJBKZSShH5Hkl0eTo=
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr13451994ljo.297.1635100109244; 
 Sun, 24 Oct 2021 11:28:29 -0700 (PDT)
MIME-Version: 1.0
From: Alassane <alassaneg@gmail.com>
Date: Sun, 24 Oct 2021 20:28:16 +0200
Message-ID: <CAJ2YAHurtC2D047qVGQ89q2q0+WG0DOOx48V2mDA0S8swfMRKg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Issue compiling the library linux_libnfc-nci (from NXP)
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
Content-Type: multipart/mixed; boundary="===============4255369337647559157=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4255369337647559157==
Content-Type: multipart/alternative; boundary="0000000000002f0cd805cf1d69cc"

--0000000000002f0cd805cf1d69cc
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to add the following package to buildroot and trying to compile
it : linux_libnfc-nci (https://github.com/NXPNFCLinux/linux_libnfc-nci).
It was supposed not too be complicated but i'm actually struggling with
that. the "configure" file is missing from the linux repository. To get the
"configure" file, we must run the "bootstrap.sh" script, which is in the
git repository, and contains the following commands:

mkdir -p m4
aclocal
autoheader
libtoolize
automake --add-missing
autoreconf -fi
rm -Rf autom4te.cache
I'm able to install this library on my host but i'm not able and even able
to manually cross compile it but it doesn't work when trying to
cross-compile it through buildroot (as a package), because of this
"configure" file missing (the error i have is : "/bin/bash: ./configure: No
such file or directory").
Does anyone know how can i generate this "configure" file using buildroot?
is it possible to run the "boostrap" with a specific line in the ".mk" file?
Can i manually run the "bootstrap.sh" script and copy the "configure" file
in the package build folder? is this a good method?

I hope this is clear and that someone will be able to help with that.

Kind regards

Thank you

--0000000000002f0cd805cf1d69cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m trying to add the follow=
ing package to buildroot and trying to compile it :=C2=A0<span style=3D"fon=
t-weight:600;background-color:rgb(246,248,250);color:rgb(36,41,47);font-fam=
ily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,s=
ans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-siz=
e:20px">linux_libnfc-nci (</span><a href=3D"https://github.com/NXPNFCLinux/=
linux_libnfc-nci">https://github.com/NXPNFCLinux/linux_libnfc-nci</a>).</di=
v><div>It was supposed not too be complicated but i&#39;m actually struggli=
ng with that. the &quot;configure&quot; file is missing from the linux repo=
sitory. To get the &quot;configure&quot; file, we must run the &quot;bootst=
rap.sh&quot; script, which is in the git repository, and contains=C2=A0the =
following commands:</div><div><br></div><table class=3D"gmail-highlight gma=
il-tab-size gmail-js-file-line-container" style=3D"border-spacing:0px;borde=
r-collapse:collapse;color:rgb(36,41,47);font-family:-apple-system,BlinkMacS=
ystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color=
 Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><tbody style=3D"box=
-sizing:border-box"><tr style=3D"box-sizing:border-box"><td id=3D"gmail-L3"=
 class=3D"gmail-blob-num gmail-js-line-number" style=3D"box-sizing:border-b=
ox;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:12px;line-height:20px;text-align:right;white-space:nowra=
p;vertical-align:top"></td><td id=3D"gmail-LC3" class=3D"gmail-blob-code gm=
ail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-box;padd=
ing:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-fami=
ly:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Lib=
eration Mono&quot;,monospace;font-size:12px;white-space:pre">mkdir -p m4</t=
d></tr><tr style=3D"box-sizing:border-box;background-color:transparent"><td=
 id=3D"gmail-L4" class=3D"gmail-blob-num gmail-js-line-number" style=3D"box=
-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:u=
i-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberat=
ion Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;w=
hite-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC4" class=3D"gm=
ail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing=
:border-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:v=
isible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Co=
nsolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre=
">aclocal</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-L5" =
class=3D"gmail-blob-num gmail-js-line-number" style=3D"box-sizing:border-bo=
x;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMon=
o-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mo=
nospace;font-size:12px;line-height:20px;text-align:right;white-space:nowrap=
;vertical-align:top"></td><td id=3D"gmail-LC5" class=3D"gmail-blob-code gma=
il-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-box;paddi=
ng:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-famil=
y:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Libe=
ration Mono&quot;,monospace;font-size:12px;white-space:pre">autoheader</td>=
</tr><tr style=3D"box-sizing:border-box;background-color:transparent"><td i=
d=3D"gmail-L6" class=3D"gmail-blob-num gmail-js-line-number" style=3D"box-s=
izing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-=
monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberatio=
n Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;whi=
te-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC6" class=3D"gmai=
l-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:b=
order-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:vis=
ible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Cons=
olas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">=
libtoolize</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-L7"=
 class=3D"gmail-blob-num gmail-js-line-number" style=3D"box-sizing:border-b=
ox;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:12px;line-height:20px;text-align:right;white-space:nowra=
p;vertical-align:top"></td><td id=3D"gmail-LC7" class=3D"gmail-blob-code gm=
ail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-box;padd=
ing:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-fami=
ly:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Lib=
eration Mono&quot;,monospace;font-size:12px;white-space:pre">automake --add=
-missing</td></tr><tr style=3D"box-sizing:border-box;background-color:trans=
parent"><td id=3D"gmail-L8" class=3D"gmail-blob-num gmail-js-line-number" s=
tyle=3D"box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:12px;line-height:20px;text-al=
ign:right;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC8" =
class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D=
"box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top=
;overflow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quo=
t;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;whit=
e-space:pre">autoreconf -fi</td></tr><tr style=3D"box-sizing:border-box"><t=
d id=3D"gmail-L9" class=3D"gmail-blob-num gmail-js-line-number" style=3D"bo=
x-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:=
ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Libera=
tion Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;=
white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC9" class=3D"g=
mail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizin=
g:border-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:=
visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,C=
onsolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pr=
e">rm -Rf autom4te.cache</td></tr></tbody></table><br><div>I&#39;m able to =
install this library on my host but i&#39;m not able and even able to manua=
lly cross compile it but it doesn&#39;t work when trying to cross-compile i=
t through buildroot (as a package), because of this &quot;configure&quot; f=
ile missing (the error i have is : &quot;/bin/bash: ./configure: No such fi=
le or directory&quot;).</div><div>Does anyone know how can i generate this =
&quot;configure&quot; file using buildroot? is it possible to run the &quot=
;boostrap&quot; with a specific line in the &quot;.mk&quot; file?</div><div=
>Can i manually run the &quot;bootstrap.sh&quot; script and copy the &quot;=
configure&quot; file in the package build folder? is this a good method?</d=
iv><div><br></div><div>I hope this is clear and that someone will be able t=
o help with that.</div><div><br></div><div>Kind regards</div><div><br></div=
><div>Thank you</div><img src=3D"https://mail-info-ext.com/pixel/qhHHw3dVJn=
VvhoTUJCT1?rid=3DqhHHw3dVJnVvhoTUJCT1" width=3D"1" height=3D"1" border=3D"0=
"></div>

--0000000000002f0cd805cf1d69cc--

--===============4255369337647559157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4255369337647559157==--
