Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BBC9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 22:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7F260BBE;
	Fri, 25 Sep 2026 22:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3BInIdKl7Ke; Fri, 25 Sep 2026 22:24:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 16AD06067B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790375078;
	b=h6J17loXCFk2um3fnmGMGfRvBUMS+uo4AQ+Xhyj1Q0SJmaMYnXN6wXZRsJi1Qe6a929A
	 6bFU08whFLPwzZFEVeEmSDuwzL67VK4I+OjFFXM4Kit2dEFzuaLwfJUFezx/GCjiVpba/
	 8MI9cxDRVMsQahwGK9QI/T3289wCxxBPOiq3TMb4rjuhFYuv+wXberHYEZ84mCNbCCymb
	 JH6WIXVrH3xI+GiV4jIhgtOThYFZNUohrz4cPKRNu4gzVu5767m6vhkoAXpZfH3Wh9wBf
	 IvjQSQfKZX4srW4vPLdEatYqZydrfFZoqOAls9cg/cGPDnZh0LcdfZ6pJI2swjcoZsw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790375078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Errors-To:Sender;
	bh=WgMe0heYFxhbwqCTd9XI7b43csEWhhZQUEeWhk4zFZs=;
	b=I9pN4SMHfg3vOgz1csUU+mDz9/dKZatfGXTg+e5xXol1RR+Cneg9ritauwbooCoCMw+9
	 GYaSzRyJ2zih9cGPa36oSH7/gS5iCECiY+HysFOwVpyJJDKKI5ckleDzwFd/RUkTFesfs
	 MF3WF5p73bHyawfWMUWbCAWWBnwp7CiDKRXyQx/5sZ3VOUT5ppCgCj4uV1H+YhNkOB3Ui
	 659nASdGWrk/2ULzJH+SUjPv/iFT08Oa295YOZCohh4PTmUsjQgH8a5jcBSvlT7wkcRSU
	 dwYe51pRrtcbGNF6a3CVYcN28mab+C/Bnb2ibXgm9xoXHE/irywKjlKLlq1QPrXZVPQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790375078;
	bh=WgMe0heYFxhbwqCTd9XI7b43csEWhhZQUEeWhk4zFZs=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P0aF2Q8BE2f5Iga4EihJZlB1WepKQgEDFdITS8s6Mr7nja6EigwrZfrvovYHIUlrF
	 u0NhZoCcHgUgd5Jsn+Sijd+b3OxqtDtg75DoTxM/L8Q/jnaMvHr4ILD52Xuuv6aPck
	 EoV5rx/0Tre4nviacpXLPiYh/KL9ie9wkV+dN6g3y+lEHnMLeUM2SzQyJ3i/MPJ2YZ
	 1Bk8VBaS7MMcGCwe0a+vO+93FGTPJ80sdJWCpORNpC//ecAuqLe+T4ibZn2HdfP7NO
	 BDi5h8k1xHmFgCcC9u+KC1ZKx78EsHiDv1RtPjQIMi/+pMP1CXJ3QbM4jXxITkLENj
	 vWqxRL/QnoB3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16AD06067B;
	Fri, 25 Sep 2026 22:24:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4284F355
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 22:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334756067B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 22:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHQEK17sbo5g for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 22:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 969B86066B
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790375075;
 b=KwKIVomYHljq9k2sg1GbOViX745O2fkH24/Z08tJVkiRMh7TGtno+trQh9mjuKHTH4rR
 vVBcuwAcdnMRajEUpviIzFwSUZ1IiBl/w1Zfm9QKlXuIM2KiH3Aajal5Btil1PI03pNRW
 1WhghsqJ7J91Kw/XtqvJX5UTvc+WDseK0BNYm/3Aqp3Gpv1zCC51sgaphCcCiZTlg9F4k
 ohT5ry7GR1hXV+qXJ+cSC64YAEMkW/6bB43s6knw8ESHe0B6W/zgUmqNfz24c5JuW53yg
 mFiYn5b8feqERWa9g/RjrF48FMeTxmlhiyTFoBTKrkK/bFauAjnNB/7StH5+MmpCN6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790375075;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=/k0XHErL/D18KedjfoDC+AeKU40T/Y3uHuVi4bx2bzg=;
 b=FMjmVllIV5ii9DDi8h5kD2tON8eoyD9k8bVah1Ak+UL+Tq9j/z5HwTa9gyNlLPbLNgLi
 1yp/HUax6pJ8OBs5zKegXun45xAwGVkNPcG3WvGYooVFIBcDZQqTHzG11ZEE9UqwR3Guq
 udqFs4DVFaFArCbDSUF1QQkmPK2bfkOzZyDtd+P7BAhjEMWM6NQSuJD1bgkFCW4N5dC6b
 WIXmgEh22VZOR0Dry9h9geJ8eb0AswOSeqnGa/74a/gB7RR1iChzSo8mPlZD2MVREQK7b
 Veb+JTo6loKg++hcaUE6uq36WYyj9Qnxjr9aAJyHUwDIVH9ge9bAQQE2UYbmNem62Uw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=outrider.ai; 
 dkim=pass header.d=outrider.ai header.i=@outrider.ai header.a=rsa-sha256
 header.s=google header.b="B+wH8/+g"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:39::12"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:39::12; helo=mail-pj2-x12.google.com;
 envelope-from=jkoch@outrider.ai; receiver=<UNKNOWN> 
