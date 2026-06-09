Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB930CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 10:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD9C61619;
	Tue,  9 Jun 2026 10:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRl0eyVLkNyf; Tue,  9 Jun 2026 10:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C0161628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780999524;
	bh=Lbz+CWEkifMDdFmRIis9iABweRCQCdyWGS3PZH7Fhow=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ozZL6jy0AuxqXuyosL3LnlPikcx/bbdSaHEAuXfxgjPcHZU7FXj5//WKwaRccGrw4
	 0UWoTdWQdndIvF+/Zgil74fN9Z0AkPBrvnRYTbV3XakgGJT7nlP8ezYolhYDVaz4TH
	 PXUDQCbJxnbKYe5x8XH6uIYs2fBUiNKv6Kn8G2d7wjS4HIysEl0Y7iBLfzBmMYA8zS
	 MrPVj2f+U9OfXatGHQacMQyeUBbxto9w38lDXDzC02OvCP19bmLAKiARPmFULEgKO1
	 6YXbsUinZtLbQI2+Hv1bZXYia4Rtf8AVmVXeCft2VU/Rcsv06FAnuIs4l+ET4yO949
	 BNgssGwmQIeYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C0161628;
	Tue,  9 Jun 2026 10:05:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6985D2C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 10:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473B561619
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 10:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 937DRICpy2xS for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 10:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1111561614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1111561614
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1111561614
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 10:05:21 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-68acf0a15b3so7627522a12.1
 for <buildroot@buildroot.org>; Tue, 09 Jun 2026 03:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780999520; x=1781604320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ti/54uGywk1oOZYf21RAaFN1UPWBJVUHLe5lW7rqlss=;
 b=J+PdMPV6Fy7GDr86hI4aDJCEneB+W4RkxQbEyfGPxfiUeRdhZEg/0zKjdLzaNvHaMD
 uf43rl0wqeBkJTDwRRaC2Fh1dH0tFeYdggWMCNKkFiNeF5uayD5ZALrAQQBWG6gZ8m1l
 T4PePeOtGNfwUaGxMzqOxIFlG7ntxJY/k6npXKzh/Xbs7XEEbsKzac2pLlGHcrilM/oc
 1q0F0WFyv8p0UytdpNwCnhDfgx+yzHEXHWRzC0g9rho8uo+zG2Qx9wjtHIj7B2OveIPN
 qULapZlSGyORolWP9JEzaE2RRpAaJZ8kvCQfDD4+AFRKLODxa7KC0Upa/vB9L9L3bLh9
 ZGnA==
X-Gm-Message-State: AOJu0Yzl92MGr2hNl2H8lVzrD8ylx5drb/VZVGv9/1P4c4RmCrwJkxCh
 5Kdc2sQQXxZ+J8dqJOFR8B4UlZEXIj9mQBMepmwTU3E1tGPMV1UFWDzmF7ti2g==
X-Gm-Gg: Acq92OH79hGcU6xaW3mXdhWQNzdG9oMWwzzepeToye7HnHbZkLCEWiA28mLYB4UgZTV
 iH+KCMkQkZ5gisvZMW6MlGJp/PbhtJWD+VZj2a+tGSJeEkxrVm6nDCwQojVlkRciv7BRCqW3JBj
 +U/0agaOHypI7NpR/C9p4HenkuXSJ/Tv/u+vDUXNAPbc8thsInUCgSDyyyP1y54Zac0RRHqDf/x
 KXRjWVmnoTkmuFbTYrKLJFs3cufLnAfgL8eb38RlaRQr7EJMQDKkWSjsioj4p7fvMdP6qdSjU+d
 Hzg+bzHhFSVgrwtkv0HgV2eNSredTmdmydAjBR31koiCdQcvBtdc9XmbM0+5Co+F/LMWa2WNhSq
 dgVSrJfZ7UhQ8h6322RoEo1JekjGR1mTHILeRfmbSlWF5KaWQYC3KnZX8n0U5KFQ0N0Z1pas2rO
 dEKBAc03OALZUNoZSYs0g8HdnQHIiCYljXaSggznifH4a/qgy3qa/KjIp4zxlvqFHw/7GQLyVyF
 ovXRcsVn1Lr8cuVHg==
X-Received: by 2002:a05:6402:518c:b0:68d:aee2:7516 with SMTP id
 4fb4d7f45d1cf-68fa47b9d81mr9489945a12.0.1780999519385; 
 Tue, 09 Jun 2026 03:05:19 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e650287d9sm8546974a12.12.2026.06.09.03.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 03:05:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  9 Jun 2026 12:05:15 +0200
