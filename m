Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBE4C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0055F60667;
	Fri, 31 Jan 2025 21:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S9_FV9cSYkG; Fri, 31 Jan 2025 21:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA7D60685
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA7D60685;
	Fri, 31 Jan 2025 21:03:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B160F16E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A171E820FC
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oW-YNkNOuYFo for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 21:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com;
 envelope-from=oscargomezf@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0DB6820D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0DB6820D6
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0DB6820D6
 for <buildroot@busybox.net>; Fri, 31 Jan 2025 21:03:02 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6dd01781b56so24842676d6.0
 for <buildroot@busybox.net>; Fri, 31 Jan 2025 13:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738357381; x=1738962181;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Im9D6cGrljyOELMKiCiPVYzd0yS+RC2FI9s5h+vfTYc=;
 b=eUdfM6nTcOsjpDsFPy+LhDKw1kc7nK7f/wSd5m2GrzmRn91Wpf/HcjuFi2oRLj4z8a
 Vf2qmKYXLYM75GGiST760sCw9ZKUaweHscR3IaZkiKczNzCqYmh2NfbC/Papq/+rNtgS
 FBP5JRS/ERjIqHDIiLamP2sl6pELvSyeJo0dtI80ikbCF9h8qYWq24DgtLIJZInnunfS
 85IdFKNEvuyMtUaEibhHerUZougRGc5yESOeTIoKQSW88aaxP9iUwCiqPZ+MKHIqwgwi
 Pv34Df+EXZ105el32BJZV4bwnJPKYWXgXAUgbN1zV37oZ0SsY0bCAZFIwRuRtxmsPy/g
 6W8w==
X-Gm-Message-State: AOJu0Ywx0YoILntEbvOt0rcFq1AV514ldoLAkJn9/3OKJKHipvuNdYnD
 CPR+j2vTY6UWbAy6/vTiPz3b6Oxi1p7taBfDKef8QynGCR8PFJdMPHgSD43btxNtYCK0R4pkA+d
 IIft9bsZVfA4qPs+GTIDKlhzj8ekiwx5zqH8=
X-Gm-Gg: ASbGncthRK9bxSfXcXvcvCY5iKqN/TMUbVZwxD7NDbznDxRmI3SJ3Kvo7aNZx6qs2Lq
 krgH0UKgmsAFwCbK+4ZmT5NyXINj62kMIlryMI2FqNGHYC2Q3Sk73ypm72SUHS7oLqC6dIw==
X-Google-Smtp-Source: AGHT+IEyV4GWZOuhmDi2Yc9gszt8sUjVVZoCscEwdO3AdOCVST1r5BLBclkFf1CSDgX1l40nmyKwxceEti3w95muDho=
X-Received: by 2002:a05:6214:29e3:b0:6d8:d5f6:8c75 with SMTP id
 6a1803df08f44-6e243bb8d4dmr126981176d6.12.1738357380565; Fri, 31 Jan 2025
 13:03:00 -0800 (PST)
MIME-Version: 1.0
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 31 Jan 2025 22:02:25 +0100
X-Gm-Features: AWEUYZlKdG8XQhUj2WHYaeujw1SQr5O9G_JY7O91_VhMLTj4rAEuBitAKb999EU
Message-ID: <CALtfCQbttDOwqg-eVJdGpi1a8Gh7ukCVODTcxTphF4nSbwtdCg@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738357381; x=1738962181; darn=busybox.net;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Im9D6cGrljyOELMKiCiPVYzd0yS+RC2FI9s5h+vfTYc=;
 b=VSWxQzx8uK4l1uJ6SAIqwwlddFWqLS31+WhjoclggbiBEk1BNTIyRAQcHsD0Mr1CvP
 jfRnO6tfb4Is7fizWHNCswjYQD9ewBUcTIOTI+Yjza3fzJyeqmfca/IKNHwQf30FJAlJ
 bsCyGKWS12NiNwt7G79nvmJthqa2FSKuJZGkVs6GRdLBkP8r3h4lq5ouLTqisYwKMkVH
 QAowZc8N8PVa1TGbm1j36YiaZOR+wl7fb9TAK6/cQhljFZrORD6tSRn6g4+rWbB5uml4
 Nh0XRoIMR/sq3ojc+ZMI1yw7DztRoockJQUYFbkb6WCRyAlYRO9ie0RoNRQvKQWfdHpy
 pFpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VSWxQzx8
Subject: [Buildroot] Error compiling python-paho-mqtt v2.1.0 in buildroot
 version 2022.02.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgZXZlcnlvbmUsCgpJIG5lZWQgdG8gdXBkYXRlIHRoZSBweXRob24tcGFoby1tcXR0IHBhY2th
Z2UgdmVyc2lvbiBmcm9tIDEuNC4wIHRvCjIuMS4wLCBzbyBJIGhhdmUgY2hhbmdlZCB0aGVzZSBm
aWxlczoKCi4uL3BhY2thZ2UvcHl0aG9uLXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lm1rCi4u
L3BhY2thZ2UvcHl0aG9uLXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lmhhc2gKClNvIGZhciBz
byBnb29kLCBidXQgaXQgc2VlbXMgdG8gYmUgc29tZXRoaW5nIGhhcyBjaGFuZ2VkIGJlY2F1c2Ug
SSd2ZQpnb3QgdGhpcyBlcnJvcjoKLi4vYnVpbGRyb290LTIwMjIuMDIuMS9vdXRwdXQvaG9zdC9i
aW4vcHl0aG9uOiBjYW4ndCBvcGVuIGZpbGUKJy9ob21lL1VTRVJOQU1FL0dJVC9yYXNwYmVycnlw
aS9idWlsZHJvb3QtMjAyMi4wMi4xL291dHB1dC9idWlsZC9weXRob24tcGFoby1tcXR0LTIuMS4w
L3NldHVwLnB5JzoKW0Vycm5vIDJdIE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKCkkgd2FzIGFu
YWx5emluZyBob3cgaXQgaXMgdGhlIC5tayBmaWxlIGluIHRoZSBjdXJyZW50IHZlcnNpb24sIGFu
ZCBpdApzZWVtcyB0byBiZSB0aGF0IHRoZSBQWVRIT05fUEFIT19NUVRUX1NFVFVQX1RZUEUgbWV0
aG9kIGhhcyBjaGFuZ2VkCmZyb20gc2V0dXB0b29scyB0byBoYXRjaC4KCkNhbiBjb21waWxlIHRo
aXMgcGFja2FnZSB1c2luZyB0aGUgb2xkIG1ldGhvZAooUFlUSE9OX1BBSE9fTVFUVF9TRVRVUF9U
WVBFID0gc2V0cHRvb2wpIHdpdGggYnVpbGRyb290LTIwMjIuMDIuMT8gVGhlCmJ1aWxkcm9vdC0y
MDIyLTAyLjEgdmVyc2lvbiBkb2Vzbid0IHN1cHBvcnQgdGhlIGhhdGNoIG1ldGhvZC4gQW55CnN1
Z2dlc3Rpb24gPwoKQmVzdCByZWdhcmRzLArDk3NjYXIgR8OzbWV6IEZ1ZW50ZS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
