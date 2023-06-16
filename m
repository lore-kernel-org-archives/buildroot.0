Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C5CEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 12:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C785E42110;
	Fri, 16 Jun 2023 12:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C785E42110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzWEybl8n7uj; Fri, 16 Jun 2023 12:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5B841E6D;
	Fri, 16 Jun 2023 12:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5B841E6D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2BF1BF39A
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 12:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E55EB614AA
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 12:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E55EB614AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mz7EkU6qg4Zk for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 12:47:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E19661497
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E19661497
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 12:46:59 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b4274f7640so23260541fa.0
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 05:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686919617; x=1689511617;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqvqB1O4n9zjnK/NdD8oFBsqxWAkb0uc7WH+5m7Dvng=;
 b=DnSHVfL0LTYY1pFmf2s/OIi/V9UJJnxjNrF+ruzqu+bxZ6yKZDHyinCBhLrrAWdrdl
 /9FJ4oUnxTmDqxCP+sTndFDXVeuIhdKev4qonBX1WtWc2IqT7w2fsXN9tmKVsnzu7Kve
 JRku1Q41mtqw3NcuZLaYLjWpvNIwPR/g+NvZ+pPw/XHB5Xwys4GQYCrBbrdH+4orJ6Vl
 JPeCM0M7QuTj79OZjmeeeJLPb1TpDQ/O5nB5TKL/8jttFHxmXM9yQ6jUv065+UTGfjbY
 aucg/g/XPtlCf7E1E6MBwm1WoXOFW4r45gisCFcrL8ZZOsM+uuQscrT2+UD7GDM2Db9L
 IHqg==
X-Gm-Message-State: AC+VfDxDfbM1bS25XksBLnGlmcLgVqPcYfL3aJZO6DNxjm6i6DuWVu23
 BL3nSCipo54tHGjmSNVpXT3c5G1f1p4xiG14YjmuWYIUmiE=
X-Google-Smtp-Source: ACHHUZ6BWivNwIzDKR+B4G2LCDlr6ktDLR6WCsJ4Ea9voHhA5dRacZcX7jpYIBhjQvZKiRBtB5g7aST32W3ndAA8usg=
X-Received: by 2002:a2e:6814:0:b0:2b3:4663:74d5 with SMTP id
 c20-20020a2e6814000000b002b3466374d5mr681546lja.10.1686919617064; Fri, 16 Jun
 2023 05:46:57 -0700 (PDT)
MIME-Version: 1.0
From: bignesh lenka <bigneshlenka20@gmail.com>
Date: Fri, 16 Jun 2023 18:16:44 +0530
Message-ID: <CA+XYDRsCC9oXebc15HH5HT9=A5f0yj7cUr=TT_sdaBEr9qG_Eg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686919617; x=1689511617;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HqvqB1O4n9zjnK/NdD8oFBsqxWAkb0uc7WH+5m7Dvng=;
 b=JbBIofEfkbGJkRKHHO+H7yzuW5DEpZDQ5nl8d3Jo7NF6ZzmqfzPZCLOSqjtyKYkgG6
 yeq41NX6KTgmytWzBGmRSTTuaZcv4rpxbkq4hkj5wVphBKowcPrtkSuCuFfnb/QOClGI
 pvc5kV/J/LfRl9mF07GuLz6PMTsCScNmTUFhEHMn7zSG7RmwgjY3ZbveQ7WpKbxlOJ/+
 WCoAnNpzgbf7b4NIF2V98dI2IfSC2wS+hZ4gXy1uDbXCCIx/hjT06ToMsVwiHRFZj1nq
 d/TQA4A5P+Yai4Dm08TkxksBArpFnH1zFg1gQNg3MWHuiH927FANH1QroulXgMxdUcdG
 fLoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JbBIofEf
Subject: [Buildroot] Request for information
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
Content-Type: multipart/mixed; boundary="===============3885984108760759215=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3885984108760759215==
Content-Type: multipart/alternative; boundary="0000000000008a333005fe3e947d"

--0000000000008a333005fe3e947d
Content-Type: text/plain; charset="UTF-8"

Respected sir/madam,

I am software engineer, working for a startup called besquare technologies.
Here we are using buildroot for learning as well as developing new
applications.

I as an enthusiast wanted to know when we build an environment for a
specific hardware from where and how the kernel is getting downloaded to
the output directory.

Hope you reply to my query as soon as possible

Thank you

Best regards,
Bignesh lenka

--0000000000008a333005fe3e947d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Respected sir/madam,<div><br></div><div>I am software engi=
neer, working for a startup called besquare technologies. Here we are using=
 buildroot=C2=A0for learning as well as developing new applications.=C2=A0<=
br><br></div><div>I as an enthusiast=C2=A0wanted to know when we build an e=
nvironment=C2=A0for a specific hardware from where and how the kernel is ge=
tting downloaded to the output directory.<br><br></div><div>Hope you reply =
to my query as=C2=A0soon as possible<br><br></div><div>Thank you<br><br></d=
iv><div>Best regards,</div><div>Bignesh lenka</div></div>

--0000000000008a333005fe3e947d--

--===============3885984108760759215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3885984108760759215==--
