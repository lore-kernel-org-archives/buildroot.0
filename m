Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B01CD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C046340C2A;
	Sun, 24 May 2026 17:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWQiNWgSdLxD; Sun, 24 May 2026 17:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D737E40C33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779643433;
	bh=f4HYCosiJCkZWDE0atyReMFgfI248cyWaQMMtJiqwPo=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RuBchkx8PoMdghO42KzGwfQf+3pJmJueWNm8fGFx65LmU2L8609SlYnKBsNthE0pe
	 rGoktkBRP8N57F8olMvMilC+vD87bJZtRYfnn0ICoGWK+tv/5KwuBdvNY5IZhFYrzv
	 xoXRTxx3jsvdUr6eMOAlKmxpF0/Gf3Dnm35fR7xG5jguB6Oad1OQmp6yKYZU3Migww
	 blKtY+91LdxdJ902Fd4O2MgLweX+5c4oYoj3En5l7LIgmLbij1fQHeZE+2D440NIUT
	 xuHkOz0Ajk5wwbApWZEchQTdzHGiwFA6ogxwItsCdrDF+jchcSvO57Ejca0QebWXfb
	 4ZUAEg6y5Nfpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D737E40C33;
	Sun, 24 May 2026 17:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8227469
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7365383AE0
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGpRCuO5tgSz for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB67A83ADB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB67A83ADB
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB67A83ADB
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso48305825e9.3
 for <buildroot@buildroot.org>; Sun, 24 May 2026 10:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779643429; x=1780248229;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbJLlPK4hvW5BE2v7GjcV01IUKPtdjtfjUMVj0vFtcM=;
 b=qatTym+ZUaKBbRmJ2rs7weDDYdGd5V/KiAQ6MkCbRUAY/ThiOhNfzhmw/b4b1iqHhe
 JSACefM6MPNljvDf61Z7LzFGu33xWHoPgnlT0NX3izqXnv2A+yHZAbxmGnFs3tpJyI4V
 99MKTezA235K7nHNU6NckljezyBO9RI28lwtXPg+S+unzY5owaZ8N+oOor1SCyxXIgcG
 jDUNoHYrM2EkJ7mainfUu2dpm9zPheUxWKo+A3tRhyl+ZBoUKYzTuAkk0tPttBgol28G
 2Np0QeLKX5rVw0sk6JwlzmdaNUbxgo8nvuIATFuJVBukg3ew0U3D0mJTx6eekT+u/otS
 qmkA==
X-Gm-Message-State: AOJu0YyqOubkpI5KqzBifXa0FkP+cfxnINyC6fsKB3dJ1yp5FcJzQRS/
 rdfatC6tA7nRgS+RtaokjMp1RIsPY6FzRzgBnF7ztYb0/5cvHKAs1Qrt
X-Gm-Gg: Acq92OEfiW/5T/vgWcg2M3ME2/7V9JGhuq8tpSRbAf2BTBKSwq96R1s9OCRFzT/ifaH
 4Wc5jKM7gf/7bW2LP/4+VUaSnZwDacWUHRFByikEN36GYFwfYM7/COfCNDDeZ8p8dnV5rrZTvYz
 hKmyqkQiTu2yMbvqNuiohXRWtLNk2rziB7kBcRaZrjLrVqi90x2bRFgQfjO4GQKbAVDn0f+Xl6X
 2KId+FZZKownI06+CqB/dCqz750Hlc1hqD/VoN3xKY4D3bD/36uYMJhRnwBLHQTR3Tqr7FfIgGl
 xrU7QC1KFlKxLGSBazcpbq5WT1i9DsDTt9Z79uSlLSZAtTqU5NS8tpbSxkczs8zCeYWaUVJMmV7
 j1RCxav9D3pK1oQMGRyV7hUaMbMhHocxCyc6V10t/jQj+7MVy9GcnNCgcSaIZ7C+525BwURLmrU
 wiewP/WiELQYRyk6xFQ9T43TtrwcfD6WQzd1lSLnMlamEYixEO6ISEHkH4lxypqRFCQzcwRu7e1
 vNfvYFmRS4juUuJj5VU7+QsLBELT364MC2HIagJmvubIwko+jMN6q9jYDLR+qHtlxYpAJqJug/I
 K1U1fldY9M6si9JZJ0OgFQK2Kznt3ng7Gv0Mwpn0R204WeWI3AwnituLUZwAEnOqG9awkQ==
