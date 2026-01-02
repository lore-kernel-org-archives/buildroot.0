Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D5AFC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CD1180B1E;
	Fri,  2 Jan 2026 23:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2eot_syjTkm; Fri,  2 Jan 2026 23:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14A0A80962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767396354;
	bh=T7wdj3rfs/+G3+RSiwFn2JyDB1oVOFLr6WXPZYqXYzg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VBQ2QCN7/GLRVfHJKysv5vFVY5M+CdAimzW/VLGnxawp1oHGWMhM6eqPqtt+ufp6v
	 OaX0jsitXSojB9L1LqCS0RwxnjPIhno5oT32PEBE5yPvP2JJVjxwReKT7UKrK9j8K4
	 jpw9NQbc0Stra12jdLZUlb3J3qVdxbhooHIxX4v8KtM0mkfC5wtOAYWZdc25y8oDT5
	 c/3bg3TDsn79/W3mrQHLKCGMO4PqsqEofLqkvwkN5pPE64wGFypjK7SX9BavDV7R4a
	 A0JNb8yCmPiLIxTML5sf8xR0WInuCbqhuXd3sOugudCbyGqpY6RMJKQptCVbKmN8bq
	 Rg92jSP2FIp+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A0A80962;
	Fri,  2 Jan 2026 23:25:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 471CE249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C80605DC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFVECtXgfHgB for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:25:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DD5F605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD5F605D5
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DD5F605D5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:25:50 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-455a461ab6eso3764504b6e.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 15:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767396350; x=1768001150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBHV+sqpyNXBzu9GC12uKfqaRIRT3+UjYap0xYDFq/A=;
 b=aiipacK2OwOgIPnLbOam+5DPhfKYBa1v0paCXW/wmS0Cp5psIGXEEiZ2SdyEwQj/q5
 dD1CQmhxC84uJ9ix5xe3iXlWHjClQg1jWLI4oW5OvDl1dXz8a20/5UIxKa431kxMQfIP
 1ivq6XanUsrrag4N1VnhpuMaylWU9QSsS2WZOzB9AM6WEehlW93hSsdUVAnGYGIZdfxA
 jXh0XA7qH/LWuyQX3uhNHDqBNMJ1COBP0eJ7BSqy0iCnhqGxhZMpUGVmdWLjVWb7VG/s
 tGl0qheHiOvx+yQwr5QEUivHiSNUO0XE8Z4pvz7MAdvxi8knYUJN2tIQvESINzcbpJMm
 J3lA==
X-Gm-Message-State: AOJu0Yz6C4p0dZXM1ebiTnHoCDuMEsRJElzw9eou03xfkFwl1KspmKmp
 67H4EbweHtyOYRO36DtESanHY7mGkYG6DmowvcQC2x8ySbjZeWC28rAxHHDuE3t+kmA=
X-Gm-Gg: AY/fxX4rzsxzf3c6zPxD/34nsyE0soTO4gfgFZ/vP0/oLPgcFKN5dzpUTy69VYy7WM1
 7/Pp9fDPKf+7Fi6ORpNtb8YKLjTHoKeS2teKQODTf0hmlaKFra1RN05BG/gcghwtAAj15Cv/4vQ
 tOqRbfBHwp0YF0krgS+aH+mSoOZbgC/om4VTvQdwLK/iqU804oQJRktPV2cXVD29EU2XzCSAClR
 WdWVpO0TgTf7Dn67fRsw+3J7MwXYOrJLAOl/UmfNpGFXGihQe2tuEEAsi8ZC/RBbQUkmtTNG7vo
 ylwdzwoquW1S419vKVtXf58DZCHG0fOtKQmGjMnSAXmtPuc7BTGZ6BhPzc+bXaboYlzyEKQB4bH
 CKid+LHMHeu/NPPJScxcLd1hvhU+iqOC4xm4g/vpBdShLcU/P63wTR+jTznKo2DTihQlcz8AFcV
 kX1a7c6Xp+U6zYVbe0VOUAyoX3RsZiQCS1BcYlDL8VNlmsXfA4fRqYobiPBveviwbsNh8D9S9JS
 xjB3YLbgxGYk/VSpkKVCPegw16w2qcWRRFBQnkAprk+PrtQsiTFfvI=
