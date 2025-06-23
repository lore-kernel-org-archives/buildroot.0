Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C38C7115D
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 08:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FCE760E9C;
	Mon, 23 Jun 2025 08:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMEN0Ra85ZvH; Mon, 23 Jun 2025 08:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A6D5608CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6D5608CC;
	Mon, 23 Jun 2025 08:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B174154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A85400E5
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5R3wdums_IZ8 for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 08:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 054C8400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054C8400A2
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 054C8400A2
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:39:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so1589489f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 01:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750667991; x=1751272791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uxTDVhG8UX7A0ZR1cUXBADxbI7ZhkuUxVnIUW5N0BMQ=;
 b=cg7QiTWzPoAMJE36M81v3T5o0xjvzSTSuKfsafs5RgThPdB09Hm9kHGzJ2eXL51d+0
 tjMcaTB7tdu2ryKbee5vnDLGlmf4Ob1ewcVTQqq5VdU6HcJxyPz0//TVhFQx5k7rWDgm
 gKHoC759DohSGoi2dIl0Bc/SlKJngjznSR51aLp91Goby+oH9Fhv7oaIs1/kqXrPmwB+
 5FpNa5LnIbIPGF/DQ+jHi72EvHLKkpsY5w5a4CZGTT/yJXHVAYBVo8GlxWX4c08UlAXe
 P2tmRxs4HZzVHPgbfOVqcoEeyqEWvQW6gKXTDmIB1F6n49KNdpkl4ZbUivj3TKqduSWj
 R9ug==
X-Gm-Message-State: AOJu0YwFCRUIAdFljEdGoj4cHNVaLzbQRSW/BPt96Ls1K46H9Olf6rnJ
 tEIZV/htCedYxjmGtwwMFeAyuY40ECu2Bk31YvIk65b/75IJpvQVFn2yZu+cFm4/J71O622xY3/
 XiVx1aolZgA==
X-Gm-Gg: ASbGncvNFeA9RDALKynyfVYJ8zuazlh1dHMG64H1kFnKGEFSLOJUMscBMMhJkIGz0rh
 IAX5ENa+mUpWPDAMi2Nzg/0IQC9rz/2rkIhgng+7JB6V7qUshQB8+XtlWf0b3PJc1aw1b+7vxbL
 N9+GnQRD6c03hRbqtd6FTIYPLtmpGf9twHLBSsGEcbEonT9IA6fX2y2D925kR4gr/YGiccydWHP
 lR96rRzMaOYKjzZjwYirZwk/IHesoRnlU+ZXMi4ACOVbW2KQGE5CiYoTDRfInHC90Ga5+zqhwvW
 1+4GeL3JQTMTcP7s+sLSBbTccNl2kV/3PmxdHFXl2gCMevDGOKoz6rFZV6PvUH6/lxxNfvHlI5g
 iY9naw2x6Ai8AEugQHw==
X-Google-Smtp-Source: AGHT+IHB81LLBYGM6vn6cWzoZj7etqIjBkPGDN/asKuPI4kSoUinlZJHazwLwVjrU649X4blqrGcDA==
X-Received: by 2002:a5d:5850:0:b0:3a5:14e1:d9ec with SMTP id
 ffacd0b85a97d-3a6d12e6386mr9084556f8f.51.1750667990962; 
 Mon, 23 Jun 2025 01:39:50 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453646cb64csm106363945e9.4.2025.06.23.01.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 01:39:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 10:39:41 +0200
Message-ID: <20250623083941.724176-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750667991; x=1751272791; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uxTDVhG8UX7A0ZR1cUXBADxbI7ZhkuUxVnIUW5N0BMQ=;
 b=ZckOobog2wimmLcq2KWhUdwkfizJd+4BDfbrsfySh409OJMM97Gwe/vCeCRMazSrx+
 eJfRNk+Nw1ghInG5gxxYtFl4BpDHz+vSpcpRPEOLQlLnw8Nw0+C9FIjz0ixFdM4Tjwt5
 H5TicS8wON96juVaHCbEjBb8fO5M2nqLxk/BVUKdxmtMDJ1L/3qQ/bvoyJRDUBXms99X
 i7UbkIonRpIsxaXojh4WJu3e42//LOcLa+e92gICv8vKrR+BwscoDoDzJhtrux3ol586
 ux+wb9cG3PK0XzL9dzUXjpq62Twm+B5or41PHoegSdyzt8rixTp8tfaW3JpQy8ttSWzW
 kcgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZckOobog
Subject: [Buildroot] [PATCH for 2025.02.x] package/python3: security bump to
 v3.12.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following CVEs affecting tarfile extraction filters:

- CVE-2024-12718:
    Bypass extraction filter to modify file metadata outside
    extraction directory

- CVE-2025-4138:
    Bypassing extraction filter to create symlinks to arbitrary targets
    outside extraction directory

- CVE-2025-4330:
    Extraction filter bypass for linking outside extraction directory

- CVE-2025-4435:
    Tarfile extracts filtered members when errorlevel=0

- CVE-2025-4517:
    Arbitrary writes via tarfile realpath overflow

See https://www.python.org/downloads/release/python-31211/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2772e33109..923a632165 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31210/
-md5  0c0a6cce86d7611aed691d61e0599de0  Python-3.12.10.tar.xz
+# From https://www.python.org/downloads/release/python-31211/
+md5  9613d56b90d0d0cfd19980c7e2956a06  Python-3.12.11.tar.xz
 # Locally computed
-sha256  07ab697474595e06f06647417d3c7fa97ded07afc1a7e4454c5639919b46eaea  Python-3.12.10.tar.xz
+sha256  c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d49f7adb  Python-3.12.11.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6b3a3e81f3..8bbff066ab 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
