Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB9ECF9C6D
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 20:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E70405F8;
	Sun, 22 Sep 2024 20:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoWvTNULgC_z; Sun, 22 Sep 2024 20:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6046405B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6046405B3;
	Sun, 22 Sep 2024 20:42:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A26CF1BF39D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 20:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C379607C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 20:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FWeg75E9Vq8 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 20:41:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0E5C60790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E5C60790
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0E5C60790
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 20:41:51 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7b0c9bbddb4so2463593a12.3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 13:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727037709; x=1727642509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qV6qbWUeYRKvl1KXFLFK05Nl1rbeUZXKC/BlHo6dl8Q=;
 b=XpZgaJgUX7AsXQc8ntFpSfw6a+gTVYew1+n5jv/jcpRXzFqCASM6vXoRwcB7r7d1mL
 J3OIBc+8tGJbMchqUTKozcthCRwQDX351QfMcKJ2K5JIzT4nRhUYbug7t4Nf1jfqYFDT
 OTNaJUmqrIl3xcUWcmXKh0jDPPDTGvHpjkyUfvrBMgGG+BK2McMfpOHdjUY+TKWkD0F7
 wciL2VtkL0EdTQJoLzgY/78munuSne3dP+rYepZLbVyZ++PKMRAtNukguu/sc24ksnFQ
 o2RkCSShv/vTQxCK3gBIQsLDuhoVYfYPlL3nTHNcdsy1Xx4GSmu7HpxXPAHbYwXXjmlp
 AVTA==
X-Gm-Message-State: AOJu0YzLLNJSb0OGxODYRXdu7CtJx1qE1zgJB5sRumjosHAVDrkmGlII
 Mx9LcxR+IO/Eqo/bN6Ks1/6axf3+rAEHpzn2myyzOlAGIJ8tF7Sl4RRGMjnDLyc=
X-Google-Smtp-Source: AGHT+IHxWcLWqhM92Zck/r/jSYAg/q07tEEefpPhzArhDqx6D0OH0sVUHyHURbDdTD+8PkotVkQfGw==
X-Received: by 2002:a05:6a20:cf8b:b0:1cf:2438:c9e3 with SMTP id
 adf61e73a8af0-1d30a91b479mr14439607637.16.1727037709238; 
 Sun, 22 Sep 2024 13:41:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:ad2f:66c:ef69:238f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b975dasm12757243b3a.158.2024.09.22.13.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 13:41:48 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 13:41:45 -0700
Message-Id: <20240922204145.3704517-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727037709; x=1727642509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qV6qbWUeYRKvl1KXFLFK05Nl1rbeUZXKC/BlHo6dl8Q=;
 b=FhbIfFcYkK4lFBUT+vv6+obXsG4ITs+3EVXZBeCcsaB5mNWaTiAPI2+9feXXWghIes
 X0+MtIdGJMXrN66GR3Yil0A9fMWYLTmunzCX6+08+5ZfQLJEWUflP4t+iRlNShG/mpuz
 Lf8WyYuvKIP94+dHiMZqyffihxHbsEu+kWPQZYAkRESHyGBLakDme91dV0KNyxQq+h4t
 fwWzgGy3cv1L04uck/4IbNXzDQg4Qtukgz8NVHejw0kOr7BuS23BX+hu4XT5aZUUNP2l
 aNY8uMlwxReJl7lciBA4MK2AEZ+PqIKj4/JI9prRb3O28sEAS5zMThb/tOJGXE0UcH+Q
 2/Sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FhbIfFcY
Subject: [Buildroot] [PATCH 1/1] package/tcpdump: bump version to 4.99.5
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/the-tcpdump-group/tcpdump/blob/4a789712f187e3ac7b2c0044c3a3f8c71b83646e/CHANGES

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 1a22889851..b29ac06060 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.5.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea  tcpdump-4.99.4.tar.gz
+sha256  8c75856e00addeeadf70dad67c9ff3dd368536b2b8563abf6854d7c764cd3adb  tcpdump-4.99.5.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 91643e7bea..f4086ef124 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.4
+TCPDUMP_VERSION = 4.99.5
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
