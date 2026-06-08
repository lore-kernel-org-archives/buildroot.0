Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DEACD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 09:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA64A40BB5;
	Mon,  8 Jun 2026 09:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rX2dEE69xhcE; Mon,  8 Jun 2026 09:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FBD40BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780910788;
	bh=lm/gN3mn6YIR0UTeVCdxM3Z8KaSb6kqvbewfrNI1ex8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OGODJRdNZj5NYsMTvA7T5jjtc1s9SzB8t5+C6zR/DPU4etEBEO0TY5fNlmYc//Uic
	 FNZSWXL8RmsId7AvDZdCsHNZ4vkujMFgINE5gFgtMYkrFvSkD9rxIi5WVUkVCDAJcr
	 mXwFxJ0dQJHFCU8iX+SpVp2kb8J4Ff9wsECWeq7JIaJ+McM0C2pB74NRPLWh8pnoI3
	 nlUpq5gq2InCq2WPeIeS9NSCXUXIKeVNj35nAoDhLWUxirsrRVCxXRBWPeP3/TDZJw
	 xY2+6WlIlkmZyx80wCwP40QJezuppeIpnvVt02UcwRdS/FM0TFp9wy6Cr6xd18NzXU
	 bbS7iDB4VUrYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83FBD40BBC;
	Mon,  8 Jun 2026 09:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7372C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 09:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F62D614B2
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 09:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmBHLEn8CTIA for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 09:26:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68CA260828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68CA260828
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68CA260828
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 09:26:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6912f4acca4so3961542a12.1
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 02:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780910784; x=1781515584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNt+VoGT4QyP4WRzUZE86jne89hfxsgbfZmfMs3Mk18=;
 b=cLla4tteFxVjCHnVSVYHQaxy4vHnX1tHLxrU9fjiCr/LBtcQj9rid7VJ6M49kfntQ0
 Fm4S7A7URHsbm54pME3dugbSzRldKgz2rnrNetBjT6rOVEJgK+i9c4cW13QV7aMQBt1k
 6r1CD8HblcxRY2oLugBQJWNZjLK//zkPjN4ky45uQOlFwyCaAnFQ8pw5eWGvpj4J1p5b
 pb3NIxbNUEIHUGV7fLtNHTO/uHlKfGPV7g4touEU/yp8hbfrqDTY8MfN9/wf6zQoFICq
 Hmh7uTFLz2LhGg9MGuD2n39ZjKhTe8HjSjSsxDB2veVllbAsCvJ7hxWfhiiKI31ZhfCG
 Tikw==
X-Gm-Message-State: AOJu0YwvOmF12PmaDygsD829L4vkgHIN8Jw1nMZ0vRXSTDmznCbryYwV
 rpTtRnS9wOtOB8Y6XHRVlf49MzBpdx2T66pY6b+mLlR4+WNHlpvbNvl23nIcbw==
X-Gm-Gg: Acq92OGUn1e5UuQZAUUKKb16AznHzx99uPY8gjMZw1hMUTjkqbG77hIYJTCaq65AFAH
 0u2Wmra2zN9YVTfD24TAAfHEbg1bSpjlznli74TW22trGX2eiNiVDoeusTltYPn2cMXEweQvhD7
 K9rhDDYGCDozzBgttizC7yxX3er4moQM3kfl9+L0KT4j7WJjZkUeIuAEc0jFZh0+jKDmPDMBnrL
 TsD5XyYCUi2irUojO1Ubj5utwH3GduKFhlF3ywPXrvPcf3HzYsvdnP6QFbXdj/SBaxQG/JmUgPC
 R64UdUovqpS9xHR9b0Bx7/00u3zHfig6VPJMDQpvmj66ZCmYKc+KVt5MLTF349CVfxgAY5JqEPZ
 oYcEPUKUitunSFtutVPYmUoZskZxeMm7p2ddAkrltPa8+8GIF9BV1NwPmaXygKEIUAOVlWtR9Lz
 MTwlnm0FrKsRcN2RdTMQ9tKcMogRUHCGYLRILFSPV+fz7lZoaj87eewlAXZUHvzExfvqwS02/CY
 pS5pjFQS92jovFsEg==
X-Received: by 2002:a17:906:459c:b0:bec:3548:1144 with SMTP id
 a640c23a62f3a-bf370188a98mr498758966b.11.1780910783913; 
 Mon, 08 Jun 2026 02:26:23 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055309368sm829127166b.49.2026.06.08.02.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 02:26:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 11:26:15 +0200
Message-Id: <20260608092615.3773814-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1780910784; x=1781515584; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QNt+VoGT4QyP4WRzUZE86jne89hfxsgbfZmfMs3Mk18=;
 b=HMD4r23jykdtQ8PA82TXa/BqlWjbPNONBdopd/8w2RAOOCq3rk2wh+iCgb6NKlgATB
 v30Aaqr/xpIyvLbj2fQ0W6x7I7oXWUYhosu+tWNmZ3vcCkqwu5EiESDU7PmP3KbCWLbc
 h7s6QPe1wqXzWWCdFLRhnpmiaVy8GWeljDletvTrqdmUYCX0Z2FKCWjcybMPB2qnyTlG
 KGGf20l+GF8WGCeV0UnK/s+vDKCT0H5Hztg9CW+U6FHekzQNx5KhiVAcY1lTzwJ2/1bS
 viQAfQmbpyIz48sXYXD/0uaLzw+3DCTYPC0TpOU14c0v4dVTGAWUwka6BBYTij7VdkqK
 0gsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HMD4r23j
Subject: [Buildroot] [PATCH] package/python-webpy: bump to version 0.76
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

The repository doesn't provide a git tag so use git commit to
specify the version.

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

Remove the upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-Address-CVE-2025-3818.patch          | 42 -------------------
 package/python-webpy/python-webpy.hash        |  2 +-
 package/python-webpy/python-webpy.mk          |  4 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
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
index 0fb39170c7..25ee53242a 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  eee36e423b5e85463145159d94735e3c3a4c1c8078555042d8139348350b0022  python-webpy-0.70.tar.gz
+sha256  ed23999eb7dfa35bfd1ce75c5a828b9cf92e62891147ec6942e644b967137ad3  python-webpy-0.70-19-g99e5eed8e3a210b4951ca1ed5cb5575479a25c99.tar.gz
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 62b2331c08..dafdc3d17c 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.70
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_VERSION = 0.70-19-g99e5eed8e3a210b4951ca1ed5cb5575479a25c99
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
