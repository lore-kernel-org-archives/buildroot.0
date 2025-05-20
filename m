Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50BEC3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 04:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28BE8407F7;
	Tue, 20 May 2025 04:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVq4lxucHjL7; Tue, 20 May 2025 04:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA59407F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA59407F9;
	Tue, 20 May 2025 04:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0420193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8679D807A0
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VOcsxOLPMSu for <buildroot@buildroot.org>;
 Tue, 20 May 2025 04:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E2BD8079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E2BD8079A
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E2BD8079A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:45:49 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-70c7b8794faso51812467b3.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747716348; x=1748321148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=08X+nTxPZHVROU73dgDuip0UQ1tukN1DCBmUBzJ7rpk=;
 b=FsSWKp3N9h+zAsXztRkVWl31kUNAhm0mWVlcCfrd4n9VWRL2udrqGvBup/Ld3vlH9G
 Ba9178Tgn44gOgb9eJKyRB6+gZwJOW+OCAankx6Hn2zsJRDa5k0cfPpbN7+FqwnaqiCP
 uSncb4iaoPGUJwH9uzzVFyxIdBERBbRJidAg3EE2fJOSO08jk0hh6mgjmwlBanVqkAZ9
 NVwAxz6PJGL5MZSMNh5FIo+fPsTnrN0OHmwEK2MPQjXULUV3tAT42iYJKMGTQqkSwHmK
 5sKU3VsQA6PTudUYfYNs7119jEAN+L3gg/cGOnzvy7bt6/c7VTTPrfbw8G/AopQRms4j
 bQ6w==
X-Gm-Message-State: AOJu0YwWa07dTWA3I6kBEpMfUh9CoHByQNMCUTmgGXwBaKmuWSjySgG9
 XwDl+OzWil+n3aqNFOpcBt8nXgIihFWTeUSyYDE+FDkni0zIS1Kp88xAnlbJ8DxEfLhgMMEwUD3
 senO5NbtN3+jgI8HQwBoEBZ0ccWqLNlOQLA==
X-Gm-Gg: ASbGncvR4zU3fZBHCvaZFHcFSdPuNblazz2WK5M4avzd7Fnztwev0Bx9wGa05EcdYp9
 WI78c8QWgz8WDPSynOcmWshPWP+179VISXjWLTJT5H2QUWjbwyiGVtyQo/iEpoJiQtZXNTF7Spw
 k6uzdOFmOAK1EMD86qnipkjOhqkCkhdl2ThA==
X-Google-Smtp-Source: AGHT+IHwEstlLsnSRemEPQRRT32nA9mBZvNq5HC1rZivc/thDg+84C/ZnHZkU0x+If5If4HgwlAqG2A9vnmNGyu8TzQ=
X-Received: by 2002:a05:690c:368c:b0:708:43f1:10a with SMTP id
 00721157ae682-70ca79bfcc8mr225689417b3.10.1747716347886; Mon, 19 May 2025
 21:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 20 May 2025 06:45:33 +0200
X-Gm-Features: AX0GCFvaoaWYhASE6FrNAAclcLJHRDxyjxGBEs_LggOkD2Sflq6eKSSObTIAiL0
Message-ID: <CA+R_derULt_TejX==oCmuKKo1sOKco=3tivibNMwg76jbcthPA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747716348; x=1748321148; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=08X+nTxPZHVROU73dgDuip0UQ1tukN1DCBmUBzJ7rpk=;
 b=Pk+oNHoj+CT/EMV/sk0xwAK0ZIIIORc+G6wl6HrDZ+CZmN//g1qghg/ixX8D8IL+5P
 UWIDuw4NhUSWvqUil0RbFLFzxWAEzwv+f5q0IVYuR/4pTsMVwNLxKHa+BZNC9ncHtjsT
 DaudE2iNz8xE2HnS9Uzk6a6TWqoPqx7AeOMkSSnTCXyOEKB2rmzVTCOc977RWyILVvcb
 wkc5RPDpE8nWNtIjRKUVR57FI0Esg74y9JyDdk2HbN9upIQ1uDK1wdjt8k5MldymVUeI
 AO2a2IMt5jlNGMcqAPHZtekleqaPV5sNoSWXzSWr9vdka4tepBFYXXOUcLpUBXnk2qEC
 QFrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pk+oNHoj
