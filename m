Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330BDC369C9
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0F4606CA;
	Fri, 18 Apr 2025 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmIEA5Vbwr56; Fri, 18 Apr 2025 20:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B95E606D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B95E606D9;
	Fri, 18 Apr 2025 20:03:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B39E228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE764012A
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dklGkslzzbKz for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 20:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=ct.clmsn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77A5D400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77A5D400DD
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77A5D400DD
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 20:03:17 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-72c173211feso603903a34.1
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 13:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006596; x=1745611396;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QPlsN3wDmlQ9JSfs7wpqkEPA6yWvdUe50gLEsteZDv0=;
 b=qILvC9QvpJDSoFZuSV9EYI7NBUrDGMgl70YrvRqkdEldHb5KhBmEG0khsheCHVC/X3
 fx8ds/6o6WMC0hfrFv67Kh9m7lPLebOws+Hka11MtM/G7DQkPqUMiP5kvVOWtNt51RY6
 M2cAFK25K9He1I39RmDkSjdn7ApO97KMjLdNQhz45lJXLja2b63cxpdnYbh22Z7I0w+a
 f3S4mTF39H0gkisB4A4oj1V9j0AQwdhb7xoRaWJ++UEfvrtH5z4sjKkinKhVyGikpZqF
 aPCftsZPps2lrhTh+YjASxiQ9WYgFxisHXM46znDtBF73grA2Lv5cQJpAu/2qz7tsIko
 xMiw==
X-Gm-Message-State: AOJu0YwIKKsPVe35OrhWuZVKm0QVMBNjkKF3wA+PM4dQsakCIOblH+x1
 1yXkuwbMPjhZWS/A0vfpWSSMLsUCz6VlOB4XL20qaa6DHcE272X2Vk7WUhsg/D/HssAl+V0Vt5W
 2G8wRXBrcFeT/O+V3/9nTRx29gSFx1tJ2
X-Gm-Gg: ASbGncv2ke0NY0xPYuZ2/2DYI5Jz3L8nzVDHEsPG6KnGaA49orkiQ6HS32qg1CBeTa2
 hJwyZy2nZRIvKIclTvXkOPr3B5s7Von72RwuM+g7V2oG+Gl8/qCs2F+B1NR3sAC6oEYgCahVT8i
 gTuFWOBAK+JfLDwbMxXDrJarXQ8V+ek8pj
X-Google-Smtp-Source: AGHT+IHDQoES47sk9ss3joYuw+rB7Ze0Dfdj/HTCNs1yO5/EDCY733/TWNYU+hs8zCu9C9rzgyRcvfvwcYYDWxovg3M=
X-Received: by 2002:a05:6830:610e:b0:727:345d:3b83 with SMTP id
 46e09a7af769-730063540f1mr2228529a34.23.1745006596190; Fri, 18 Apr 2025
 13:03:16 -0700 (PDT)
MIME-Version: 1.0
From: ct clmsn <ct.clmsn@gmail.com>
Date: Fri, 18 Apr 2025 16:03:05 -0400
X-Gm-Features: ATxdqUE40b7stI-OF7BD1M9Qt6lOHtYZCGXitJtm8e8jve_N7NnXvGNzdujmFmU
Message-ID: <CAN4CwauhHFPtub8jRNeVTD3=o9inY6x6V=UhWcJbDn5Hm3rmrQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745006596; x=1745611396; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QPlsN3wDmlQ9JSfs7wpqkEPA6yWvdUe50gLEsteZDv0=;
 b=fmu9iMRDIaHQvaK4sLRSLJxSb7jCrm4WaQIZivMo4X5KzRxozlHaF8efYhroBV0NeQ
 iVXaZb8W0ftjQxD4Fmj3fDSDVXBL3vYibtcs5H+XJygnsRgd+G59yxkoAXl1mBVmoRVQ
 +r//o9zZXS+HxhLTas3IHBLewB8tYx6wjWtfPOlzob+HIwnkfZwVyA7yVW7VPuUmwLHK
 0vZ/0PuW5VMs69KVHh9brvuVCfjEAnnjKhOk2mca457uA1YCKGj2zojpUbfT0/QUNWof
 0BK1+tHWHYgq6XyBKQuPhFCLnsWeua8XI16gt4E4ZRsrLxqLkH+D9ksZgu3YeV+cTvRi
 y0Lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fmu9iMRD
Subject: [Buildroot] kernel install from buildroot
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
Content-Type: multipart/mixed; boundary="===============1454725043571743689=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1454725043571743689==
Content-Type: multipart/alternative; boundary="0000000000004bf8e706331302b5"

--0000000000004bf8e706331302b5
Content-Type: text/plain; charset="UTF-8"

Hello,

This should be a pretty trivial question mostly asking to make sure my
assumptions are correct.

I'm doing hardware testing with an SBC. I have an SBC that is configured to
boot from an NVME-SSD. A vendor encouraged me to use buildroot to compile a
new kernel. My preference would be to just update the existing environment
on my SBC's NVME-SSD.

Given `buildroot/output/target` contains the compiled linux kernel with
firmware, which directories or files should I be concerned with copying
over on the NVME-SSD?

Thanks in advance for the assistance and confirming my back-of-the-envelope
verification.

v/r,
ct

--0000000000004bf8e706331302b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>This should be a pretty=C2=A0tri=
vial question mostly asking to make sure my assumptions are correct.</div><=
div><br></div><div>I&#39;m doing hardware testing with=C2=A0an=C2=A0SBC. I =
have an SBC that is configured to boot from an NVME-SSD. A vendor encourage=
d me to use buildroot to compile a new kernel. My preference would be to ju=
st update the existing environment on my SBC&#39;s NVME-SSD.</div><div><br>=
</div><div>Given `buildroot/output/target` contains the compiled linux kern=
el with firmware, which directories or files should I be concerned with cop=
ying over on the NVME-SSD?</div><div><br></div><div>Thanks in advance for t=
he assistance and confirming my back-of-the-envelope verification.</div><di=
v><br></div><div>v/r,</div><div>ct</div></div>

--0000000000004bf8e706331302b5--

--===============1454725043571743689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1454725043571743689==--
