Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39992C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B73412E6;
	Mon, 21 Jul 2025 15:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGe9EeG-5Zrz; Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD5E4137F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD5E4137F;
	Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C9EDA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF427412E6
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nq6p6Q6GIhtJ for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF01F412D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF01F412D7
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF01F412D7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6097d144923so9557481a12.1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112894; x=1753717694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=moxjFU2PvPzw4OpwPSooj/KjSyg1qDW7lHKta1V5tU4=;
 b=OMwddDbe/Aw38AZ9jHdtUhv+qjjhElF4Vu6CQPoEMkDEoyuf44hdy++Eqb77SjWhcm
 wuG8mQCGCaxLi5og2UqULtrz74FPWIDGEm99jAq762MIG7pZ+lCh1JmOrNYA/jjI8y/u
 /GB13X3tlW8JobAymfkrf9uZjQsmATtGqISJagCTjFPXH/phZbJnU5bgJhfVy4y7/3Py
 PEdOVUF4LiEu1a18UFAzrWG+4hVhIZWHnhS/Gjlz1SsopTv6/XNiniMdm5AwJMbkOf8H
 JXB+mYpYm/9hEehBjRuL/LvFiIGiLBabheZlj+wA8q2iIFvCY7GVn1o83kSM28laKyag
 ewbA==
X-Gm-Message-State: AOJu0Yyo/B1qihklbEy/fhBlceGLD2AU3BEYBg/WALmTeSe0VQamxJb1
 GGLl+ctzgaB7RZeiw6Rj8hytj2Rp5q7VWRBRVRhhMssKQUXyFnjvmOC0mhZ5+hNT8bU0vI3bUNv
 nDkEs
X-Gm-Gg: ASbGncuTB05AmyMvzy+AinFjrovBPi2HT3162KPnPASxyoZiI7atPqzfpWzRj8Sr1D8
 j3xsupA7qUlT4h5wCxNzsBdPw0d/pn2nD9AsEaRVIqyszKHBie8aRS8RsbdTp4mEWAAZtLlBIIs
 yrYHDT9iCeCTlUPq3dmFRheHcoBTrocTSZ/1se8Y9DMbViywPeDs8/ONt2RWyty9G+tGctY7z5M
 D3x7f8S7FcDrZATDN0U0QLB4DSy6ZwJuoA3fR3RKWApK3U93YtJN7qf6zfLdCHN0tNxMMXa7FvD
 h2RNtG82+QE/N/AbG31jsswsidw8QnOi/KAILycaRyYrOIgY314dAbCnKZXdqKt9Z5BSZ48+NhV
 IMjdmpq895e/V1lIPPMz7s34=
X-Google-Smtp-Source: AGHT+IGLOEFBKcccjXQsRcBjCZCa900khnZOC3AH79lCiqW09QSu5hlL4aL/OLC5Z9M2FtRAId3sUQ==
X-Received: by 2002:a05:6402:5303:b0:607:2e08:f3e6 with SMTP id
 4fb4d7f45d1cf-612a36f6f3emr14260280a12.17.1753112894248; 
 Mon, 21 Jul 2025 08:48:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f543ddsm5530410a12.30.2025.07.21.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A865B5F83D;
 Mon, 21 Jul 2025 16:48:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:01 +0100
Message-ID: <20250721154812.787883-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112894; x=1753717694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=moxjFU2PvPzw4OpwPSooj/KjSyg1qDW7lHKta1V5tU4=;
 b=BWB9xpp8jUyo7fLJF85KjBAsm2ioJOw7+NYwKgeKmkrZ94aptZDRUMUEBjJBxyMRjj
 4OthvXfPBjDGr7E0fkrFB+Q6bn2Cd2I39syqT3EV403Li5P9pgIN2EORmqTb5ARLogrV
 b53/lwTnCbZzQIcP5g8xw6hKz70Tn3Cy7Z//QDnruwejM4kfDiWfD3aApDhkxjVsais5
 PvdnKfxIrDD+lYVOo8Yp6/JksM2pZiOBUUP7cWwf4jkNlMl/0qad3d6riEb3VRt1RAzT
 tYYzmPTO240g/wSlWRpsaxVyhXtqA26lIFWlvtUj+GIc5exnLumxfs55zND7s7QdmxEX
 ZdGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BWB9xpp8
Subject: [Buildroot] [PATCH v3 0/9] kvm-unit-tests: update deps and fine
 tune qemu
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

