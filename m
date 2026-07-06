Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7300EC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 05:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0B840A31;
	Mon,  6 Jul 2026 05:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZYxu-kJR27b; Mon,  6 Jul 2026 05:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27CE94097E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783316681;
	bh=tBRFhP7Z3z9LFA8/eaOQ0Jlsm9QtJ+MvfazKanU5ECQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KibrU20cc/uzWQar/zpCSuWm8R+u8cUlgCAPVLHL01xEaaFKruzUZqtG+Gz5oT6+t
	 5lCwJKToO7SnPqHMMckcG+QtqN4UFL3gatHzv/13EpObgoi3SQ/S1SfVRxDZPG3g3a
	 jCmtatW5sjfMDcO/cpkmE0TRcxfMcyex21lWIN0f1RzslngmW95b+mBRtYe4pZtIp3
	 dQhFDl8EPmGIauV2hxdk6ufUcVFvYVUMhIkXZHUKWZAigH1Ao4C7zK72EqN/lW0/1v
	 BGWo8DumpOOMzhI2pya01tBVo+WwuwQHRwYUbL5p77FyYguvXLyduPYgdkJPi2pqte
	 eMBHEHb42XEOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CE94097E;
	Mon,  6 Jul 2026 05:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C97A82A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 05:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2EE1401D0
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 05:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alwt_C4GibYN for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 05:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80E23400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E23400D7
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80E23400D7
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 05:44:38 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5aebf120839so2255692e87.0
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 22:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783316676; x=1783921476;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3m7X6/Dap2Q6qcIwYZumg872GWRJswDdOlwdOAKBY+4=;
 b=m9YeCMc7nHzGqgRqzXgbLMc5lvF5zXou6VV68NUpSf1L6P1bnRX9JIAYzAxW+vQ8+o
 z4zggAXQiVC3/1JW4qUXuJQzMWGPf4pnX4U1Kc+XH7s4dtlxPKloxeJwMVgySQSKkiKo
 i940jL7Orc02leIPuUkdOBIquYRVG+gEgRb97xag2nD2aWnPmAlBt2JAbN1mJgDgWEYn
 LjLtU3EAuVjv0lm9UxvWQ0n1Hj7yEm8BsKzvLt7wRmHwvXl8nSrsRGK4CYa8gJiFQQFV
 jOM3c0BsCn8lIWA8JmBdWlqbj9BTNepQWQ/IL/NL63mVHatvbLhu79dEAeHGjRpipRYk
 ej/A==
X-Gm-Message-State: AOJu0YyVLI58dvQAYxySz8x10Jz6DgpE2Qdy8Vikr+JHX7DI+V7bOUCc
 UhFWMAYeGHDaVSe9Bkc0qWO/YlCtS2mQ/8BSOKsoFXa1K2ezCmP+AqJ933DZoRMY
X-Gm-Gg: AfdE7ckxcnlbK4VhEvwAST1pzytZeLIc6SqDKOPdOGJEBcjphiKwPXHNUoTKaOeR/H+
 ezzv3yAqduj/G1bIq+4WRrHS/qJdKxRj8r+IgipP3N3z4uf163A35bu0aOvV7QCmEaz7nUdE1Bl
 tvPlTMrUK/UpC58v1gxBOnDZgj2lC3eM2lMI9LAhk4toREVie9u06OnhVBeZitznlc/rGH+ateO
 8LHi52LNWSnfs7LtTF4lPnyrO8yQfMAgMQCYq6swg3Mqk1iB7b3R/R0NYs7y+rbjhd4LjHnqS9W
 7hauKMQEMkj4xF04cLTTzOeweke2kWy9UcSejlVs6waf5ddPGtynt3pjXmlnhV9zgydRt6WJmMq
 JRsjNF9qAN8iZsV6kga+q+DAR/5wzqO3Bb1zRHCdNUzScmajucNZtzmWZoVR2GO3C6IAc+FVpmP
 RiFwmlqi5Kq0QdESETx+GfuKwONkWh0r1Zc2LDbERE
X-Received: by 2002:a05:6512:3b9c:b0:5ae:a500:e368 with SMTP id
 2adb3069b0e04-5aed4f043camr1690297e87.3.1783316675799; 
 Sun, 05 Jul 2026 22:44:35 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aed1377068sm2579485e87.27.2026.07.05.22.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 22:44:34 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jul 2026 07:44:30 +0200
