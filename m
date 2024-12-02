Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73978E69E81
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 18:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC8B815AD;
	Mon,  2 Dec 2024 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lC_0OdjJY_q; Mon,  2 Dec 2024 18:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D6B681EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D6B681EA1;
	Mon,  2 Dec 2024 18:21:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 674AF60
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F922606D4
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZPpyXYpvCjF for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B649360621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B649360621
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B649360621
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385e1f3f2a6so1808931f8f.3
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 10:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733163663; x=1733768463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/EUEz5fXC9Oh8tdcmcXSz5AMvgFcj7pHdHVUbvuTWuY=;
 b=Gml2QF7nqpkPcz98WdiAP0hsptgn42MxulNCVlwMoblKKsBgbp2ORv+OP7CobiuJTO
 FDaVYJJXarLVrYbI4LJc494SGYek1blLggbuWhL1fMf8t4LqoVUfsp/TfOZ4bEn+08YG
 4FvtjT7sBQ2nWXHY5Gnuql7bw6sOkWBb4MRz0dHN0/S6fLu3tpkCBMkYLXk1i3s6el1/
 QvL/50trf2XhRKjnra9aZQ6WC3pVu+nzxrEjsIhTwoo0Iuxy3ZjQE9QnZPPUrW/gXGHR
 bx38hIidnrWGTslszx/fNEd9bvor/2UsDEZ5Ed2lqIIbTi3vCXSy/Ny53y/9YFcqRaCU
 oLMg==
X-Gm-Message-State: AOJu0YzlYM2+3P3+24jDmYJY9m2E7oq43ugm1q287PNpfhLYPa88mQYx
 CgQRV2wKrnOJ9kfoyXWdWqcz5X7WwG+I+9aP/CLmSm+R+JBVdragvJsHDKJiCliGY9lwfCe26ky
 t+Vg=
X-Gm-Gg: ASbGncvZLBmJEeDX1q+4g9DglY6Jm8zm5Bx6Rm2arOlj9uG3LtVbDcPP5zsbb8E9AoP
 K6Gu1vSwC6AekJ6/pggr4n2GY+H6rLqYAz5OYVZVsRztqdva8MR6ITnoaDN2vx6IiN3ILOn6aHs
 AJABqWyz+z4fR33/EvgKq6lVA9ya4fZnl0fNbdBthRJNz4i2exyQGYMAja5xwIeYWE1ROcSWTvm
 KDX+Lz8EnOJliDzZCwJ+lUpaQQFVc8/NTf38vze3pfZ2BE0
X-Google-Smtp-Source: AGHT+IGjQvv+HdsO1x9Huuv2xDy+TbDECnjLC9iu1ZTOfKyFy4rToX6cftDUMYL4ugzNzChPV1UnHg==
X-Received: by 2002:a5d:6dad:0:b0:382:450c:2607 with SMTP id
 ffacd0b85a97d-385c6cca80bmr20211892f8f.4.1733163663009; 
 Mon, 02 Dec 2024 10:21:03 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dfb2d7e0sm9998286f8f.44.2024.12.02.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 10:21:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B28465F767;
 Mon,  2 Dec 2024 18:21:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  2 Dec 2024 18:20:59 +0000
Message-Id: <20241202182101.410320-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733163663; x=1733768463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/EUEz5fXC9Oh8tdcmcXSz5AMvgFcj7pHdHVUbvuTWuY=;
 b=ZjmL0vAqUUyjX9BdQhZKKIWr7wQ4xIiTSSldCsUxWYLAs85VQk+awRg7sGrA81vEOj
 d8CvhAfJL9DRW7Ni4BGySREpbaH/tDFBJSFvB9OWoC5bbBOR8eJyKaH/R02qq2yEWrrn
 FVRWMa/zxZ/OgWA2aJT1/rk1vq3867zMN9c7t6rhFPxVf3TwGCNcfBH+TkyF7vL9HAxF
 6fmiYvMgznf41TYKceuSEGXiczhijLebxyA48+yPlnC6eoEWcuJ+PEOCmoc+KvbdUm/L
 5dwCSBks8EtIx/ep5l2O7l1a7jp5ZqnYH2mVIYqjmi6F4dHB67/0XV9gxa0LJGiMiMBr
 tTQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZjmL0vAq
Subject: [Buildroot] [PATCH 0/2] Enable venus and add vkmark
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

SGksCgpUaGlzIGlzIGEgcmVzcGluIG9mIGEgc2VyaWVzIEkgc2VudCBvdXQgaW4gQXVndXN0LiBU
aGlzIHRpbWUgaXQKYXBwbGllcyBvbiB0b3Agb2YgdGhlIHNlcmllcyBCZXJuZCBoYXMganVzdCBz
ZW50IG91dDoKCiAgU3ViamVjdDogW0J1aWxkcm9vdF0gW1BBVENIIDEvN10gcGFja2FnZS9saWJk
cm06IGFkZCBob3N0IHZhcmlhbnQKICBNZXNzYWdlLUlkOiA8MjAyNDEyMDIxNzQwMDguMTEzNDY2
Ny0xLWJlcm5kQGt1aGxzLm5ldD4KICBEYXRlOiBNb24sICAyIERlYyAyMDI0IDE4OjQwOjAyICsw
MTAwCiAgRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCmFuZCBlbmFibGVzIHRo
ZSBWaXJ0SU8gVmVudXMgZW5jYXBzdWxhdGlvbiB0byBWdWxrYW4gZ3JhcGhpY3MgYW5kIGFkZAp0
aGUgdmttYXJrIGJlbmNobWFyayBwcm9ncmFtLgoKQWxleCBCZW5uw6llICgyKToKICBwYWNrYWdl
L21lc2EzZDogYWRkIG9wdGlvbiB0byBlbmFibGUgVklSVElPIHZ1bGthbiBkcml2ZXIKICBwYWNr
YWdlL3ZrbWFyazogYWRkIHZrbWFyayBiZW5jaG1hcmtpbmcgdG9vbAoKIERFVkVMT1BFUlMgICAg
ICAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsK
IHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiAgIHwgIDYgKysrKysKIHBhY2thZ2UvbWVzYTNkL21l
c2EzZC5tayAgIHwgIDEgKwogcGFja2FnZS92a21hcmsvQ29uZmlnLmluICAgfCA0NyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS92a21hcmsvdmttYXJrLmhh
c2ggfCAgMiArKwogcGFja2FnZS92a21hcmsvdmttYXJrLm1rICAgfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92
a21hcmsvdmttYXJrLm1rCgotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
