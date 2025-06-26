Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51063C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 08:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B70408CC;
	Thu, 26 Jun 2025 08:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwjRXlmz6LMc; Thu, 26 Jun 2025 08:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A8740798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A8740798;
	Thu, 26 Jun 2025 08:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 077A510A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED88140176
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixUiQ9-_O01c for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 08:30:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9505340069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9505340069
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9505340069
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:30:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450cf214200so4815875e9.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 01:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750926616; x=1751531416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nw2QHucMLjV0So57Heh/D0z3LkrljqboVfj1vTmPbE8=;
 b=Ha/03KNfuO9OLQf8IOuwLikG3ZcsAY9pTvX56iw0ME/Mr8LNkDjamrR9W0/2aeNpqn
 rfJhZ21MT6Swmjz6qKvHYMIddIDHX5yHKsrkZBAEOJDncKt0kwwaOK/FlgzjZz6Mf7LL
 EtnAD5j0p+Z6PLPy41CrpWuvSxjhwWrdw1Z+HhTJDKFwVobc6RFJmhXlAjt79pa5C4zy
 aZW62qQVKyaFEvOHVWBXYkG3rnU716o/udZZH8fofEOrfo5QNPiRg1pUolDq9BK33Ugt
 0plDtOcnEUh30Z2xwoWVyHea5MHE3pbsg57lzMMaD34Pn9aFl4ku89PEXtDq16iwgbqF
 MOKA==
X-Gm-Message-State: AOJu0Yy/JG4r2dfXc5gSkYOtrh66BLCvUpaaAW7//+fK4OxjRjwP8VZ3
 JtUh1QkbCggUcKFlmIuUlVHwEoQgB0n6pF/TuBs+HOoBU8O3JnAsBv4m/h6hYphbXSYPPseEGns
 WRedG
X-Gm-Gg: ASbGncuHGOmRmE+yWK8VHKrIUsRfBQGdEAiDBUj8cFZJgFLSn4fyp7JiXxgdtOIh9QA
 uo5F+MeFiyUyuo/ThUV7Oi9mqByu3PobxlzVVj5g5u3hMb1cdVhnyaCrZkZt3Y/7YlZ+yC14r4+
 u3fCul+RrRuVIRx9ZrHkui0ozsM3lnl6y62NJqV1xQFdprE1KWOpJV/Ohm58kBPiHYZYhmMX5fY
 uyayYf1xNpXLnA40uZEynNsKc9L8Bje4hROA4KDlJThTUOk2FUqPzHulm2zOf6LexNUbFR78WEs
 bZe/R5l8LISsNhgR+QnnmHq2LQ8tgBxYfCJO1ke5Ui2w6haOJk6BF32J9cv7r1HGN6dUh0sQpvN
 DeWqhZRSdKYnGEQqMtPnNOkxsE3Z7
X-Google-Smtp-Source: AGHT+IGT1vzzu5vNCUpIVG4+STW8xVfLxp01MfF/CreC8qp8jwNEBA85FynzE9UzTeaavqwTcUfnVQ==
X-Received: by 2002:a05:600c:5306:b0:453:6146:1182 with SMTP id
 5b1f17b1804b1-45381af52c2mr51173985e9.32.1750926615877; 
 Thu, 26 Jun 2025 01:30:15 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810b5eesm6628823f8f.85.2025.06.26.01.30.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 01:30:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 10:30:04 +0200
Message-ID: <20250626083005.537882-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750926616; x=1751531416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nw2QHucMLjV0So57Heh/D0z3LkrljqboVfj1vTmPbE8=;
 b=PAYppODCd5Vj2u8qOTIc8dW7hOcVLTp6oTtztCyF+k0r4MhWyjGzy7ZRWvJY1E7Iho
 /bo6VYAdWA5OfuhbIsL9+sg7zdbC7MM3IoNWgNyx/FL43Uy2SnTZ78rCxW6JlijEcdF7
 V1A6r9r+13w8TwPJsvN6xOm6N5L9lrFwPKgiXupMsjEY2mXUHg2Q8Yldl2AMl+7wjSBC
 eXZogZZkFUkc5zPhpemsuSb6NcbXNBmqjyjA7Q4usEZZjKtGNkTUyAbJW7FlW+G3yJrm
 wl3/PZSG4+VQi+NBnDWFfo/JgRQ8bR3IpPYlbIQAjINeRRZsYsYuAeObATstDm6081eX
 c03w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PAYppODC
Subject: [Buildroot] [PATCH 1/2] package/libmpeg2: switch to videolan Gitlab
 repository
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The source code archives don't seem to be available anymore from the libmpeg2
website (Sourceforge) [1], and their SVN repository [2] doesn't seem
reachable either.

This fixes recent autobuilder failures, such as
https://autobuild.buildroot.net/results/ede/edeef6a480350880b12eebd94654644e43c2670e/

[1] https://libmpeg2.sourceforge.io/
[2] svn://svn.videolan.org/libmpeg2/trunk

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libmpeg2/libmpeg2.hash | 2 +-
 package/libmpeg2/libmpeg2.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libmpeg2/libmpeg2.hash b/package/libmpeg2/libmpeg2.hash
index 615d0ea6bf..96b71fb1c8 100644
--- a/package/libmpeg2/libmpeg2.hash
+++ b/package/libmpeg2/libmpeg2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4  libmpeg2-0.5.1.tar.gz
+sha256  1b3adfb73e7d34ce9259130683d884b0b1af67572c9fd8229d45f55794b6dc0c  libmpeg2-v41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index db9b2f8bbb..cab800162c 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 LIBMPEG2_VERSION = 0.5.1
-LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
+# Gitlab repository does not have a 0.5.1 git tag,
+# use the corresponding commit sha instead
+LIBMPEG2_VERSION_SHA = 41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871
+LIBMPEG2_SOURCE = libmpeg2-v$(LIBMPEG2_VERSION_SHA).tar.gz
+LIBMPEG2_SITE = https://code.videolan.org/videolan/libmpeg2/-/archive/$(LIBMPEG2_VERSION_SHA)
 LIBMPEG2_LICENSE = GPL-2.0+
 LIBMPEG2_LICENSE_FILES = COPYING
 LIBMPEG2_INSTALL_STAGING = YES
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
