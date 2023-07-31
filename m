Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF2CC001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863DE416E5;
	Mon, 31 Jul 2023 14:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863DE416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNALWNM35fU5; Mon, 31 Jul 2023 14:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3A4416CA;
	Mon, 31 Jul 2023 14:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3A4416CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6541BF38E
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 164CC81779
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164CC81779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGrdSgheCoU0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:02:47 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA19F81773
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 14:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA19F81773
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-997c4107d62so672015266b.0
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 07:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690812165; x=1691416965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCb9gVEPPWffIt26NjzHsEL24fbTepVYNXN8yZyAT2Y=;
 b=ZpBp5K22mHO/sioGo+Ma5+JSvwfJXzr0cojdEAeztm9ODiFYkaPU31BnH+rg4xQGjD
 DWGqOr+MUcrSHPjpmtxi9tgNKMro7QXnuLl+D8VP+sZZHtcZ6rrVsGOpmvolTbATp0+G
 Y7+Lmvi6JVLgFfKM6Lp/EB9LUY/sPSJws615+6PnewfmmzZWJqsGNvEsgdctFCvboUnP
 2fhiDmrdrCCYCHbbwaN39F9Ev8dkjDKXjrjpPeO1f7bCIpEzgdYghJZKm8PuAfloJb8h
 72xwBy19xmgdVAsbAjTR9Iz/7GWr2qmpFSUB4OdYeYgycJ4422EBWE/8d5yIwV53afA4
 IkIw==
X-Gm-Message-State: ABy/qLY0twqwUqAkkX0eJjkQnXUWZspkPoFRWLt9tqzdsITeOFKj7vdY
 dR4/geR8MiMT9CjGDX8BSSxuC8y/JNk=
X-Google-Smtp-Source: APBJJlE6BuORHpTt5Cn8Z6spaLChY0de966w7so+2AcTrBsTkEDc4F19V7y/8EtDJFU11u7IfuMQ0Q==
X-Received: by 2002:a17:906:53d3:b0:98f:5640:16a with SMTP id
 p19-20020a17090653d300b0098f5640016amr6981029ejo.53.1690812165055; 
 Mon, 31 Jul 2023 07:02:45 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 i22-20020a170906265600b0098cf565d98asm6210881ejc.22.2023.07.31.07.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:02:44 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 31 Jul 2023 16:02:40 +0200
Message-Id: <20230731140240.73537-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690812165; x=1691416965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XCb9gVEPPWffIt26NjzHsEL24fbTepVYNXN8yZyAT2Y=;
 b=Gxwdp3QUKa6Ge515n0Jl1LpxAch4BagmjNalCbP9Z3qS0k+k/U1bW+onK0LA67TQ69
 PZW38YZNCVALXONnyx04FtUN8V5xSVktc7hUkxJh3bcS4BItK6QOax1TuyIQNNMMPbl2
 j8XVtBB6NW1GoMBhnMepvBnKH5TN3Dh+pUB2cT3+otzbtu/G8E2/l7kDz4CfM7piFJHC
 yNVeOZNy57H7BBa/ZNBIS/z9px4lBRs2zqkZtkHYRq1tiZFcwvdarRCXoG3tdUIWB9i8
 wYoIXCvO2NqfOY7Q+L0Xyr6YjyM8Jfhi87p5SOjg/mSXVY8EdUVLfwOJogBCUABMVSn3
 UTXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Gxwdp3QU
Subject: [Buildroot] [PATCH] package/qemu: bump to version 8.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch  | 2 +-
 package/qemu/qemu.hash                                          | 2 +-
 package/qemu/qemu.mk                                            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
index 60518bcfa..fb7a9a698 100644
--- a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
+++ b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
@@ -15,7 +15,7 @@ diff --git a/tests/fp/meson.build b/tests/fp/meson.build
 index 8bd0979f67..2fe019d2c6 100644
 --- a/tests/fp/meson.build
 +++ b/tests/fp/meson.build
-@@ -636,6 +636,7 @@ fpbench = executable(
+@@ -640,6 +640,7 @@ fpbench = executable(
    dependencies: [qemuutil],
    include_directories: [sfinc, include_directories(tfdir)],
    c_args: fpcflags,
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index b6fcad83e..e71742c24 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5  qemu-8.0.2.tar.xz
+sha256  ecf4d32cbef9d397bfc8cc50e4d1e92a1b30253bf32e8ee73c7a8dcf9a232b09  qemu-8.0.3.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c530896fa..b341d0220 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.0.2
+QEMU_VERSION = 8.0.3
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