X-Google-Smtp-Source: AGHT+IEu/xt6O/G5Nrntp3H9px2iMrt6vMjWVjBi2glVlvMBDxyM1eCEs0ho/YE2PPGS4M2DLBKfSQ==
X-Received: by 2002:a05:6808:1485:b0:450:dce4:8e with SMTP id
 5614622812f47-457b1fdcb77mr17923672b6e.37.1767396349674; 
 Fri, 02 Jan 2026 15:25:49 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3be2223sm19993094b6e.8.2026.01.02.15.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 15:25:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:25:46 -0700
Message-ID: <20260102232546.567018-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767396350; x=1768001150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qBHV+sqpyNXBzu9GC12uKfqaRIRT3+UjYap0xYDFq/A=;
 b=JCSBdPhsMY/0R/81gQ4t2pED1gIzdGBzP/WxmDx1WFPUZwpv6LhCe30TmkE6KNibVL
 hG6+Fk00mTxJJVWgbBz22I+6lHeAB486K/99r2K70dGK2DbQWDSaQoLYTzCMUYLGHq8c
 Lo1Z1aJnfUFYdUFqgO7zORMcV1hcwmXGO3OW3Hf96LkaV16dB4AnH7gyZFOi37J6Te5m
 nr4DfICt7Iu4CJnSxDUWALqSuvxXB6l25uhiaoULy0xPcPMDih5h+5lBeJYDj/IApE7O
 E9eprXCm3Vw9pdM6vBWcaO4iJmpu9kRJnpYcXAekjFDNx9bHc7gdrHm3UR/BGZX5bfsU
 bxJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JCSBdPhs
Subject: [Buildroot] [PATCH 1/1] package/python-iptables: bump to version
 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is no longer required.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...g-get_path-instead-of-get_python_lib.patch | 40 -------------------
 package/python-iptables/python-iptables.hash  |  7 ++--
 package/python-iptables/python-iptables.mk    |  5 ++-
 3 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch

diff --git a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
deleted file mode 100644
index 2a4de3daf2..0000000000
--- a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fd415a3613fad872062fb7cb4e271ac1476402ef Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Tue, 24 Oct 2023 08:47:12 +0200
-Subject: [PATCH] use sysconfig.get_path instead of get_python_lib
-
-Distutils has been removed from python 3.12.0. Use sysconfig.get_path instead
-of get_python_lib.
-
-Upstream: https://github.com/ldx/python-iptables/pull/340
-
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- iptc/util.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/iptc/util.py b/iptc/util.py
-index 04fe905..94befc5 100644
---- a/iptc/util.py
-+++ b/iptc/util.py
-@@ -3,7 +3,7 @@ import os
- import sys
- import ctypes
- import ctypes.util
--from distutils.sysconfig import get_python_lib
-+import sysconfig
- from itertools import product
- from subprocess import Popen, PIPE
- from sys import version_info
-@@ -64,7 +64,7 @@ def _do_find_library(name):
- 
-     # probably we have been installed in a virtualenv
-     try:
--        lib = ctypes.CDLL(os.path.join(get_python_lib(), name),
-+        lib = ctypes.CDLL(os.path.join(sysconfig.get_path("purelib"), name),
-                           mode=ctypes.RTLD_GLOBAL)
-         return lib
-     except:
--- 
-2.41.0
-
diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
index 1b7c9e9324..e1d66aa691 100644
--- a/package/python-iptables/python-iptables.hash
+++ b/package/python-iptables/python-iptables.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-iptables/json
-md5  bd6950c1ed9c6b48b7d552ff8e6766c5  python-iptables-1.0.1.tar.gz
-sha256  1989f2b48598392c3574052a95f456985cb06fb4287b61bf8794e93ebc37eddb  python-iptables-1.0.1.tar.gz
-
-# Locally calculated
+md5  b93381df79a3d6f61040f399cb2bd57c  python_iptables-1.2.0.tar.gz
+sha256  60f120d548f6d940f682f2c78851956018588936de05b9d5d338c3cb9bb47ca2  python_iptables-1.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index d01545d8b2..21698a0458 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPTABLES_VERSION = 1.0.1
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/35/e4/33e639b9e153c2d798d73342a96715a4edca6f46431d763b275a34b3aeca
+PYTHON_IPTABLES_VERSION = 1.2.0
+PYTHON_IPTABLES_SOURCE = python_iptables-$(PYTHON_IPTABLES_VERSION).tar.gz
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/55/3c/a2626b88fffb5bcebae80a2dca1e09ff539ab454a8e5fb2e50141943a1f8
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