X-Received: by 2002:a05:600c:6287:b0:48f:eb8b:997a with SMTP id
 5b1f17b1804b1-49042ae285bmr190040295e9.31.1779643428380; 
 Sun, 24 May 2026 10:23:48 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454dedd9sm170233235e9.6.2026.05.24.10.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 10:23:47 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 24 May 2026 18:23:37 +0100
Message-Id: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABk0E2oC/5WQyw6CMBBFf8V07Zi2IA9X/odxUWAKE4FiC6gh/
 LsFNXHLanJvJudkZmIOLaFjp93ELI7kyLQ+BPsdyyvVlghU+Mwkl0cueQwP6sBkmbJFDpkxPaC
 mZZaDr4Ba6knV0N1KSAsRYZjJJNAF87zO+tXn6rpcfa7I9ca+VvUolna1CCnSDZZRAAeuAx4jx
 kEq0nPZKKoPuWnYYhnljxzxcBtZerIIJc/DRMeJVv/k+XOQxfvgf9Z/r5rnN/Y9IPNRAQAA
X-Change-ID: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=vDkabKytvKiFW/EVmgRT2MhlF1LWxphd37Vnps+lBRU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqEzQeLIvot/Ij5TfXDKDUDIG8M65lpn28zf5zI
 raPuEKuOoSJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCahM0HgAKCRBjTcTwaHBG
 +NLvD/9yKN1T/UiyeVaNtR9Xar28YOWKe6oUGQZCm2yJywiCO3cr8EomMPjiPjmPCcbBwGy2saD
 DK3pEZ0mzlyV9goZH8BOdvLY7hTW3ZZF0xXM/LvA0LqGqENQqzCxbZrDqIU4Frhw6y1KdNkeWrb
 lemBoQIc1jGD3A0dBnJHl//Td1Cd0vuZ6dtCSnt/+fNVz5dAmYrN+2HZPAvG98pxU3jB2hC5/RH
 lnaKuzugdoYIFxk0OqyndDKNo975zdsF9uI9pt99pzML85Bbx0I1du89IudMqQ//Nj+cn9uf8TX
 274H/DbqqUIyO2qs0CkDRqZoqGPRnOajGQTE/0OZ1oVgq15xGder8mAI93VOzlbKIzQBb+WrM5G
 TptU8NC6IpnFu5Yq+vNEv1Y+GZSf1QdBwI4FKDLtIW730fuz/Z1KCSZ2eqH5nZ35Ftqrpk+Sbhx
 Z56zVGPYYLz1OQODb4C6aXakBaHX78vFuYlo1rvtpBlvgppMtpUzzeXDAz5iEO36+MzkM3j8JFq
 zbI1wC1ZsQ9NVznBjH0wGDo038pWsMN/sYQrN4xzD4pCoo8Vl/JYCTE+i7m2vgf5fuhnrIhL/gU
 eMkfOHNPMxJu3Q35E345q5Kcbb0hx47/4RZvTeckasWLaJztPdH8LGsFAVqr9jD0rgLuNiRntut
 cPeTFPG31d4UHbQ==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779643429; x=1780248229; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EbJLlPK4hvW5BE2v7GjcV01IUKPtdjtfjUMVj0vFtcM=;
 b=atZmUXFsTbt9bb7Bb0hKJE/3oKx+l5jkRr7A2/b3ccXBYcskeD31tvRlv+PLl8PlKR
 N8wVh9uPX/m3qhVVZ7+X70wOo67jowWfPHfm9GZb6HdKyTHy1gg3tWBjAwjjaEM1iJ0Z
 8aOTwEqSG5SVMtHNN0QqBo6Kng/gzRrKbFKVhuqPAG6dGYUpd3B2L3RWo72GA08F8Kf3
 yQvcVp2p3wedCSWUVK2JbNG3ncm81X4K3szHDYS7wg8i2ZhVUE6+EUCoeeltv7Zc9a7l
 z1a5EOlx8gM8HjPn1eimQTJN39JKALl4Jqo2/GKrmg+Nk/SHCd4nqziuppzn4bSReR4V
 GyRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=atZmUXFs
