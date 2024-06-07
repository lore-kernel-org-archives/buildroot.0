Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75330C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD14405EC;
	Fri,  7 Jun 2024 18:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFkOC1Q9ExPS; Fri,  7 Jun 2024 18:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A471C40C11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A471C40C11;
	Fri,  7 Jun 2024 18:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C579E1BF476
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 18:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B11CB40C11
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 18:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFoKWSyBBlhg for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 18:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF6A4405EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF6A4405EC
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF6A4405EC
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 18:17:12 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4eb11869d5bso764466e0c.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 11:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717784231; x=1718389031;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQeBKp09PdN5L3guoiaOaSve1P6HBPs7O9DAjsdnlRs=;
 b=EQbIE+yaOz7ucAU+pNmboGF7+L8p8kqg2w61uf4TH097/dGZeOIwMk3kbQiI3ZSAC9
 oG0KOo7yNd47iwoNI1mv1JJajm7TPOGWmjd+ot9sND1oLfmKLxjPFfbnx/HQGfrVBQY1
 2S8A7smQza3R3SJRVf/Sj/6AabnEzkmp/hEhVTMwVGBBHdY0uPdz6B93A6EQ1vFsWbTt
 nPI+06W0+8oCHkeVyXJ9M6fcE3DM7DDhEh55tYZs9+tre+w77FIuEUriDRVpIbkHAqHq
 tHLMhHO/VznSA5EKnxjGOm77D1PgsmQCpgsuogNbcCTMRxoXYvv6G9BOTr3dwL4H4ya4
 J1qQ==
X-Gm-Message-State: AOJu0Yz9CBhMyjgjMceK4lKD0rTV2fWt5nyP7x/0HCPVVe98prvM0MSh
 WB6dRvEusox+kmfAWdMRXHiXcCtkCftcRuKbyty3KxQ9a7BRgAIc5niTZ6PWo2NZwqxHzt+pDaW
 PFUwkCos4uHwWBFi8wIJXiMPKhOnarkhCN9G1HM1xgVEv8JpH+Is=
X-Google-Smtp-Source: AGHT+IG98ppX7ZZi8BQCDTYky0N/fGcwuIm377N3EvXVY4UzcuOzJLOzCtj+5tM0255QjFjKU7uHyLCdZVr/VeZej1Y=
X-Received: by 2002:a05:6122:c91:b0:4d8:df31:6b34 with SMTP id
 71dfb90a1353d-4eb56255ef4mr3877202e0c.8.1717784231141; Fri, 07 Jun 2024
 11:17:11 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Fri, 7 Jun 2024 14:17:00 -0400
Message-ID: <CAJ6EmCeAFeqGEy5Hq=UhFo8b6twQKD3++6Et9+jKH1U8d=vDEw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1717784231; x=1718389031; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qQeBKp09PdN5L3guoiaOaSve1P6HBPs7O9DAjsdnlRs=;
 b=W3lWe6QoNKr6yoDB8H+LFuRtEphMxGFqXUedII4/HmUVXfetG/sMyQM3Lw2Y8at+BL
 mU8qVJ9H5j3JM1D23ERgop4FN5ffg1iogo8Ce6x/BoPzuigwKNeLVqx6qbS2lDUVf0TR
 Ic/7Tl32648EhzQS1p7KljrwAGHlAM2rkB0VOvDKauvMqSn0Fm+L4nPXnRNVB+LmyEXQ
 r/RTSXyB+wsMEqn+5ajSN9ommg1p8SGYR+WH5mzBsP0uYLR6+4D8IKtMA2/vRA/x9Izp
 gcF2RcsZxZ/dg9nQ3hQix1IeTMCzjH/DdqpPaXxi4gScXmeg9h1Y4+PEma6BW2qEeTcI
 WvSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=W3lWe6Qo
Subject: [Buildroot] QT5webkit build error
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
Content-Type: multipart/mixed; boundary="===============5747415647277343908=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5747415647277343908==
Content-Type: multipart/alternative; boundary="000000000000e60258061a50ce9e"

--000000000000e60258061a50ce9e
Content-Type: text/plain; charset="UTF-8"

I just downloaded and started using Buildroot 2024.02.2 for a Beagleplay
project I am working on for a client.  I am getting the following error
when QT5webkit is being built.  I found a couple patches in an online
search, but  they don't seem to be related to the problem I'm seeing.
Output of build below.  Has anyone seen this and is there a patch available
for this problem?

 from
/media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb:68:in
`<main>'
make[4]: ***
[Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/build.make:96:
DerivedSources/JavaScriptCore/LLIntDesiredOffsets.h] Error 1
make[3]: *** [CMakeFiles/Makefile2:1430:
Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....
[  4%] Linking CXX shared library ../../../lib/libgtest.so
[  4%] Built target gtest
make[2]: *** [Makefile:166: all] Error 2
make[1]: *** [package/pkg-generic.mk:283:
/media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4/.stamp_built]
Error 2
make: *** [Makefile:82: _all] Error 2

--000000000000e60258061a50ce9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just=C2=A0downloaded and started using Buildroot 2024.02=
.2 for a Beagleplay project I am=C2=A0working on for=C2=A0a client.=C2=A0 I=
 am getting the following error when QT5webkit is being built.=C2=A0 I foun=
d a couple patches in an online search, but=C2=A0 they don&#39;t seem to be=
 related to the problem I&#39;m seeing.=C2=A0 Output of build below.=C2=A0 =
Has anyone seen this and is there a patch available for this problem?<div><=
br></div><div>=C2=A0from /media/Projects/Edvotek/edvotek-edvocycler3/buildr=
oot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/o=
fflineasm/generate_offset_extractor.rb:68:in `&lt;main&gt;&#39;<br>make[4]:=
 *** [Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/build.make=
:96: DerivedSources/JavaScriptCore/LLIntDesiredOffsets.h] Error 1<br>make[3=
]: *** [CMakeFiles/Makefile2:1430: Source/JavaScriptCore/CMakeFiles/LLIntOf=
fsetsExtractor.dir/all] Error 2<br>make[3]: *** Waiting for unfinished jobs=
....<br>[ =C2=A04%] Linking CXX shared library ../../../lib/libgtest.so<br>=
[ =C2=A04%] Built target gtest<br>make[2]: *** [Makefile:166: all] Error 2<=
br>make[1]: *** [package/<a href=3D"http://pkg-generic.mk:283">pkg-generic.=
mk:283</a>: /media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2=
/output/build/qt5webkit-5.212.0-alpha4/.stamp_built] Error 2<br>make: *** [=
Makefile:82: _all] Error 2<br></div></div>

--000000000000e60258061a50ce9e--

--===============5747415647277343908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5747415647277343908==--
