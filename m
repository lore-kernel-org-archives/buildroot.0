Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5BDC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 09:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B8D4606ED;
	Tue, 19 Mar 2024 09:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iU3xxlxZWkdr; Tue, 19 Mar 2024 09:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFE660709
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFE660709;
	Tue, 19 Mar 2024 09:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF9461BF2C3
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 09:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C80FA402EC
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 09:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyjN8h-GrhrG for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 09:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=shafqat.abbas@skyelectric.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7DB5402A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7DB5402A5
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7DB5402A5
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 09:18:35 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e6fb9a494aso2746741b3a.0
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 02:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710839915; x=1711444715;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pS8F/iBohC+pNHIW+X743sOfD1thUUax7HA4fMW09wk=;
 b=E7GkirOQO+DDy88+jQWWZyvCyiKs9m1+IF9d+MATaXLMZ1dIPZKiyIBAmkWxj3PgCE
 Me4XyMDQ4bTFjYWX/amQReeOLWpS3qknIeXIAbww7P2WE79DG7H4Q8dLVGuo+QeSWNJh
 lVwd3MYKZuATzZC/jFBe023olHQSW1vlIdSZmfzwS1xsTIsTwRhQIT9l0047+YKDuvpe
 Jq32QLbVsZbpv74RGoPu0yA67Dy7FC6WpzxaO6WLQZyJv1sMtEozbVBkiOsQFoqH8jmj
 FrL4H0Ld/Z7Q+zDv3L53jSXUzW3caP5PexzvErz/JyW04hPCxfuPbqeUhMoIwlk4ttaC
 EVxg==
X-Gm-Message-State: AOJu0YwMQGH4ie0zlcJCSLZamEmOptAuSeIlq/BbdYXnYEGIStPUzm+f
 UI0CJ/kfZCGXDZzmDXzUuDYECzfGNOX31LcXZZPNkigmTwAaLPYGURLgEjyYFonX+uVGr2ln0zz
 V6LBQITpXAA0I9/4uGVqAEv0IgdDHlEdpiV8aHBpVSNQqgrW8LSY=
X-Google-Smtp-Source: AGHT+IE6CPUlReSbwHP4FyPe+WyNLpZ6hGZoKm4S+2AHgAOcO49r7XK2O7OXK8sOrg5ZfUxbWSysOvxAyn0iK95z13Q=
X-Received: by 2002:a05:6a21:1798:b0:1a3:6fe9:4060 with SMTP id
 nx24-20020a056a21179800b001a36fe94060mr2214984pzb.17.1710839914666; Tue, 19
 Mar 2024 02:18:34 -0700 (PDT)
MIME-Version: 1.0
From: Shafqat Abbas <shafqat.abbas@skyelectric.com>
Date: Tue, 19 Mar 2024 14:18:23 +0500
Message-ID: <CAL5xJopYY+47g9XAwr=9WDBrYBTPB4ycnh0ODy45+jNsP8WfFg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyelectric.com; s=google; t=1710839915; x=1711444715; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pS8F/iBohC+pNHIW+X743sOfD1thUUax7HA4fMW09wk=;
 b=darlEpOlTkuoEPeyLCp3b70mXRVU8kUJxFZUWha8t3c3DDrXvb/Kk2noAbJKum71ic
 IC1Ebh1YXdcZ3sns5UftWHUSSR/txJb9mHLhEKhvofGrhV7xSFtBf7/U7yb44zv2PBwg
 g/4AQUI8QFJGe/b4+OUScgs1jcD4V/sv3vZ9bnItHHOCYswVC+uMEVvP8FVSYyhruAmF
 UPtC0v5G5LCdkGp0O3COfdwgji5drbtRB4zLXMA2SJPLrjP+sxSE6gBx8amxjO7Wg4oJ
 NvoI9PdCwXQ5KBU6gD0vMSfKDwiqsQ6czcxI7CEQQ4CzYawTD+T1UX+NV9MyiE7iE5k+
 eBVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=skyelectric.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=skyelectric.com header.i=@skyelectric.com
 header.a=rsa-sha256 header.s=google header.b=darlEpOl
Subject: [Buildroot] Information Required for Buildroot Image Issue
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
Content-Type: multipart/mixed; boundary="===============7771663432067283340=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7771663432067283340==
Content-Type: multipart/alternative; boundary="00000000000061b36d0613fff5a2"

--00000000000061b36d0613fff5a2
Content-Type: text/plain; charset="UTF-8"

Hi,

I hope you are doing well. I have been trying to compile the Linux OS for
Raspberry Pi 4 (Compute Module / CM4) using buildroot. I have tried all the
default configurations available for raspberry pi systems. After writing
the image to the pi, the system boots up properly, however, it does not
read input from the keyboard. I am facing this issue on all builds. I have
also tried changing the board but that also resulted in the same issue.

I am using the following steps to generate builds:

1. ```make raspberrypi_defconfig```
2. ```make```

I have used this method for compiling builds for all defconfigs, including
the following:
1. Build for *Raspberry Pi*
2. Build for *Raspberry Pi 4*
3. Build for *Raspberry* *Pi 4 (64 bit)*
4. Build for *Raspberry Pi CM4 IO*
5. Build for *Raspberry Pi CM4 IO (64 bit)*

The keyboard does not work at all. Even the lights do not work, which shows
that the keyboard is not connected, however the same keyboard works fine on
other systems.

So, the assumption is that the keyboard is fine, the board is fine, the RPi
is fine, and the issue lies in the build compiled by buildroot.

I kindly request the community to help me sort out this issue. Thanks a lot

--00000000000061b36d0613fff5a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I hope you are doing well. I have been trying t=
o compile the Linux OS for Raspberry Pi 4 (Compute Module / CM4) using buil=
droot. I have tried all the default configurations available for raspberry =
pi systems. After writing the image to the pi, the system boots up properly=
, however, it does not read input from the keyboard. I am facing this issue=
 on all builds. I have also tried=C2=A0changing the board but that also res=
ulted in the same issue.=C2=A0<br><br>I am using the following steps to gen=
erate builds:<br><br>1. ```make raspberrypi_defconfig```<br>2. ```make```<b=
r><br>I have used this method for compiling builds for all defconfigs, incl=
uding the following:<br>1.=C2=A0Build for <i style=3D"">Raspberry Pi</i><br=
>2. Build for <i style=3D"">Raspberry  Pi 4</i><br>3. Build for <i style=3D=
"">Raspberry</i><i style=3D""> </i><i style=3D"">Pi 4 (64 bit)</i><br>4. Bu=
ild for <i style=3D"">Raspberry Pi CM4 IO</i><br>5. Build for <i style=3D""=
>Raspberry Pi CM4 IO (64 bit)</i>=C2=A0<br><br>The keyboard does not work a=
t all. Even the lights do not work, which shows that the keyboard is not co=
nnected, however the same keyboard works fine on other systems.=C2=A0<br><b=
r>So, the assumption is that the keyboard is fine, the board is fine, the R=
Pi is fine, and the issue lies in the build compiled by buildroot.=C2=A0<br=
><br>I kindly request the community to help me sort out this issue. Thanks =
a lot<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div></div></div>=
</div></div>

--00000000000061b36d0613fff5a2--

--===============7771663432067283340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7771663432067283340==--
