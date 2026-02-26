Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF3FCE08F
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8F960F80;
	Thu, 26 Feb 2026 14:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew0ciFpPz4FS; Thu, 26 Feb 2026 14:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4802A6160C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115967;
	bh=XtS4NV4ZFUHRj2HAKKscsYqBYO/jiLt1+6X4to7qWE0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W39J4Xi22Xzj61mARNBc1fCb6jojMdDZDBZaYGwxMuaphyOoEU0xeNy1D8DuNmH1B
	 QexAhfivnBIBUB13JV2FVUAC1d1LBhZjV0xngV6+EhOUdWoUNZPI4RpSr8ErhjfRZT
	 p8qIRIs7F6W7SJUOohHgWA6NaKKf703C3qrtwRe2t06s7Pd/HA5gMmNWWkylGzOO98
	 8fUNXpJuh7e4vx2q6VhnWFlP3qxan19QNZmiY6nuNVX2Y1XuxzQXpiRtth82qxyNRl
	 /n5uJXSHjapw71eE/khoUnMlP6c2qevo5CE7V0g6KK1HcHeZ+uFqRNfcys1bhSsbqy
	 GuM3q4eXfPKwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4802A6160C;
	Thu, 26 Feb 2026 14:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ED3EA47
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD7A41400
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zxdokOKwvRw for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:01 +0000 (UTC)
X-Greylist: delayed 308 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Feb 2026 14:26:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 948FB40344
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948FB40344
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 948FB40344
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 0E6885A0003;
 Thu, 26 Feb 2026 15:20:51 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqq0BlAaqJpu; Thu, 26 Feb 2026 15:20:50 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 189AC5A0004;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:17 +0100
Message-ID: <20260226142023.1064241-3-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=zQ/tuycwUIuZM5IUUSp/02dS6NrnfImQH2eKLlGucow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sAqDf3P3ckmeay6lNGCiibNzwcqA7mmSnOqYCIETnqLXu9yHlXozKwmdNbhTvBsu5
 CqfjATjCqE/FIhGfU6e/Q9j1PG+kfuMxknn4rElJ8Q65I4JxTB82sIh7cAaF7L/eN9
 wxw90m7AE4Zz1aYC1MKJzv0PbOoPDMEjY7O/PlXBb4sOfgG3FPzqVcsGFF+JqN8T15
 g53PyxQiP4tXApH5NFhOCaRRgzozMKmYuCVIwyfKjJ3F+fCPaBE6CKrsBI4WIQiiwU
 k4FgtSQGZxU34nQsyU5+Uv6buC0E2MSQ8hUyXHAkFJhEag+APMzpfH61QDcWMRhcVj
 6zbFN2zkdddDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=sAqDf3P3
Subject: [Buildroot] [PATCH 2/8] utils/generate-cyclonedx: allow referencing
 patches by upstream URL if available
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

Scan patches for Upstream: headers that start with http:// or https://. If found,
reference the patch by URL instead of embedding the patch content in the BOM.
Also set the type to "backport" instead of "unofficial" for such patches.

The feature is gated by new --with-diff modes: url and url-only. url prefers URL
references, but falls back to inline diff content. url-only skips patch entries
without an Upstream URL, unless it resolves a CVE.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 44 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 25248a0e2d95..b3dfc9462020 100755
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
@@ -241,22 +262,39 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
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
 
         if patch:
-            patch["type"] = "unofficial"
+            patch["type"] = "backport" if upstream else "unofficial"
             patch_contents.append(patch)
 
     if not patch_contents:
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
