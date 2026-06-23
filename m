Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F66CDB470
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 18:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A496240AA8;
	Tue, 23 Jun 2026 18:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBPiSFVHRIA0; Tue, 23 Jun 2026 18:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 688CF40A83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782238833;
	bh=hVQOd4z/t0fKaDcXuZqu4fRJ5BZ+ml8JY0HeSK+JYLY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RSBnG1VNPncHlGESwglIxmxlvDApjiBIsKa/tmKWq+gwVGCptFo+DTI95E+ojM63m
	 UcpoL+CG9y76Z45aGOUqKys2HbRCS0UY0832CB+9l5/E6n41pksL2kF1BGh7cLnmIV
	 W90I40TpU8sH5laG7T/1hSgF7rQenLfPndByyLTrKx0A6eceLB0DOS7wizW9abg1Nt
	 tRAXUnF/dz8K+YoWrkls5af68WHCH/E1jiWzSeHawbupBP7Os0e0rXRbV5XQy43ECv
	 iCzde1t8oXYg6e4XlffSGrSNeXzVXMNGNl8EY8e6MRnageDSkIm16XSCfmDP6T27Sa
	 uE4GxcFrH0FHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688CF40A83;
	Tue, 23 Jun 2026 18:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C197157
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 18:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 048BE40A83
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 18:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2HFIQQAhUSS for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 18:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAE8440A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAE8440A82
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAE8440A82
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 18:20:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c817.dip0.t-ipconnect.de [79.214.200.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37380A4C226A;
 Tue, 23 Jun 2026 20:20:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56850)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wc5jU-000000000HQ-3bvo;
 Tue, 23 Jun 2026 18:20:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 23 Jun 2026 20:20:24 +0200
Message-ID: <20260623182024.2068785-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782238825;
 bh=EKVjx/bW0WIwDJRK6gqWWRCrIKG4CWYXgCb4wFDTWMo=;
 h=From:To:Cc:Subject:Date:From;
 b=EkxOp+50vJ7YEWT+aFcZdqgpENLm/KTvnn9x9DjCR/3TX+DysbEIVB2QVJeOcqDHh
 0iOw6IF60H0pt5LCJZsc6IrzqcbQngSIwFDBHVvXoud8Ed/M7W6EpqLjc/i74i8Ckn
 twp/65DliUkNCFhlV+VgUMIWaka+Xrxj+bx7VB3vogsHfSEvKlGMdsIao1n0Be3PAT
 v9RqEkZ4zhjZYw8Rjy7EJE5+N37G/CrceCkwSgjTZxw9wNkVEPNBiUOq9wtgYgchNT
 k+IIliEBS+5OrpDnenVml7pOk1uOYCk32pnZaRKQmS7YR9Ohk+l/J/1KlI/0U6BWCl
 BvP30LdNGd5dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EkxOp+50
Subject: [Buildroot] [PATCH 1/1] package/python3: add upstream security
 patch for CVE-2026-11940
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://seclists.org/oss-sec/2026/q2/1006
https://www.cve.org/CVERecord?id=CVE-2026-11940
https://github.com/python/cpython/pull/151559

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8200789782546a265af81c894a442a2e64091bcc

 ...ix-symlink-escape-via-tarfile-hardli.patch | 83 +++++++++++++++++++
 package/python3/python3.mk                    |  3 +
 2 files changed, 86 insertions(+)
 create mode 100644 package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch

diff --git a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
new file mode 100644
index 0000000000..d3454a7a6b
--- /dev/null
+++ b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
@@ -0,0 +1,83 @@
+From 79c06bd5c6afa3c440d50faf7ee1b147c8832b4c Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 15:58:47 +0200
+Subject: [PATCH] [3.14] gh-151558: Fix symlink escape via `tarfile`
+ hardlink-extraction fallback (GH-151559)
+
+(cherry picked from commit 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
+
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
+Upstream: https://github.com/python/cpython/commit/79c06bd5c6afa3c440d50faf7ee1b147c8832b4c
+CVE: CVE-2026-11940
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/tarfile.py                                |  3 +++
+ Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
+ ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
+ 3 files changed, 30 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 39b1cd6514c..399f906efdf 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2784,6 +2784,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
+                     "makelink_with_filter: if filter_function is not None, "
+                     + "extraction_root must also not be None")
+             try:
++                filter_function(
++                    unfiltered.replace(name=tarinfo.name, deep=False),
++                    extraction_root)
+                 filtered = filter_function(unfiltered, extraction_root)
+             except _FILTER_ERRORS as cause:
+                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 8503024a690..045377d620c 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
+                     self.expect_file("boom", symlink_to='../../link_here')
+                     self.expect_file("c", symlink_to='b')
+ 
++    @symlink_test
++    def test_sneaky_hardlink_fallback_deep(self):
++        # (CVE-2026-11940)
++        with ArchiveMaker() as arc:
++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
++
++        with self.check_context(arc.open(), 'data'):
++            e = self.expect_exception(
++                tarfile.LinkFallbackError,
++                "link 's' would be extracted as a copy of "
++                + "'a/b/s', which was rejected")
++            self.assertIsInstance(e.__cause__,
++                                  tarfile.LinkOutsideDestinationError)
++
++        for filter in 'tar', 'fully_trusted':
++            with self.subTest(filter), self.check_context(arc.open(), filter):
++                if not os_helper.can_symlink():
++                    self.expect_file("a/")
++                    self.expect_file("a/b/")
++                else:
++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
++
+     @symlink_test
+     def test_exfiltration_via_symlink(self):
+         # (CVE-2025-4138)
+diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+new file mode 100644
+index 00000000000..74459d5680e
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+@@ -0,0 +1,3 @@
++Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
++filters where crafted archives could create a symlink pointing outside the
++destination directory. This was a bypass of :cve:`2025-4330`.
+-- 
+2.47.3
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ff9afbb5a9..fabbdac384 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
+PYTHON3_IGNORE_CVES += CVE-2026-11940
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
