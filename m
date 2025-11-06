Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3459FCCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 12:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F18A41405;
	Thu,  6 Nov 2025 12:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZ37Wd2Ct1cK; Thu,  6 Nov 2025 12:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5098640F5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5098640F5E;
	Thu,  6 Nov 2025 12:42:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B4AC462
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 12:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37D5C40F5E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 12:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ak8egymCpqiZ for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 12:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=rustamabd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4083F40F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4083F40F0F
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4083F40F0F
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 12:42:10 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-44fe45e430aso373138b6e.1
 for <buildroot@buildroot.org>; Thu, 06 Nov 2025 04:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762432929; x=1763037729;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ppmXG61PeQaZKJMjeYRwhWIGxmpBI8jgw5KvR/4ITlw=;
 b=u2lJTG4XMLDETlZHw1QNMXuIS/7JzcmNqrhF9Us9jUw+roGyEMKDY9ygxLZT+OT+y3
 /SPGX8mapmvmpsURTVGJHTK4BEBtaVSN1vpARoDQEgoP4TIr0YDEmcL4hVn7BSAx0mIa
 /rS+BltJJKZ/xjK7OZ44VXsU6tcgUPcwwHnPO/2rgcfTQ3+TtNI+wmA2Mt7+XPArvbQI
 psrohTZNADc4xwg7rIwazsaHPgIA/6ZkT/Fjt2lYcNztwpnAm2guICC6xMhPnd1xk+WS
 qVaPar7Mnrf6TlwM+6WPXJwoVXzVqXw59YbazafvczSMsvGur4iM8yraeUCpw7dUfQhs
 ZGmQ==
X-Gm-Message-State: AOJu0YzzxfrX3heL4Juh0iR6rMEjlLHkIVPD3VkYr4wDVWYJd9UXKtum
 Jov+BIyGMWpCU/QMXOc/mBfHsKE4kscX8TPQwAV2UabTWwV1ZeBX3YUhPtxilMG7kRVnWp1cbEL
 lmAMT0BulKXrB/ucSySDZs3TRyLM1EAg7nhlH3v4=
X-Gm-Gg: ASbGnct3LbO3XS7Vbdxrp/nJP+ZNBRNYckxFn/4ovyGodwZOsp9Jn+THbs98+huGB0b
 CMaJGPcCg2jIreuquC9VM/TAPMSbSWDpc0MHYxFK9ZypJZi34YxA14unzP+KS6++U+9Uw9wHcA0
 mS0MhnKXmzU69xTk+6tAwcEO+dyE0Nf/wswnBHtyDiOYznWjcWmQp5yPr8HULFNruWs1Vcw1e8y
 gg2VyR670M2NF3iE5JadcLmPP0lQbjgBImqJziIedhLgQMEhfiMlNBy7t4gDwCLuZrCUCDqWcDw
 3gb1/x2BnngdOsx7rgqI2EYiXHnEb96eG1CbwcdbOKd/OoR+C3RrdSSM+GyQKzHfikFpAMimqjL
 Ki4q/us8Y0jZSZS6Tr+9tySDb0WQ=
X-Google-Smtp-Source: AGHT+IEvwwxPf+wpS/b9B6z2ErBi4zIQrO1FQA0e8fCL6waH+KkV2BUte5FOY2pAcaD56jI2x/oVEwJlWO33oxbJR4M=
X-Received: by 2002:a05:6808:1a11:b0:44e:4d0e:f028 with SMTP id
 5614622812f47-44fed49de7bmr3636995b6e.49.1762432928946; Thu, 06 Nov 2025
 04:42:08 -0800 (PST)
MIME-Version: 1.0
From: Rustam <rustamabd@gmail.com>
Date: Thu, 6 Nov 2025 13:41:58 +0100
X-Gm-Features: AWmQ_bmzseeeIJ51a3Iy2XuJCGgfY9wlp2B56NGx3xOwock8tPL-uMBU-1BJAFI
Message-ID: <CAPzS6u_Lu2jE3PzbmOc1gRzA0uLjxmiR60fwy5eEwRDK92ya2A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762432929; x=1763037729; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ppmXG61PeQaZKJMjeYRwhWIGxmpBI8jgw5KvR/4ITlw=;
 b=OuHYFgOX1hMXTyGyWp7WN4EN4HC+REvhBJIpsyWOq7vUWt7yx0RP6yRwIlE1BJ/XOx
 RGR53w5KQwoOok0vJBPzFB7cZ0wRSir2O1rBlNYIO7L+AHf8W2xjEDiVgpYC9/ibAzA6
 VkRz0Zww38xI+bgnSdIs27T1B3i8bt0D9z5qt3PemlRZXROHwQwHvV87OJLZI89g6rLY
 c/diuBbR++/2wMZ/KNeBKsAeLGQIaPJGD3kZZEP22GMrmjzBEyUFfjjwxgZba+IQMsHN
 kDBaJV7btQNH8rpufA+B0B2huyvJOJaYqNXGPRG4Jk80YaOPHxydvW2t6/7WWXsNrWmz
 AAlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OuHYFgOX
Subject: [Buildroot] Kernel headers with an external toolchain
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
Content-Type: multipart/mixed; boundary="===============2501645123861431610=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2501645123861431610==
Content-Type: multipart/alternative; boundary="000000000000aba46d0642ec6491"

--000000000000aba46d0642ec6491
Content-Type: text/plain; charset="UTF-8"

When using an external toolchain, I get linux kernel headers from the
toolchain in the SDK.

In case of the official ARM toolchain (from
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads), we get
4.20 headers, which causes issues when the actual kernel is 6.12.

BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"

Question: how to get the actual kernel headers in combination with an
external toolchain?

I tried BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y, that had no effect.

I could live with just copying the current headers onto the toolchain,
overwriting existing files, but the toolchain is built before the kernel.
So how to do it properly?

--000000000000aba46d0642ec6491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>When using an external toolchain, I =
get linux kernel headers from the toolchain in the SDK.</div><div><br></div=
><div>In case of the official ARM toolchain (from <a href=3D"https://develo=
per.arm.com/downloads/-/arm-gnu-toolchain-downloads">https://developer.arm.=
com/downloads/-/arm-gnu-toolchain-downloads</a>), we get 4.20 headers, whic=
h causes issues when the actual kernel is 6.12.</div><div><br></div><div>BR=
2_arm=3Dy</div><div>BR2_cortex_a9=3Dy</div><div>BR2_TOOLCHAIN_EXTERNAL=3Dy<=
/div><div>BR2_LINUX_KERNEL=3Dy</div><div>BR2_LINUX_KERNEL_CUSTOM_VERSION=3D=
y</div><div>BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.12.47&quot;</di=
v><div><br></div><div>Question: how to get the actual kernel headers in com=
bination with an external toolchain?</div><div><br></div><div>I tried BR2_P=
ACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy, that had no effect.</div><div><b=
r></div><div>I could live with just copying the current headers onto the to=
olchain, overwriting existing files, but the toolchain is built before the =
kernel. So how to do it properly?</div></div></div>

--000000000000aba46d0642ec6491--

--===============2501645123861431610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2501645123861431610==--