VGhlIGt2bS11bml0LXRlc3RzIHJlY2lwZSBpcyBhIGxpdHRsZSBvdXQgb2YgZGF0ZSB3aXRoIHRo
ZQpkZXBlbmRlbmNpZXMgaXQgbmVlZHMuIFdpdGggdGhhdCBhbmQgc29tZSB0d2Vha2luZyBvZiB0
aGUgb2YgcHJvY2Vzc29yCmRlcGVuZGVuY2llcyB3ZSBjYW4gbm93IGJ1aWxkIGt2bS11bml0LXRl
c3RzIGZvciBhcm02NC4KCkFzIGt2bS11bml0LXRlc3RzIG5lZWQgdGhlIGxpYmMgdXRpbHMgYW5k
IEkgdXNlIGV4dGVybmFsIHRvb2xpbmcgSQphZGRlZCBzdXBwb3J0IGZvciB0aGF0LgoKT24gdGhl
IHdheSBJJ3ZlIGFkZGVkIHNvbWUgbmV3IGNvbmZpZyBvcHRpb25zIGZvciBRRU1VIHNvIHlvdSBj
YW4ganVzdApzZWxlY3QgeW91ciBuYXRpdmUsIGt2bS1vbmx5IFFFTVUgYnVpbGQuCgpGb3IgQXJt
IHdlIGNhbiBhbHNvIHJ1biB3aXRoIGt2bXRvb2wgc28gSSd2ZSBhZGRlZCBhbiBvcHRpb24gdG8g
ZW5hYmxlCnRoYXQuCgpGaW5hbGx5IEkndmUgYWRkZWQgYSBzaW1wbGUgdGVzdCBjYXNlIGZvciB0
aGUga3ZtLXVuaXQtdGVzdHMgcGFja2FnZS4KCkZvciB2MwogIC0gYWRkIHItYiB0YWdzCiAgLSB1
cGRhdGUga3ZtLXVuaXQtdGVzdHMgdG8gY3VycmVudCBtYXN0ZXIKICAtIHVwZGF0ZSBrdm10b29s
CiAgLSBlbmFibGUga3ZtdG9vbCBhcyBhbHRlcm5hdGl2ZSB0byBRRU1VCgpGb3IgdjIKICAtIGFk
ZHJlc3NlZCByZXZpZXcgY29tbWVudHMKICAtIGFkZGVkIGV4dGVybmFsIGxpYmMgdXRpbCBzdXBw
b3J0CiAgLSBhZGRlZCB0ZXN0IGNhc2UKICAtIHJhbiBhbmQgYWRkcmVzc2VkIGxpbnRlciB3YXJu
aW5ncwoKQWxleC4KCkFsZXggQmVubsOpZSAoOSk6CiAgdG9vbGNoYWluL2V4dGVybmFsOiBhbGxv
dyBpbnN0YWxsaW5nIG9mIGxpYmMgdXRpbHMKICBwYWNrYWdlL2t2bS11bml0LXRlc3RzOiBhc3N1
bWUgQUFyY2g2NCBzdXBwb3J0cyBLVk0KICBwYWNrYWdlL2t2bS11bml0LXRlc3RzOiB1cGRhdGUg
ZGVwZW5kZW5jaWVzCiAgcGFja2FnZS9xZW11OiBpbnRyb2R1Y2Uga3ZtIGFuZCB0Y2cgc3lzdGVt
IG9wdGlvbnMKICBwYWNrYWdlL2t2bS11bml0LXRlc3RzOiBidW1wIHRvIGN1cnJlbnQgbWFzdGVy
CiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czogaG9ub3VyIEJSMl9BUk02NF9QQUdFX1NJWkUKICBz
dXBwb3J0L3Rlc3Rpbmc6IGFkZCB0ZXN0IGZvciBrdm0tdW5pdC10ZXN0cwogIHBhY2thZ2Uva3Zt
dG9vbDogYnVtcCB0byBjdXJyZW50IEhFQUQKICBwYWNrYWdlL2t2bS11bml0LXRlc3RzOiBhbGxv
dyBrdm10b29sIHRvIGJlIHVzZWQKCiBib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25m
aWcgICAgICAgICAgfCAgMiArCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiAgICAg
ICAgICAgICAgfCAzNyArKysrKysrKystLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLmhhc2ggICAgfCAgMiArLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5p
dC10ZXN0cy5tayAgICAgIHwgMjAgKysrKystLQogLi4uZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1j
b21wYXRpYmlsaXR5LnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9rdm10
b29sL2t2bXRvb2wuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uva3ZtdG9v
bC9rdm10b29sLm1rICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3FlbXUvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAyMyArKysrKystLQogcGFja2FnZS9xZW11
L3FlbXUubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKy0KIHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5ICAgICB8IDQ3ICsrKysrKysrKysrKysrKysr
CiB0b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL0NvbmZpZy5pbiAgICAgICAgfCAgNyArKysK
IC4uLi9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rICAgICAgICAgICAgICAgICB8IDI0ICsrKysr
KysrKwogMTIgZmlsZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKyksIDc1IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uva3ZtdG9vbC8wMDAxLXJlbW92ZS13b3Jkc2l6
ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKCi0tIAoyLjQ3
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
