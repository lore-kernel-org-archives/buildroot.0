Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B500BE77188
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 00:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53D97403A4;
	Mon, 13 Jan 2025 00:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NvpOiDMEBdp; Mon, 13 Jan 2025 00:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF38403BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF38403BB;
	Mon, 13 Jan 2025 00:59:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DC43940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5F281141
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVFJH65utydY for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 00:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8064C810E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8064C810E1
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8064C810E1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:59:05 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21661be2c2dso60385755ad.1
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 16:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736729944; x=1737334744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hqWshIBG5RguuhONXMeHMN+sDJCLussuubSg8IrpAx0=;
 b=c1hNoCMaSUTqPkkWwNy/Q/ho6z02cj/5st1VQeIs4wFPhBHjQUpAsiQc808lW+zofu
 WnaniZnbH6toci+dMWfhF2wN4i6QOaaRcJskfsbZ1BTNED4W/AupSk4CFKGl7EqC8OkY
 RqdvQ9EFjhAS/tUqP9PhXWBaCTwHqppYqf2+fpNh/4DwmHZdFxmZ30EbF2YUlDtbGFiV
 39vBL/AyqnTo9qztsk1TFQWHfUp1diAJRnXHv/DRw0lHK8WUnEpRF4dKFCHDtu5uiGm4
 GAkfaisdOSgwbOjNObvNkdcHRNoIFWDwG0fMAu8ql/LTBkOfNythU8oOzRCIoYzDIDTg
 sXtA==
X-Gm-Message-State: AOJu0YxjTvh2t92v5/L65fa5pPk8ToEnYoGJmm+1I7f1RaG39WgUGhwz
 HJC9oqHEwImD4yXCvz18UuH+vIEz8yk1XAUl9msH20suOUFxpjDKFDG7TtAB
X-Gm-Gg: ASbGnctwF++xDFVrBOnIkHrzWOxIz/HqRig3VeC7so/bqDejdbNGnZWA1rDZNjZM2xU
 ctYXdT5utXT/OGaqsvQgro9SIYZWDymq1Y8L3Y5GNp+IWwVEU/fLn+gtmzGVbvH7N/xU/yI3Df3
 kTAACgecR1lCQnU453cZpspUwa2bJwKbcsQYpt3B3HeHeFEK9fi4RpP7tKdTlQTO0eql2GCGrIf
 wB5Rq7OUttwSITRRoXIg5xIWCmv1S0E2Dy4FAWDCPUas3hKPrJtK6VR+aFQop8Tu/OxetBLJWL9
 R0fFh5rBCIYu7aIUGZf57AARwh1t0jm27LskiuXC
X-Google-Smtp-Source: AGHT+IFCfEQbe1LhVdg323px/6+WLWmgNRQRB5bIMcAq+ZePFqGXmT1rm0MpLkyrVXBR2MXGWvO0qQ==
X-Received: by 2002:a17:903:41c8:b0:216:4348:149d with SMTP id
 d9443c01a7336-21a84008e49mr302152745ad.53.1736729944521; 
 Sun, 12 Jan 2025 16:59:04 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f25c655sm43701735ad.231.2025.01.12.16.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 16:59:03 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 12 Jan 2025 16:59:01 -0800
Message-Id: <20250113005901.773490-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736729944; x=1737334744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hqWshIBG5RguuhONXMeHMN+sDJCLussuubSg8IrpAx0=;
 b=LHum4KgyGaPGOzNO32nYQD1QxVQuReLaxlie/+6IEsmJTDzXRD/nHjyX1NcFnw2ePm
 TzXN21M4xSoq/mUti0qxZXc+L0r5e+jSAlZJOm6EIyEJJR/9FJMlxvRaSrVrIWG/iiEV
 aw42S0JwV00kVvB3/smHzissSYnBAEQ7SrL4IUzUMOKrZvOepFb+u05B+7mB0zE4B21t
 lKZHl6Nnk8IejBvEqFfqsI4nC3mzw8satuh9I2qrUVeoquwDuOGAMjzYEjlFI0akTpqP
 p8KBYtZ7tqEOTCORYTcRKtCo5bDrb/YWzikXl1lbiKHvzNztrtY0nCMMOrBg48NEjRlX
 KuCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LHum4Kgy
Subject: [Buildroot] [PATCH 1/1] package/jitterentropy-library: bump version
 to 3.6.1
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

- License hash changed due to year update.
- Updated site to new location.

Release notes:
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.1
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.0
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.5.0

Changelog file:
https://github.com/smuellerDD/jitterentropy-library/blob/v3.6.1/CHANGES.md

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/jitterentropy-library/jitterentropy-library.hash | 4 ++--
 package/jitterentropy-library/jitterentropy-library.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index c7833f1428..feb15f0fca 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  802f025f766c38abf663fd5a21482b8313b6d6e2c68c36a4ffd6bc105fe975ab  jitterentropy-library-3.4.1.tar.xz
-sha256  7a89069066f6c0b8767d3256e5ec5d765b2c7f3354a5a06fc8d5bd7b8103d8a3  LICENSE
+sha256  ddd23429cb6bdabbfeafd2b6aaabfbf1959dd7288887334dfec5ff099a2e9f3e  jitterentropy-library-3.6.1.tar.xz
+sha256  adbfea86223ce2c1f410353054fbbe8d7936dd900ff0d373301c959300c2214c  LICENSE
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index f405082d08..28a0f7da61 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 3.4.1
+JITTERENTROPY_LIBRARY_VERSION = 3.6.1
 JITTERENTROPY_LIBRARY_SOURCE = \
 	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
-JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent
+JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent/releases/$(JITTERENTROPY_LIBRARY_VERSION)
 JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
 JITTERENTROPY_LIBRARY_LICENSE_FILES = LICENSE LICENSE.bsd LICENSE.gplv2
 JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
