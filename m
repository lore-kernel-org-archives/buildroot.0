Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E61AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1CB260F12
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1CB260F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5063C401F5;
	Fri,  3 Sep 2021 06:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mUinWAoU6JE; Fri,  3 Sep 2021 06:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31AF0401AF;
	Fri,  3 Sep 2021 06:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46D441BF44C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 423C6401BD
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YDH1ZU5JhgS for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 06:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34B84400DE
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 06:54:03 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id eb14so6568428edb.8
 for <buildroot@buildroot.org>; Thu, 02 Sep 2021 23:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R1yRffxa1kPrUndYtvnMl14MvFvRIYL4IDnxV8GHUyc=;
 b=xS8/Q6+DohBfgohsB9yjF256RvxvKABMtbh6IkU+uecwgTdF007C4dsqKBBK443Rek
 wer9ZTDdPuqQ05yQ/1HqNwOCpM5oRyG0P4uqQrA3toXwJXXnd9EgHmvFaYAcZ/JHdGAB
 x3a6b8FxzEnwl7RoF5tGWdwQL16/v+25buhiadbyS1faVVM8TY2+8Gv0hgzXklaSZIxA
 YMNd2wu65zRthZ/5TvTunMpYoK/s4CFJrSuWHbu5xet2bHHg96Sob50TUeXg3tDI3IzH
 yvV8lR9HRLgFeNQJeStIX0cAFbEwV62PryOIce6MCmPb6ntUhaXO5nEdfEfroezbRAM9
 ACwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R1yRffxa1kPrUndYtvnMl14MvFvRIYL4IDnxV8GHUyc=;
 b=NMc+iAE6cx1226NYCfx8rOLFzBNebeREgHR/smk/XHvXXzr1jB9QrJ9RRdHaFh5bLQ
 GUIRJh4OHtAp+Z5S6MauWJXGem9STdOYAKxCP/zkwSCrEuN3IkMpqPuE8V3PGxbyrR4n
 6UyCqChxYPyq2sA5+YgYUItF3hkvQJdYFFMUc729ylP0mfVUIjP/tdXSJCBDVOZVGQOn
 5FUFYS90EfbjII8kZbEQ8UEJGYbQXxHdIH7ussAzNmbPYnMOtk3+aa5yuOG1Quj7J7ii
 FuKIpu67FkwAHO4cxcID92e/LEZoTgnhIigIpwmVGY+8LvDf0FE5bQV746o4C8rTDFZv
 0Jqg==
X-Gm-Message-State: AOAM532GWNxMvWDvCC0ShlQDBW2+qHZG1zSWGsP28UYCHVdEHyuIYkVI
 DNshzRWFrFqZUgjH+6LxbuqX8zjYI9CTZrxE7cchOA==
X-Google-Smtp-Source: ABdhPJzcuAWkM78MruHGDy+xsEuAEpoXE3uf7eESJuz/qFSCYY1SfYYZKJWX00b0WZEQEjNMA7C0kcf/yyxoalwxG/M=
X-Received: by 2002:aa7:c514:: with SMTP id o20mr2454114edq.318.1630652041290; 
 Thu, 02 Sep 2021 23:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
 <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
 <20210820191656.GS27036@scaer>
 <DM2P110MB0105551AC77B57173ACEAAC0F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
 <CAJPV9MqR1ERA5dLyj6uKDHQ5GXGG5BH7bN6g98-eFXq+mK-5qw@mail.gmail.com>
In-Reply-To: <CAJPV9MqR1ERA5dLyj6uKDHQ5GXGG5BH7bN6g98-eFXq+mK-5qw@mail.gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Fri, 3 Sep 2021 09:53:50 +0300
Message-ID: <CAJPV9Mrsi9+JKT+c5tRAD8OzAMB2TQhCD5PweeWLb0jn4pHm=w@mail.gmail.com>
To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Subject: Re: [Buildroot] [External] Re: [PATCH v2] package/libselinux: Add
 autorelabel for first boot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5584094448062756593=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============5584094448062756593==
Content-Type: multipart/alternative; boundary="000000000000ac7c0005cb11c35a"

--000000000000ac7c0005cb11c35a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 2:33 PM Jos=C3=A9 Pekkarinen <jose.pekkarinen@uniki=
e.com>
wrote:

>
>
> On Mon, Aug 23, 2021 at 5:19 PM Weber, Matthew L Collins <
> Matthew.Weber@collins.com> wrote:
>
>>
>>
> Hi,
>
> I'm afraid the init script may not work since it
>
> references paths only existing in Centos, not in buildroot
> userspace(specifically, /usr/share/selinux/ and
> /selinux/enforce). However, we could use it to add the
> missing pieces of autorelabel for the restorecond init script
> or fix it and submit it. I'm happy to go for it, I'd like to hear
> what the upstream point of view is.
>

Hi,

Can I have some comments from maintainers whether

autorelabeling can be enabled in buildroot or not, and what
would be the preferred way? It seems to me that I can propose
a new init script for policycoreutils package that check for the
autorelabel file and trigger the missing commands. Would
that be a good idea?

Best regards.


Jos=C3=A9.

--000000000000ac7c0005cb11c35a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 25, 2021 at 2:33 PM Jos=
=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com">jose.pe=
kkarinen@unikie.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 23, 20=
21 at 5:19 PM Weber, Matthew L                            Collins &lt;<a hr=
ef=3D"mailto:Matthew.Weber@collins.com" target=3D"_blank">Matthew.Weber@col=
lins.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br></blockquote></div><br clear=3D"all"><div><blockquote style=3D"=
margin:0px 0px 0px 40px;border:none;padding:0px"><div>Hi,</div><div><br></d=
iv></blockquote><blockquote style=3D"margin:0px 0px 0px 40px;border:none;pa=
dding:0px"><div>I&#39;m afraid the init script may not work since it</div><=
/blockquote>references paths only existing in Centos, not in buildroot</div=
><div>userspace(specifically, /usr/share/selinux/ and</div><div>/selinux/en=
force). However, we could use it to add the</div><div>missing pieces of aut=
orelabel for the restorecond init script</div><div>or fix it and submit it.=
 I&#39;m happy to go for it, I&#39;d like to hear</div><div>what the upstre=
am point of view is.</div></div></blockquote><div><br></div></div><blockquo=
te style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_=
quote"><div>Hi,</div><div><br></div></div></blockquote><blockquote style=3D=
"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div=
>Can I have some comments from maintainers whether</div></div></blockquote>=
autorelabeling can be enabled in buildroot or not, and what<br>would be the=
 preferred way? It seems to me that I can propose<br>a new init script for =
policycoreutils package that check for the<br>autorelabel file and trigger =
the missing commands. Would<br>that be a good idea?<div><br></div><div><blo=
ckquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Best regar=
ds.</div></blockquote><div class=3D"gmail_quote"><div><br></div></div><div =
dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D=
"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></=
div></div></div></div>

--000000000000ac7c0005cb11c35a--

--===============5584094448062756593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5584094448062756593==--
