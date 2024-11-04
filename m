Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AD6D1CA09
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 23:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 685BE811DF;
	Mon,  4 Nov 2024 23:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqW-Mvvv4_k7; Mon,  4 Nov 2024 23:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53DF7811DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53DF7811DD;
	Mon,  4 Nov 2024 23:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8797D3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 23:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72301402DA
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 23:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7P00F6oMQLZ for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 23:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::943; helo=mail-ua1-x943.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C98A7406E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98A7406E6
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C98A7406E6
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 23:30:31 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id
 a1e0cc1a2514c-84fcb49691fso1552763241.3
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 15:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730763030; x=1731367830;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ngl6O5kCV8/rCbiXtL70MQn565QIBjt9A/QbtP5kYro=;
 b=q7JsEC4djSDlL0wZGOf9OTDtysqxI/YmQ7LdZXujOcnaHkOs9XxbjCwVX5XI/CB7pB
 MvdHYAFoWRMc4Dg8BYUCaFkJ1bcIHYwknLRoZPNNlbAS6O4PbohBpWOBuCqLhln12tlY
 dfigTHKojEQud4i1hE8bYVUeCEOHbHKeqB5HYNqB54VFdCaC8ovAnfYTtK+5ZVa0sHNd
 IaWdCZ3xgtPmT1+wzDP4JHEy5LpRVmTERphK4VNMVmLp1bFY6MtGqek4gKfuMM6CSmlU
 v7dB66oAsVfycuCxLBW6wogyQm4GJZG6Mocz9eNow4raRLUOUHB1vPgbzhoRC0cT/C4F
 c8Aw==
X-Gm-Message-State: AOJu0YywoV4kxpb+vOU9N3PRwF5Vf46HBlJ0z7p3pOmP9MQlFunIMhlP
 SwXfS5DdNZGaNdGMqaPJP0DyNZI3EKMOoefLwbqBLYphwOJdH1HDwNKL6jhXUsRHMhAJm7u9rck
 XJTX62nP/O+hnm1/7SBEEmh/KfgmztrH1NASQ9GuA3ewmPlJ7Bj2fNsLZ
X-Google-Smtp-Source: AGHT+IEweWI1eoCqU3Q7ZhJXL8XuabCk2T1+tTPw2BkjEv6QmgqNDMuTxNSpR/QH7oixxu8vQcuPo2tC4PlqCGVpdkw=
X-Received: by 2002:a05:6102:3746:b0:493:daea:615d with SMTP id
 ada2fe7eead31-4a900a0ddb1mr19267174137.0.1730763030080; Mon, 04 Nov 2024
 15:30:30 -0800 (PST)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 4 Nov 2024 18:30:19 -0500
Message-ID: <CAJ6EmCdqA+HgxzKsMj1m-pFn-3o5Kj4yNc74wkZe29dEyApLew@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1730763030; x=1731367830; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ngl6O5kCV8/rCbiXtL70MQn565QIBjt9A/QbtP5kYro=;
 b=PtBpsYqMK2m9zjp0OmHEmJF2ByTtF3Ek4NJdLhb+Osgrp1HD2Kt1kyUc4KOvBw3lb1
 OUAhLb8eJB4bhHFX0CV61gmG8mhCeDWU3Zsev+of72EcId2CUWvHdmTOd6E32NooT9Wc
 GnFYNeYkAd51stkS7/BirDUU8txWaAHmbazuCwXPWnKN9fssNsMfAQ8PFXj/xNk+MMwl
 chz3JFH45mH4XH65GR3QXv7/Z20k3D8V/gG4IL3CoYykQc4jjRgzzc4Zf1KSXHZDP3HG
 DeJ8yYac3RSSGpOTvHK6sVBSp31JxIOiMCC+/54G4gPMHMRblYOMmoSSd7BG9A1yK9iR
 b1Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=PtBpsYqM
Subject: [Buildroot] libwpe error with 2024.08.1
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
Content-Type: multipart/mixed; boundary="===============6620643215549781308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6620643215549781308==
Content-Type: multipart/alternative; boundary="000000000000996ea006261eabbb"

--000000000000996ea006261eabbb
Content-Type: text/plain; charset="UTF-8"

I am in the process of migrating a client project from 2024.02 to 2024.08
in order to pick up QT6 packages.  The hardware platform is AM62X.

Unfortunately, I end up with the following error while libwpe is building:

loader-static.c:(.text+0x20): undefined reference to `_wpe_loader_interface'
/home/pholden/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1/output/host/lib/gcc/aarch64-buildroot-linux-gnu/13.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
loader-static.c:(.text+0x24): undefined reference to `_wpe_loader_interface'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
make[1]: *** [package/pkg-generic.mk:289:
/home/pholden/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1/output/build/libwpe-1.16.0/.stamp_built]
Error 1
make: *** [Makefile:83: _all] Error 2
[1]-  Done                    emacs package/libwpe/libwpe.mk  (wd:
~/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08-rc3)
(wd now: ~/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1)
[2]+  Done                    emacs edvo_buildroot_install.sh  (wd:
~/Projects/EdvoQt6/edvotek-edvocycler3)

Has anyone seen this or maybe have an inkling as to why I'm getting this
error?

Thanks!

--000000000000996ea006261eabbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am in the process of migrating a client project from 202=
4.02 to 2024.08 in order to pick up QT6 packages.=C2=A0 The hardware platfo=
rm is AM62X.<div><br></div><div>Unfortunately, I end up with the following =
error while libwpe is building:<div><br></div><div>loader-static.c:(.text+0=
x20): undefined reference to `_wpe_loader_interface&#39;<br>/home/pholden/P=
rojects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1/output/host/lib/gcc=
/aarch64-buildroot-linux-gnu/13.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld: loader-static.c:(.text+0x24): undefined reference to `_wpe_loader_=
interface&#39;<br>collect2: error: ld returned 1 exit status<br>ninja: buil=
d stopped: subcommand failed.<br>make[1]: *** [package/<a href=3D"http://pk=
g-generic.mk:289">pkg-generic.mk:289</a>: /home/pholden/Projects/EdvoQt6/ed=
votek-edvocycler3/buildroot-2024.08.1/output/build/libwpe-1.16.0/.stamp_bui=
lt] Error 1<br>make: *** [Makefile:83: _all] Error 2<br>[1]- =C2=A0Done =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emacs pac=
kage/libwpe/<a href=3D"http://libwpe.mk">libwpe.mk</a> =C2=A0(wd: ~/Project=
s/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08-rc3)<br>(wd now: ~/Projects=
/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1)<br>[2]+ =C2=A0Done =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emacs edvo_b=
uildroot_install.sh =C2=A0(wd: ~/Projects/EdvoQt6/edvotek-edvocycler3)<br><=
/div></div><div><br></div><div>Has anyone seen this or maybe have an inklin=
g as to why I&#39;m getting this error?</div><div><br></div><div>Thanks!</d=
iv></div>

--000000000000996ea006261eabbb--

--===============6620643215549781308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6620643215549781308==--
