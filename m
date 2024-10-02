Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC43ECF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89FCA40190;
	Wed,  2 Oct 2024 21:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSu_WV6G2Lq4; Wed,  2 Oct 2024 21:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ADAE409C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ADAE409C4;
	Wed,  2 Oct 2024 21:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE4431BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD93761148
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upUNW2ltHKeH for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=andrew.2.622266@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49A9661129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A9661129
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49A9661129
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:25:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so24858566b.2
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 14:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727904310; x=1728509110;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oHx/WU7KUd6uDb/D6oqgfP+1Tkjg6gGIV3jJKp9KI8M=;
 b=YalYptAgKMpvJ4xFY1/TT4rtQxrG55umwQqA9apvbT9MtaVLdCq2fz9Uu83oyxdHJs
 nExHVFu5jMMNh8cZOfEX4WqX9GgAc/+EGSld03HuJz3v9GPoJUwp1UTWaCbLuJs35ksi
 AIMrW6V9xAaNt/hK7gSn/mdYkqoobj/22R4vIodiF+NjPbWETkDk204EiqvaPNwsoOcK
 5gBYsZzWbQ69Nf4KYwMSj9mqyT3wJfV5RhmcmN8FDXo8FlrE9hx1+7KyNyAQ8uOxT0dr
 X7frWCGmkZxC2HV4J7bpcs4YH+DBfvc1e+PM87LztDvtiw5KAl/M4jpXc6ovCGXuKLZj
 gUFQ==
X-Gm-Message-State: AOJu0YxbVPtqf2TCkAp2CLex7DAnlSGZeTyRVAos/LjD2HHuUH2IGCPX
 ZoZYfmVYSuyywXJBBXpiw08XLKHZi3qmTTKJpN3phqvuAkPeRzF633OjPQFKuMJ5x70OlnPVNan
 MTN/fbktDd55nKuki34A6rl2Zbr4xPQ==
X-Google-Smtp-Source: AGHT+IFmwJxZlGzPxh91UHUv/jj5jqC9XNIr/7chNoa9SNRvv3Bce912D9HxHbbyeo0mZHISfXV03zz2uIynoqu4P3o=
X-Received: by 2002:a17:907:9708:b0:a8a:6e20:761e with SMTP id
 a640c23a62f3a-a98f837bacamr440817266b.48.1727904309832; Wed, 02 Oct 2024
 14:25:09 -0700 (PDT)
MIME-Version: 1.0
From: Andrew McCann <andrew.2.622266@gmail.com>
Date: Wed, 2 Oct 2024 17:24:57 -0400
Message-ID: <CAPKzRz-Yye+toUmfTE02zEY7JACBbZ-wHEE6Xnk15rooaVrrhA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727904310; x=1728509110; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oHx/WU7KUd6uDb/D6oqgfP+1Tkjg6gGIV3jJKp9KI8M=;
 b=epB2k2Q5XLLQOE6IiVIL3INRunk9S5I0rAfOwR8aXhM3IouFstAnqYzRFWYNAbodaM
 Gvsm2jlnCswtsktpljgoOnVMVgEvUKk3QGVh7XSXW/oShjYdu3oe1IEYn2xWC973rwfX
 njND3BXOc4cqWMBW74mFhHhvBEc/YEp+kZ0AN8TruZ3gTRfuvNhoJX7drXRBTAyde1vK
 EmRubQL9dfr7DoOYkpChca3dwBKM32kjUfMi37kFFpYOCLIsv//tudD2Ec8UFPC7/GNV
 naLeGzWCpwgukdzF/DOXTioMQvWbUKV81G0Hpj5yZadfKDK7uqAmMquBEMGoCIytwQMc
 UJWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=epB2k2Q5
Subject: [Buildroot] Ethernet Connection
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
Content-Type: multipart/mixed; boundary="===============1398691893183415654=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1398691893183415654==
Content-Type: multipart/alternative; boundary="00000000000097f1a20623851251"

--00000000000097f1a20623851251
Content-Type: text/plain; charset="UTF-8"

Hi All

I'm trying to get basic networking working with a Rpi-3b+.  I note that
with the default config, raspberrypi3_64_defconfig, eth0 is setup as the
network interface to configure through DHCP.  Also
BR2_PACKAGE_IFUPDOWN_SCRIPTS are enabled by default.

However, when I boot the system with sdcard.img, the pi does not connect to
my network. Are there are things that I need to enable that are not part of
the default configuration?

My longer term goal is to ssh (using dropbear) into my pi via the LAN, and
use iwctl to configure iwd for wireless connectivity.  But first I need to
establish the LAN connection.  Please let me know any advice that you have,
or any documentation that you can recommend.

Regards
Andy

--00000000000097f1a20623851251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All</div><div><br></div><div>I&#39;m trying to get=
 basic networking working with a Rpi-3b+.=C2=A0 I note that with the defaul=
t config, raspberrypi3_64_defconfig, eth0 is setup as the network interface=
 to configure through DHCP.=C2=A0 Also BR2_PACKAGE_IFUPDOWN_SCRIPTS are ena=
bled by default.=C2=A0=C2=A0</div><div><br></div><div>However, when I boot =
the system with sdcard.img, the pi does not connect to my network. Are ther=
e are things that I need to enable that are not part of the default configu=
ration? =C2=A0=C2=A0</div><div><br></div><div>My longer term goal is to ssh=
 (using dropbear) into my pi via the LAN, and use iwctl to configure iwd fo=
r wireless connectivity.=C2=A0 But first I need to establish the LAN connec=
tion.=C2=A0 Please let me know any advice that you have, or any documentati=
on that you can recommend.</div><div><br></div><div>Regards</div><div>Andy<=
br></div></div>

--00000000000097f1a20623851251--

--===============1398691893183415654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1398691893183415654==--
