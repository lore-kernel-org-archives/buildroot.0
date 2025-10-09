Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80900CCD183
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 15:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 283EB612D8;
	Thu,  9 Oct 2025 15:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPgPuLeOCajM; Thu,  9 Oct 2025 15:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D279612DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D279612DB;
	Thu,  9 Oct 2025 15:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9C9226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C07612CD
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXWAR0uebf2F for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 15:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DC086128C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC086128C
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com
 [IPv6:2607:f8b0:4864:20::b131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC086128C
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:56:18 +0000 (UTC)
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-637dc2292cfso1176488d50.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 08:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760025377; x=1760630177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8WjVZizcSwI0N8IbiTMq9AFTUfv+w7TrWD0iv8+yH34=;
 b=QYH/eRl5ULIOvhz79O11TeyNcAu59jE63rC2Wg8zLXdGU2N+Esim2Ktb7cTJQU9H5h
 VJbFssGlavkDE0FO0xd643AQeYpdWv9av971E3yUi0p8ZLPR5LmuKZaahLIdnsAw25cX
 SV76Ltk1590rJzQ5NUqHlIPJ6wXSkNPbmlRcSCb6+AUnchR2kEmIjFFp9kF19VOHL+tx
 hMFikFVGUvd379FmkwbG/FBTM+dz7yBVpi7EZKCZ80NBZe1KyUEXM/HQoCUu5022n57z
 ZF1+E33A8YferAJyzun0C34KEHdcbSy++ChyRBEAo09ITLdViIrkpUH+XHJNLohXv89L
 1RRA==
X-Gm-Message-State: AOJu0Yz0DLqiw5McxnXCAcUsDsV+sE7ZQVVW0AZ5nnp6dehGxyNjvKum
 +JsbUVrDETvAnu7RZAlCEw5YUXIqn/amTogHIHDiRw87i2BY+zZx+C+dyD+3Nw==
X-Gm-Gg: ASbGncvKsN/htQspLfOhFegroUs0ibF5abba3AY9qd4LE8DDkyOmeGfBWftoxYjhnvH
 m319uZ6Ipys3o5OhfuHUgCIx583g6txlVBTTqo8JbVeWpZ+zPzYVx9dcRRkIHl1vRrhkez8w7gz
 GV1011BsrgZJlm7/8xj3alFt8Y0IcLKpxOaNij0sMKqs17YCzs5y+XMcujouO0/sennrw8ygt5Q
 3NP0hualLD055eyvIoN2AvvXsypDxc/hl/MmhvKwXp4zWZMNVaujhTLgWMSsQyJTbpC6xbvZIui
 lxf9jhByb2IOpculNszUZ0uqzGfee4xUKXdCzVpHf//LN5UETYXGZhywzyQWZW42teD5vypyw3F
 NA7oXsQZrraI58vU6+EP+3w2WYoZdr58qqMBu8Vc3RWjfvXlPDIflBw==
X-Google-Smtp-Source: AGHT+IGQdSnklAvigGrRdJhdxEDQDAe3FV2vtScnkkN2v+g4gOjx7NaHOfBRnn3QF9lEnfkkP3Hxuw==
X-Received: by 2002:a05:690c:360b:b0:77f:8289:98ac with SMTP id
 00721157ae682-780e1521ea7mr142967397b3.5.1760025376871; 
 Thu, 09 Oct 2025 08:56:16 -0700 (PDT)
Received: from localhost ([66.112.214.180])
 by smtp.gmail.com with UTF8SMTPSA id
 00721157ae682-77fa13b612asm58382377b3.65.2025.10.09.08.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 08:56:16 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Thu,  9 Oct 2025 23:56:01 +0800
Message-ID: <20251009155602.224265-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760025377; x=1760630177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8WjVZizcSwI0N8IbiTMq9AFTUfv+w7TrWD0iv8+yH34=;
 b=Q/+IwOu1RAeSVWjK8Z6vh1ApzMcGe9hUJ6YYLZrSgjF5m9ixBIpwb7K1kE1ZpAolro
 rGA/yct12CQB2O+dIxCBbJJnLsB7cvVHRVpkcTx1I397fHBwpF4NaZP2w+8W3maGquEx
 QrfVHSL0T7VvpGXGNqR9aGjYyExgkbM68X47KSQ/eaRlBpK1w20Zaa558yXQclvmsKwG
 Qcc5jlNRc8bea/AJlYVRKZUTKKpPF8wBDN8X5oo4O6zwFgCIoIKEHZVTl7ZMOoPw+fXz
 690+qVutyklJeMz1Y4iMolXMxClc/XBxNBGxyz25rSeZoBoFJmtSRniM69b3RJ2wKrhz
 G0rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q/+IwOu1
Subject: [Buildroot] [PATCH] package/chrony: bump to version 4.8
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

Release notes: https://chrony-project.org/news.html

Enhancements:
  - Add maxunreach option to limit selection of unreachable sources
  - Add -u option to chronyc to drop root privileges
    (default chronyc user is set by configure script)

Bug fixes:
  - Hide chronyc socket to mitigate unsafe permissions change
  - Fix refclock extpps option to work on Linux >= 6.15
  - Validate refclock samples for reachability updates

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 75555fed9e..6b07b8d56a 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.7-tar-gz-asc.txt
-sha256  c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b  chrony-4.7.tar.gz
+# https://chrony-project.org/releases/chrony-4.8-tar-gz-asc.txt
+sha256  33ea8eb2a4daeaa506e8fcafd5d6d89027ed6f2f0609645c6f149b560d301706  chrony-4.8.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f2aca81d60..d1745419a2 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.7
+CHRONY_VERSION = 4.8
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
