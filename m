Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C4D10F2E
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 21:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D642160598;
	Sun, 17 Nov 2024 21:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKxtO68CI_zg; Sun, 17 Nov 2024 21:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC77614A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC77614A1;
	Sun, 17 Nov 2024 21:00:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AFB0DB3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 21:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDF94018E
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 21:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAa1mzR8XgMP for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 21:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D48924095F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D48924095F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D48924095F
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 21:00:41 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83aba65556cso57952839f.3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 13:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731877241; x=1732482041;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wB/LyMpzLMLUG3/sHkcg4KqjM3jQl7qP3tUgXGSITjk=;
 b=iBpxJ1keP58KUBLKYZHZJvT+257GUUi9nVcSFdARYq5m4ng8BFWoMbCe9DYLru/eqA
 GaoIAHoKL1sl3GWUaSNzAB5rE9to7i2C4tX0X1AhHCCWShVgHIzdzGCOQesYfk4+4xgJ
 mGjrubdQByzk8zKqid9q831+C1uxLBz7C2zO+S03YQUHVm5hiUVuslfaB3NZJFkyO+S0
 AAknb6jfbcBx2p4BvDk/eeXTco9OCeKyYbAPPLus4jCf1Z+3+XSgJkgq4oLAAbieEerF
 uYCKtnlkU1n4jH/ehjZjFrlcW5p+cE8nk1YIdg7R2fu2hP1f7hc36UcLmzZN1snnuRFz
 5l5Q==
X-Gm-Message-State: AOJu0YzPENbNLtuXPLGvKvuLdf3CDUUjqjnfyQZlwhQBOuEW/fiuorj2
 GFt98wrMvmhuD8KBkjHYLmB7DZvK0Tbo0326vRJBUu0OWf/Vcxs5
X-Google-Smtp-Source: AGHT+IHlr7f0AdwJLKzGUZhzSJPzMkIOs5oMVkKFPipBimHUVtMqrpMfZ+Be3R3w/TTQw5ek93nWHA==
X-Received: by 2002:a05:6602:2b89:b0:83a:63f4:ad73 with SMTP id
 ca18e2360f4ac-83e6c0c8fe1mr1173798239f.4.1731877240445; 
 Sun, 17 Nov 2024 13:00:40 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83e6e00086fsm161590539f.27.2024.11.17.13.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 13:00:39 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 17 Nov 2024 15:00:38 -0600
MIME-Version: 1.0
Message-Id: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHVZOmcC/42NTQ6CMBBGr0Jm7ZhORQVX3sOwaMq0TCI/aQuRE
 O5u5QQu38uX920QOQhHeBQbBF4kyjhk0KcCbGcGzyhtZtBKl0SqRs+D9Cb7yYQkKc8xrRPjPEu
 LFZf2pplVSQ5yYgrs5HPkX03mTmIaw3q8LfSzf4YXQoW10xeqlL1TfX363sj7bMcemn3fvxf9Q
 LvIAAAA
X-Change-ID: 20241109-genimage-partition-type-uuid-8e4c62ee041f
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731877241; x=1732482041; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wB/LyMpzLMLUG3/sHkcg4KqjM3jQl7qP3tUgXGSITjk=;
 b=CDQa4/j8w5hTBhFwu61GUWqJCqQ1WjJOdISdV+Hs58e/kSSXwEw2vFctzbUNhhHHyP
 093P+0EznCW2PdkCf37hJ0A2ngyD1utNPrlGTNWvm7PZsILX2zEGeCyIfaBLRj0YjV7r
 Q7yT2w93JXM0F98+KsuKYMwswI3oSjuyJeYqwHVZ0h/4G50iSp9FPCS/3lwToxHtA2sy
 kYm1XMEk08tYzr20tF6KYARn3GRaDBylukxbCDs8tVZsKLERjdRK+NvmFmgw7HaOayVZ
 9OfRrTOaCCWpAVN5Zse6u8WShSnRGSmL5Twd1gHi+cAQORnVInJi25ym249sN5beyp8a
 zzHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CDQa4/j8
Subject: [Buildroot] [PATCH v2] docs/manual/writing-rules: align use of
 genimage partition types
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot boards use a mixture of the GPT Partition Type "L" (generic
Linux filesystem) and "root-x86", "root-arm", etc (UAPI Root
Filesystem) for root filesystem partitions.

To have consistent guidance on building disk images with genimage,
update the docs to recommend using the UAPI Root Filesystem types. The
UAPI Root Filesystem types are part of the UAPI Discoverable Partitions
Specification (DPS) which helps set a wider standard for system boot.

See https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
Changes in v2:
- Update docs to call out root-* partition type [Niklas, Thomas]
- Drop GUID board updates for a later patch series
- Link to v1: https://lore.kernel.org/r/20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com
---
 docs/manual/writing-rules.adoc | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
index 03e4f2c61cfe4820fe6d06d193b9215d423bf4d7..3964deca867494ca4df70f3c0d92f9982ec6deec 100644
--- a/docs/manual/writing-rules.adoc
+++ b/docs/manual/writing-rules.adoc
@@ -198,17 +198,32 @@ image sdimage.img {
   chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
   (not +kb+) in place of +G+, +M+, +K+.
 
-* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
-  the EFI System Partition (expanded to
-  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
-  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
-  _genimage_) or +L+ for the root filesystem or other filesystems
-  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
-  _genimage_). Even though +L+ is the default value of _genimage_, we
-  prefer to have it explicitly specified in our +genimage.cfg+
-  files. Finally, these shortcuts should be used without double
-  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
-  specified, lower-case letters should be used.
+* Every +partition+ of a GPT image (e.g. +partition-table-type = gpt+) must
+  explicitly set +partition-type-uuid+.
+
+** Every +partition-type-uuid+ value must not be double quoted
+
+** Every +partition-type-uuid+ value must be written with _genimage_ GUID
+   shortcuts (for example, use +U+ instead of +c12a7328-...+). For a list of
+   GUID shortcuts, see
+   https://github.com/pengutronix/genimage/?tab=readme-ov-file#the-image-section
+   If a GUID shortcut is not supported by _genimage_, the full GUID must be
+   written in lower-case letters.
+
+** Every +partition-type-uuid+ must use a GUID from the
+   https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[UAPI
+   Discoverable Partitions Specification] when possible. Some common partition
+   types are as follows.
+
+*** +U+ for the EFI System Partition (expanded to
+    +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_)
+
+*** +root-\{arch\}+ for the root filesystem partition, where +\{arch\}+ is the
+    system architecture (for example +root-x86+, +root-x86-64+, +root-arm+, or
+    +root-arm64+)
+
+*** +L+ for other Linux filesystem partitions (expanded to
+    +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).
 
 The +genimage.cfg+ files are the input for the genimage tool used in
 Buildroot to generate the final image file(i.e. sdcard.img). For further

---
base-commit: 0df7dfb804457a62c7751eec6555ad75158e3e3d
change-id: 20241109-genimage-partition-type-uuid-8e4c62ee041f

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
