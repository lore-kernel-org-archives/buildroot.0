Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41220C83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 23:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988F04092D;
	Mon, 28 Aug 2023 23:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988F04092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WLi6PsP4mtC; Mon, 28 Aug 2023 23:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677D540932;
	Mon, 28 Aug 2023 23:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 677D540932
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9D681BF295
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 23:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9213740932
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 23:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9213740932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGv6kXQBOBDj for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 23:19:20 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 702394092D
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 23:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 702394092D
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d77f97a0e72so3728221276.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 16:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693264759; x=1693869559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dF/WWVjntLe5mgX3XMSC2tLEDE6seiy2wOLHUfdUIY=;
 b=hxVrOVcss27RrrSLjrY3FyvE8HdLWBXeIvFtRyHOeLezyQQfGHYsZ1/H5W0OrfpwPg
 7zmQYhHa647O7VdvvqJYC1t5CRsEpOYNlhx/P8LXQmfGOqIq9T1q342/mcFJ+VhS+o9w
 3Wl0wot8m/CbnPsAZ0VikUYg/rMKAH5BKo/ysBz04j8Ndk2oIyTsEhEcsdh9+FXNUoZo
 h3ffJVYcNFaZuUI/w1wm6grxhD1NS20gE0z/u/KOoNDBMP9/EFmInIMHcOX28GJKQRgi
 SPmgiytsYAWLgJ1/uxew9u+5GidIyhm0StgAO0TA1Hqj3SdLkGG7eG23lEnElbcciOC3
 pnPQ==
X-Gm-Message-State: AOJu0Yxj7a2umSZETuYUF9rLp0hGmWNrlvqod9rY1NzhM6Bh4iFHriFn
 7LgOr3LGK/FuiErJoggX2Mg4XKXTbu/UhNajsqU=
X-Google-Smtp-Source: AGHT+IEcv2E2bmsXmpbC0AvSIqoj2uT0QJPPoV0gvFXjiJ67V/tdXQk2VB3ZclQ9jqBl3J4IxUvjrv5GyAjytOuo3+8=
X-Received: by 2002:a25:10c6:0:b0:d7a:ee98:4f8 with SMTP id
 189-20020a2510c6000000b00d7aee9804f8mr5580171ybq.30.1693264759253; Mon, 28
 Aug 2023 16:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk> <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
 <87msyb548w.fsf@48ers.dk>
In-Reply-To: <87msyb548w.fsf@48ers.dk>
From: Robert Smigielski <ptdropper@gmail.com>
Date: Mon, 28 Aug 2023 19:19:08 -0400
Message-ID: <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693264759; x=1693869559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5dF/WWVjntLe5mgX3XMSC2tLEDE6seiy2wOLHUfdUIY=;
 b=I0BT1HtPHt1AFJFLfm9AbmMi8/Uvaem7lfc427ATQVhb+4ymAR77fRql6rv1BAw8fI
 MX1sQ7isGsJSsNMdoC65OW3LRYZ2XKA5GYvUxlZjLbOTV87GduaAJh/bz6ujWO7P/YJ0
 PNLdntxDukZ5zwnuXWPupWf6lr9fdyCAo0JCHNwRMfNNbn/Gq04DfrNGGH64ZEnWsy6r
 pCFzDY0tGNRxEiKh7eeOitpN5Ftq3Rwoq0TkU+UBwvi6fotY/hDPffuDNCRHAxFc8ZGQ
 rj6ELbJFlTbJkDbG+SSEShNSX4fapbiBg9azAG/vR9h63d+SkSsQ59jhSukRFAtnI9GY
 O91w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=I0BT1HtP
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Content-Type: multipart/mixed; boundary="===============2144235280459304563=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2144235280459304563==
Content-Type: multipart/alternative; boundary="0000000000007c75c6060403ecbf"

--0000000000007c75c6060403ecbf
Content-Type: text/plain; charset="UTF-8"

>
>
>
>  >  I think Robert is not necessarily primarily concerned with finding
>  >  vulnerabilities, but rather with constructing a meaningful and
>  > accurate SBoM (which is what dependencytrack does).
>
> True. The monitoring stuff seems quite interesting for vulnerabilities
> though.
>

Yes I am concerned with creating a valid CycloneDX official SBOM for use in
other projects as an input. For example take the output file
<product>.json as input to Dependency Track. It does work. That is exactly
what I need for my daily work.


