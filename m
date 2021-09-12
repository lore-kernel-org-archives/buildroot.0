Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D417BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2B8610CB
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D2B8610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F1F40477;
	Sun, 12 Sep 2021 14:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jELZhKDV_T6v; Sun, 12 Sep 2021 14:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E911403C6;
	Sun, 12 Sep 2021 14:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D51461BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D118F401CC
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXARn36t5F9h for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC7924013A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g16so10437312wrb.3
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/o++rGDwtvYmQnVO0Bu+VVu6yzfiRTmSre1V6Naonr0=;
 b=ftxJUvuK6R9k0MuM7E/PKqZizMZJiu/1lxRYRiIRgP0yERg3Ma7cq8jqR0MBx3WzZX
 q6CLVYaBp2W750wmxiB+cThpSNLrDItf4XDpT9eOGEfLptg//rckotqbgbguWfQWp4a9
 xw+u64WfPHL82EJdZF0o1BNWZQjPA+2P/h/poyrFmKIEl0bD3ZmGusLJb8VOWWeRGbC8
 S9cjHG45PCFkYr0baFkEtkuJllz05Ky8nQXtRoFQdJuu8f8Ta2iX+zBNkhGLJ1NnbQGB
 0FM0nSGq76A3DEHx1bOhwchTVzl8kmBclDBSBWPtRsZ2VlBLR8RcASW0gRyS3EFyCZ1u
 Uieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/o++rGDwtvYmQnVO0Bu+VVu6yzfiRTmSre1V6Naonr0=;
 b=DbDGV/EP9uM4bFkskpHW+x7lTDeoCkbQs6jz28+agJ4He2WIyzliS4AL8C+itV6X6v
 5oXjf0JrDzIRgnGGnVve0WltUUCuPSkkcloP3DBdg4GI7pny7w46w6ugvxe5iGfI3r6s
 N6isGJ32l0PyV2ZdOncOFeDd3EAM64pOalN6xFyGAFJIor0i0+uRfvs1Fn47qJ32waPE
 UQoxTYOzEGZMCCKhFi+vbDvsvggyZQXXgl0Pg044qXfB0XU3BE+usqss5QG5suygwQ1/
 UUgBek6bKrKjoV6B2MqXu2TlvDNf3bpqsPFZs/0lxw1tz3jJvya9fFyrfrS58AGp0Avn
 uQ/g==
X-Gm-Message-State: AOAM532eK6fEMPR9j3bifsGQIz5Zx5jhDWoGqwd1RqWCCs7nmNpiCEsK
 jmD20UsmYN9fACGz40/Qrut+hnOWG08=
X-Google-Smtp-Source: ABdhPJynk7LvMkurLUwH9Fh16r57TUr/Ho1Il+YOo8kPEc2Y9xrgW2w0eFWkT9dCkXekEJtjAtlgiQ==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr7863657wrq.145.1631455917993; 
 Sun, 12 Sep 2021 07:11:57 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:57 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:39 +0200
Message-Id: <20210912141140.253778-13-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 15/16] support/testing: update logical
 eraseblock and physical eraseblock size for qemu >= 2.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The current ubi/ubifs test (test_ubi.py) rely on a Qemu bug present in
2.8.0 that was fixed in Qemu 2.9.0 [1]. The ubi/ubifs settings is
updated to run with Qemu >= 2.9.0 using the new multiple chip handling.

If needed, the old behavior can be enabled using the pflash01 property
"old-multiple-chip-handling" [2].

The issue was not detected until now since we are sill using an old
qemu (2.8 from Debian stretch) for testing in gitlab (using the
Buildroot Docker image used by gitlab-ci.yml).

First the logical eraseblock size (LEB) must be updated to the value
0x3ff80 reported by the kernel when using qemu >= 2.9.0.

  UBIFS (ubi0:0): Mounting in unauthenticated mode
  UBIFS error (ubi0:0 pid 1): ubifs_read_superblock: LEB size mismatch: 524160 in superblock, 262016 real
  UBIFS error (ubi0:0 pid 1): ubifs_read_superblock: bad superblock, error 1

But the system is still failing to boot:

 UBIFS error (ubi0:0 pid 1): ubifs_scan: garbage
 UBIFS error (ubi0:0 pid 1): ubifs_recover_master_node: failed to recover master node

ubifs is reading garbage since Qemu >= 2.9.0 report a sector
length per device divided by the number of devices (see commit [1]).

The kernel detect two flash devices (dmesg):

  Concatenating MTD devices:
  (0): "40000000.flash"
  (1): "40000000.flash"
  into device "40000000.flash"

Divide the physical eraseblock (PEB) size by two.

Tested with qemu 2.9.0, 5.1.0.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1543100932

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=feb0b1aa11f14ee71660aba46b46387d1f923c9e
[2] http://lists.busybox.net/pipermail/buildroot/2021-September/622069.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_ubi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index eeb55b1d59..7c687c1982 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -8,10 +8,10 @@ class TestUbi(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_UBIFS=y
-        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
+        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3ff80
         BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
         BR2_TARGET_ROOTFS_UBI=y
-        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
+        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
         BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
         """
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