Message-ID: <20260706054430.2860918-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783316676; x=1783921476; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3m7X6/Dap2Q6qcIwYZumg872GWRJswDdOlwdOAKBY+4=;
 b=J3qml4HLwlnIhF+HFo5oL7MOQsejYR10ejUa6oqpK7KYhvhmqNThtib++731vwDfxi
 Y0S+JWwv3kgloLUjU4bVIK/5CX6Rg9b+5DKSWE04HOEWZ08QN53JO60RfeMqqb7LMkwr
 /lKACoLs2d1mc+wODlzkjkGr0fKTOVINCY4ofHwiwzNLRJCfRVngxyopvWnr6nVFCKVO
 e8ujGCNsFIisvrYw9gEkCXj3E9EQZZSfuqL2LW0qLchSuXh8kjHH7Dq6CdIizzMTZR87
 1EtcDcMFkzWlQi29ts4kOYI/kUU3Edn+2SNSdvJMda/9w9YLHcvz5wjN70a11Wc2Cwjo
 +f0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=J3qml4HL
Subject: [Buildroot] [PATCH 1/1] package/firewalld: bump to v2.4.3
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

- Switch to release tarball using GitHub generated checksum
- Drop backported patch

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...tions-don-t-use-deprecated-pipes.quo.patch | 42 -------------------
 package/firewalld/firewalld.hash              |  3 +-
 package/firewalld/firewalld.mk                |  6 +--
 3 files changed, 5 insertions(+), 46 deletions(-)
 delete mode 100644 package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch

diff --git a/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch b/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
deleted file mode 100644
index 0deacbcca0..0000000000
--- a/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0bfa4eb3e15d8df8a68a8c3429505905afae112e Mon Sep 17 00:00:00 2001
-From: Thomas Haller <thaller@redhat.com>
-Date: Fri, 7 Jul 2023 18:13:10 +0200
-Subject: [PATCH] improvement(functions): don't use deprecated pipes.quote()
-
-Since Python 3.3, shlex.quote() replaces it. This avoids a deprecation
-warning.
-
-Upstream: f7f5613b76c044c62c876ae87c6b85f5a41acb2a
-[Romain: backport to 2.0.2]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/firewall/functions.py | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/src/firewall/functions.py b/src/firewall/functions.py
-index f7133d71..6213e778 100644
---- a/src/firewall/functions.py
-+++ b/src/firewall/functions.py
-@@ -34,7 +34,6 @@ import socket
- import os
- import os.path
- import shlex
--import pipes
- import string
- import tempfile
- from firewall.core.logger import log
-@@ -607,10 +606,7 @@ def checkContext(context):
-     return True
- 
- def joinArgs(args):
--    if "quote" in dir(shlex):
--        return " ".join(shlex.quote(a) for a in args)
--    else:
--        return " ".join(pipes.quote(a) for a in args)
-+    return " ".join(shlex.quote(a) for a in args)
- 
- def splitArgs(_string):
-     return shlex.split(_string)
--- 
-2.51.0
-
diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index cbd4c7685b..48d80b1b87 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,3 +1,4 @@
+# Hash generated by GitHub https://github.com/firewalld/firewalld/releases
+sha256  d441705746cf3d0a5efaad58b1b1193a23c58114162d81a9a0f4fe0c58ee43cf  firewalld-2.4.3.tar.bz2
 # Locally computed
-sha256  1433247299367f707279d50e0759ed27fbcc9bb973b7b2131e8cee96e006d96e  firewalld-2.0.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index eae8afc27f..c443ab3db4 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 2.0.2
-FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
+FIREWALLD_VERSION = 2.4.3
+FIREWALLD_SITE = https://github.com/firewalld/firewalld/releases/download/v$(FIREWALLD_VERSION)
+FIREWALLD_SOURCE = firewalld-$(FIREWALLD_VERSION).tar.bz2
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
 FIREWALLD_CPE_ID_VENDOR = firewalld
-FIREWALLD_AUTORECONF = YES
 
 FIREWALLD_DEPENDENCIES = \
 	host-intltool \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
