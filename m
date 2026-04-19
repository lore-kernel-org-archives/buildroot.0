Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA35F99C8D
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 00:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A90540EF0;
	Sun, 19 Apr 2026 00:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XfxFShoxOuV; Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95DF040EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776558077;
	bh=7Np9zN0+wlesw6uhz0PJ4Tz5+szD9yf+G9Lurv01Jco=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GW5wGt64qV08BeRTu+Azyf+YUUQ7kJ2Q6Hp6DUX8TR4b4ViSQ3UHb6jiWYUDlLi+2
	 IyMZMB6rnh+QL1UbOmbf1FSN8vGZUDlTLaesxslVQ6A2tP2vc4T7Yw0GD1T101dnsl
	 iW78eKD8hW90uDqshtHNGwHyYuteBDHUE0uPOF5NItfGo4osRtjutt0gnEB8/2SOJf
	 1ikYyzEv/x0rP8vSVeUPPqUyH0aYbQWrRVhlfcGOZbks59jLQCLv4KNOrkxsiKTwtx
	 oaSuk9lhX4R9nl5mgnDxI1tF5RW8gX4QRoq1Rn8CpL6Aq/ALcIBY4SIv8/7ufubUu3
	 f5Hk9x9pDDnqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DF040EF2;
	Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6C3259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D7CB40EF2
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwVK409LghEw for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 00:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16FF440EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16FF440EF0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16FF440EF0
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so1137487f8f.2
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 17:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776558073; x=1777162873;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n22WVI0h0TXJq3kx82HWyCd3ngm5Wt1iRWaWmjpDWh8=;
 b=o+OlsvkCFnS5WhVEieinJhqD0QBBtW9m0W2SZZ7S4PA1WuPFTEdnEo5hA+6I2om4d+
 opAx/W+vNgsRw6tHXodYIHOkUsBNITAl8/JumDcqLDVHugiYUVrNxL8F4MjVRoe+JQ55
 CfUpqWBPktJgg5O5SoXl2fqaSMBGE9PTTBMvF7YS1sWqIjZ+Y7el/hD7BWWfh3CPsmZ7
 8+j+QMOC4kQp2oVCSjTGemg6p/x4lWLRUHpR7PVc4pU5BXYDfSfftyvunjMKQUJD4bnp
 io0BcS+tUvNrDVqdGWSKF0bio7Y0Iasg5L/V+BH0s6m35lkChdNj3nmLRK4Sz5XXe3dN
 b+/A==
X-Gm-Message-State: AOJu0YzugYn44/t/M6WbQDYf2acTUmIsFF5xoJODSf3xKSDd6HST6+iI
 uOThi7gMkHkKNa5/XPr/wqm8+O6KOES99sAfArruVa033SGL6B1Unt4m
X-Gm-Gg: AeBDies7R9eITBkeFkkYvCcW+NSYQ9VuNVoFOZiiI0HgbdK0IhRAR/tKEV5zTp3pBFN
 tjf3IBMa+tZO2KpEc03v2Js0KgJo6Aytpn1iW+P8uYKOsmdz0Sl7QLqSCoWmhrSkqrLzEp8ocjy
 DeWcTTXDV2RsrAM/1Evmk60dAOarx4HIAr45aLalzQMetAabnZ5Nvkv0/FG9zfvvMk9KzQAHqBH
 ViiNXDkVyhRXDGN181xk7NRazEVVYJIGpF1QpTH3SI53xO6sx45EdDkz3/IqNRNDAh1JyTeoxHz
 vM5QEZi4qlXjdClAOn2f8ztPkSGeGoPBZunBbW0YMRWM9IgLCwkj8Wl2vjhAVp9iaER79RQF2cd
 iG0sgqugB1nHYCR8q/+/nY6WohUroSIsXz2LDwAteIhyHOP1oP76raOJedM3zCxQxBkV75QXeQo
 e9VrSyevv4SnSGHX56c6vFHK7STIK2y7dqBELELHqpe/gXfu2l5vl/zM96nENDNFFDp7pDUkplB
 umEpIJ+jvBP8BY3t8ndi5gXhrRPpGlKpiCi6+90D8+C7lBd0P/MMhsz1IYaTXhPzM9FWHdoxP4L
 6PdcOjGmY3w820swahAxlw4I0vyjOFRIvz9Y2B6428BLv5iQ7ptAypLazVrNGOYiAXVRthtd90r
 9EC1x
X-Received: by 2002:a05:6000:2890:b0:43d:7aa8:f64e with SMTP id
 ffacd0b85a97d-43fe3e0a2c4mr12304137f8f.32.1776558071975; 
 Sat, 18 Apr 2026 17:21:11 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc09b1sm16970290f8f.9.2026.04.18.17.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 17:21:11 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 19 Apr 2026 01:20:50 +0100
Message-Id: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOMf5GkC/5WNQQ6CMBREr0K69pu2qFhX3sOwaOmn/AgtaRE1h
 LtbuIGryZtM5i0sYSRM7FYsLOJMiYLPIA8FazrtHQLZzExyeeaSV/CmEYIxOtoGTAgTYEtbule
 ugDxNpHsYnw6UFRc8GXktW8vy3xjz9LO7HnXmjtIU4ndXz2Jrd4uQQv1hmQVw4G3JK8SqVELd3
 aCpPzZhYPW6rj/DLMUj4gAAAA==
