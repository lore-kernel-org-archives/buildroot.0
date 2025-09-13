Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5EBCAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 17:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29EA833C9;
	Sat, 13 Sep 2025 17:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1g0Dl8gyKpaN; Sat, 13 Sep 2025 17:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B0383518
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B0383518;
	Sat, 13 Sep 2025 17:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7213117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACD41605D0
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5h_94WbFTOg for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 17:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DB5660638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DB5660638
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DB5660638
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:33:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45df0cde41bso22015575e9.3
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757784794; x=1758389594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NQngCsYBLnJQdcoPy9U8qKnFUaFA0WbxI8t5PNjGlc=;
 b=hMzBNjjly9BPiVhkZyWU3fum/w2jbIy+Z2111mQrRmYkS7feiqzvUNVS6KG7h7qxvm
 U5MpNq9Fuo+mumB/09xMjnvcf6l/SFq0piP2GQQn+DLcwauDhBS6N7k3fvSFXNVdiyGX
 iM3taQCDR1IpWWIry8W4wMUyVsKSkZBXxlz1XhO3WbjEbH6YNCj/YWQORv99XAV0+FPV
 PLf1U1B/NbVIf97N3imKJwtKFkYMUoBLiFQ3DLwYqTAirH71s+ZZksdH9Flsj+c83lvn
 rCS0W2v6WgMSZSzMYb+gzJLrg99nIp8UOdCiIEe6ejXKEb3vJ43r2DHD42gSPe64oLZP
 ICSg==
X-Gm-Message-State: AOJu0YzV87yb6t8vwL9mzXQ+VJMN1sEpUmtivJhik1OU4Asrw5h9KEhV
 vcHsw9CTDP3IHdcF9J9zNY+GAIiIMyyi2qRdq5b6hnskh2kPG/vIRsp4sco+c7iIMU+rEpXUka6
 FVY97ZS/iMQ==
X-Gm-Gg: ASbGnctcBL2EzIFYuS6T2zAFvAxjsFMUey1/gj7GKIJz3tA0kT6tHBxa0+pp+6RM9nb
 tUQxflXC6RRFQ+3Y2HSP3D9VLvUhD+hoWD1keNCQOuSePHWkZwJ/scrbmwhHpTmPJ58hfbZ5h36
 fti+ZlmkAJsbAQFLPCboAnuXAoFv7Fb9yh8xfnk0oen5Wq0ZZiCsbcRnswDvPIL1LsPl1oyi5Pi
 Q0TrtSq5zOMaukO/gAn9/vf8LAIb5b3BbYoeieE81rgawTSsHUIjA9GIBN0gMy1b22TJcZte8SK
 LpBKfYqvR8nyBfpBwXQAYlNOcQK81RV2ZqK2diO8b4CbQmXIZ6fYo0LNphXcDumaJPeKtylKk0X
 Qa9YL4tQui0MdNGfZ5z/cIv85KBIfBptPfxslcpXLmjsOjIlu1dsYuxO72lCpNWYkSVwIuJHzMN
 /fjy4GNesK8vqwffyxZNmQ
X-Google-Smtp-Source: AGHT+IGoiCSQM/l04N3tb2SS3+jfV3LLZjSAWZ3C6uz8Cjn1TXN3FcX/Y/WdL0FVrz5f/0U0tws9Gw==
X-Received: by 2002:a05:600c:a4b:b0:45c:b5eb:b0c6 with SMTP id
 5b1f17b1804b1-45f211c856dmr74506285e9.5.1757784794227; 
 Sat, 13 Sep 2025 10:33:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0156d40esm111056805e9.1.2025.09.13.10.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 10:33:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 19:33:10 +0200
Message-ID: <20250913173311.2624001-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757784794; x=1758389594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8NQngCsYBLnJQdcoPy9U8qKnFUaFA0WbxI8t5PNjGlc=;
 b=t3lJUzUU42Wp2oz5oGIlhu5TyyKT6NIW7n/E+0ve89FzuTIIMSv4uYUQ0XKBJWNWJr
 6wkMvCunrg2Fy/6px2j37cLvDc6PvZOBMlB3aIFpnd4YuzdCUofWMjzB/5f4wZ5wod85
 1nh43MmBb3wiwnzzZkyNKIHBLrrtKc6a6vv78=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=t3lJUzUU
