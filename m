Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E68C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 22:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF4360FD9;
	Fri, 30 May 2025 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZzXvjCKyrh7; Fri, 30 May 2025 22:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084FB60FD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084FB60FD7;
	Fri, 30 May 2025 22:11:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A560E236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93EA260FD1
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYUyLgK7bo-q for <buildroot@buildroot.org>;
 Fri, 30 May 2025 22:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C007660FD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C007660FD2
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C007660FD2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:11:39 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b0b2d0b2843so1857162a12.2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 15:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748643098; x=1749247898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGBbaFVegZqQOBH7x6G85nabHH7Zs7ioGQq0Tq+kDr8=;
 b=f00hVGtjSgOcYM/ahtCj+gppR3EBRJHOvQGQIAwlqyKpQOkR7DdxTzysWaJvmPpPVX
 uSONRQYt/AGxG2HIWdit8Z57cOCFIfQSEnExFSueoKEdMsm3KSV1HoRVx9iy8fbqqXFG
 kvVrcRmBL+EGcpMHdVi6p95LmwWH6EGpkpL1HTh/oJCJtAbM0RnYlHXejYXaoutz0zGi
 NxijIvPSv/i1NPd8NEDebQQYy49BAEJgcehEVuG3iJl7i2UEbflXDvAW3RNmCkI32HWJ
 NsxZG6PDjsd1nJsZOcQgYdIYgWMPHDfeHPQ0jnVqRZ1PgkHoomtejJ5+RmqXL+OEwq/j
 CJkg==
X-Gm-Message-State: AOJu0Yx6aAAxurZOoWSeMovSJ+vjJ/zN8B2VHGfqdRZRNEIYdi9aTSrK
 1ieEgXTmGH35ho42b1457xh5NMmLBjmlhZaSUPeS4LccflOFpNkmvCqLAt9b+0i2
X-Gm-Gg: ASbGncsBq0AVeOS9kcQURHvPc2LtJKSniw1O4GwErXZLD2pWPjjoVLpeZia20ribBha
 Gnp5eGIJyFHozcivdNaZFd08+dtNBf8/LjCh52U9aXAAqkkelnAB0pmIi7ZpIesFMtgVOjRv+fw
 wDEDcCNBqjTXxabkSRoCzaUPMQCvmxDj4E6FzXJxIHYDNSUHdTg4LaUqGO/i8DvVcqJPZduzVRG
 yTDn6UoXONsf7XbqgcdaYLaSiJsbDxfyY1jyBJbB3M2XWPOTB6iaeVjRCbQyztw/dWIcxx4L3+h
 Gk1uKdbQA8mAMY66gC7AqjttU6yj+ZwxiwdPqDELpiFBTxWUoSHN3xW11ezDx74a06bunL5LtwZ
 7izSulfogWnBz0c1GeguALVS/uzbq4UUdYGw0FA==
X-Google-Smtp-Source: AGHT+IEZ8yVYDwLPixPpsJsyMtR4u8r7irWVw4WEyC/N4f0c94slYxxz7hEYceKYmkXAI9nP1QmXlQ==
X-Received: by 2002:a17:90b:384e:b0:310:8d73:c54c with SMTP id
 98e67ed59e1d1-31241b88f62mr6172279a91.22.1748643098370; 
 Fri, 30 May 2025 15:11:38 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2e9c9fsm1683385a91.30.2025.05.30.15.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 15:11:37 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri, 30 May 2025 15:11:35 -0700
Message-Id: <20250530221135.566651-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748643098; x=1749247898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eGBbaFVegZqQOBH7x6G85nabHH7Zs7ioGQq0Tq+kDr8=;
 b=SW3RRWa2njRsTobxVqM+Sv4NQbfJxxvsdZwZQ9t3YAQtEqvBjn0IdCDLebQWO2ita0
 EwHnGzqkk9cDzO25ybohM4zyZcjlgM55+P/spdqo95BEiMcrUhGFv8wMcFKB4Tz/cYoC
 Kpq9ibvazR1nYWLNMktpN7+zc3TmLbB775+VlKCic0gHTdQgB9EWz2WX/SJelPTQbr0h
 zxjPbcwqQ8HzyMiXUd974VhSI5dWf1ifxVK/e855P+sU+y0EM7+qMm+FufMgHKpDHDv9
 QPctzKjyHrhvs1iSQD4jJjdz5o9mrgpxPb9xIezXPK+NdD5oOb3QED9spP2LTTGdXuaF
 97dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SW3RRWa2
Subject: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.29
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
https://marlam.de/msmtp/news/msmtp-1-8-29/

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index a7cd70364c..2aadb92700 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.28.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.29.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4  msmtp-1.8.28.tar.xz
+sha256  13a78f3c6034b33008a7f2474fdddd0deaf7db6da89d0791d3d75eae721220d7  msmtp-1.8.29.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 92fddbe8f3..9073fffe76 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.28
+MSMTP_VERSION = 1.8.29
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
