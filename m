Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A98CE79A7
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 22:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92724031B;
	Mon, 25 Sep 2023 22:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92724031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YMg2f5ScA7Y; Mon, 25 Sep 2023 22:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9956440352;
	Mon, 25 Sep 2023 22:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9956440352
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E805F1BF322
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 22:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF4714031B
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 22:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4714031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1k2HQJWevnA for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 22:43:11 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8311D401E7
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 22:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8311D401E7
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-65b0e623189so15960306d6.1
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 15:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695681790; x=1696286590;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gDJDds+VBLuwl2+JxMcrmXBomDAKDjfxDDnhFN5ComI=;
 b=K4zJzu3+Z9ka3n8GPLB7fcSMo0Iwpvux5du3m4G3GtC3pAiFeIrC+MEWH9DpzoZSaJ
 nTB7M7n0aXn29FTizI2ZsiTehrZfp/52GD9BMebaGiHNPGkYoJ3RO1pCvzPHln907ANA
 kPrz/xr7rXekpdqKC7A6rvpuoQEN8J61eJL5G1s3Er0A1O+cQGsoBdDMo81o2XyYU0tA
 Q5IQSK4mxLIWRoXQC8rECggE9uQjko+Ggn8Pddu0m5/j3RHZg0y8nGhZhiZmnGxoo5/4
 9k4a6bkf0ZD0RFx6q1A3ANlb2u/GlrQiFbfgbETfSO7LZZLspd4cKSL26eIvSnIkmGJl
 Hzgw==
X-Gm-Message-State: AOJu0YxMuidCJboHZhGiaU8+rleggzixd4U2h7/QIbhJ0H8PTRz7GMav
 9R0Kru9/fqzk1j+P2q+hP5p5dAkVwvDw4Ewr0i5JFoe9D+HBww==
X-Google-Smtp-Source: AGHT+IFlNxIkR4hycRZYlboRX2gW2yGnNo1xAH5uXn8dwe0c0HgfFw4euEjxkl9HvUkcIhCchZG8em28K7o7rO9y8qs=
X-Received: by 2002:ad4:5291:0:b0:64f:49d1:3fe7 with SMTP id
 v17-20020ad45291000000b0064f49d13fe7mr7848815qvr.23.1695681789981; Mon, 25
 Sep 2023 15:43:09 -0700 (PDT)
MIME-Version: 1.0
From: Yanghao Cheng <YanghaoBillCheng@gmail.com>
Date: Mon, 25 Sep 2023 15:42:59 -0700
Message-ID: <CAGnyD8udPeWvFXjQGrV2kDhMRLVv9T0aNNAJPTgxjQNLr-BU8w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695681790; x=1696286590; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gDJDds+VBLuwl2+JxMcrmXBomDAKDjfxDDnhFN5ComI=;
 b=Wxqx/imFnrTPUl0Uka49R5VCMQoCz6gHiMJPVL641O5FW80cugYwai7pQLemov6pKR
 u1xny84cHgW++LfwdrRHrj8RwbiDnqRuwNgZU6hXvB2mgnR41/Wsoq1ZQ+j4HPwFYwWS
 wIXK2ZXtzJQ4VixlDvBg9aNjYnDAr3oUyKGsBE4XONU7o2DzHc7Gc14EyLtuFOQYYmuV
 DT8HQT1rRrv3+pUcMCmjwG4TSnr/fbzgX5AIxQmcnvgyLuvzlU07Tna0Tw82wMDAQPrq
 FtEJLZoFRp9Rij4aCn6Ujaa+83fNRiD5ZUnQ2/4WdQZEbPKv25+pfjXvZGdhSuqcP7Ci
 oZYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wxqx/imF
Subject: [Buildroot] test-pkg failed, then what?
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
Content-Type: multipart/mixed; boundary="===============5740298630073625558=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5740298630073625558==
Content-Type: multipart/alternative; boundary="000000000000be7916060636ae1d"

--000000000000be7916060636ae1d
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I am trying to add the wiringpi package back as now that there's a
continuation on Github.
https://github.com/WiringPi/WiringPi

I brought the old config.in and .mk files off the old commit that removed
them and adjusted the site.
I tested it on my board and it builds. Prior to submission, I also tested
the package with test-pkg script. But the tests either failed or were
skipped.

I've read the section 18.25 of the manual, but there isn't any instruction
to go about fixing the failed test.

Following is the output

> $ utils/test-pkg -c wiringpi.config -p wiringpi
>                     bootlin-armv5-uclibc [1/6]: FAILED
>                      bootlin-armv7-glibc [2/6]: FAILED
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: FAILED
>                       br-arm-full-static [5/6]: SKIPPED
>                             sourcery-arm [6/6]: FAILED
> 6 builds, 2 skipped, 4 build failed, 0 legal-info failed, 0 show-info
> failed


Best,
Yanghao

--000000000000be7916060636ae1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<div><br></div><div>I am trying to add the =
wiringpi package back as now that there&#39;s a continuation on Github.</di=
v><div><a href=3D"https://github.com/WiringPi/WiringPi">https://github.com/=
WiringPi/WiringPi</a>=C2=A0<br><br>I brought the old <a href=3D"http://conf=
ig.in">config.in</a> and .mk files off the old commit that removed them and=
 adjusted the site.<br>I tested it on my board and it builds. Prior to subm=
ission, I also tested the package with test-pkg script. But the tests eithe=
r failed or were skipped.<br><br>I&#39;ve read the section 18.25 of the man=
ual, but there isn&#39;t any instruction to go about fixing the failed=C2=
=A0test.</div><div><br></div>Following is the output<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">$ utils/test-pkg -c wiringpi.config -p wir=
ingpi<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bootlin-armv5-uclibc [1/6]: FAILED<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootlin-armv7-glibc [2/6]: FAI=
LED<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bootlin-armv7m-uclibc [3/6]: SKIPPED<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootlin-x86-64-musl [4/6]: FAI=
LED<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 br-arm-full-static [5/6]: SKIPPED<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sour=
cery-arm [6/6]: FAILED<br>6 builds, 2 skipped, 4 build failed, 0 legal-info=
 failed, 0 show-info failed</blockquote><div><br></div><div>Best,<br>Yangha=
o=C2=A0</div></div>

--000000000000be7916060636ae1d--

--===============5740298630073625558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5740298630073625558==--
