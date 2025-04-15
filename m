Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA594C369BD
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6B360BA9;
	Tue, 15 Apr 2025 15:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHx4GtlcxNlB; Tue, 15 Apr 2025 15:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA4F760E05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4F760E05;
	Tue, 15 Apr 2025 15:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C52FB200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA2884053B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TPECVpydqGP for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04475404E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04475404E2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04475404E2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3978ef9a778so280508f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744731097; x=1745335897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5gUbkzGNWJmioX7UbT3adsz1BTRvkKWn4/av7PsFoPE=;
 b=HEaZPeojroP6Y4y4kUdkx43cM9HHE7edHq24h0FmEghMoVntDfQb36yKbS0Z7cb0jh
 9LwW6Uk2xkj9Ib1LVnHy22epud3lk3FyZfOgYBDZ618vgAtjHgR//qBiUOiQBiLlNFzW
 IVn4AfQAhzXzVWK96graSZ8Caqs4AxKJgjY0vSX813XH5+Eiuoroqdn6vxMGHIWjzuZg
 +UZIMToT9jSMD8PYBIVcyQ5RcnqNXYRiTea343y4Ca8kxfhxK2X6ysVAqc1dcT/UtzOv
 0KjjGUIWltzNwGlhpxv/QjDb/U4tfNoEz5MiBbYmzOk/LYut90G566mEXKeKALiUzhOM
 iQmg==
X-Gm-Message-State: AOJu0YykfiveYKL7N6bsw71VaryL6fq5neX/K80rExj47sVI9txE9Djd
 SyGSfI/gUbPfg7LBP3MSvwoLIwpv72lyhrMXKnPFiKKtWglQGsYPtp31coJh
X-Gm-Gg: ASbGnctEl8F6dAepreBoSutsiv6zJzoFufsyzZVNChWnq94qjB8hmo0mh133HoQpPqJ
 qV5vx0umfo/1FX6WSFMPSurXPdS0TF8Dm+hy4ZzYbntVnink4+JoshWUu86XpLKkHfeaN6jEl4b
 XhaK2Aq/KDbbA4kYWNgOttAfFjKFNgMuxiLjtNsbGivw37txEB/2lsJ7+HOdSj1LZQUANvgQpUG
 1gppCgtCswrtEC0Ta8kNopIhxkwhM75Y4dCI3Kbu/2Nbj0JbCdXmuPPqzVjJ0ZRWLLEL14y8+/S
 5eaC6WP533C4Ro0bUVly/KFlNM7pwdcuYXvmdNvO/RyEfH7hTTk=
X-Google-Smtp-Source: AGHT+IG3kHLcApJqLaJkBjQP9WLntGMZOR50f4x5BBYqFR8nTBJaHLjvLeL1yCC1uOAM/Cz8ffHaCQ==
X-Received: by 2002:a5d:5983:0:b0:390:dba1:9589 with SMTP id
 ffacd0b85a97d-39ea5215dd2mr4561579f8f.8.1744731097549; 
 Tue, 15 Apr 2025 08:31:37 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm14458950f8f.3.2025.04.15.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:31:36 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:31:25 +0200
Message-ID: <20250415153127.1868025-4-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744731097; x=1745335897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gUbkzGNWJmioX7UbT3adsz1BTRvkKWn4/av7PsFoPE=;
 b=nDlF8WQh3TjbWoHXiKRTQkFInQTAWvXbiUbYfLgnG7AzZSvT1Muc7MLoDJ6gVUL7jJ
 2khkMIAqi11tGsoRNBtkITMaXrijQVCPCIpoNF3Imgd6MWViRWV5AD5fozOz7xsVnQZV
 q1U5Xw2KHnyvbbATXnvn68DU13c6LcFVXEF75s91galVQ87ZBxcPZEgdg/1q0oxldjih
 4Esu2ccp0nJ8w041a7lmR0B2nicRDJ3fPmQuLandhPR9ruInix14ndu4fd5k7mI6etgA
 Pe+nFq34Pc9bvbKRPOhVh2UGWBuNT+vHOIzYtDd7+wGOjvSeI2RlaXmSt17jG2aSbamD
 P/WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nDlF8WQh
Subject: [Buildroot] [PATCH 4/6] board/raspberrypi/readme.txt: add missing
 Raspberry Pi Zero models
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

VGhpcyBhZGRzIHRoZSBtaXNzaW5nIFJhc3BiZXJyeSBQaSBaZXJvIG1vZGVscyB0byB0aGUgbGlz
dC4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwu
Y29tPgotLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgfCAzICsrKwogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3Jl
YWRtZS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CmluZGV4IGMxMmE4OTY5ZjEu
LjRhMDkwMzU3OGIgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKKysr
IGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dApAQCAtNiw2ICs2LDkgQEAgSW50cm8KIFRo
ZXNlIGluc3RydWN0aW9ucyBhcHBseSB0byBhbGwgbW9kZWxzIG9mIHRoZSBSYXNwYmVycnkgUGk6
CiAgIC0gdGhlIG9yaWdpbmFsIG1vZGVscyBBIGFuZCBCLAogICAtIHRoZSAiZW5oYW5jZWQiIG1v
ZGVscyBBKyBhbmQgQissCisgIC0gdGhlIG1vZGVsIFplcm8gKGFrYSBSYXNwYmVycnkgUGkgWmVy
bykKKyAgLSB0aGUgbW9kZWwgWmVybyBXIChha2EgUmFzcGJlcnJ5IFBpIFplcm8gVykKKyAgLSB0
aGUgbW9kZWwgWmVybyAyIFcgKGFrYSBSYXNwYmVycnkgUGkgWmVybyAyIFcpCiAgIC0gdGhlIG1v
ZGVsIEIyIChha2EgUmFzcGJlcnJ5IFBpIDIpCiAgIC0gdGhlIG1vZGVsIEIzIChha2EgUmFzcGJl
cnJ5IFBpIDMpLgogICAtIHRoZSBtb2RlbCBCNCAoYWthIFJhc3BiZXJyeSBQaSA0KS4KLS0gCjIu
NDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
