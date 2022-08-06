Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523F6C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 18:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C953182F4F;
	Sat,  6 Aug 2022 18:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C953182F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOBwMmGFQYQQ; Sat,  6 Aug 2022 18:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D920282F37;
	Sat,  6 Aug 2022 18:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D920282F37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79CFC1BF593
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 18:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB91417AC
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 18:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB91417AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fiP2o3jv65o for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 18:15:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB67417A8
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBB67417A8
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 18:15:54 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id 204so8209656yba.1
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 11:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7x3z1R3VCPcEzx4SN0SyRUTUP7D3+URdjpP/Hx0vQUM=;
 b=5pa5TwvqQng3R1Jat87I4B2pzb95SQEd4oi1IYu4eqMZsHNqUxNuGZNKfpAJmbKxgE
 RhtLi4SQBv8FW3/FuTdbnDBluj1FIp6nsVctMFhIGbPjn0ctRxL2Y+NthQ2pfYh3mLKJ
 kA2C20FjC0TaYx35wpk4r7C44VXT1lr6A5EGYp7Ecoz21V6Goog5HIBuBogFNtMXDTPA
 n7WJ5E2SxAMhG+Oz+75zC/wp7nZtZmZZBndAWZ+/4mi0XKudaB9ctTY5dBpETFl8jfkd
 ROcemUJzX5c93ycvBa7KmiSf9JA8T4MIngjydYxZPi42clR6Y2I/inIJgWpgLHFKO20u
 CWOQ==
X-Gm-Message-State: ACgBeo0awKBBXT5glW/iYrACr6nb2usZcWdYBvMq7eYPOpBYlRcAncNU
 RR8iBXffeVBkVZNGP1XYDM0nlMXyqBgK+KREyYIsc0eU96lrDw==
X-Google-Smtp-Source: AA6agR5xmWQAhSOOy5+k8V792gy0IEw2ImaPUfz0MHHw0vWpWV1JSmQluSTbN4JuhveGkRa9gq8Uv2hplAnx+X02MAw=
X-Received: by 2002:a25:d612:0:b0:671:6dc0:bbc9 with SMTP id
 n18-20020a25d612000000b006716dc0bbc9mr9410008ybg.223.1659809753461; Sat, 06
 Aug 2022 11:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
 <575D4695-1A46-4431-90F2-63212188CDD1@benettiengineering.com>
In-Reply-To: <575D4695-1A46-4431-90F2-63212188CDD1@benettiengineering.com>
From: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Date: Sat, 6 Aug 2022 20:15:42 +0200
Message-ID: <CAPn86JC8tsPtbGZ=W1V5sgf70UsaFOtLWKwhdChxBg-k2RZVDA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7x3z1R3VCPcEzx4SN0SyRUTUP7D3+URdjpP/Hx0vQUM=;
 b=LLSjxA1V3pyCe9zbvnzkj+FY/VR3xfiRgdw6brJy2Ih+ztUATc9rZWQPcbfnwr3Ho7
 WIhdU8XMm3eP1mnh3Kw5Rv9gBpkSl4OLGzeoWE///5h7kJnbYhB82cPMb2rbraQK/o6s
 x1EmluhXnZndUTrxEuRTQtoHCHb1SLsZUiN+w4dnGq1vzQixTdL/Rsgz2J1/Z9mxuX/H
 jQTqV+gI0uaBXvtM2kIh+Rsa1t2lTGoC8PrbgoZT0+rOPgHVJ39stXOBOGVsBTutSGmG
 m0+HTiM85EBAvU4rN3h0VltVA4oa/8lhJ6ClYUqsx64gcgemjZdREy878YA/lNCavIC1
 L0cA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LLSjxA1V
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
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
Content-Type: multipart/mixed; boundary="===============3459893413839726499=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3459893413839726499==
Content-Type: multipart/alternative; boundary="000000000000bff86d05e5969251"

--000000000000bff86d05e5969251
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,
thanks for the quick reply. Here's the defconfig
https://pastebin.com/Xsh5d4HG
For the sake of completeness I didn't remove any of the lines, but some are
specific to my out-of-tree folder and overlays, so you might want to get
rid of those.

I'm currently building the 2022.05.1 tag with SHA
2e399893b4f60f1e103228df6e4439d4e4ac3dd5

Looking forward to your insights.

Best
Stefano