Subject: Re: [Buildroot] [PATCH v2 00/11] Update Qt 6 to 6.9.0
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
Cc: Christian Hitz <christian@klarinett.li>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: multipart/mixed; boundary="===============2953900363382853885=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2953900363382853885==
Content-Type: multipart/alternative; boundary="000000000000157eba063589ec78"

--000000000000157eba063589ec78
Content-Type: text/plain; charset="UTF-8"

There is still a problem I need to fix

man. 19. mai 2025 kl. 23:06 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> In v1 of the patchset I avoided build failures by removing the option to
> build for target. Here I try to tackle the issues instead.
>
> Bernd Kuhls (1):
>   package/qt6/qt6positioning: new package
>
> Christian Hitz (1):
>   package/qt6/qt6connectivity: new package
>
> Jack Rubacha (1):
>   package/qt6/qt6grpc: new package
>
> Roy Kollen Svendsen (8):
>   package/qt6: bump version to 6.9.0
>   package/qt6/qt6sensors: new package
>   package/qt6/qt6speech: new package
>   package/qt6/qt6base: add hidden options needed by qt6tools
>   package/qt6/qt6tools: fix assistant build failure
>   package/qt6/qt6tools: fix designer build failure
>   package/qt6/qt6tools: fix linguist build failure
>   package/qt6/qt6tools: fix assistant build failure
>
>  package/qt6/Config.in                         |  5 ++
>  package/qt6/qt6.mk                            |  4 +-
>  package/qt6/qt6base/Config.in.host            | 14 ++++++
>  package/qt6/qt6base/qt6base.hash              |  4 +-
>  package/qt6/qt6base/qt6base.mk                | 40 +++++++++++++++-
>  package/qt6/qt6charts/qt6charts.hash          |  4 +-
>  package/qt6/qt6connectivity/Config.in         | 17 +++++++
>  .../qt6/qt6connectivity/qt6connectivity.hash  | 11 +++++
>  .../qt6/qt6connectivity/qt6connectivity.mk    | 42 +++++++++++++++++
>  .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +-
>  .../qt6/qt6declarative/qt6declarative.hash    |  4 +-
>  package/qt6/qt6graphs/qt6graphs.hash          |  4 +-
>  package/qt6/qt6grpc/Config.in                 |  7 +++
>  package/qt6/qt6grpc/qt6grpc.hash              | 10 ++++
>  package/qt6/qt6grpc/qt6grpc.mk                | 43 +++++++++++++++++
>  .../qt6languageserver/qt6languageserver.hash  |  4 +-
>  package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
>  package/qt6/qt6multimedia/qt6multimedia.hash  | 12 +----
>  package/qt6/qt6multimedia/qt6multimedia.mk    |  8 ----
>  package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
>  package/qt6/qt6positioning/Config.in          |  8 ++++
>  .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
>  package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
>  package/qt6/qt6quick3d/qt6quick3d.hash        |  6 +--
>  package/qt6/qt6quick3d/qt6quick3d.mk          |  4 +-
>  .../qt6quicktimeline/qt6quicktimeline.hash    |  4 +-
>  package/qt6/qt6scxml/qt6scxml.hash            |  4 +-
>  package/qt6/qt6sensors/Config.in              |  6 +++
>  package/qt6/qt6sensors/qt6sensors.hash        |  7 +++
>  package/qt6/qt6sensors/qt6sensors.mk          | 32 +++++++++++++
>  package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +-
>  package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
>  .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +-
>  package/qt6/qt6speech/Config.in               |  8 ++++
>  package/qt6/qt6speech/qt6speech.hash          | 10 ++++
>  package/qt6/qt6speech/qt6speech.mk            | 37 +++++++++++++++
>  package/qt6/qt6svg/qt6svg.hash                |  5 +-
>  package/qt6/qt6svg/qt6svg.mk                  |  3 +-
>  package/qt6/qt6tools/Config.in                | 40 ++++++++++++++++
>  package/qt6/qt6tools/Config.in.host           | 17 +++++--
>  package/qt6/qt6tools/qt6tools.hash            |  4 +-
>  package/qt6/qt6tools/qt6tools.mk              | 24 ++++++++++
>  .../qt6virtualkeyboard.hash                   |  6 +--
>  package/qt6/qt6wayland/qt6wayland.hash        |  4 +-
>  package/qt6/qt6websockets/qt6websockets.hash  |  4 +-
>  45 files changed, 479 insertions(+), 70 deletions(-)
>  create mode 100644 package/qt6/qt6connectivity/Config.in
>  create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash
>  create mode 100644 package/qt6/qt6connectivity/qt6connectivity.mk
>  create mode 100644 package/qt6/qt6grpc/Config.in
>  create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
>  create mode 100644 package/qt6/qt6grpc/qt6grpc.mk
>  create mode 100644 package/qt6/qt6positioning/Config.in
>  create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
>  create mode 100644 package/qt6/qt6positioning/qt6positioning.mk
>  create mode 100644 package/qt6/qt6sensors/Config.in
>  create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
>  create mode 100644 package/qt6/qt6sensors/qt6sensors.mk
>  create mode 100644 package/qt6/qt6speech/Config.in
>  create mode 100644 package/qt6/qt6speech/qt6speech.hash
>  create mode 100644 package/qt6/qt6speech/qt6speech.mk
>
> --
> 2.49.0
>
>

