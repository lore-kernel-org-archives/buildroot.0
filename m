Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF9EC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29EDE408CF;
	Fri, 12 Jul 2024 13:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE4GFoUMu3PQ; Fri, 12 Jul 2024 13:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC96410A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC96410A7;
	Fri, 12 Jul 2024 13:43:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6BA1BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8888184631
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRclMBi7flzE for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:43:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87FB5812F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FB5812F6
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87FB5812F6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:43:20 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-65651296d91so19440717b3.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720791799; x=1721396599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IhJILdX1tD2ArCEpiYBjqDSSHeVPyAPqfswTq1w5ifc=;
 b=quqv69wrf8d4KAMswvaA3s2BXGEl7Vf+3hw3tAT5DuKbWwY39MxkUYBXlPBUdBQJpy
 e4WUg7TTt7NJusb6vcKm8N15oGuyXPgTk/XR5UCMAXUllhF8zqBIyWJseG2gnNV418Gv
 vx5ewur8dWa5tXSmR/hO0PkI9k7Nyg92aWtv9DjckwO6bxsJel00ccud6I1DaE9yiGAP
 +76AQ7NWx2+6qybi+C1UGztEoLepk2IF4AZDRwui3kSFVlrgOE64rIa5jpN5BYnQ/SR7
 fUfKThNY5CV/bo6waanI90WDs89LOe1JbsKTLcXPVoaXwhvNABUxDBnzeVhy6tiIJusf
 2lVQ==
X-Gm-Message-State: AOJu0YzLaFCqAUfOg4MqPWgGf38+0vB3yq6Ud8LcTU9qwKjMmEyUmrUc
 eidSkwIsKSci7aWao2AerhPdw/IYj9GWGJB2t0TphUv3U7b5Tnqepgmza11tkabq4EMmlPMVWn2
 XllCTSp+rhZQSQH40w8jYSqLD19FLjw==
X-Google-Smtp-Source: AGHT+IEKN1PxyUIvizIPSZSmXkgCwlOFt5xgGCRMrTOjX3HAJGHUV5kDZOA8vSKdHgED6aXrFMmLWwNHyfMRsKrUN24=
X-Received: by 2002:a05:690c:fd4:b0:65b:cdab:2678 with SMTP id
 00721157ae682-65cbafb2003mr69480457b3.15.1720791799218; Fri, 12 Jul 2024
 06:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240611141216.1211627-1-roy.kollen.svendsen@gmail.com>
 <c8f71ea8-a7dc-457a-90ea-2af4084eb484@mind.be>
In-Reply-To: <c8f71ea8-a7dc-457a-90ea-2af4084eb484@mind.be>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 12 Jul 2024 15:43:08 +0200
Message-ID: <CA+R_derS68K1iKkeGRfReXHOjonS37zv9iLsbRbb+Nw-rOoCDw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720791799; x=1721396599; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IhJILdX1tD2ArCEpiYBjqDSSHeVPyAPqfswTq1w5ifc=;
 b=OQscOryIW0G1Ht35jY6qYOYlX/D7arDQl3O9Iv15bB1us7LahOFc7EKYONatcOePiO
 tX2/0qs4m5ID6JRhmkuVnpFXUl8OonCYysHXeAdQMbUjucdePCbL9uCzMWmV19OlHKSX
 ywEaDPus/Z0ktN3T8MtpZdtrCcBPbYxx5if9NmRcjRSItk5CI+qjqXCraBrewlM/bovZ
 W9XEEPb5var4VcZmRNlPLzX56OCdHBwn5zdELmqFJbuVjm3ELheGSBKiv3RNlvLRjAP4
 Z6marns9vZxzmI1vxEKoUliF/oZCgFbz8hxCJh4zobFF7wOTpMBNLMauNOThRfCs9yaE
 cfKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OQscOryI
Subject: Re: [Buildroot] [PATCH] package/qt5: bump packages to lateste kde
 submodule versions
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: multipart/mixed; boundary="===============8994669771298725351=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8994669771298725351==
Content-Type: multipart/alternative; boundary="000000000000ecc8c6061d0d0ffe"

--000000000000ecc8c6061d0d0ffe
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

fre. 12. jul. 2024, 00:08 skrev Arnout Vandecappelle <arnout@mind.be>:

>   Hi Roy,
>
> On 11/06/2024 16:12, Roy Kollen Svendsen wrote:
> > Bump qt5 packages to latest submodule versions from:
> > https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
>
>   Your Signoff is missing...
>
>   You can just reply to this mail with your signoff and we can add it
> while
> applying.
>
>
>   Regards,
>   Arnout
>
> [snip]
>

--000000000000ecc8c6061d0d0ffe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:12.8px">Signed-off-by: Roy Kolle=
n Svendsen &lt;</span><a href=3D"mailto:roykollensvendsen@gmail.com" style=
=3D"text-decoration-line:none;color:rgb(66,133,244);font-size:12.8px">royko=
llensvendsen@gmail.com</a><span style=3D"font-size:12.8px">&gt;</span></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">fre. =
12. jul. 2024, 00:08 skrev Arnout Vandecappelle &lt;<a href=3D"mailto:arnou=
t@mind.be">arnout@mind.be</a>&gt;:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
=C2=A0 Hi Roy,<br>
<br>
On 11/06/2024 16:12, Roy Kollen Svendsen wrote:<br>
&gt; Bump qt5 packages to latest submodule versions from:<br>
&gt; <a href=3D"https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://invent.kde.org/qt/qt/qt5/-/t=
ree/kde/5.15</a><br>
<br>
=C2=A0 Your Signoff is missing...<br>
<br>
=C2=A0 You can just reply to this mail with your signoff and we can add it =
while <br>
applying.<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
[snip]<br>
</blockquote></div>

--000000000000ecc8c6061d0d0ffe--

--===============8994669771298725351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8994669771298725351==--
