Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E6CCFA13
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 18:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEAD6077F;
	Wed, 29 Apr 2026 18:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDPrVUo9kyjH; Wed, 29 Apr 2026 18:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B89660ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777488599;
	bh=UU5/6rS8vjJsu84edNVe2h+QYE4HynnTeGzMmiLFopE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aXD43YOLSwau3ZVqvRKXTnqJZLbzemCTtHks814TQ7+vu89Y/Lg1JD1v7MfOdrbkC
	 4Ed/ce8JIDxRmcSKRvxOl4ZspCn3bGbY36xCov1sGFtinuz9GClqCk22+1zcmLrUhf
	 KAtxwyPq5YrKO0b5wqt2oQ0ONuvK2DF0AJ6mwFKgoeAej6uzIswqNjVwjkK8F3+lb5
	 BQgOCX6qM+DaiVLwgwhlZ9qWGwYwZTxUfTXbJT9YRu+JKwqKRd6zjEJ+fCfLODKglK
	 Cjf0S7WNRdfNSDClQI8VxAX6rDouNzuzzPAPKzTnOOdo+kc0tyGyWMCdKrWPATy3Yd
	 wBKRGzkaqYUaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B89660ECC;
	Wed, 29 Apr 2026 18:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5153F18E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 437B681341
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ann6v8bu5eht for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 18:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71F6F810BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F6F810BF
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71F6F810BF
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:49:57 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c76c60c7502so534133a12.0
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 11:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488596; x=1778093396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4IpM4dHCSoC+F8zH0QqKDsiqOxuLawYiU5ZcsnMNyxk=;
 b=TAbVcKBRGJoy+N4IWQOdBnSMlM6G1fTNkzWOm0F6oKMHC2wECK5g6EE30hbRGLU82/
 fvFHo8dceUPq1Wen1AJfmyBurlTq1rsBDAC1O1dD/RNuiIBVsKgXLjy8qx+jvDk6w+bz
 yGfEHjNzxD00RIjtlNr9mwEoW8aFzbmcw6baspWhUXziRRU8Tn+3UWiI/ksVULMJFCkq
 Ou1Zl2DzFZNx2ET4motE80XlUyTwLUnbH2sfs+gX47VjMil+Jf+ED3GsmGrh0oCk/u8w
 hG5/g7B9C4ZeagaJpMtm+QnZrWm1kmHaL9VjczbyCFaLQxv9p1Lbo2rFeHopkUwaYTfu
 efjQ==
X-Gm-Message-State: AOJu0YzEHAVdw6JkAHtoEyxpBO2epxnbbo58+rma8WjMyIoDfuMCw1kT
 JuE0tyxzTRd79tZSOwtqy4AykXRAVoocVa+YLdU0PrAq8EE7ogu2k0bjG+zb0+5S
X-Gm-Gg: AeBDieu8U1IVHoI4T/IPMqliJMmfCacsR0N0VzS0r04Xf2r1bMg0Nldg+G4pPhVG+HN
 FkhrDS1BfyOxDXuL8KjTH86FfLho37pBaSLo/2qfeueiC2r1yMmvSmg7pxmxrDHQ/2zx3XPruSO
 Mn/hbqeYhmBhapj6hLkpI9ZcDInfSpjU+tfCT+y3erXVE86/hrLA7RBSVUm3HxTm+DDA3Rrk9Mx
 83am8pzB76zPbuYS2dHzXUZfoit+/Phyrk3gHfltxJEcfLwlRq2EcS1zky/s2sJtfvxq4xnb3A+
 nKQLsNpWVIZgWJ3PRq5DecqShU8dmyryGhtCxXqNNDmY4IIuZc/fl6Xmrhd4JRQUZaH3qcoLN+6
 VOT2kaR/1U0Pr9nYAc+g6zTIRrjNXq5sXEhfT0MO3IO6DC7QHKPxN1/3UfqSlwQxXb0VvmY70rZ
 d4tlGC8zNmnf4kTzMpxpHRXzxUV9SGQ4mWn26fIh3FRVw=
X-Received: by 2002:a17:902:9002:b0:2b2:4dc4:18cc with SMTP id
 d9443c01a7336-2b98841cd46mr23588695ad.12.1777488596022; 
 Wed, 29 Apr 2026 11:49:56 -0700 (PDT)
Received: from fedora ([2409:40e5:101a:749:12b4:d7e3:4df:eaa1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b988772dc0sm30155905ad.15.2026.04.29.11.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 11:49:55 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 30 Apr 2026 00:19:36 +0530
Message-ID: <20260429184937.2405733-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777488596; x=1778093396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4IpM4dHCSoC+F8zH0QqKDsiqOxuLawYiU5ZcsnMNyxk=;
 b=XgUiHwcPSCL3QOn1vWWGxDedLQVpvCFl3/UwRXcas5wy2dePVejlCCT/Yj66LfqviB
 eXlbqIn8BuLm9TvLqK4RZofbdH2dcIEM14m7Y67G1euloH/sYDNUwPC813JHmCFVnWVy
 gPcXu+SpyEBr5TdUAPPVDs3MPSgBv3BlUt8lt7Cy5VfITXulCXGDU3T46mwvCyTMHK/u
 gfn4So3VJ/blAk0+PP0jJLmC6En0kxWOIgGxnJDJd4tfIQ+o3lKYjYDQz2iOFWcKdYTw
 i/YizFwxi8mMTQdKMw5iasKo7va1pM/SYzsU4GoTJX5GyqgfzHrM0+affJxlYbFpQvNC
 wgLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XgUiHwcP
Subject: [Buildroot] [PATCH] package/ed: bump to version 1.22.5
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

Changes in 1.22.5 (released 2026-02-06):
- Fix sizeof usage in set_active_node: Use 'sizeof active_list[0]'
  instead of 'sizeof (line_node **)'
- Improve error message: Change "Is a directory" to "Invalid filename"
  in may_access_filename function

Changes in 1.22.4 (released 2026-01-03):
- Skip check of ISO-8859-1 names on UTF-8-only systems in test suite

https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html

Tested Using:
- utils/test-pkg -a -p ed

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 605c4854f7..39a6ff5f22 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html
-sha256  47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be  ed-1.22.3.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html
+sha256  56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc  ed-1.22.5.tar.lz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 3042b3c370..6e1d5a3d05 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.22.3
+ED_VERSION = 1.22.5
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
