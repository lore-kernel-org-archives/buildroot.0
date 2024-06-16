Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BE9C27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 06:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF6B6069A;
	Sun, 16 Jun 2024 06:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDKSQA-oZOz9; Sun, 16 Jun 2024 06:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094FB606A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 094FB606A8;
	Sun, 16 Jun 2024 06:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5B1B1BF2CE
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 06:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2504406A0
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 06:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoIgvLcQzxqb for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 06:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFB4F4069D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB4F4069D
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFB4F4069D
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 06:55:31 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dff2df7de4aso744528276.2
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 23:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718520931; x=1719125731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSRtADwyAQ6ZI0IUjwWbntFhcvjSZQGRC05wrZcLL5U=;
 b=TPUz7co+LDSKFJF0cwCL3qDrKVZAIE4KLNp1uxcM46x3001ly8+6G1hcWw1y+7rv9X
 3teEmoi6g79ZZ/CNh80ssXoWst6WxbRYtO7RZN2wRiXM685n7yO2iy5eQvcXbcVEN0iR
 IHRUkthGLJi5c4ntkK7jhAR45rwfv1q79acl7jX0DG7BgLrMMNwqOVqHrdXCwTNo4KsG
 01eVSBH2Rb8EZ+xWd2L/pZ0mbzq2zpP+6A2q5SOg7ffX/kF9vpJoBPe4thaSr4NZ54UF
 ZlLYKKqneKGnppYriXYrhJj2fJS5mYXv+wtxCu2e0lZTIfDPxsnM8K0RzcQGdS9t2I7o
 6Uyw==
X-Gm-Message-State: AOJu0Yxy1PR+9INnEWnvo9LBwsnSdy7OtP1/gfWuhRQipV/ZDzmi4D+p
 aJ3Eboyq6f6vOOMGgdc116+WmjFgCpR7sneOXwTIqcSYIp04coB3hCwkWfLKtflUdme3xkfNSlX
 QiwVXHLUij+W/Zwfu4XUlRVRCB0o=
X-Google-Smtp-Source: AGHT+IFx4P4ioZIPcd2Heev691Gr75g52IFwx+ax7X+jLFyzfi8o5Emj41YFdVEt7ARS82uU0m0Q+7xfZlz9Gd/y5ag=
X-Received: by 2002:a25:c70c:0:b0:dff:2f86:defd with SMTP id
 3f1490d57ef6-dff2f86e5cbmr2077327276.53.1718520930793; Sat, 15 Jun 2024
 23:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <CAP07Bnk1GgNw_Ltz1Y2e52PvPBL8CLLM0KzeavNbDvGWQ+EdWg@mail.gmail.com>
In-Reply-To: <CAP07Bnk1GgNw_Ltz1Y2e52PvPBL8CLLM0KzeavNbDvGWQ+EdWg@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 16 Jun 2024 08:55:19 +0200
Message-ID: <CA+R_deqgaqq8icBRc0Ey6LDXknca1vxhr2H+x2GSgfFisgaV4A@mail.gmail.com>
To: Hannah Kiekens <hannah.kiekens@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718520931; x=1719125731; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wSRtADwyAQ6ZI0IUjwWbntFhcvjSZQGRC05wrZcLL5U=;
 b=BOSP3I+jk2ImGi78YJjZztoxHqIhYy5jtuV44nee3Wta2NoH5JAsuXJBYsqy2mKtMf
 Q1XlNy/F2oFexY8sShbEi7sNT44Xx8HUrcuqJPQT6tRwUV2c5Q4M1+HEmph//MYpEA9r
 0y7BvorL1bu3/naYgI/2G0ZSJa8R91L36ElLXE94nMvn1GI6JFel+5SglHqq5iMxEn88
 +sbKw8iLQBoGvPKT7ReSCpKiTvrMv3pnnFtjyhOC9X9ISX/Q2ibSG6ucNO2Qz61LMk/S
 DcKb/JgNK/eSxd5Q7k/hQIR9w44O11cfV9sAkK6OqltyX0Z946u9gcC9NZuyfrEOMDFb
 gOnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BOSP3I+j
Subject: Re: [Buildroot] [PATCH v6 09/14] package/qt6/qt6declarative: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: multipart/mixed; boundary="===============7116191131224036611=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7116191131224036611==
Content-Type: multipart/alternative; boundary="0000000000009e822e061afc5557"

--0000000000009e822e061afc5557
Content-Type: text/plain; charset="UTF-8"

Hi Hannah,

Thank you for testing and and reporting this.

I will try to fix this and other dependency related problems.

Best Regards,
Roy

fre. 14. juni 2024 kl. 00:01 skrev Hannah Kiekens <hannah.kiekens@mind.be>:

> config BR2_PACKAGE_QT6DECLARATIVE needs to have
>     select BR2_PACKAGE_QT6SVG
>
> otherwise I get:
> Makefile:574: *** qt6svg is in the dependency chain of qt6declarative that
> has added it to its _DEPENDENCIES variable without selecting it or
> depending on it from Config.in.  Stop.
>

--0000000000009e822e061afc5557
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Hannah,</div><div><br></div><div>Thank you for tes=
ting and and reporting this.</div><div><br></div><div>I will try to fix thi=
s and other dependency related problems.</div><div><br></div><div>Best Rega=
rds,</div><div>Roy<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">fre. 14. juni 2024 kl. 00:01 skrev Hannah Kie=
kens &lt;<a href=3D"mailto:hannah.kiekens@mind.be">hannah.kiekens@mind.be</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>config BR2_PACKAGE_QT6DECLARATIVE needs to have</div><div>=C2=
=A0=C2=A0=C2=A0 select BR2_PACKAGE_QT6SVG</div><div><br></div><div>otherwis=
e I get:<br>Makefile:574: *** qt6svg is in the dependency chain of qt6decla=
rative that has added it to its _DEPENDENCIES variable without selecting it=
 or depending on it from Config.in.=C2=A0 Stop.<br></div></div>
</blockquote></div>

--0000000000009e822e061afc5557--

--===============7116191131224036611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7116191131224036611==--