Message-Id: <20260609100515.2206615-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1780999520; x=1781604320; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ti/54uGywk1oOZYf21RAaFN1UPWBJVUHLe5lW7rqlss=;
 b=J3v9j5gEigMvxJLfg3RiTl/C8GbgLUCkq9MLJhnSP/NjZ50P2rwlwIdrIShKnnv+p2
 NYTGrc1wYXpR2BPxD2/gtf7oG6buGer6mWarEqkKi0wrQbeWit25f78sAX3pFk8iUWG5
 XWDv2bTdFKfKJ7E4qGuNTBdIiVxYutU8YdXXiqbtkNM+1jxxGIB9C2oy2yNYi+TmOSMP
 c39XcC/IYvNgCQ2f1pIE+y49JN5nFTaioxGXRxhG820a67VZgAAd6TfG0EHDsuHeRkS/
 jWM21vEz89x4FyyJwb+zIh+TFZB5TlWo49rJryw0WmBczj5q44lrZGpz+QJX6v1R6Ztm
 z75w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=J3v9j5gE
Subject: [Buildroot] [PATCH v2] package/python-webpy: bump to version 0.76
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Change log:

99e5eed Fix session.py to allow suppression of the cookie (#737)
c962428 Document development setup (#823)
2598dfe Allow python v3.14.x (#822)
7853e70 Bump actions/checkout from 5 to 6 (#817)
3e05bc6 refactor: remove python2 compatible import usages (#728)
c888e19 Remove required Python version limit  (#805)
dc561bc Bump actions/setup-python from 5 to 6 (#814)
1444393 Bump actions/checkout from 4 to 5 (#812)
efcad93 Fix query for #807 and #808 (#809)
19da0b8 pre-commit run --all-files, fix SQLQuery (#808)
3ba1b40 Address CVE-2025-3818 (#807)
9aeaf55 Fix: disable accessing special variables from template (#803)
25dc267 Automate PyPI release on new tag push (#797)
952d1fd Propagate field notes (#790)
d364932 Fix: enable Python 3.12 to parse templates (#785)
5709b1f Bump actions/setup-python from 4 to 5 (#788)
9913d80 Keep GitHub Actions up to date with Dependabot (#787)
cab78cf Fix: update deprecated sqlite3 datetime and timestamp adapters (#786)
ed3e92c Fix storify and multipart (#778)

Remove the upstreamed patch and add a license file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - use newly pushed tag
  - add a license file

 .../0001-Address-CVE-2025-3818.patch          | 42 -------------------
 package/python-webpy/python-webpy.hash        |  3 +-
 package/python-webpy/python-webpy.mk          |  5 ++-
 3 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 package/python-webpy/0001-Address-CVE-2025-3818.patch

diff --git a/package/python-webpy/0001-Address-CVE-2025-3818.patch b/package/python-webpy/0001-Address-CVE-2025-3818.patch
deleted file mode 100644
index d8373cbac6..0000000000
--- a/package/python-webpy/0001-Address-CVE-2025-3818.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3ba1b40e5a828a26a1df1b49cdc87395f3274c81 Mon Sep 17 00:00:00 2001
-From: Mek <michael.karpeles@gmail.com>
-Date: Wed, 7 May 2025 15:14:44 -0400
-Subject: [PATCH] Address CVE-2025-3818 (#807)
-
-* Address CVE-2025-3818
-
-Co-authored-by: Scott Barnes <scottreidbarnes@gmail.com>
-
-Upstream: https://github.com/webpy/webpy/commit/3ba1b40e5a828a26a1df1b49cdc87395f3274c81
-
-Fixes CVE-2025-3818: https://github.com/advisories/GHSA-9g47-36rw-gjh2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- web/db.py | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/web/db.py b/web/db.py
-index 5284f8d0..ba3e12c5 100644
---- a/web/db.py
-+++ b/web/db.py
-@@ -1198,10 +1198,18 @@ def _process_insert_query(self, query, tablename, seqname):
-                 seqname = None
- 
-         if seqname:
--            query += "; SELECT currval('%s')" % seqname
-+            query += self.get_sequence_query(seqname)
- 
-         return query
- 
-+    def get_sequence_query(self, seqname):
-+        import re
-+        # Ensure the sequence name is valid
-+        if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_$]*$', seqname):
-+            raise ValueError(f"Invalid sequence name: {seqname}")
-+        return SQLQuery("; SELECT currval(%s)", seqname)
-+
-+
-     def _get_all_sequences(self):
-         """Query postgres to find names of all sequences used in this database."""
-         if self._sequences is None:
diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 0fb39170c7..8514b6a4f0 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  eee36e423b5e85463145159d94735e3c3a4c1c8078555042d8139348350b0022  python-webpy-0.70.tar.gz
+sha256  c5d5df8b95c22cacb6be580cee88459922ff114894fe4e146da634ab3d1f9185  python-webpy-v0.76.tar.gz
+sha256  791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 62b2331c08..ef885cd428 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.70
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_VERSION = v0.76
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain
+PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
