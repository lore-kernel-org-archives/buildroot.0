Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35CCA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 09:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7C480C0D;
	Mon,  5 Oct 2026 09:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNDXE1PAfuAb; Mon,  5 Oct 2026 09:52:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2B7CE80BEC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791193927;
	b=Eyd2xvTn6Ld/gvQDHzZd6Y3VEU6uvRBO/81PJjQO5rmWrx+X/+Ed6ngBb9OmhcNXlMpi
	 E4/22m5OfCa2gGiml9+DSG2hImMC+o+A3N78n5DGhCbTiZl6HCP7+TzCO9lL71JRSpGU3
	 /kNr/Gz1JbEsMy79T3YrevIJrCGOvGK43r3F2CNeiwrIHtfnfIvfAY/GxNAp6JOJ7asH5
	 6iU1V9UoeQRgLQBdzpKENXo5lhItjQRk5zKuCr5UecAfUvCxT/V++igEBKcbzFO3DatDF
	 e5hiZD9ND9UWMKyOdhoMkFTdgOvANXujioM5EFzRHfJXWackyh7UwudMbd1mv/U1yNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791193927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uJko8L1aLs3wEEqTjFIjMBdIjwA/NwsnnMqDVQyQC8E=;
	b=M2LduKR/Fj2DiFHkFLlP6SmTA1PsA2fsKVunCBZqLK7t1ghXzTb1pvNL4zvG+200PTk/
	 0X6bc/Z1PNyKebpXvlEpalMY16ciD56eZEKD4zKWGI/qYRxrOiYV2WGNB9bEYk73JKObw
	 TByHLlIikIUqFcPN/lh+bQlYwJVixbnslojYEAS1eoII2p7JFvbKshefTmPpdpqhPHDmA
	 7BAPDq0qgPKVctDi+Al7Xp2gJtm2iv5haFsOEa6TdqGxSgmLg9sWLi3RQH2pOYugESj8m
	 frepvBo/t43gcp304vAOqiWD6+S1TbURwIQ8+zn3PK/lNIIZ3P8OkwIhwDYM7stJzRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791193927;
	bh=uJko8L1aLs3wEEqTjFIjMBdIjwA/NwsnnMqDVQyQC8E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DYVnEHBDcv6LDTuYxfE5lvZWahBJt9f96DLPA0oNzxkfVoG0udSCDKOIqggi+SIyC
	 j+LAHVzpoFI6ofrDQ9JyOCSFX+WijsShZmiXJoNuftSrCkE3bosgo1VZFyDfrP4tZA
	 MN99KcR5SayFvnIX+KBxZPOlHrY7BPrU0vF0GLN56QBi6nm9bnNIbRsldCNwT7tjqd
	 G1R1MzpWdwpoSsIWRDYmYGgr7pRo6VT3Ov5Z5v7gWRvbXYBH2CvUnr+Ypbx2+QjIqs
	 HdzzdUcNe+UhLvT15TzRa0McYvvInFKDCN9e5+IuD4qQoC9n3Gn3d2TRcbAMw72HQK
	 y+PV4sf2ZNe1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B7CE80BEC;
	Mon,  5 Oct 2026 09:52:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D590C75
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C731F60614
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie1NE977H_5F for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 09:46:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E159060606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791193576;
 b=LUERq4Uf4EqSW8ucJtg/C7GgzqaUUVY+amGb5IZOeSmG2DAHY+ilu4xGRZw/YeqZptJ5
 3j+JN+QJVAH1Sipezm78caa1Jjww/ccbg9gNCqoRd+ZatPWN3fmZDMPc1N75WaXXF2USB
 mTZMXLeEpe9+rs1/g5oKeaY+tBB7DY0s2tkP9jAUr3Zv3QRwa1TgJbmK7ncKjj7edgtL0
 AUAKMUwHFl/lAv/dfHdiA2NMIReHrTbVCMCAyYZxhWsQATd52GunCodGa1sig/PqOr1No
 DW1P6UWvoOf7wPM4RYieeY1LDIM3l+pIr9+YG8eXftmqdajHK6F0t2Dmyf1iji8+6sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791193576;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=25q1ZyE9LzgWQ2nhJpyjIv66CbDY74h9TPRuZMYUQFY=;
 b=B8RCZ0CjNvnTpPEGomvbvJN+Evud8GaNs2MfopvX0R8shu9v7zZNlxokuJ/W0ERbWHxA
 FInLCbvKaFctj9/QbkpUV3qpC+kU2XCAP5gTKJgBVFUclkYpbM27LYaJ8xdMT68sACKX1
 xJj/u3fk/WzXxhfYQrPz4iuRIwK8Uf9CTNWoFQ5P6PyEmpmmwM3aoz7xg2EZxFLH+NtNO
 4v1dJTQuN31c9VgNHmpHi9JNQ4LkzpTPnVET9qAw47bayHxKg3zb07BFd0+UwUWz8Dw3C
 9HBnBgGg3+x1Ln5bJ3s23hF64x8oY+RPsOgt+pZlPPHZQRzMy/cqYyGg/qTGBScYNOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N4cV4644; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E159060606
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:46:14 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-4a174a3dc9dso2828735e9.0
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 02:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791193573; x=1791798373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=25q1ZyE9LzgWQ2nhJpyjIv66CbDY74h9TPRuZMYUQFY=;
 b=1+OlgWBotYQCq6L9WykFV0olo+4fxpLrt+ltpaCTg1kBB9ukFHqjNDmU73iMkI45Wj
 TgxQiH112e0aWleYWhinp4a/SKCNbNpJwvtdUwGRAAvPR9gQoNcIN4lImoWCmJEkba2Q
 k3eH55mTiP7ZGDTbVroFgBrZJ3LDR1v7YBmpZ9dX98YFzlfF1SNgeBLN99aqKONuAxts
 0fje2lI82fsNbUNRZ3ViiF17IpBlhocCNa6ljf+G4ir8vr3Zix2oJdYOuZWteY8vmi9U
 dd29Erk0BIfCJOPzp3wG/02A/7kNbyyhfdHlECoH3wpBtOZiXFNRGnWbDl3TVnXcKTmI
 ymsQ==