--000000000000157eba063589ec78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is still a problem I need to fix</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">man. 19. mai 2025 kl. 23:06 skrev Roy Kollen Svendsen &lt;<a href=3D"mail=
to:roykollensvendsen@gmail.com">roykollensvendsen@gmail.com</a>&gt;:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">In v1 of the patchset =
I avoided build failures by removing the option to<br>
build for target. Here I try to tackle the issues instead.<br>
<br>
Bernd Kuhls (1):<br>
=C2=A0 package/qt6/qt6positioning: new package<br>
<br>
Christian Hitz (1):<br>
=C2=A0 package/qt6/qt6connectivity: new package<br>
<br>
Jack Rubacha (1):<br>
=C2=A0 package/qt6/qt6grpc: new package<br>
<br>
Roy Kollen Svendsen (8):<br>
=C2=A0 package/qt6: bump version to 6.9.0<br>
=C2=A0 package/qt6/qt6sensors: new package<br>
=C2=A0 package/qt6/qt6speech: new package<br>
=C2=A0 package/qt6/qt6base: add hidden options needed by qt6tools<br>
=C2=A0 package/qt6/qt6tools: fix assistant build failure<br>
=C2=A0 package/qt6/qt6tools: fix designer build failure<br>
=C2=A0 package/qt6/qt6tools: fix linguist build failure<br>
=C2=A0 package/qt6/qt6tools: fix assistant build failure<br>
<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
=C2=A0package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6base/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 14 ++++++<br>
=C2=A0package/qt6/qt6base/qt6base.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 40 +++++++++++++++-<br>
=C2=A0package/qt6/qt6charts/qt6charts.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6connectivity/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 17 +++++++<br>
=C2=A0.../qt6/qt6connectivity/qt6connectivity.hash=C2=A0 | 11 +++++<br>
=C2=A0.../qt6/qt6connectivity/<a href=3D"http://qt6connectivity.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6connectivity.mk</a>=C2=A0 =C2=A0 | 42 ++++=
+++++++++++++<br>
=C2=A0.../qt6/qt6core5compat/qt6core5compat.hash=C2=A0 =C2=A0 |=C2=A0 4 +-<=
br>
=C2=A0.../qt6/qt6declarative/qt6declarative.hash=C2=A0 =C2=A0 |=C2=A0 4 +-<=
br>
=C2=A0package/qt6/qt6graphs/qt6graphs.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6grpc/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++<br>
=C2=A0package/qt6/qt6grpc/qt6grpc.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 ++++<br>
=C2=A0package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6grpc.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 43 +++++++++++++++++<br>
=C2=A0.../qt6languageserver/qt6languageserver.hash=C2=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6mqtt/qt6mqtt.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0package/qt6/qt6multimedia/qt6multimedia.hash=C2=A0 | 12 +----<br>
=C2=A0package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a>=C2=A0 =C2=A0 |=C2=A0 8 -=
---<br>
=C2=A0package/qt6/qt6opcua/qt6opcua.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0package/qt6/qt6positioning/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 8 ++++<br>
=C2=A0.../qt6/qt6positioning/qt6positioning.hash=C2=A0 =C2=A0 | 16 +++++++<=
br>
=C2=A0package/qt6/qt6positioning/<a href=3D"http://qt6positioning.mk" rel=
=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a>=C2=A0 | 47 ++++++++=
+++++++++++<br>
=C2=A0package/qt6/qt6quick3d/qt6quick3d.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +--<br>
=C2=A0package/qt6/qt6quick3d/<a href=3D"http://qt6quick3d.mk" rel=3D"norefe=
rrer" target=3D"_blank">qt6quick3d.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 4 +-<br>
=C2=A0.../qt6quicktimeline/qt6quicktimeline.hash=C2=A0 =C2=A0 |=C2=A0 4 +-<=
br>
=C2=A0package/qt6/qt6scxml/qt6scxml.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6sensors/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 6 +++<br>
=C2=A0package/qt6/qt6sensors/qt6sensors.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 7 +++<br>
=C2=A0package/qt6/qt6sensors/<a href=3D"http://qt6sensors.mk" rel=3D"norefe=
rrer" target=3D"_blank">qt6sensors.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 32 +++++++++++++<br>
=C2=A0package/qt6/qt6serialbus/qt6serialbus.hash=C2=A0 =C2=A0 |=C2=A0 4 +-<=
br>
=C2=A0package/qt6/qt6serialport/qt6serialport.hash=C2=A0 |=C2=A0 4 +-<br>
=C2=A0.../qt6/qt6shadertools/qt6shadertools.hash=C2=A0 =C2=A0 |=C2=A0 4 +-<=
br>
=C2=A0package/qt6/qt6speech/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++<br>
=C2=A0package/qt6/qt6speech/qt6speech.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 10 ++++<br>
=C2=A0package/qt6/qt6speech/<a href=3D"http://qt6speech.mk" rel=3D"noreferr=
er" target=3D"_blank">qt6speech.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 37 +++++++++++++++<br>
=C2=A0package/qt6/qt6svg/qt6svg.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
=C2=A0package/qt6/qt6svg/<a href=3D"http://qt6svg.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">qt6svg.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A0package/qt6/qt6tools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 40 ++++++++++++++++<br>
=C2=A0package/qt6/qt6tools/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 17 +++++--<br>
=C2=A0package/qt6/qt6tools/qt6tools.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6tools/<a href=3D"http://qt6tools.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6tools.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 24 ++++++++++<br>
=C2=A0.../qt6virtualkeyboard.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
=C2=A0package/qt6/qt6wayland/qt6wayland.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +-<br>
=C2=A0package/qt6/qt6websockets/qt6websockets.hash=C2=A0 |=C2=A0 4 +-<br>
=C2=A045 files changed, 479 insertions(+), 70 deletions(-)<br>
=C2=A0create mode 100644 package/qt6/qt6connectivity/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash<b=
r>
=C2=A0create mode 100644 package/qt6/qt6connectivity/<a href=3D"http://qt6c=
onnectivity.mk" rel=3D"noreferrer" target=3D"_blank">qt6connectivity.mk</a>=
<br>
=C2=A0create mode 100644 package/qt6/qt6grpc/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6grpc/qt6grpc.hash<br>
=C2=A0create mode 100644 package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6grpc.mk</a><br>
=C2=A0create mode 100644 package/qt6/qt6positioning/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6positioning/qt6positioning.hash<br>
=C2=A0create mode 100644 package/qt6/qt6positioning/<a href=3D"http://qt6po=
sitioning.mk" rel=3D"noreferrer" target=3D"_blank">qt6positioning.mk</a><br=
>
=C2=A0create mode 100644 package/qt6/qt6sensors/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6sensors/qt6sensors.hash<br>
=C2=A0create mode 100644 package/qt6/qt6sensors/<a href=3D"http://qt6sensor=
s.mk" rel=3D"noreferrer" target=3D"_blank">qt6sensors.mk</a><br>
=C2=A0create mode 100644 package/qt6/qt6speech/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6speech/qt6speech.hash<br>
=C2=A0create mode 100644 package/qt6/qt6speech/<a href=3D"http://qt6speech.=
mk" rel=3D"noreferrer" target=3D"_blank">qt6speech.mk</a><br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000157eba063589ec78--

--===============2953900363382853885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2953900363382853885==--
