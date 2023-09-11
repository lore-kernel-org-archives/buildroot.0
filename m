Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9FAEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 056C981EDA;
	Mon, 11 Sep 2023 19:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056C981EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sF6qqcif3y-M; Mon, 11 Sep 2023 19:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C6D981ECA;
	Mon, 11 Sep 2023 19:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C6D981ECA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 123F31BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC46060E76
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC46060E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTf9NUETZTmz for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:45:40 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61E6260DFF
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E6260DFF
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso4421932f8f.0
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 12:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694461538; x=1695066338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ssJlFja4bJVUacVjX5nZ2bT2ff1O2/Cjmy87hoPnVI=;
 b=FfE4H06PAjeAU4EqNJsi1ZRpSniKlGckgr6TLndSfd5UjJBsxlvfGKdR5tnKYWDk9p
 O45ZAkvDDuZ1yFMutms5SlQ4J7/NORzqynbIBMwDb9Y8Um8PcDlPyow5ksNLueDUvMTk
 xVR4li5WAY7+1/s9eWKM+gRR4884Vvd+H1IahW9mL09nGDYHp1ZLSQaK8anadwdi4CTa
 So4YOu6AMefupfMhnhZALKn7KfywORd4tiY9AE12nszyw01Q3aiRPK20aL1mrgw8GnEL
 ynIqvjPEkRX7W1YbsjJnh4EzWyvtswpi/eQ/2GFtvUg142ViMm0NyL4Mt0lPTunysde6
 nKNQ==
X-Gm-Message-State: AOJu0YyX+56HEvfCE5K9Cv4+gk1f7maIg6VgvU23f32wLVs2AG4sz420
 /whc1Po2/SiBomK8HPyWIZb9AetdXGqigN83gmG25JgQ5p8=
X-Google-Smtp-Source: AGHT+IFprv02iFCOamg9jFiH/V66IOtyPedM1VGT0Xsle7n1NCe71fJqBvPiGTGBR7iIf2M3HrilxVd8n40UYWbM54w=
X-Received: by 2002:adf:ffd0:0:b0:313:f463:9d40 with SMTP id
 x16-20020adfffd0000000b00313f4639d40mr8104687wrs.65.1694461538041; Mon, 11
 Sep 2023 12:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230911085000.559230-1-judge.packham@gmail.com>
 <20230911155225.0a63879f@windsurf> <20230911214051.0da8179c@windsurf>
In-Reply-To: <20230911214051.0da8179c@windsurf>
From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 12 Sep 2023 07:45:25 +1200
Message-ID: <CAFOYHZD=YMFyPKv-JSanV5Ry34vU5CnMrTuzEiGqOF-OVdzymg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694461538; x=1695066338; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1ssJlFja4bJVUacVjX5nZ2bT2ff1O2/Cjmy87hoPnVI=;
 b=dDb+FtTaLtVJ4gad+ELIDGYun70mvDcJ/l+17DUB1lGuON+Te2xqJQK0wrU60JAkpT
 KH2ZaFlkpLvtmM5V/0IBxC9nrFNkwv67UsW71JhY0uMfYaA23l5YYVophz7iSZeFIqZw
 6eo4zdO030PYlpLoS/4U2Ul7g34a46fBSN7c/oC+vOvnMiNpB5eVGByPveScJngXXknA
 mQhI1H7r7yRLmCT2/Uab8dmEnabSbNhejzHJbkZ9z2SstTvJFhSMpnL3hdrtHil/w/m8
 +SfQ+K7u16mY2hdONDGMZ/CHc+XLyHSb/GROTQaMFgyLB/ZhJSNhyJ7tip1nyKrf9+8k
 7YXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dDb+FtTa
Subject: Re: [Buildroot] [PATCH 1/2] syslog-ng: bump version to 4.3.1
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6380635634880073272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6380635634880073272==
Content-Type: multipart/alternative; boundary="0000000000000f859e06051a925d"

--0000000000000f859e06051a925d
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Sept 2023, 7:41 am Thomas Petazzoni, <
thomas.petazzoni@bootlin.com> wrote:

> Hello Chris,
>
> On Mon, 11 Sep 2023 15:52:25 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
>
> > On Mon, 11 Sep 2023 20:49:59 +1200
> > Chris Packham <judge.packham@gmail.com> wrote:
> >
> > > Update to latest version. This includes a fix for CVE-2022-38725.
> >
> > So this is a security bump?
>
> Actually, are you sure it is related to CVE-2022-38725. According to
> https://nvd.nist.gov/vuln/detail/CVE-2022-38725, this CVE only affects
> versions up to 3.38, and we're at 4.2.0. In addition,
> https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.3.1
> does not mention "CVE" anywhere. Could you clarify this?
>

I was going on the Debian issue that said 4.3.1 was fixed. But perhaps it
was actually unaffected.

I can resubmit without the mention. My intent was just a feature bump.

--0000000000000f859e06051a925d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Sept 2023, 7:41 am Thomas Petazzoni, &lt;<a=
 href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Chris,<br>
<br>
On Mon, 11 Sep 2023 15:52:25 +0200<br>
Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.or=
g" target=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a>&gt; wro=
te:<br>
<br>
&gt; On Mon, 11 Sep 2023 20:49:59 +1200<br>
&gt; Chris Packham &lt;<a href=3D"mailto:judge.packham@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">judge.packham@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Update to latest version. This includes a fix for CVE-2022-38725.=
=C2=A0 <br>
&gt; <br>
&gt; So this is a security bump?<br>
<br>
Actually, are you sure it is related to CVE-2022-38725. According to<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-38725" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2022-=
38725</a>, this CVE only affects<br>
versions up to 3.38, and we&#39;re at 4.2.0. In addition,<br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.=
3.1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/sys=
log-ng/syslog-ng/releases/tag/syslog-ng-4.3.1</a><br>
does not mention &quot;CVE&quot; anywhere. Could you clarify this?<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I was goi=
ng on the Debian issue that said 4.3.1 was fixed. But perhaps it was actual=
ly unaffected.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I can res=
ubmit without the mention. My intent was just a feature bump.</div></div>

--0000000000000f859e06051a925d--

--===============6380635634880073272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6380635634880073272==--
