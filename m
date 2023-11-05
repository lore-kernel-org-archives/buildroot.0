Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38973C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 04:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA7FF400D6;
	Sun,  5 Nov 2023 04:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA7FF400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4ySFbN0q5Lr; Sun,  5 Nov 2023 04:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D8A3401C2;
	Sun,  5 Nov 2023 04:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8A3401C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2A7B1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0A741A05
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB0A741A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60LZHQLyOb3V for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 04:23:31 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B639041977
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 04:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B639041977
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7a692658181so111788739f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 21:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699158210; x=1699763010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dV69C1B9a27+cLyXYVOLN5pExzGmkbEn3WWxMnA/TvI=;
 b=VRcN/qMvk3KB9xc8P1rgk2XK+pvP78L7HPiThHdJiAbwSFQBslTip/VGwYponePh+W
 SLVB9Dfn/zHHTpKWZqe+ETdoXkvjGtRM1tHiVIgsgqd7mjMaUcVg4Hyv4ZXYz2Gc/NWT
 n8dIYTm1kq7w8N5xLbtVNlgzHnt18myEta5AuK9KgDTXL4AmUIhmtCZHjQJnkIPGncLr
 C2yCQ0ZYFD9nMQNzXDMbtqrIRku23ituDwd0wqe7NT2jBZLBWO3sw9O3gavMyIaSx0Yk
 DZKVtZ17zTJq/pin5wRYfppnZn6Fi+xZv6VVlEBhOjlktJ464WMzblMJX8GnG/EdAKwW
 +MDA==
X-Gm-Message-State: AOJu0YxtdZwuIVWem9LT6mUs2rnyFHAb8+QNqb7xfRsCzydaAAgbHy5k
 nDTlEGncAhg7Iu1EXcyLOhZL6erLizc=
X-Google-Smtp-Source: AGHT+IEQ5Omm1DlssO/Q3mtqugz6R0F9+eLhiJwwN5oEa9e56KDBoOCRxOneook5onA6Tim/PDhqdA==
X-Received: by 2002:a05:6602:2e12:b0:794:d833:4a8a with SMTP id
 o18-20020a0566022e1200b00794d8334a8amr33272405iow.0.1699158210239; 
 Sat, 04 Nov 2023 21:23:30 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 r2-20020a6b5d02000000b0076ffebfc9fasm1671139iob.47.2023.11.04.21.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 21:23:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 22:23:28 -0600
Message-Id: <20231105042328.2808899-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699158210; x=1699763010; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dV69C1B9a27+cLyXYVOLN5pExzGmkbEn3WWxMnA/TvI=;
 b=C2f784J0F+IHXkh2W1Y5c7MvljdzQz/de/Qd8dBnGxaALYw3b2x7Vy56TR+RpT1QZ4
 l3PJoNcHgY++XCNfOPAxLJu6ms27vc/59xlUoCJu1XIzSunD/qedzKffNDxKUyebRUY4
 Z+ZASZxvBLhCDsaAYjGqRflhlwrHaQnr5YBJfd+6T4BWbCVpBowsSdOy/3FBea2UoW/f
 rtlIO7OM0+GxQo+ngEdCL/aiKvSld9BHKq/QEtCC/BMh3INwQrAXH9/fDKFkn6peRtKs
 cHZJdTPrvW0W/PMoxM1aINnO02JK8EOp+Y+ipuU4yD4cJ23wRwOtAfe+CbSQTufj1qV0
 GkZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C2f784J0
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.36
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index dc75d098d3..08ad8f6d84 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  138dba31e20e178b431a2e403154f906  Cython-0.29.35.tar.gz
-sha256  6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527  Cython-0.29.35.tar.gz
+md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
+sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 145e804bd7..47e105c065 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.35
+PYTHON_CYTHON_VERSION = 0.29.36
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/da/a0/298340fb8412574a0b00a0d9856aa27e7038da429b9e31d6825173d1e6bd
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