On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Stefano,
>
> Il giorno 6 ago 2022, alle ore 19:29, Stefano Cottafavi <
> stefano.cottafavi@gmail.com> ha scritto:
>
> =EF=BB=BF
> Hi all,
> I've successfully built Buildroot 2022.05 for the Raspberry Pi4 adding
> support for Qt5 and OpenCV (including objdetect module amongst few other)=
.
> I've also managed to generate the SDK for such a build however I can't
> find the header files of those OpenCV modules anywhere in the SDK.
>
> Is this expected or a bug?
>
>
> It looks like a bug. Can you please pastebin your specific defconfig?
>
> You can obtain it moving to your output folder and  issuing:
> $ make savedeconfig
> then you obtain a file called defconfig so copy and paste it on pastebin
> and provide here
> the link to the pastebin and also the SHA1 commit of your Buildroot git o=
r
> the specific version.
>
> This way we can help you.
>
> Best regards
> =E2=80=94
> Giulio Benetti
> CEO/CTO@Benetti Engineering sas
>
>
> Cheers,
> Stefano
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000bff86d05e5969251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Giulio,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace,monospace;font-size:small">thanks for the qui=
ck reply. Here&#39;s the defconfig <a href=3D"https://pastebin.com/Xsh5d4HG=
">https://pastebin.com/Xsh5d4HG</a>=C2=A0</div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace;font-size:small">For the sake of =
completeness I didn&#39;t remove any of the lines, but some are specific to=
 my out-of-tree folder and overlays, so you might want to get rid of those.=
</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace=
;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace;font-size:small">I&#39;m currently building the 2022=
.05.1 tag with SHA 2e399893b4f60f1e103228df6e4439d4e4ac3dd5</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mon=
ospace;font-size:small">Looking forward to your insights.</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mon=
ospace;font-size:small">Best</div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace;font-size:small">Stefano</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 6, 2=
022 at 7:43 PM Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettie=
ngineering.com">giulio.benetti@benettiengineering.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hi S=
tefano,<br><div dir=3D"ltr"><br><blockquote type=3D"cite">Il giorno 6 ago 2=
022, alle ore 19:29, Stefano Cottafavi &lt;<a href=3D"mailto:stefano.cottaf=
avi@gmail.com" target=3D"_blank">stefano.cottafavi@gmail.com</a>&gt; ha scr=
itto:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=
=EF=BB=BF<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family=
:monospace,monospace;font-size:small">Hi all,</div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace,monospace;font-size:small">I&#39;ve suc=
cessfully built Buildroot 2022.05 for the Raspberry Pi4 adding support for =
Qt5 and OpenCV (including objdetect module amongst few other).</div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sm=
all">I&#39;ve also managed to generate=C2=A0the SDK for such a build howeve=
r I can&#39;t find the header files of those OpenCV modules anywhere in the=
 SDK.</div><div class=3D"gmail_default" style=3D"font-family:monospace,mono=
space;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-family:monospace,monospace;font-size:small">Is this expected or a bug?</di=
v></div></div></blockquote><div><br></div><div>It looks like a bug. Can you=
 please pastebin your specific defconfig?</div><div><br></div><div>You can =
obtain it moving to your output folder and =C2=A0issuing:</div><div>$ make =
savedeconfig</div><div>then you obtain a file called defconfig so copy and =
paste it on pastebin and provide here</div><div>the link to the pastebin an=
d also the SHA1 commit of your Buildroot git or the specific version.</div>=
<div><br></div><div>This way we can help you.</div><div><br></div><div>Best=
 regards</div><div>=E2=80=94</div><div>Giulio Benetti</div><div>CEO/CTO@Ben=
etti Engineering sas</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospace,=
monospace;font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-family:monospace,monospace;font-size:small">Cheers,</div><div class=3D=
"gmail_default" style=3D"font-family:monospace,monospace;font-size:small">S=
tefano</div></div>
<span>_______________________________________________</span><br><span>build=
root mailing list</span><br><span><a href=3D"mailto:buildroot@buildroot.org=
" target=3D"_blank">buildroot@buildroot.org</a></span><br><span><a href=3D"=
https://lists.buildroot.org/mailman/listinfo/buildroot" target=3D"_blank">h=
ttps://lists.buildroot.org/mailman/listinfo/buildroot</a></span><br></div><=
/blockquote></div></blockquote></div>

--000000000000bff86d05e5969251--

--===============3459893413839726499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3459893413839726499==--