Received: from mail-pj2-x12.google.com (mail-pj2-x12.google.com
 [IPv6:2607:f8b0:4864:39::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 969B86066B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 22:24:33 +0000 (UTC)
Received: by mail-pj2-x12.google.com with SMTP id
 d9443c01a7336-2dd58e1e2c7so6434705ad.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 15:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790375073; cv=none;
 d=google.com; s=arc-20260327;
 b=muln+NWCwuUvAyH3iauosTpj551NH1eh7PuJ3KATsupBKk2eZz15v9WSkXMp9eBPZY
 BKYcKCs6Vnow0ABgPc9FFm+uG7ytlgKQV7bOf/Ol3HFWHE3Zdb7t01d2QbvkGVc2Z4Zz
 myaajwpipanPLxlBPJuBg2DkQcKu3vrDpnSxJxBO9YJ+L0M/AypTeboUaqT/mNJJVOQk
 wrKwjBqUIF0AWr4raXh1fiUTHPJkCd9ddNd2jViIgH1cf7TstFRrBiMumesLyQYPGzh1
 Y4xyy7Cfl1/xNiocISWHw1ZZrKJFiQMosSMxkFneFafSK4E0N35CfKTbP66olS96nt2U
 z8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/k0XHErL/D18KedjfoDC+AeKU40T/Y3uHuVi4bx2bzg=;
 fh=C6WG7Al5uB0nwAKpefY/95wFSNE7tOoyjgSTqDfhLMo=;
 b=Jys7AooYMKXo5m96UDkOdViqeFR1nElElpOwmNAtPpPNyxYnubSfIZKTpVCj4TRZGM
 rr4o2u7wrMpevM+hpyLa2u8KFI3NE2wtMR6TySizLZvWYe35E1aPTrRyPu5o7EAiEO6I
 EgPav0mMvb+JzLA3zr8HVFmnCPVS33C3V+MNftyHDM3uVG+zc7s9DvhVCrWTgFbXU319
 fV4wjy+Qg5MOWAcugsDfc9EOgpctHoccp4o/QQSj92oyvU0pRbDwag5D9XZVVLFvTZ4Y
 Llt/ajtx0duE9afdvrm6Ats6n3ZK62rw1k9Yy6Gp9vHbbZ5Yk33Iy5OvG2eMFBNDD0pv
 qv9Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790375073; x=1790979873;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/k0XHErL/D18KedjfoDC+AeKU40T/Y3uHuVi4bx2bzg=;
 b=OaQ+yzdKZwXf7CSoHqyf57jmvHjC61NJYg9A4ayBPbaDjWDo1DIM0EdTLa4rVkn3xZ
 vrvs/8riBtf38Sln3c1B07hgOAtCUit0V/bTSa3ka3ULCeh4OUU+0jPcbNrB5gcOC+uF
 7CIiNZQq4g2WcUwF50D2EIVoQ7TzmRqrnNAtmlQxPomj7KgtLBGY8VCO+AazhafDe+fd
 1nROSFD/vnGj4XLNz9Vx+IkVAkUIovFQ4jkek2n33N1w3PQqeqbpYC3H5Mb/KzbpLfoQ
 Gu4I94qiOUjd0Ohx49MKRLKVxDJxmzgixbBXXYHoLKsZzy/IrqjWOV4ry+Y/Z/y/aMyD
 htDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNk7yHLAqA+mFnZ9f/JtFkAE2vU5HnAbEEZoCWOqdEpE7ALHz0MfYJXqZKdfNHJwafvyUKqARbcSw=@buildroot.org
X-Gm-Message-State: AFuF++k208aVcI7Pjf8lEFaaiXFvcHHfxUYaGrQoMH8oC2tode5MyHNs
 4lGwWYgNDU8rSI70emEy5M55PRyqhS2THM2fNcEtEdnIKPI9vxbopUrFxXmmCbZDAsgDr8yQpK+
 uk5HCqOhOPZlA1bOVkdv+TYY6xcnTSpHEHGT9qc5V
X-Gm-Gg: AYBFou1ER4wXqFl3QAzeDBSCaXWBCoBOe3IJ20X5qzVuVshPBTVMZNeyUXHUzJ19J21
 fdgKtxI5v0/cirfbQWMhuZAFjjJEQtOryerHWPdvmCK3oWAyze5BJv4E9E3TnsmvttfJfpX8yXR
 Grx77xxW4uRoZPRGjP7xW5sPM0BYhg9pKp9Gar7v3TDTAVBB+4KOaAKl0/1WXtv32JDMsSuPrKX
 TS/RLAvk2ZdT28O6xSdu4LFY+Pwh+3+VlAqxwAmt2NE/8wYI0JlFZ0xbbmgFEJChcOF5psPxnnl
 iAiZWEVtTrGbDJMIpPly/vHTgkEuuRxVD12yd+njYKKPRCPu7UtKiRmykAFYKw==
X-Received: by 2002:a17:903:1b6e:b0:2df:8aea:7d92 with SMTP id
 d9443c01a7336-2df8aea889cmr39279605ad.47.1790375072838; Fri, 25 Sep 2026
 15:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260902195708.2168193-1-j@j-ernberg.se>
 <CAMQGCcjXAx56Jtk31ArAZJyPxc=cXU48KyrzObu-p-F19agEpQ@mail.gmail.com>
 <PH1P110MB1603534783B4E17496D192219FB1A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603534783B4E17496D192219FB1A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Date: Fri, 25 Sep 2026 16:24:21 -0600
X-Gm-Features: AclHuK8BwSwiRdv-S1pSXjnQ0SuVQAa5vGcKUynE_ropAOf7FSVIWzYX8YHfsr0
Message-ID: <CAMQGCch9MS-piL46iV09KS=OfTRgWaXUMqHDA0mcWEso2NX6Bw@mail.gmail.com>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: "j@j-ernberg.se" <j@j-ernberg.se>, Adam Ford <aford173@gmail.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Zach Vargas <zvargas@xes-inc.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Subject: Re: [Buildroot] Updating nvidia-driver package
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
From: John Koch via buildroot <buildroot@buildroot.org>
Reply-To: John Koch <jkoch@outrider.ai>
Content-Type: multipart/mixed; boundary="===============6068199387902512328=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6068199387902512328==
Content-Type: multipart/alternative; boundary="0000000000003b4613065c562e08"

--0000000000003b4613065c562e08
Content-Type: text/plain; charset="UTF-8"

Vincent,

I looked through your older post and repo/branch. There was a lot of good
stuff in the branch. It showed me capabilities the updated package was
ultimately missing. I spent some time addressing those shortcomings and
polishing the content. I am hesitant to remove older compatibilities,
especially if keeping them building properly isn't too difficult.

All,

Again, I'm unable to test if the build works on all hardware
configurations. I built all the permutations prior to the additions I
introduced today.

Because the package changes are so substantial, I'm unsure how to actually
introduce them. How should I share what I have so far? Once people get eyes
on it they can suggest if and how it should be broken into more reviewable
pieces.

Here are my current diff statistics:
 Config.in.legacy                             |  16 +
 package/nvidia-driver/0001-use-LDFLAGS.patch |  50 ---
 package/nvidia-driver/Config.in              | 381 +++++++++++++++---
 package/nvidia-driver/gl.pc                  |   2 +-
 package/nvidia-driver/nvidia-driver.hash     |  27 +-
 package/nvidia-driver/nvidia-driver.mk       | 558
++++++++++++++++++++-------
 6 files changed, 791 insertions(+), 243 deletions(-)

--0000000000003b4613065c562e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"arial, sans-serif">Vincent,</font></div=
><div><font face=3D"arial, sans-serif"><br></font></div><font face=3D"arial=
, sans-serif">I looked through your older post and repo/branch.=C2=A0There =
was a lot of good stuff in the branch. It showed me capabilities the update=
d package was ultimately missing. I spent some time addressing those shortc=
omings and polishing the content. I am hesitant=C2=A0to remove older compat=
ibilities, especially if keeping them building properly isn&#39;t too diffi=
cult.</font><div><font face=3D"arial, sans-serif"><br></font></div><div><fo=
nt face=3D"arial, sans-serif">All,</font></div><div><font face=3D"arial, sa=
ns-serif"><br></font></div><div><font face=3D"arial, sans-serif">Again, I&#=
39;m unable to test if the build works on all hardware configurations. I bu=
ilt all the permutations prior to the additions I introduced today.</font><=
div><font face=3D"arial, sans-serif"><br></font></div><div><font face=3D"ar=
ial, sans-serif">Because the package changes are so substantial, I&#39;m un=
sure how to actually introduce them. How should I share what I have so far?=
 Once people get eyes on it they can suggest if and how it should be broken=
 into more reviewable pieces.</font></div><div><font face=3D"arial, sans-se=
rif"><br></font></div><div><font face=3D"arial, sans-serif">Here are my cur=
rent diff statistics:</font></div><div><font face=3D"monospace">=C2=A0Confi=
g.in.legacy =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A016 +<br>=C2=A0package/nvidia-dri=
ver/0001-use-LDFLAGS.patch | =C2=A050 ---<br>=C2=A0package/nvidia-driver/Co=
nfig.in =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 381 +++++++++++++=
++---<br>=C2=A0package/nvidia-driver/gl.pc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-<br>=C2=A0package/nvidia-driver=
/nvidia-driver.hash =C2=A0 =C2=A0 | =C2=A027 +-<br>=C2=A0package/nvidia-dri=
ver/<a href=3D"http://nvidia-driver.mk">nvidia-driver.mk</a> =C2=A0 =C2=A0 =
=C2=A0 | 558 ++++++++++++++++++++-------<br>=C2=A06 files changed, 791 inse=
rtions(+), 243 deletions(-)</font><font face=3D"arial, sans-serif"></font><=
/div></div></div>

--0000000000003b4613065c562e08--

--===============6068199387902512328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6068199387902512328==--