X-Gm-Message-State: AFuF++kIGe/Khkl+62Rss7TvwPHI88JczmBdDqqFwrUp6McNjDNQhWnh
 qcstG7Oupj/oqiNGc2KSbU1wyNR3m1unmWN4TQEyDT2jX669HvkqWWdt+CnhERgeJ4a4mtXy5Z8
 FswlJ
X-Gm-Gg: AYBFou2/H+KjJYxisDtolJj61VxZUJ+w/6xY9imXfY099M+DbUzuosJ5Yaxxc3J+5gU
 4Mn40DoBCvt1lq1HX/HO9UMX+3pjwFF9+VZDTgw6ddeowdhwcrtsUdj8NAvYzLmM5ghw1AMfm5c
 W66GO30vPsaHY0I1iBTXKoXkfcLt6Q1Fg4iM2Z86GFIC+FkdmkCTiNidDVMjRMiRgbaWQ+GVRw+
 d0bExe1VJNI+MhFs7TbHsAPAAQBHbZUerN9/lWSJlVwh4crKC3DBHF2Bj7NXvE0FXn3qSKtOShl
 +68b0nHmxiD7iMmNReGwSmq+PfGupRLR9hnk70rjP5Y/CpYq4qO/fS74gofC1wl8M1uB8jyelz3
 r2uSrZuv3BHLJ0sRHZWRAJEPuki4DiacfNLGRGTKXDj4sNwr6n9zneP7Kc5JH8hB4kN8RLLqaB4
 T+FURqkcODeP5+O513QmH8lOG5EFJuF4k1c8uRfWY4x+GCrNlyQg73t2/P35VtXdv+8dWoJ5euN
 QK7dYIbZ4b1vfS+NAj3Z0Hxs+NVdqUPe9Sx/ef4xIr3loRDsLmUZj+pCjIVXg==
X-Received: by 2002:a05:600c:3510:b0:49f:f963:7093 with SMTP id
 5b1f17b1804b1-4a02769b3afmr164317675e9.23.1791193572987; 
 Mon, 05 Oct 2026 02:46:12 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a16d6295f9sm243297575e9.14.2026.10.05.02.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 02:46:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be
Date: Mon,  5 Oct 2026 11:45:56 +0200
Message-ID: <20261005094556.145883-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/{glibc,
 localedef}: security bump to v2.41-167
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:

- CVE-2026-89092: https://gitlab.com/gnutools/glibc/-/commit/fa3ea0362354af7370abb5fe8c6f31a32a73af8e
- CVE-2026-97399: https://gitlab.com/gnutools/glibc/-/commit/f247c0a2fb5b3e48a771d2d23efc9a45c64e957d

(alternative to commit c71fccc7a9ed80ab38c56d54b788bfe92090df35)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index b4549549a0..5e7549cc42 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  b369d2b38357104ba1b3848bfe4139c6a4dfdaea28ac31b3cf2a3985fb008a93  glibc-2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc-git4.tar.gz
+sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  glibc-2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 34a6175855..0c702cc1d4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
+GLIBC_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 3412db3c58..a4b871ccc7 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
+LOCALEDEF_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