Subject: [Buildroot] [PATCH v3 0/2] Add EFI Boot Guard bootloader package &
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

This patch series adds support for the EFI Boot Guard bootloader
(https://github.com/siemens/efibootguard) to Buildroot. EFI Boot Guard
can be useful when designing systems using A/B slot-based upgrades.

The first patch introduces the EFI Boot Guard bootloader package which
builds the EFI application as well as userspace and host applications.

The second patch adds an example recipe which demonstrates how to use
EFI Boot Guard in a typical EFI boot scenario. This may serve as a
reference for users looking to integrate EFI Boot Guard into their
system.

A later patch series will add an example recipe with integration
between EFI Boot Guard and RAUC, but that is still pending in RAUC
upstream [0].

While EFI Boot Guard can be built for multiple architectures, for now
this patch series only builds the bootloader for x86_64. Support for
additional architectures (including arm, aarch64 and riscv) will come
in a future follow-up patches.

EFI Boot Guard also provides a tool for generating UKI images, which can
then be signed for Secure Boot. For simplicity, this is not enabled in
the example recipe added in this series, but I expect to add it in a
follow-up patch.

The example recipe has been boot-tested on QEMU with OVMF firmware and
I have confirmed the image boots & runs as expected.

Feedback welcome!

[0] https://github.com/rauc/rauc/pull/1450

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
Changes in v3:
- Rebase on latest master branch
- Fix shellcheck warnings in board/pc-efibootguard/post-build.sh
- Add note that UKI/Secure Boot is not enabled in the example recipe
- Convert example recipe readme.txt to Markdown
- Bring-up EFI Boot Guard tools in example recipe & document usage
- Add note about RAUC integration patch
- Link to v2: https://lore.kernel.org/r/20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com

Changes in v2:
- Rebase on top of buildroot 2026.02
- Update efibootguard to v0.22
- Link to v1: https://lore.kernel.org/r/20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com

---
Christopher Obbard (2):
      boot/efibootguard: new boot package
      board/pc-efibootguard: add example EFI Boot Guard recipe

 DEVELOPERS                               |  5 ++
 board/pc-efibootguard/README.md          | 89 ++++++++++++++++++++++++++++++++
 board/pc-efibootguard/genimage.cfg       | 59 +++++++++++++++++++++
 board/pc-efibootguard/linux.fragment     | 15 ++++++
 board/pc-efibootguard/post-build.sh      | 33 ++++++++++++
 board/pc-efibootguard/post-image.sh      |  7 +++
 board/pc-efibootguard/run-image-qemu.sh  |  9 ++++
 boot/Config.in                           |  2 +
 boot/efibootguard/Config.in              | 37 +++++++++++++
 boot/efibootguard/Config.in.host         |  8 +++
 boot/efibootguard/efibootguard.hash      |  3 ++
 boot/efibootguard/efibootguard.mk        | 60 +++++++++++++++++++++
 configs/pc_x86_64_efibootguard_defconfig | 51 ++++++++++++++++++
 13 files changed, 378 insertions(+)
---
base-commit: 7418ff13895be20ccdd6ad6d460e6dbf73727637
change-id: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
