Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA84D5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C54606C9;
	Sat,  9 Nov 2024 22:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkNj5ZZ3nYX7; Sat,  9 Nov 2024 22:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 210C660682
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 210C660682;
	Sat,  9 Nov 2024 22:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66464D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5343040177
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giPRTXNrt0CF for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13B4240156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B4240156
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13B4240156
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:24 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a5e0bfc7fdso12995935ab.1
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190584; x=1731795384;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+NnQ7Pjcc0R472NCa4kjPO7AmfBt5oIuKUkBHajyIjk=;
 b=HFyknTechEtRwsGC0F0R88X8c4m4hfRx9OmGGQvGu9tStG1l3AEV61XfzBZi+qDjm3
 rBnCmWI7BCqs9vUvnM04EOYXIMKpn8xFfKyv62IxyplfCNSDzjTSUcWwONj7jw/RbR18
 Q2m3soQBPOozZX90CRhcK1NNduQ81HRQr4NVbcC2frQPHiIc5nWyr0tMvyJAdLQMAB0g
 2CpcH1PNK+il47LHja8sdN4oUNgcITurAUttPeKZOL66Lr4ZEYv1KdmuBlyh73AZA69u
 wGGo6jaNpYxc/RdneHLDZjZKrglXAgf8pwa3F8Q4D1U0DGq7EI6Rti3MqzapjUD6reY/
 m1Bw==
X-Gm-Message-State: AOJu0YyeC5uNcFbxcKmlaQ8MQsPtTWeLvEH4IIIxSAm5GxEb0dmkZ3KL
 SsLXoHgLpJMCh11MJSv6TKyqwsqFwgx0WCrsIogzt6o8tqo18A+F
X-Google-Smtp-Source: AGHT+IF21WoKTP6EZM5wGZRsfSpPVUqlE2DvVB1XnBVPE306Y/UrU6JXhJjUve5qkkeZZIe2/kx4zw==
X-Received: by 2002:a05:6e02:1a2e:b0:3a2:7651:9878 with SMTP id
 e9e14a558f8ab-3a6f19c33b0mr62337605ab.12.1731190583840; 
 Sat, 09 Nov 2024 14:16:23 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d6e34sm542722173.86.2024.11.09.14.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:23 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:15 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190584; x=1731795384; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+NnQ7Pjcc0R472NCa4kjPO7AmfBt5oIuKUkBHajyIjk=;
 b=KntpVubhdgPsX1ftqyr2uwG4oDuWzuS3nUP5hPXYUATD35hEnnK5fUPSceaI1ZF06L
 B6EH6COJzhiApCzjkqsiRN7NYfqy4wzHHDgZMNAOdKYaBsG506rqTXedEu/D94TnU5fp
 JB7ZoUy2bBAPSmjH80DcrcxdrcM/MJXnBzdCG5C+eOOEpGdPj64S/0WsV3gNMD1K6MRW
 nsam2Vp00x+LVS5yutIMsKIv20RZ126EHt3DnO2wftZaqL78PfR0WuHOBp/NBcwh2Kn0
 7k0ppfw+RsQIB10uFjV+PP13Ux7stjm2gi8nNpJ77IOndGknjVv5LKAmjrhNW6keqmrD
 9BMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KntpVubh
Subject: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add shortcuts
 for genimage partition-type-uuid
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

Prefer the use of genimage partition-type-uuid shortcuts over using the
full GUID. To make shortcuts easier to find, include a link to the full
list in the genimage source.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 docs/manual/writing-rules.adoc | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
index 03e4f2c61cfe4820fe6d06d193b9215d423bf4d7..10f25a7011db2f8d4ea7c4acb3ea66c4dcce7a86 100644
--- a/docs/manual/writing-rules.adoc
+++ b/docs/manual/writing-rules.adoc
@@ -198,17 +198,23 @@ image sdimage.img {
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
+* For GPT partitions, the +partition-type-uuid+ value must use a GUID shortcut
+  if it is supported by genimage. These shortcuts should be used without double
+  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is specified,
+  lower-case letters should be used. Even though the shortcut +L+ is the
+  default value of _genimage_, we prefer to have it explicitly specified in our
+  +genimage.cfg+ files. Some common shortcuts are provided below, for the full
+  list see the +gpt_partition_type_shortcuts+ table in
+  https://github.com/pengutronix/genimage/blob/master/image-hd.c[].
+
+** +U+ for the EFI System Partition (expanded to
+   +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_)
+
+** +F+ for a FAT partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+
+   by _genimage_)
+
+** +L+ for the root filesystem or other filesystems (expanded to
+   +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).
 
 The +genimage.cfg+ files are the input for the genimage tool used in
 Buildroot to generate the final image file(i.e. sdcard.img). For further

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
