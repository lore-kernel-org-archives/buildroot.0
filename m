Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDBBC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 09:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEC640D4B;
	Sun,  1 Jun 2025 09:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0srQcC5_W50j; Sun,  1 Jun 2025 09:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF1640A39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF1640A39;
	Sun,  1 Jun 2025 09:16:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8768D1F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 09:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 798324006B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 09:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQMd4Ju66oWG for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 09:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6C3B40028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C3B40028
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6C3B40028
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 09:16:20 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-70e40e3f316so27183467b3.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 02:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748769379; x=1749374179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D/UvLnlcCzxpM35n7SLvBMdEu0E8E7Xdibco3acLphY=;
 b=TOMASmIMwP2qvMg54tjHhqeS6ieaDrL1+uzXgIod6laW5kLHzbUQesMzWYDakuSL1J
 llMKzeX4jT/Cqcw19iXpFSRs7a0oe8HiQOfbKo99WzSv8uoVlF+85tGoQ5zlLiFUT0sy
 rF0InaTSAM4K76HfrvDNoUj/MxNop5alnajf1nRWow34g+vpPtp8gLbK2OtPSNqMGtvk
 uDTywpE9BvjAoz0hxFgCsQ8gb5K4kmst4EIPXxSiO1P+CK5I+uxFAmLovb8E3MrfMGua
 GJik6RWwVEVf4fXJ5HTZJ5l/5qV705cDXz5DdmgsIf1NxYkD+lvKt9I+Ra989wrsW1Od
 mwow==
X-Gm-Message-State: AOJu0YyvOZbmv2XpdYnYsOiitYOLimejTPdWuO2GNX6Lr6o5UcJyrg9D
 wcATkzbRiS0mVR4V19LcXVynY9rl6Y5uWhQSsFajVLwAgpZeou/2kM6pVL2QyapBxf8IeNY2JPq
 BsY3UBOiJQ/9rduEF9jqg0eWmPg5aOgYDbw==
X-Gm-Gg: ASbGncu8Ij2j9fSiBwXaH9E16O9EOLgSy8nbNRj6ZHr0ENLB5hOgTmL2rR5rKYr2c52
 x2YEIW0e2sSLtgkLbInITbk4qlzcQr5zMVVa5ePEOMZzBagveWB1wF/qCE5Xa13xkcssF7Wf/Jx
 K1IdyMArfqqIztL4SJhuCBn27bYXc6yfBOIukGEDLHNSaVB7w4JH0EDEZFBqBylsktMA==
X-Google-Smtp-Source: AGHT+IFdSzi3O6+MOU/8rV9I2hRlzOLghfK5RNv0YQDrVeRLuhr43ky99xAVTk3/N81TRzvZIlWNCGzyJOud5Tiqw54=
X-Received: by 2002:a05:690c:6a10:b0:70d:ecdd:9bd0 with SMTP id
 00721157ae682-71097e17e00mr63641857b3.27.1748769379533; Sun, 01 Jun 2025
 02:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
In-Reply-To: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 1 Jun 2025 11:16:07 +0200
X-Gm-Features: AX0GCFtRYAfFRc4RZCnzbH3qXlyJbiuqlXRgTiQSVt56euHxLvMf22wh-IzV6Pc
Message-ID: <CA+R_deo7UnzvfZB+JC5LksOQzMMJwHmM25v1u7vvTqHfDKKLmQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748769379; x=1749374179; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D/UvLnlcCzxpM35n7SLvBMdEu0E8E7Xdibco3acLphY=;
 b=lN4kg4DAHfOe5miMD303n0WlBltSkHbGbGtvYbzU4MhtcmaFpK2oQPUErAElG2bFni
 fLA+YWHF+d/fzOQAwtKJXQP1pcNu7dtYpDpc6zip4yWYXIsSVxW3kzIo9CmaF/tHzUhU
 39bBHXNWf2muPQSc1lZMCGfksaDOlb34fSRiyvrfF5TZjn8t5G8CtPwVF3BOP/kx2E93
 8iG7koK/N9mhCOZZerlf3HT1YIhEB35pUdMpar9rAgTkjKycR63InzvOqfU1Y3hBgKYu
 vvY/XXKdaRN0krkC+j0z8QfCAWSB4tkpiOiaC4leEiWrsuKYa3TBJW86+cEArqqBqEfa
 A2Ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lN4kg4DA
Subject: Re: [Buildroot] [PATCH 0/5] package/qt6/qt6tools: fix build failures
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3329154924136988833=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3329154924136988833==
Content-Type: multipart/alternative; boundary="000000000000a9463106367f19d2"

--000000000000a9463106367f19d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forgot to add the last fix, so there will be a v2 of this

s=C3=B8n. 1. juni 2025 kl. 10:46 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> These patches were originally part of the series bumping Qt6 to 6.9.0.
>
> The fixes were rebased on the old 6.8.1 version, and reordered to match
> the order in which they actually appeared.
>
> The commit messages and comments were updated.
>
> Roy Kollen Svendsen (5):
>   package/qt6/qt6base: add hidden options needed by qt6tools
>   package/qt6/qt6tools: fix linguist build failure
>   package/qt6/qt6tools: fix designer build failure
>   package/qt6/qt6tools: fix assistant build failure
>   package/qt6/qt6tools: fix assistant build failure
>
>  package/qt6/qt6base/Config.in.host  | 14 ++++++++++
>  package/qt6/qt6base/qt6base.mk      | 40 +++++++++++++++++++++++++++--
>  package/qt6/qt6tools/Config.in      | 40 +++++++++++++++++++++++++++++
>  package/qt6/qt6tools/Config.in.host | 17 +++++++++---
>  package/qt6/qt6tools/qt6tools.mk    | 24 +++++++++++++++++
>  5 files changed, 130 insertions(+), 5 deletions(-)
>
> --
> 2.49.0
>
>

--000000000000a9463106367f19d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forgot to add the last fix, so there will be a v2 of this<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">s=C3=B8n. 1. juni 2025 kl. 10:46 skrev Roy Kollen Sven=
dsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com">roykollensvendsen@g=
mail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">These patches were originally part of the series bumping Qt6 to 6.9.0.<br=
>
<br>
The fixes were rebased on the old 6.8.1 version, and reordered to match<br>
the order in which they actually appeared.<br>
<br>
The commit messages and comments were updated.<br>
<br>
Roy Kollen Svendsen (5):<br>
=C2=A0 package/qt6/qt6base: add hidden options needed by qt6tools<br>
=C2=A0 package/qt6/qt6tools: fix linguist build failure<br>
=C2=A0 package/qt6/qt6tools: fix designer build failure<br>
=C2=A0 package/qt6/qt6tools: fix assistant build failure<br>
=C2=A0 package/qt6/qt6tools: fix assistant build failure<br>
<br>
=C2=A0package/qt6/qt6base/Config.in.host=C2=A0 | 14 ++++++++++<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a>=C2=A0 =C2=A0 =C2=A0 | 40 +++++++++++++++++=
++++++++++--<br>
=C2=A0package/qt6/qt6tools/Config.in=C2=A0 =C2=A0 =C2=A0 | 40 +++++++++++++=
++++++++++++++++<br>
=C2=A0package/qt6/qt6tools/Config.in.host | 17 +++++++++---<br>
=C2=A0package/qt6/qt6tools/<a href=3D"http://qt6tools.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6tools.mk</a>=C2=A0 =C2=A0 | 24 +++++++++++++++++<br>
=C2=A05 files changed, 130 insertions(+), 5 deletions(-)<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000a9463106367f19d2--

--===============3329154924136988833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3329154924136988833==--
