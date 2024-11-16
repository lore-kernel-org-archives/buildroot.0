Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5AAD68BE1
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 05:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C82C841AA;
	Sat, 16 Nov 2024 05:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCqTh__aYkoK; Sat, 16 Nov 2024 05:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C1F6841AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C1F6841AE;
	Sat, 16 Nov 2024 05:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ED0627D7
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 05:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DD08841AA
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 05:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utt9kBresEYo for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 05:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=veredz72@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E330841AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E330841AB
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E330841AB
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 05:38:21 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3e5fbc40239so129324b6e.3
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 21:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731735500; x=1732340300;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oYRn98lPC/5UsDb3tDXHnG10J5FspClQ+j53v2xua4c=;
 b=hS0kqW12Q3kGX9f5A1Td1v/NvXRqLOcBcMwKo6FF4LIzjvC4U2zlYaBl9xJP5/+ams
 e/t6wi063u/ctLcp3QZEdm2pazosbYLA/BOaLaHRTJ6kd3J0SG4MOpj7ws6xJSwTSgpO
 NrF7x5ZBZFMdw/82B57Upg5X12zJXFJel66SW0lBO1cwpkEPxCUSwMBYfp5pJlPRg5VX
 SUMm4kcb58kGDYpJxxKK8WFr0eH9db6/L+Vzj4Te2DWI5m7LKXlbb9ii/jwcP9SdAdjF
 BMO7Q+sEBu+h8ey4S8KaW28Ga9TFoT3N0Tmh2hVrnjYgFzI9fkOPxjAGi28ZwTbbb6Tk
 3juA==
X-Gm-Message-State: AOJu0YwBXbDTxPUGyNPVj9k0JCpAE+sG0BvnfkV5s42wHL3gFxEZKdn7
 up7YEMFRlhZi3xrjtY7Qnh7V6claNYoWwXoMy+5LvF63MidYMjzK7anphlYIFkaa9irFlPJA2uA
 k/rlY3o9iDhJ6z2tuQMboqwMFBoGnCg==
X-Google-Smtp-Source: AGHT+IEVjV+Q77FMgVZQrkIdaoupbWNGp3vQyreRvbKyUyyUzSfesWyZajWBjY6wuNmdYyBADLa1+NwIQ+QGT3+chs4=
X-Received: by 2002:a05:6808:1302:b0:3e0:4db9:8c44 with SMTP id
 5614622812f47-3e7bc864902mr5039249b6e.27.1731735500002; Fri, 15 Nov 2024
 21:38:20 -0800 (PST)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Sat, 16 Nov 2024 07:38:09 +0200
Message-ID: <CABRndgwO5RUQOK_VBbLgZe4qoNRA1DDw-JCua6h=ory4xquBKQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731735500; x=1732340300; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oYRn98lPC/5UsDb3tDXHnG10J5FspClQ+j53v2xua4c=;
 b=J6qkxrMPbCyu5EeCTZXwBV8qbX9eGyrfmAI1N/YP+I8G1Ty14ve6acBmd3s1CZdIFc
 h0zf7lQqhsrsoJIQITPKmgDLssRHLxcjHA6wijXkdZUYlQuBiDFPUi7B/Q5wd159KOT6
 Q9uvYP2mAVcfttEnSv4ppb67pwsYvCFU0I86OnXPlIYYSoDIUQMzVbIZrCD/tx6/fINM
 DaATnAFx5w4oC4569gB70834HROpUo8VV46FlChwYfF8tIg5PWdTv5kAVjcOKLO23v9h
 7HNXcguIRbTcglrLQwznusGyhKqfJ2aGmWOcnYkxb3S1ysxySqd/e4gn14thVLoRFFsX
 JRug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J6qkxrMP
Subject: [Buildroot] 2024.02.6 : modinfo for target side
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
Content-Type: multipart/mixed; boundary="===============2380632664210000797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2380632664210000797==
Content-Type: multipart/alternative; boundary="000000000000529e450627011792"

--000000000000529e450627011792
Content-Type: text/plain; charset="UTF-8"

Hello,

In 2024.02.6 I included "kmod"  in "Target packages->System tools"
But in rootfs.tar built without any errors, there is no kmod nor modinfo.

Can you please advise ?

Thank you,
Zvika

--000000000000529e450627011792
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><div>In=C2=A02024.02=
.6 I included &quot;kmod&quot;=C2=A0 in &quot;Target packages-&gt;System to=
ols&quot;</div><div>But in rootfs.tar built without any errors, there is no=
 kmod nor modinfo.=C2=A0</div><div><br></div><div>Can you please advise ?</=
div><div><br></div><div>Thank you,</div><div>Zvika=C2=A0</div></div>
</div>

--000000000000529e450627011792--

--===============2380632664210000797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2380632664210000797==--
