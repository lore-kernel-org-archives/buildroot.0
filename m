Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E55C369AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 02:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE1FA80EE6;
	Tue, 22 Apr 2025 02:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAPRSJK4LkwT; Tue, 22 Apr 2025 02:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEAF780F29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEAF780F29;
	Tue, 22 Apr 2025 02:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A16711A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92DA04030A
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWKuuJHUKoka for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 02:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D35D8402F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D35D8402F4
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D35D8402F4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:57:12 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22435603572so47371625ad.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 19:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745290632; x=1745895432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+epZ9K8ACCGh+H4RiW6yYYLcxfaD2mMg8y3Zyr4mVs=;
 b=QTkCj5dNbOpg3WTAXh/WbNMS8tg5ltYIoeNS5j6CGiDBF5oERT8HeUNVCozXQsbjeX
 PpCcWZlvfQHl/08hovHfSC0aD0btxlVC8OdCPGJ2C6+XoVMMVk63dba4mkhpNBvwurHs
 S95k9ZSeLds9Tk12zLg+rT+I9vHCF/ePPm1hM90x78TGtQxT23c8pT31fEIPhnrOoykE
 GPsQZXMyHVCW0hzf6rwH3NWR7X79+up6f5X4QZQjWGl/AL3p1e7CAlB95n7vE5vZ5aPT
 8iddIlNCFXnaWoDfVf81Dpj+PBYEbm+njVon5hZdY6MrQE/BQhwVdsSVmGrgjmNRrjel
 qAmQ==
X-Gm-Message-State: AOJu0YzCV00cUgSUKvRj97dcpnia2gYApzdnsK/qvjBHbWHxNq2/e+mB
 2tECYzeohJPD60XLkAv7ZDwsjhdWJERej/5hslxal3LclXY/5JGcSq8bP+yI
X-Gm-Gg: ASbGncu9FGUvbSX2d650NmTN0ZiyjdWxkpRdJ0WefTwN6I6KZmC0R7h6sGcKVGStD+y
 x4jntvePpEJccl0KC7S8Agem45yl1mdEuXWGtOvRX61/h/dJ6yc/O8lquOOXxZySlEaTSt9qGg6
 At2XM4lnsNq6E9dDDbHajViSmYve8fkoqvlNeBBSe0rOD0hiCZbSE6y59Xell396nFJjrTSwA54
 Pcv85CsKdjyWyfAlQ5KAwQFgJ9FZgNkmNJLekgAPMtKPh+wrFz+8aq9FhRZKezgBa7mlt+Uwi28
 DxW/afmYkBFvQ+/d97SXxZn+6KoELWarDePpkV1c4WexhtPPKp/XwEfmwwRfpMjy1MTKaM+9AsT
 cmCHrZGpeDH6NufhDhP5ukQ4JWW8=
X-Google-Smtp-Source: AGHT+IFiwu2YCg//hjdTO8p0V1t4yZHnaQ8dy00cnq2mD1yHzgG3Qefw0I72r/6kb5gtxLOBXJcM/A==
X-Received: by 2002:a17:902:e2cc:b0:224:2715:bf44 with SMTP id
 d9443c01a7336-22c53580c19mr166821005ad.19.1745290631628; 
 Mon, 21 Apr 2025 19:57:11 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eceb1dsm73191055ad.186.2025.04.21.19.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 19:57:11 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 19:57:04 -0700
Message-Id: <20250422025704.782201-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745290632; x=1745895432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v+epZ9K8ACCGh+H4RiW6yYYLcxfaD2mMg8y3Zyr4mVs=;
 b=gFtOqN00uhIdUWdcctz7QaNi4253rkAvx+mnEul1EHKkqdRa1jxjHmXciV53PlDrwV
 /i+H8wMgwv5+GZKY/7y+w03I90U4FCT/Sb/NmZeYnLhWgkpglh1zstuxKnpgIg50s7gx
 1Au/mkKTjZHUtrqlTNmvlkTm/oMDdCodZaNJtLp1cHGc3h2tMovFKp8bWsFPiiIVromf
 1prIZxmKVJZ6da+CJXzBTyNEQ0td2hSKEJrpX7H9jT8XNp6v3JQ/k7B4UfbuHMUAOZ8u
 yrr4LeCMxy/MMrITJ2wGLN7deQ5/ty6NA+LcbbFVx+ZVVRhbo0UMBfgItvpZsBpcANcP
 ZN1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gFtOqN00
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.14
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/strace/strace/releases/tag/v6.14

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 9ab5715e32..10de7e7563 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.13/strace-6.13.tar.xz.asc
-sha256  e209daf0ee038ca5adcc4c277e9273b4d51f46a2ff86da575d36742ac3508a17  strace-6.13.tar.xz
+# https://strace.io/files/6.14/strace-6.14.tar.xz.asc
+sha256  244f3b5c20a32854ca9b7ca7a3ee091dd3d4bd20933a171ecee8db486c77d3c9  strace-6.14.tar.xz
 sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 7bf1c24c1a..ee0e7dcf4a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.13
+STRACE_VERSION = 6.14
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
