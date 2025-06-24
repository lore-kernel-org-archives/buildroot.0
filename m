Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3FCC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 09:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4588540A22;
	Tue, 24 Jun 2025 09:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwDUbCb86crQ; Tue, 24 Jun 2025 09:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E84F4089C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E84F4089C;
	Tue, 24 Jun 2025 09:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC700154
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD63040877
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Db9k7JOin7V5 for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 09:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1178E40890
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1178E40890
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1178E40890
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:26:21 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso198243b3a.2
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 02:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750757181; x=1751361981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmH1zt5h4vweIdaPiZS82sS4MhMsJV2j2TFO/bhmRBY=;
 b=YkUkoeBsoPFAmqXqPsPF9Ksq7IObjIUt2oWFOFhOSmiTYabixAcQyL+/aCsvvjXuvU
 0QzgJAvZfAuvRqPTyzIDPpC6jq/0S5SbWWDYPZf9alM5n1UbTweJm9TlJMXmphk22LhW
 BLNbMgnH2SFiEzcW6KzkVoQ3k6QAVe/ldoibBBeXUZaW0Blx5QXHxKSi3GlIGIRmqMKb
 Tmr3p8rx1l72/3ddQziDOQ8+hJ4+KO3pDNZfn8/jUyNlS+W+6oQ/om0hTorr4Ulwj3CY
 yNqOODCS+AKksZ6fQnGcHMknEDcJnHQ+u7c5O+GLSv7E30QisiwsP+WAaVEdJUzcxFAs
 fXXQ==
X-Gm-Message-State: AOJu0Yx0egBR/b+pAg6Bbiy6N4P1Jz+lsm8P1lpRrbHWH58rXeNKv8Gc
 7oLSRQs3d/wEw5X+flpUHWJBKCkr1yBsSiOE+R4lPd6xEXwCS4h5ah686vDk/w==
X-Gm-Gg: ASbGncvSmZWGpzDqjhNrM/PaBjFzM6JTOVkVXgOUNnEoBlPUsZJD9CPhowou/Pe4EAm
 b0JN2TXEoCG9G4Wkbu1BqGS+Q8UQ2TxQeGHYUg+NyzXB/aIjAwvTW0Uz9WEful7ei1ljlSY+Y1H
 KjWGXMn6PN4qcfZfQbS1LyZQI8fG7VgV/YAqh65k3HqYE7mI17n5TxXBw76biHUjGiUVatyYa1v
 vWtILP5I8rep6RRe33PzYzAE9ZHxknkkdpqCh/KwchDI0/hxxZjcsXO0Dw5W+tMNx1pftRr+wY0
 xNmYcY4fNvPY3y16iTRWnzYXifAGTBPDQpOrPuoj+FDiuRCvfwnNAdTr5+FLpQ==
X-Google-Smtp-Source: AGHT+IH/21W9Yb4VSxxMBmGAFx65FX7w9vwfRNVYZfgRb02DY8+LErqiNrVdOVhumKCDdgqFSEuGVA==
X-Received: by 2002:a05:6a00:2e99:b0:740:b394:3ebd with SMTP id
 d2e1a72fcca58-7490d570198mr21626213b3a.7.1750757180681; 
 Tue, 24 Jun 2025 02:26:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c88387b0sm1366554b3a.102.2025.06.24.02.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 02:26:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id BC2B34208F51; Tue, 24 Jun 2025 16:26:17 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Tue, 24 Jun 2025 16:26:16 +0700
Message-ID: <20250624092615.920562-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=bagasdotme@gmail.com;
 h=from:subject; bh=h6fDCIeBfH0KpX1K9U8QNF5lXoIdhjF1mgxOU8ADp0A=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhoyofPMWu8smL33ea01LDdbwPieoy13jlCKYrMzwb9vES
 PNLm1o7SlkYxLgYZMUUWaLXyu4y5t17ySwmoQhmDisTyBAGLk4BmEh5DMP/UkXTGUWJAf+3S/X+
 Dhdh2fpQyazu3ZbTvY+D0wV3cS5Zysjww0Fke/c282r5qUdqtxxdxniPZb7J7D9ih2YKNl9sZe7
 mAQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750757181; x=1751361981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lmH1zt5h4vweIdaPiZS82sS4MhMsJV2j2TFO/bhmRBY=;
 b=G16NyyezRce0lqhvD3CvTOA1srQXZ87KJwaAPZSGst4reLKQ095JTt5Ovqjnit2Lm7
 Lgq5ShT3NLOhdeyeuPGxa3NWZQfYcMREX4iXyG1676sJPQ6ru+zxcPYtSLezk8FZsIao
 zWdd8jyRz+HYrX7VgFFvDZnI71U00WkWnrRTXzPcHqzmrfpEkmK20R/C9XKFaMGzBHpQ
 MMOBWD3f46zdltOC0evnwKb8ZLZmr56m45zIVyYKRaWogqlVTp7fM2dpq3B+ftjXrrC8
 GjaIwGj0bN+BMeUpRpqwG7HrlyjmQg0b5OekuT7bzJxqxWi7XT/WMcm5izMS19dCZC3k
 nWeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G16Nyyez
Subject: [Buildroot] [PATCH] package/git: bump to version 2.50.0
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

Bump the package version to v2.50.0.

Release notes:
https://lore.kernel.org/git/xmqq1prj1umb.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 6235a8aa0a..b20fe2de0e 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  618190cf590b7e9f6c11f91f23b1d267cd98c3ab33b850416d8758f8b5a85628  git-2.49.0.tar.xz
+sha256  dff3c000e400ace3a63b8a6f8b3b76b88ecfdffd4504a04aba4248372cdec045  git-2.50.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 68a0fff65f..560590b33b 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.49.0
+GIT_VERSION = 2.50.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: f28f34e200bbadf0aea32110c72f7199e65fb0b9
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
