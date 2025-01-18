Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E0CC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 09:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F5D64266C;
	Sat, 18 Jan 2025 09:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pwp5uSOAszs; Sat, 18 Jan 2025 09:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F34142699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F34142699;
	Sat, 18 Jan 2025 09:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4940B69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 227CC70500
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zt-lJYnWdeH for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 09:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30248704FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30248704FA
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30248704FA
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:30:58 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-216401de828so52709505ad.3
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 01:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737192658; x=1737797458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d0EyW0xVfr0+9E2GcfR6wBSUv7wVRjPK0EwEJikyQjw=;
 b=vR5Nk2lVtcYt3gzKLESApmFytJVKYL/o5olPsvuMGs4Pz+UeEHRz1qbQP6PHbPqQQ4
 rrroXCHjZIeR6CPIkBeiHMZtyvrpLZA9nsZUWIewkNO30Wf6tgEr1sJx2QGNQvshRTuN
 78RRTz3m477wMMeJepu+Qp3QGbk7pWcKTrEB3b7iZJYYVrCPAJ3rhWQZde3v5dWpqqO+
 TaKQ2fxEpvxYD452KNE/vSRxWbPn6L2w3AYjOZGa0GKL+T2j3p1cBChcMh20sqmSdRMg
 qSt2Hk49IqFIBqBBm+5cnycSx1GkvjL1SOr9xikT3cOTmQyQ06z/FYenig6zriuEwHVs
 ETdg==
X-Gm-Message-State: AOJu0Yz8M6mZ1JcHFCVq34vRnSwzCOE5xd7gN7UBjYni+s5m1QAhY+qd
 zu4orkuBXWClK7pJbZLGA1ZySNto4F4fCwEfag2L98djUvRn7qvcDc73dqmJ
X-Gm-Gg: ASbGncsuc+6g8yfcI49zBDeteZQz2Ue8UyFwti6Ps9kCKTkRf+sRjjE93NYu9krs2Lm
 05lMgJsqCdgv54bXhZTFXWYfBisO02lALDzLqx2KpdPZ+uA/aB8mNLTDHuC1eLe8PY5JkJj4z7G
 Ow8PGOMxulDO6vC8aR8SCt5KpRnL2/ms2K5FKLqhGrRI5w/zYkS6NiEIRgmuUSQWFa83ias5Cyy
 7ZSWZlc0GDxQSjiQWh747zE0slYS/jbs+mZhQ5RSWyd0177lzNGybG8LMQYpOU8tGHedfoCitLF
 HlFIQ4j590PjILZ3SsfrkojNcnfdOowvHOYCsRrUvHF6YqIg9L7Bcw==
X-Google-Smtp-Source: AGHT+IGq9ZPwOgjOt/jcjYNlsQdtjd9C8QUyTnnVhS4S1EURmRuHtDJNr8eVggQGG8gvffRoxGL/dg==
X-Received: by 2002:a05:6a00:929e:b0:725:e73c:c415 with SMTP id
 d2e1a72fcca58-72dafa9ac7dmr9298601b3a.18.1737192658027; 
 Sat, 18 Jan 2025 01:30:58 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab7f0436sm3325017b3a.22.2025.01.18.01.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 01:30:57 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 18 Jan 2025 01:30:48 -0800
Message-Id: <20250118093049.878701-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737192658; x=1737797458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d0EyW0xVfr0+9E2GcfR6wBSUv7wVRjPK0EwEJikyQjw=;
 b=maclsmilLkwAvAwX/birvyiDN8yOjlvoV1DmBjF2GSnBfo0CygQeCW0sosARRt50oy
 g4qE2PcZEc0GjceHcodoDBSryA1zFV0yH3oIB6W3uaHkveSx0fiK2lP2Ci83vkRztbi6
 6R+KzqvAq9e7a6fsaLkKjAEvKf6YabiLIGBizp+DhYyXpP46NXyWbSkRNRwMQXC7ASo8
 TT5tw/24WSYlbyvJfzcY0KIP2BPWGV+o9WuUTJLC7J/e6E/WW8bnxjwcGzcRroaTnKOc
 7gcBB1CatXIc+QnWpyqrDUpMQ2Ra/XtEAWD2zr2ztWVBgG1djhoYvnmwpACvVYmtyXye
 L7SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=maclsmil
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2025a
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

Release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/

Rebased the patch and updated the hash URL.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../zic/0001-remove-dependency-check-on-version-file.patch    | 2 +-
 package/zic/zic.hash                                          | 4 ++--
 package/zic/zic.mk                                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index 1eb1074c31..81190ba493 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile b/Makefile
 index 0087b459..4773a977 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -673,7 +673,7 @@ INSTALL:	ALL install date.1
+@@ -675,7 +675,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 124b724e6e..9e89aad23a 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
-sha512  0e4e872d6c6d9e2ce8c4e567fcbb7658942b8544157d1e48673d9cb989f3af3379fa58e7a71ab98f4a8f2ac6727de1f8c4cd1981053409ebd8989345dc640026  tzcode2024b.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
+sha512  308f6a3d6ebfa18446f8296e5c799e18dccecd79ace3ba004d3f233892c7428faae152b217b22d229c59dd4e0faafee797d8b3583b58fa982b81f7cc7347f502  tzcode2025a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 9382fa4187..71454d4fe0 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2024b
+ZIC_VERSION = 2025a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
