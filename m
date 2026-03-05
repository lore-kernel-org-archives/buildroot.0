Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506F7F30952
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63F182043;
	Thu,  5 Mar 2026 11:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F043zDKgJI3j; Thu,  5 Mar 2026 11:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C13B481F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711673;
	bh=rlmt29gy0UQYilYI18jRdKLo8Rg/gxBiwslOasYW+7M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gic2mDtyU3lPS1B7uOvgJoPQ/vqxdaNKc2ToztnyssCcDuVbPwIFbT0PUePvsM2dN
	 qtNbZWH5XQn1PaqCWflcwkQ5+tyjHNVwW+Ihc7Vf/o8DOvUcuC4tYzYNMXCvtO3kLN
	 N0xRotEKJT7ZoSIqrBdES/cLQmQ2qRXwY4SDMPHXrfH0NnLjyrHb6ZT93yT4CN+G7C
	 Gnmu88DM99RR5iYIyrh8ecnFv1Kzdo1gydpoedd8I0ORqNWWwZTTI5QCUL7MwcJBq2
	 /jReuU/wAwhJS7aGH0e2uadzRw9dGc0SivG5MaCEakMNh07M1psljD6uuWz54JYaBD
	 mWCApo+AiaffQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13B481F93;
	Thu,  5 Mar 2026 11:54:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F8B223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED28260B04
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ze2MBY1QXzZ for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42C5E60B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C5E60B16
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42C5E60B16
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 361B15A0007;
 Thu, 05 Mar 2026 12:54:25 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQEvSXhHCO8u; Thu,  5 Mar 2026 12:54:24 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 728995A0009;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:10 +0100
Message-ID: <20260305115413.1860514-5-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=cvfV2nklym6dV8BC+v1cvO8Y549j3Wxt00VOIBwMKJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B2jquHqFXJefG4ulbhL1zLDgHW9mzKYTEckm3PyCw/NKylLFrcd00CyFkiZT1QeCI
 sL7zNJCzvkC46VLAXf3Ov58ChwRshuJfKYjpK8Rzys530mWhDBa1OrDeIce7mBqhU2
 16+Us2rP64kXBAvG6GUmrDCKuNl5b6Io6+itFq1onQ7Xjcm4HQpuAShsDTdN+3uMPt
 ZsBthS51y8q1SE7chKkdsp9MtkMoG6jfybCNwtv0n5N0lsKYKwc5USz5g/ddf8OP6K
 5BJlc237Bg8ApodItIbw9V6rh6hNzlmYgv6vYCCr6yGFI/Xfhyr5Y6cQeLpGijDLLV
 0lTV1ezpR4KrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=B2jquHqF
Subject: [Buildroot] [PATCH v2 4/7] utils/generate-cyclonedx: allow
 referencing patches by upstream URL
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

Scan patches for Upstream: headers that start with http:// or https://. If
found, reference the patch by URL instead of embedding the patch content in
the BOM.

The feature is gated by new --with-diff modes: url and url-only. url prefers
URL references, but falls back to inline diff content. url-only skips patch
entries without an Upstream URL, unless it resolves a CVE.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 27 ++++++++++++
 utils/generate-cyclonedx                      | 42 ++++++++++++++++++-
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index dc850dd4e2b6..274e78ab3f8d 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -149,3 +149,30 @@ class TestGenerateCycloneDX(unittest.TestCase):
         foo = self._find_component(result, "package-foo")
         patch = foo["pedigree"]["patches"][0]
         self.assertNotIn("diff", patch)
+
+    def test_diff_url(self):
+        info = self._make_show_info()
+        result = self._run_script(["--with-diff", "url"], show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        foo_patch = foo["pedigree"]["patches"][0]
+        self.assertIn("url", foo_patch["diff"])
+        self.assertEqual(foo_patch["diff"]["url"], "https://patches.example/foo.patch")
+
+        bar = self._find_component(result, "package-bar")
+        bar_patch = bar["pedigree"]["patches"][0]
+        self.assertIn("text", bar_patch["diff"])
+        self.assertIn("world", bar_patch["diff"]["text"]["content"])
+
+    def test_diff_url_only(self):
+        info = self._make_show_info()
+        result = self._run_script(["--with-diff", "url-only"], show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        foo_patch = foo["pedigree"]["patches"][0]
+        self.assertIn("diff", foo_patch)
+        self.assertEqual(foo_patch["diff"], {"url": "https://patches.example/foo.patch"})
+
+        bar = self._find_component(result, "package-bar")
+        bar_patch = bar["pedigree"]["patches"][0]
+        self.assertNotIn("diff", bar_patch)
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index adae419b9cca..4cd991dde467 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -15,7 +15,7 @@ import json
 import os
 from enum import Enum
 from pathlib import Path
-from typing import Any
+from typing import Any, Optional
 import urllib.request
 import subprocess
 import sys
@@ -47,6 +47,8 @@ SPDX_LICENSES = []
 
 class DiffMode(str, Enum):
     INLINE = "inline"
+    URL = "url"
+    URL_ONLY = "url-only"
     NONE = "none"
 
     def __str__(self) -> str:
@@ -145,6 +147,24 @@ def extract_cves_from_header(header: str) -> list[str]:
     ]
 
 
+def extract_upstream_from_header(header: str) -> Optional[str]:
+    """Extract upstream information from the patch header.
+
+    Args:
+        header (str): Content of the header of a patch.
+
+    Returns:
+        str|None: Upstream information if present, otherwise None.
+    """
+    PATCH_UPSTREAM_HEADER = "Upstream: "
+    for line in header.splitlines():
+        if line.startswith(PATCH_UPSTREAM_HEADER):
+            upstream = line.partition(PATCH_UPSTREAM_HEADER)[2].strip()
+            if upstream.startswith("http://") or upstream.startswith("https://"):
+                return upstream
+    return None
+
+
 def patch_retrieve_header(content: str) -> str:
     """Read the content of a patch and split the header from the content.
 
@@ -220,6 +240,7 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
     for path in patch_list:
         patch_path = brpath / path
         patch: dict[str, Any] = {}
+        upstream = None
         if patch_path.exists():
             try:
                 content = read_patch_file(patch_path)
@@ -241,16 +262,33 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
                     } for cve in cves
                 ]
 
+            upstream = extract_upstream_from_header(header)
             if mode is DiffMode.INLINE:
                 patch["diff"] = {
                     "text": {
                         "content": content
                     }
                 }
+            elif mode is DiffMode.URL:
+                if upstream:
+                    patch["diff"] = {
+                        "url": upstream
+                    }
+                else:
+                    patch["diff"] = {
+                        "text": {
+                            "content": content
+                        }
+                    }
+            elif mode is DiffMode.URL_ONLY:
+                if upstream:
+                    patch["diff"] = {
+                        "url": upstream
+                    }
         else:
             # If the patch is not a file it's a tarball or diff url passed
             # through the `<pkg-name>_PATCH` variable.
-            if mode is not DiffMode.NONE:
+            if mode in {DiffMode.INLINE, DiffMode.URL}:
                 patch["diff"] = {
                     "url": path
                 }
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
