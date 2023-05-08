Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2B0C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 14:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D814B40278;
	Mon,  8 May 2023 14:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D814B40278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssdZwl0Wxa2b; Mon,  8 May 2023 14:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 854F9401A2;
	Mon,  8 May 2023 14:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 854F9401A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F27CE1BF279
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBBBA614E4
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBBBA614E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id maD7iD6kXk2E for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 14:58:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A7361457
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A7361457
 for <buildroot@buildroot.org>; Mon,  8 May 2023 14:58:07 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-619ca08c166so22303016d6.1
 for <buildroot@buildroot.org>; Mon, 08 May 2023 07:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683557886; x=1686149886;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yTAC8926zS3fpXCtu0+/ASoDIHYngL/i8N6I2eRbq1c=;
 b=LlB3/2YOy8PfZQnfjrQ5cGVWwBR+X9zRiM4nV7xO2UG6bV4uDaIP0F9jfGa5Rx68JD
 b8KrkmW2Ntvm+QWwFrH5m+pq91+7ZR4wFAmL1p44+5KdkrIPPD4qpVUZdLLmEm4sN1M8
 m7j++60BoXMiHgybAlaRC7E9AZFIfs7f69hVQlZKvkF2CGLNghlGnXKXiq1MuzqP8mJB
 Awcu+hll5GJWuX/1YMlPDFYpDOBj7x9vRE3UA75H5uKM1LVNjyZ3ah/NV2eTeR+Ea6Hy
 caiShLSCQ0cOGQfACeGVel5EbCM6M6w8PDDEZLfDREmm9aMbnj06DoFGtKc4OECYb2Pv
 mnRA==
X-Gm-Message-State: AC+VfDwLkrVpBflMg4Rciah7aV24En4P9ny+87/ZuEfoIgNlvoK3OSPZ
 z7phx81AEP1+WLLPGaOYDOBARF5D2t1qQKhPrBbYBByewoBRVB8U
X-Google-Smtp-Source: ACHHUZ6B2kdP4RvUBldDYcjLcNnTbw29865eYqT+ofTP+fWVeRHyG7USOVI1Zy1VlhHhqrETrGllahgB85Xp3iG3h/Y=
X-Received: by 2002:a05:6214:21aa:b0:600:5dbc:c31a with SMTP id
 t10-20020a05621421aa00b006005dbcc31amr14820929qvc.7.1683557886193; Mon, 08
 May 2023 07:58:06 -0700 (PDT)
MIME-Version: 1.0
From: Chris Hamilton <chamilton@apecor.com>
Date: Mon, 8 May 2023 10:57:30 -0400
Message-ID: <CACvqGUar+MHDXMVcOzYOaA9uaqSnJ_T7PkoffbaVKYnSWeXTmQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=apecor.com; s=google; t=1683557886; x=1686149886;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yTAC8926zS3fpXCtu0+/ASoDIHYngL/i8N6I2eRbq1c=;
 b=TSNQ+hYN6FHd1djH09o3YYEVFynWYNAVYCEaVX8bbnDDrAxIGsXtDhmRomrVF2FBYC
 msyGVqcU7kJ0AW7Ycd7dadlgmTBE0MSkmi52JQw34kDvfXwbvXMigHM9X3+jK8STz7Ij
 eAQSUu7aTUuOfTqqiO9iXYYG19i9bc/zToJLs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=apecor.com header.i=@apecor.com
 header.a=rsa-sha256 header.s=google header.b=TSNQ+hYN
Subject: [Buildroot] Decoupling build and runtime dependencies
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
Content-Type: multipart/mixed; boundary="===============4151346952046507191=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4151346952046507191==
Content-Type: multipart/alternative; boundary="000000000000c406c705fb2fdd56"

--000000000000c406c705fb2fdd56
Content-Type: text/plain; charset="UTF-8"

Hello

First, a general description of what we're trying to do.

We have a program written in python that we'd like to compile to native
binary using nuitka to help with execution time.  Right now, there is a
sizable startup delay with the script because of the platform it's running
on (ARM based), so we'd like to Nuitka-ize it for the purpose of speed.

What I'm unsure of is that best way to do this.  One option is to compile
the program on some ARM hardware and just copy the binary directly into the
rootfs in the post-build hooks.  The other, more preferable method, would
be to incorporate the build into buildroot itself.  In my mind though, it
seems that adding nuitka as a dependency would actually bake nuitka into
the rootfs... whereas we'd rather only have nuitka installed in the build
environment and call nuitka as if it were on an ARM platform.  Granted,
nuitka does not support cross compiling, so I guess I'm not sure if this is
even possible with Nuitka... maybe method 1 is the only way to do this?

I realize this is a combo buildroot/nuitka question, but any insights or
suggestions would be appreciated!

Thanks
Chris

-- 
*Chris Hamilton*
Sr. Firmware Engineer
ApECOR
5707 Dot Com Court Unit 1001
Oviedo, Florida 32765
407.476.4747
www.apecor.com <http://apecor.com/>

--000000000000c406c705fb2fdd56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div><br></div><div>First, a general description of w=
hat we&#39;re trying to do.</div><div><br></div><div>We have a program writ=
ten in python that we&#39;d like to compile to native binary using nuitka t=
o help with execution time.=C2=A0 Right now, there is a sizable startup del=
ay with the script because of the platform it&#39;s running on (ARM based),=
 so we&#39;d like to Nuitka-ize it for the purpose of speed.</div><div><br>=
</div><div>What I&#39;m unsure of is that best way to do this.=C2=A0 One op=
tion is to compile the program on some ARM hardware and just copy the binar=
y directly into the rootfs in the post-build hooks.=C2=A0 The other, more p=
referable method, would be to incorporate the build into buildroot itself.=
=C2=A0 In my mind though, it seems that adding nuitka as a dependency would=
 actually bake nuitka into the rootfs... whereas we&#39;d rather only have =
nuitka installed=C2=A0in the build environment and call nuitka as if it wer=
e on an ARM platform.=C2=A0 Granted, nuitka does not support cross compilin=
g, so I guess I&#39;m not sure if this is even possible with Nuitka... mayb=
e method 1 is the only way to do this?</div><div><br></div><div>I realize t=
his is a combo buildroot/nuitka question, but any insights or suggestions w=
ould be appreciated!<br><br>Thanks<br>Chris<br clear=3D"all"><div><br></div=
><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr" style=3D"font-size:12.8px"><b>Ch=
ris Hamilton</b><br>Sr. Firmware Engineer<br>ApECOR<br></div><div style=3D"=
font-size:12.8px"><span style=3D"color:rgb(34,34,34);font-size:small">5707 =
Dot Com Court Unit 1001</span></div><div style=3D"font-size:12.8px"><span s=
tyle=3D"color:rgb(34,34,34);font-size:small">Oviedo, Florida 32765</span><b=
r></div><div dir=3D"ltr" style=3D"font-size:12.8px"><a href=3D"tel:407.476.=
4747" value=3D"+14074764747" style=3D"color:rgb(17,85,204)" target=3D"_blan=
k">407.476.4747</a><br><a href=3D"http://apecor.com/" style=3D"color:rgb(17=
,85,204)" target=3D"_blank">www.apecor.com</a></div></div></div></div></div=
></div></div></div>

--000000000000c406c705fb2fdd56--

--===============4151346952046507191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4151346952046507191==--