> OK. It doesn't sound like it will bring a lot of advantages for the
> effort to maintain PURL identifiers :/
>

From my view point - if Buildroot supports PURL I will add that data to my
project. If not, that is okay.

>
>  > each with a distinct PURL. We could start our own namespace, but
>  > that's kind of pointless unless we also issue advisories...
>

Yes, Buildroot could consider itself a package manager, because it does
that. That idea is a possibility.


> I guess we should use the one matching where we get the source code from
> (if any). The cyclonedx tool uses a "generic"
> pkg:generic/$name?download_url=$site/$tarball, so we could default to
> that and just use pypi/github/whatever for the special cases where there
> is a more accurate one
>

Yes, the tool I wrote uses the "generic"  package. There is a place
holder out there in PURL for Buildroot if you want to go that way in the
future.

 >  There's by the way another issue (which also exists for the CPE-based
>  >  approach): our "BoM" for the cargo and go packages is not correct: we
>  > vendor the dependencies, but they're not taken into account in the
>  > BoM. The tarball we put in legal-info does include the vendored
>  > dependencies, but they're not mentioned in the manifest, and we don't
>  > scan their vulnerabilities.
>

If data is not in the legal-info, then no problem, the CycloneDX-Buildroot
project will not see it.  Note that CycloneDX has support for cargo and for
go already. Maybe that can help.

-- 
Robert Smigielski

--0000000000007c75c6060403ecbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br><br>
=C2=A0&gt;=C2=A0 I think Robert is not necessarily primarily concerned with=
 finding<br>
=C2=A0&gt;=C2=A0 vulnerabilities, but rather with constructing a meaningful=
 and<br>
=C2=A0&gt; accurate SBoM (which is what dependencytrack does).<br>
<br>
True. The monitoring stuff seems quite interesting for vulnerabilities<br>
though.<br></blockquote><div><br></div><div>Yes I am concerned with creatin=
g a valid CycloneDX official SBOM for use in other projects as an input. Fo=
r example take the output file &lt;product&gt;.json=C2=A0as input to Depend=
ency Track. It does work. That is exactly what I need for my daily work.=C2=
=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
OK. It doesn&#39;t sound like it will bring a lot of advantages for the<br>
effort to maintain PURL identifiers :/<br></blockquote><div><br></div><div>=
From my view point - if Buildroot supports PURL I will add that data to my =
project. If not, that is okay.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>=C2=A0&gt; each with a distinct PURL. We could start our own=
 namespace, but<br>
=C2=A0&gt; that&#39;s kind of pointless unless we also issue advisories...<=
br></blockquote><div><br></div><div>Yes, Buildroot could consider itself a =
package manager, because it does that. That idea is a possibility.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess we should use the one matching where we get the source code from<br=
>
(if any). The cyclonedx tool uses a &quot;generic&quot;<br>
pkg:generic/$name?download_url=3D$site/$tarball, so we could default to<br>
that and just use pypi/github/whatever for the special cases where there<br=
>
is a more accurate one<br></blockquote><div><br></div><div>Yes, the tool I =
wrote uses the &quot;generic&quot;=C2=A0 package. There is a place holder=
=C2=A0out there in PURL for Buildroot if you want to go that way in the fut=
ure.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0&gt;=C2=A0 There&#39;s by the way another issue (which also exists fo=
r the CPE-based<br>
=C2=A0&gt;=C2=A0 approach): our &quot;BoM&quot; for the cargo and go packag=
es is not correct: we<br>
=C2=A0&gt; vendor the dependencies, but they&#39;re not taken into account =
in the<br>
=C2=A0&gt; BoM. The tarball we put in legal-info does include the vendored<=
br>
=C2=A0&gt; dependencies, but they&#39;re not mentioned in the manifest, and=
 we don&#39;t<br>
=C2=A0&gt; scan their vulnerabilities.<br></blockquote><div><br></div><div>=
If data is not in the legal-info, then no problem, the CycloneDX-Buildroot =
project will not see it.=C2=A0 Note that CycloneDX has support for cargo an=
d for go already. Maybe that can help.</div><div>=C2=A0</div></div><span cl=
ass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Robert Smigielski<br><s=
pan></span><span></span></div></div></div></div></div>

--0000000000007c75c6060403ecbf--

--===============2144235280459304563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2144235280459304563==--
