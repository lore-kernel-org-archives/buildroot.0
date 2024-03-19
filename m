Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B95C54E71
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0AAC81EB3;
	Tue, 19 Mar 2024 21:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srjHxu7IaxKd; Tue, 19 Mar 2024 21:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDDD181F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDDD181F41;
	Tue, 19 Mar 2024 21:03:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D48281BF834
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10D660768
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsJv9MmD9P-B for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4C4560737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C4560737
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4C4560737
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:03:06 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so5189554276.2
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 14:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882185; x=1711486985;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GyvbMoYUgzKclHYFYYxYEpczWqGHJpvSERY0aDrkVes=;
 b=oDkqObRhxeBTbIUlhSO5jDOEFkGVGzjJOem5ASsMT5O5YDIK+0xofk4VLGdcwLdVc9
 tYq8/EpKEYMeW//xo9CaV493cIMORpmteJyNslY86yerJOp1OV6/6wuDNXQFN9Oh0Dnu
 FjtW/dgwjjox7yjN/6nXlAF9BxfuWzp4RQMFoTWwtHPHF0gqEsKUbVIjE9q0OCln/j65
 X11PUViK0psUInnOA087wD00VWHSK9d13k21loW+p3DVRYaOt4N7wqm3TkmdN3zUL3F6
 Dcwu/eh7BkAomdHcLn1VY+YNJSBtoz2ciQwP311lxQ/X7E/PFYAtgTU5eZjwurpmVEop
 s2mQ==
X-Gm-Message-State: AOJu0Yx9F4PJuA/5P7zkdtcHjoRo403+y3Fr63hfUxs13PgqXiT+zBPK
 uvVke32Z12/oX382mo5z5RbuHdxC0C6CCCUhEVOStfJtNCLYEQ6ivSpyY++TcLs+oKVkXqOId5W
 d/KiJFDL1DhkuWcbx5QdZ7X/DY6GgfbzxkkIC9g==
X-Google-Smtp-Source: AGHT+IExlFTeDecbd5bB34YwmbMYZx7/dZyUhaD7PAihuBc+IeDiMjE9ypebwIVyVIBE0nhpwfy5U9x56Pix65Hk2kI=
X-Received: by 2002:a5b:ecc:0:b0:dd1:3909:bdd with SMTP id
 a12-20020a5b0ecc000000b00dd139090bddmr10310915ybs.65.1710882184022; 
 Tue, 19 Mar 2024 14:03:04 -0700 (PDT)
MIME-Version: 1.0
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 19 Mar 2024 14:02:52 -0700
Message-ID: <CAMV0Ro8PH6Q4FJfv6OUXpxDPHCNEXt4b3N7_sRLP-RpH07s_bg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710882185; x=1711486985; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GyvbMoYUgzKclHYFYYxYEpczWqGHJpvSERY0aDrkVes=;
 b=kRFV0sfcg82zFpWhbKjYv6mrkPkrvA/ZXNWXUaTE/jc8psF/VpZ7yTGsVPD/4nwdPL
 HnEkdjUUIAn8kefdHcQ6cksyiRMsNi/ZFD99+pNHj4U+o9p+uYlWQhBktt/BsAMNTQXK
 V+wKnoBL7U911hgkjkDKhZ43RqO4JxKkakYE4B0GbaCNlRt3rUIaf+OqNZOJc9TOxvCq
 0mcy9mshyhjwqM4Et2akERlO0YQ3a2pO0vn867X1WFGeFIAMe5bopKH2vwzp1MDpQ02X
 1RrvX7SLoxjBcqNFzb2BbsROt14mgfoD+KoZsn50zFS9hW/Jp1qaBrtewi4VArpX6Fly
 sZhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kRFV0sfc
Subject: [Buildroot] AUH (auto-upgrade-helper) for the Buildroot
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
Content-Type: multipart/mixed; boundary="===============3116517022601711029=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3116517022601711029==
Content-Type: multipart/alternative; boundary="000000000000d4d2d0061409cc60"

--000000000000d4d2d0061409cc60
Content-Type: text/plain; charset="UTF-8"

Hi Buildroot Experts,

Around 80% of the commits on the Buildroot involve package upgrades.
(As of March 18, 2024)
Total number of commits on the br master         - 71554
Total number of commits on the package folder - 57305

Yocto has an AUH tool to perform trivial upgrades.

It would be great if AUH (https://git.yoctoproject.org/auto-upgrade-helper)
will be available for the Buildroot. Is there a plan to support AUH or a
similar tool on Buildroot?

The usage of AUH can be found here -
https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-the-auto-upgrade-helper-auh

Benefits of this tool are self explanatory.

Thanks
Akhilesh

--000000000000d4d2d0061409cc60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Buildroot Experts,<div><br></div><div>Around 80% of the=
 commits on the Buildroot involve package upgrades.<br>(As of March 18, 202=
4)<br></div><div>Total number of commits on the br master=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- 71554<br></div><div>Total number of commits on the packa=
ge folder - 57305<br><br></div><div>Yocto has an AUH tool to perform trivia=
l upgrades.<br><br>It would be great if AUH (<a href=3D"https://git.yoctopr=
oject.org/auto-upgrade-helper">https://git.yoctoproject.org/auto-upgrade-he=
lper</a>) will be available for the Buildroot. Is there a plan to support A=
UH or a similar tool on Buildroot?<br><br>The usage of AUH can be found her=
e - <a href=3D"https://docs.yoctoproject.org/dev-manual/upgrading-recipes.h=
tml#using-the-auto-upgrade-helper-auh">https://docs.yoctoproject.org/dev-ma=
nual/upgrading-recipes.html#using-the-auto-upgrade-helper-auh</a></div><div=
><br>Benefits of this tool are self explanatory.=C2=A0<br><br></div><div>Th=
anks</div><div>Akhilesh</div></div>

--000000000000d4d2d0061409cc60--

--===============3116517022601711029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3116517022601711029==--