Subject: [Buildroot] [PATCH 1/2] support/testing: remove TestZfsUclibc
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgcmVwb3J0ZWQgb24gdGhlIG1haWxpbmcgbGlzdCBbMV0gd2hpbGUgaW52ZXN0aWdhdGluZyB0
aGUKVGVzdFpmc1VjbGliYyBHaXRsYWItQ0kgZmFpbHVyZSwgdGhlIHB5dGhvbiAzLjEzIGludGVy
cHJldGVyIGl0c2VmCnNlZ2ZhdWx0IGF0IHJ1bnRpbWU6CgogIEZhdGFsIFB5dGhvbiBlcnJvcjog
X1B5VGhyZWFkU3RhdGVfQXR0YWNoOiBub24tTlVMTCBvbGQgdGhyZWFkIHN0YXRlCiAgUHl0aG9u
IHJ1bnRpbWUgc3RhdGU6IHByZWluaXRpYWxpemVkCiAgVGhyZWFkIDB4U2VnbWVudGF0aW9uIGZh
dWx0CgpUaGlzIGlzc3VlIGlzIHJlbGF0ZWQgdG8gdGhlIHB5dGhvbiAzLjEzIHZlcnNpb24gYnVt
cMKgWzJdIHdlcmUgc2V2ZXJhbAppbnRlcm5hbCBjaGFuZ2VzIHdlcmUgYWRkZWQgWzNdIHRvIHN1
cHBvcnQgUEVQIDcwMyBbNF0uClBFUCA3OTMgaXMgYWJvdXQgQ1B5dGhvbuKAmXMgZ2xvYmFsIGlu
dGVycHJldGVyIGxvY2sgKOKAnEdJTOKAnSkgcmVtb3ZhbApmb3IgbXVsdGktdGhyZWFkcyBzdXBw
b3J0IHRoYXQgcmVxdWlyZXMgYSB3b3JraW5nIEMxMSAidGhyZWFkX2xvY2FsIgpmb3IgdGhyZWFk
LWxvY2FsIHN0b3JhZ2UgWzVdLgoKUmVtb3ZlIFRlc3RaZnNVY2xpYmMgc2luY2UgdGhpcyBpc3N1
ZSBpcyBub3QgcmVsYXRlZCB0byBaRlMgYW5kIHNpbmNlCndlIGFyZSBnb2luZyB0byBkaXNhYmxl
IHB5dGhvbjMgcGFja2FnZSBmb3IgYWFyY2g2NCB1Q2xpYmMtbmcKdG9vbGNoYWlucy4KCktlZXBp
bmcgVGVzdFpmc1VjbGliYyBpcyBwb3NzaWJsZSBieSB1c2luZyBhbm90aGVyIGFyY2hpdGVjdHVy
ZSB0aGFuCmFhcmNoNjQuIEJ1dCBpdCByZXF1aXJlcyB0byB1cGRhdGUgVGVzdFpmc0Jhc2UuCgpG
aXhlczoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8x
MTI3MTEyNDg1OSAoVGVzdFpmc1VjbGliYykKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9i
dWlsZHJvb3QvN2E0ZDI0NWQtMTU1Ni00M2M5LTg5OTctNmIxZjc5MWFmYmZlQGdtYWlsLmNvbS8g
KFRlc3RaZnNVY2xpYmMpClsyXSBkNjNlMjA3ZWI4NjkwNjNmODJjODY3NjU4Njc2YzI5MDNiZWIw
OGNiClszXSBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vY29tbWl0LzZlOTdhOTY0
N2FlMDI4ZmFjYjM5MmQxMmZjMjQ5NzM1MDM2OTNiZDYKWzRdIGh0dHBzOi8vcGVwcy5weXRob24u
b3JnL3BlcC0wNzAzLwpbNV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy0xNS4x
LjAvZ2NjL1RocmVhZC1Mb2NhbC5odG1sCgpDYzogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxz
YWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CkNjOiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9w
ZW5hZGsub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSB8IDEw
IC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CmluZGV4IDFiOTA3YWM0ZGUuLjM4MzM4Mzhl
M2EgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5
CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CkBAIC03Mywx
NiArNzMsNiBAQCBjbGFzcyBUZXN0WmZzR2xpYmMoVGVzdFpmc0Jhc2UpOgogICAgICAgICBUZXN0
WmZzQmFzZS5iYXNlX3Rlc3RfcnVuKHNlbGYpCiAKIAotY2xhc3MgVGVzdFpmc1VjbGliYyhUZXN0
WmZzQmFzZSk6Ci0gICAgY29uZmlnID0gVGVzdFpmc0Jhc2UuY29uZmlnICsgXAotICAgICAgICAi
IiIKLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfVUNMSUJD
X1NUQUJMRT15Ci0gICAgICAgICIiIgotCi0gICAgZGVmIHRlc3RfcnVuKHNlbGYpOgotICAgICAg
ICBUZXN0WmZzQmFzZS5iYXNlX3Rlc3RfcnVuKHNlbGYpCi0KLQogY2xhc3MgVGVzdFpmc011c2wo
VGVzdFpmc0Jhc2UpOgogICAgIGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNvbmZpZyArIFwKICAgICAg
ICAgIiIiCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
