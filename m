Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23B7C35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F86240198;
	Sun, 15 Sep 2024 05:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8PdEIS7chhq; Sun, 15 Sep 2024 05:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67DA8401AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67DA8401AD;
	Sun, 15 Sep 2024 05:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 537001BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F852401AD
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNWhHNVl_blF for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0170940198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0170940198
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0170940198
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:38:07 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-39f526fd19bso7462065ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726378686; x=1726983486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YOp4tmu9WXPnwtU0NhyOMNScMi25ooy0lVMmaelxaRw=;
 b=o9H9kyputjGOK+ns5WmDErkIcUypTLhEEpvZOEKAWfWoYX2TyAqHvmDEj6gUCUSB7S
 UqyN9DNfZBmvftgcH4HPsdkGkdTAH47hcOKcTBfkKEuDA9K09lxaQBV6TxIHdoKFjm8X
 KWhM2zhitlOUpCZUt8Pha0yxhNsVobUEEirA2YxTE6RZHEqV+PrZUdyK/qyXOcbDktLj
 JrLFpcEQolL9JbxM+DF/FMA4pCsF/a38/fRuVNJYc0djCQjEM6y/cXZFnfcpZy9pOUd0
 3EspU9BBEH+Cof29Ju6GjFVJRr8pyg9/bVeQoOgNiFr3V/1iKg3Xkldl8p45skVyOOg+
 7uRQ==
X-Gm-Message-State: AOJu0YxHAtpPoENZfxHzySfNpLhOhamph/m2b2w7KGlrso2+fja3jyav
 L2y/wr4blCmK28stJaQh2Ms0ddEh6z0PIyRb4b/ehDC+YkQY4i2tV9/dYw==
X-Google-Smtp-Source: AGHT+IGgUB08pnbbg288Riy59EdQFUeukzl51DrF9nb+Ixk2dG2uWMhQ3aEoCTk+uvQYCHolbB+V8Q==
X-Received: by 2002:a05:6e02:1543:b0:39f:36f3:1957 with SMTP id
 e9e14a558f8ab-3a08b6f7e96mr78393105ab.3.1726378686315; 
 Sat, 14 Sep 2024 22:38:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34da6sm765456173.147.2024.09.14.22.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:38:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:37:52 -0600
Message-Id: <20240915053752.1421744-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726378686; x=1726983486; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YOp4tmu9WXPnwtU0NhyOMNScMi25ooy0lVMmaelxaRw=;
 b=BWXra0c1H1PxIMhW+frHT6Mv6M0q1bIhV6quRwifevaI415JeJlDuNivhJZ6h0rhov
 2MVXyezgP9RttmG76wKjAPDjdRUGBWmDsww+VTY59Dc8ItRmfHSrJspK/xfnF6yQCMxE
 uo3GPMPBx6Keket+fYmxi0Cd1WM8U2fCKeMUZqt/hheQaJiH9SCVhZ2GgBCIj5kiRtJq
 r+C9xFV9btXf19xGXnGuKAUGSgJhMUgQWqQfqDzIwP/Ied+PkdzxakQptR473wnW2A7x
 7bNqffXENkxHXBQmm+CeBRIL3wsKijTapb391v83a3AK0W4SuptMzoTjKo9NjrwSwrFt
 12xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BWXra0c1
Subject: [Buildroot] [PATCH 1/1] package/python-evdev: bump to version 1.7.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index 9a6d0d07be..afa74c792b 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  905b12ef6136b518ddf418d8d5b053e4  evdev-1.6.1.tar.gz
-sha256  299db8628cc73b237fc1cc57d3c2948faa0756e2a58b6194b5bf81dc2081f1e3  evdev-1.6.1.tar.gz
+md5  c20a623d2d05fd87c1f46d736ee9c3cc  evdev-1.7.1.tar.gz
+sha256  0c72c370bda29d857e188d931019c32651a9c1ea977c08c8d939b1ced1637fde  evdev-1.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  55fd76d7b3f90d312f161d318631b93c58a0e69d662d07c4f5aca2c6c9ecc85e  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index b509b43e8a..269b290dca 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.6.1
+PYTHON_EVDEV_VERSION = 1.7.1
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/05/50/629b011a7f61cb2fca754ea8631575784bf8605a1ec4d6970a010bc54e2b
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/12/bb/f622a8a5e64d46ca83020a761877c0ead19140903c9aaf1431f3c531fdf6
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
