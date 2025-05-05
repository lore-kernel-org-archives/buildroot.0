Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE0AC3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 08:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1A940770;
	Mon,  5 May 2025 08:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBxpbm-QXQbH; Mon,  5 May 2025 08:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDEFD4076E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDEFD4076E;
	Mon,  5 May 2025 08:05:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7634D12E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 08:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65B706060B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 08:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAuNt2HcsPRi for <buildroot@buildroot.org>;
 Mon,  5 May 2025 08:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50E0360812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E0360812
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50E0360812
 for <buildroot@buildroot.org>; Mon,  5 May 2025 08:05:34 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-708ac7dfc19so30686937b3.3
 for <buildroot@buildroot.org>; Mon, 05 May 2025 01:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746432333; x=1747037133;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ao/niYVpbCY/JUPu1rA44oQmCETKxe5eXXE3hkwP8/c=;
 b=BvzJFEToFr3834aYoWhtDI0byo1dFba55FL9vdhoJ3V9xmpbirEC/En/TaFCMm/3m+
 TQRLJjDtOnqeowUN2QTB9wW7K1jZbKsDlDitDR8nKgZWlFTZtUE9vQY17YLGiNvFQUAm
 eGwNDk99OG5kv3/fgRMvPTvIk6Jun4CLCgl0PPM4MUqV8gu+fLNLqpscyKsV0uaarsc/
 B/8xaZ+CYJ1CSRlLajwLtpYtblGVPb069HPs3VRvsDy8VFZEUJCtXzIoFL5X9RpH1UBM
 X0Xw91awmeesZ2Q4jDRvgIe5E9/qUJuYNt/Vx+uIyrgH3/EHcgjHNl6dVnfamNf+NU0u
 /QHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCC/xk5dQJXjc1KWzOd2hwUjG36AX5hZ5PoTUyhrcJCHsEpI5VPCs7W4Vx7e7eC1BJpjZK+WMNdJs=@buildroot.org
X-Gm-Message-State: AOJu0Yyv/CG1lYWH8op5y2lYB0nPg+QdPbe0zSitMNvfo9qtxGGtfpne
 GnpzhiNtnrLC2pKqO4rerU5SyBDP+xgKmqgLUVUX9E34vGXqjijC96tGh0TZS+455hfHcVF4QBY
 ayRwlidWQKBtgOrpptCQSV8B0f6ILWV73
X-Gm-Gg: ASbGnctkyy2TDn9r58If1f3Z2UdoRnfvQcmoH4jXYe4BOxV+irUWLwkT9acTd92nV4T
 WT6UaaiaXwI9MlprH6xo2ORumPwjP5Wkb+ZyGL/lH0YYL4cOLXoRdizO9v/7sg3ZYpDANFpjlPb
 bhpUrIyiJi5BNJolaDhvvUpHM=
X-Google-Smtp-Source: AGHT+IHAICDaNGptvHWURnm1YogXYUdZ9WjvAAQVc5SDbX5w8rarGyDtJNvbwh1uop2egCTUNDXO+X3TyYkDC8JU0/0=
X-Received: by 2002:a05:690c:6889:b0:708:a265:b0f5 with SMTP id
 00721157ae682-708eaf8176bmr83796197b3.37.1746432332962; Mon, 05 May 2025
 01:05:32 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Mon, 5 May 2025 10:05:21 +0200
X-Gm-Features: ATxdqUGCGORkLV3lES_1uHkNiEY-ZvgrYXcS50-2ozBfoWBwdTI5oHKHg1PFYh0
Message-ID: <CAH+XeQYfLBFirOwHPKVVpePNBZdbt7N9DK2gBE7Q-u6aTMH3bg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Baruch Siach via buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746432333; x=1747037133; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ao/niYVpbCY/JUPu1rA44oQmCETKxe5eXXE3hkwP8/c=;
 b=Q8CyOTntnMM+15lnTACJv1RA4+ofPziBQ06JpXWXmK+uSVP6CE1+ql+YIPLKdsXiey
 GNaJOIuGTTtArg/ZeOqrkEqT2pWNWDclfeaNIIDKz695epbVABcog59WmF7Sm38SUPkr
 7dDRj9JGiMDdD4wP/opc/0qSbTVEUeIhgF0g32YxpdhoGih/KIu/OE55g15fEHu9FTXG
 wrSrkAaSRE19qbCf3vEUMapzUrDqddg6ELi1w1bayVdOv23BVlvNzgPj/4CJyby1A7/s
 cDHJTtdC9c3q+2vEpXxTqMD61vDtk7vSoe+hgBF7MOHCmjgEGRHV81FmQOA+3pTWveB8
 rDpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8CyOTnt
Subject: [Buildroot] d63e207eb869063f82c867658676c2903beb08cb broke uclibc
 zfs test
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
Content-Type: multipart/mixed; boundary="===============7158395659547459963=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7158395659547459963==
Content-Type: multipart/alternative; boundary="000000000000d4a22906345ef6cf"

--000000000000d4a22906345ef6cf
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

The commit d63e207eb869063f82c867658676c2903beb08cb broke the ZFS test for
UCLIBC.
You can check it executing:

./support/testing/run-tests -d $(pwd)/dl -o $(mktemp -d) -s
tests.package.test_zfs.TestZfsUclibc.test_run

Greetings.

--000000000000d4a22906345ef6cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas,</div><div><br></div><div>The commit d63=
e207eb869063f82c867658676c2903beb08cb broke the ZFS test for UCLIBC.</div><=
div>You can check it executing:</div><div><br></div><div>./support/testing/=
run-tests -d $(pwd)/dl -o $(mktemp -d) -s tests.package.test_zfs.TestZfsUcl=
ibc.test_run</div><div><br></div><div>Greetings.</div></div>

--000000000000d4a22906345ef6cf--

--===============7158395659547459963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7158395659547459963==--