X-Change-ID: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=a/oNA9y0Gc32df5e4cO966tmKq814UV9B+ZiHir8TeE=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp5B/psyY0b66aczcgVPaBJVWIRYc9436dAQs0F
 y9kaZMxhC6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaeQf6QAKCRBjTcTwaHBG
 +OuHD/0W6nclrtvo1ByGH8BUcm59GCHqvVKp61L3OHDHpEw+hC5Fu1RAFEd5CMVN55KPZF0yMRj
 x/8nUC4upGHto9HKwy9NFRkq/83s96g5McM4LRRckwcSl1VkPsVwmyLAl66rrh7GkdzWd5Bk0Jc
 ySwa0siYrmIVQQ8FQpBNDj3mMQFJZtlk9JChZIhKmMwhuiKyJZyuwN15nM1mJnemMugkv4YiiHa
 FJwe+iEYSoSHM0sN4yU/zYfHgy5uKhJqN3moUEr7KLQrFlU7kPvacO8n0BGe5qDkudxWf7KBWwh
 VDHZptYIntbESHr5LqxFs4d++Dg1XwN2sUL1V9d/H5joCB2nONit5iv80UVI2SYVzXG12T3LWAR
 1SufFwaHcjUd12LjDY84FhZi3A5nNlLB+Z8MmcJihhvMd3XuxD1SVBNRykO88NG/8QskXWtWCqb
 n4Sklzf9/AkcG2UB6jj55yabqyVfe5NsVni/pxUAyNBlLg97GKARiFDZezlHc0Q7EVQhkU88MVB
 3rhFCYhtak4vToD4cWD+TKNA6cY25MpQ6cjCAtRbyk37kAHXIOAxgOk74BpsLwYyJAK0lqe81JT
 cBafuoLI/fH0nC5a0jsKEdNa6JNabYvz3S07Q+6JOVltvPFetvHFMLiZGPz2L+K8UY+jBsX9Ztn
 HlXLLQqfv9s6aCQ==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776558073; x=1777162873; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n22WVI0h0TXJq3kx82HWyCd3ngm5Wt1iRWaWmjpDWh8=;
 b=swAsMkBABVqz7KEd82oiFcQHszThbR0m2NgwVET0eUsEhd17gjmGfHog6osnyiR5Bm
 SWIVVihG840w/QUnIklnz93dIKWnWrQCpMqBAiZeFhSeBlsyT4uH54iQTY/RQlSWJ4ZD
 4Weoj6mSeA/HgmLEg4+5ZX29PJdrwpywB2P5Avwmx4htK+H3np1PFEaF1DjfIsGdOKvZ
 mnZS1JC6/gj5mnJKJZf60yskbb5uCPMQ5rWVRGqAuITTHNN9rAlVszVMiI8l01GHgEuO
 EkKHiXQ8i2aAVXXqPYUap/QIy4kw1CIpVOzezRIKQYgMPLpy+9F1XadQRYRzSDxN0I77
 hhaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=swAsMkBA
Subject: [Buildroot] [PATCH v2 0/2] Add efibootguard bootloader package &
 example recipe
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for the efibootguard bootloader
(https://github.com/siemens/efibootguard) to buildroot. efibootguard
can be useful when designing systems using A/B slot-based upgrades.

The first patch introduces the efibootguard bootloader package which
builds the EFI application, user-space applications and host
applications.

The second patch adds an example recipe which demonstrates how to use
efibootguard in a typical EFI boot scenario. This may serve as a
reference for users looking to integrate efibootguard into their system.

efibootguard can be built for multiple architectures, but for now this
patch series only builds for x86_64 (since that was what the project I
added efibootguard to used). Support for additional architectures
(including arm, aarch64 and riscv) will come in future follow-up patches.
I expect to do that once this series has been merged.

The example recipe has been boot-tested on QEMU with OVMF firmware and
I have confirmed the image boots & runs as expected.

Feedback welcome!

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
Changes in v2:
- Rebase on top of buildroot 2026.02
- Update efibootguard to v0.22
- Link to v1: https://lore.kernel.org/r/20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com

---
Christopher Obbard (2):
      boot/efibootguard: new boot package
      board/pc-efibootguard: add example efibootguard recipe

 DEVELOPERS                                   |  5 +++
 board/pc-efibootguard/genimage.cfg           | 59 +++++++++++++++++++++++++++
 board/pc-efibootguard/linux-efistub.fragment |  4 ++
 board/pc-efibootguard/post-build.sh          | 35 ++++++++++++++++
 board/pc-efibootguard/post-image.sh          |  7 ++++
 board/pc-efibootguard/readme.txt             | 30 ++++++++++++++
 board/pc-efibootguard/run-image-qemu.sh      |  9 +++++
 boot/Config.in                               |  2 +
 boot/efibootguard/Config.in                  | 37 +++++++++++++++++
 boot/efibootguard/Config.in.host             |  8 ++++
 boot/efibootguard/efibootguard.hash          |  3 ++
 boot/efibootguard/efibootguard.mk            | 60 ++++++++++++++++++++++++++++
 configs/pc_x86_64_efibootguard_defconfig     | 51 +++++++++++++++++++++++
 13 files changed, 310 insertions(+)
---
base-commit: 52ee2f5644da5389634b2465f1dc31deb5a4807c
change-id: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
