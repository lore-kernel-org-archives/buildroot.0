Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6365BFCE091
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA4C61614;
	Thu, 26 Feb 2026 14:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpCLmlDFshyM; Thu, 26 Feb 2026 14:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8F361618
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116047;
	bh=VMg6GC7A/vEw0ZDCrwzANc7GiMWV3XRpaOr2pZC3i2g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKqq4jLRJ+8PWc4dXGFIhmyYegT9Xd04wiS5Sgnw69ySGmV1OaTuUcSzVCKhGLhdq
	 yJt1qFHDCwHFA/1bURZcoACkcocLEOCtQjWDp1ICpGnpa9b5PrYMPmkJaFu/1KgUnR
	 mWdFbBCckRXl08erKTdYa++KMct9T++E8u2VgeM/mTP8NzaKg1qf88y6bZ/beoLeId
	 3Zuf/3ovDqweh5vIrFLc6CUC2dF8F13AngMSvGpEELbDMhsKiRppDvP3PrNQqobvNi
	 Rbr+ZT3gOsdRfRn6q+VJxNUGBtJ1ymXK2MGoLymn6IGcjr+9T0p/EZ+B7Ez84mwtOZ
	 0PN1pUMsribtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8F361618;
	Thu, 26 Feb 2026 14:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 153E623D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06B6C61614
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94CMxswMXUrE for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBDD261610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBDD261610
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBDD261610
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 3BFE55A0002;
 Thu, 26 Feb 2026 15:27:19 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2phCEor0phIc; Thu, 26 Feb 2026 15:27:18 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 627855A000A;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:58 +0100
Message-ID: <20260226142700.1064999-8-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=S6fq/HsymsZbDuR044umg3CvUZeKRd7DeUrOYQI8Muk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MYF47h7QWNqGt5y4tcNbuqyVeSL9g6lJNjO+r4O7NupiKWzgrEI3q33RZeNCRP/H0
 w5pY4mr0tjKCDtWe9P4BZfGG28yipvHc4rbnu78vxwvLxR79TaO6c/A02ijjexvJhc
 YkqyidqJPbqFf7xpFt2XWF0OEfua0CdJ+zFUeueyKjIeoOpdUAedL+2Rww7z8+SDYk
 vOyqi8aKHTIoPaeUluPwjBihpc9CQxw1pxshG80W700wpkcIKW2snBHj6XkfzMucgj
 7+8tv7da/8uwJna56aq7YX2/Y1g5IqZdoHC16hV2bG9qg9XKjf9/w1cZvRPLSYrDQa
 BV9voD8q7oknQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=MYF47h7Q
Subject: [Buildroot] [PATCH 7/9] utils/generate-cyclonedx: add generic purl
 for http(s) source URIs
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

Not all Buildroot packages provide a CPE identifier, so some components lack
a strong identifier. In addition, some SBOM tooling prefers purl-based
identification.

Add generic purl generation based on source tarball URLs. When a package has
an http/https download URI, generate a CycloneDX generic purl with a
download_url qualifier.

This generic form may not be recognized by all vulnerability databases, but it
provides a useful fallback. More specific purl types (for example PyPI, CPAN,
etc.) can be added later.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index f551e3ffbd6a..0b38a0317cbe 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -15,8 +15,9 @@ import json
 import os
 from enum import Enum
 from pathlib import Path
-from typing import Any, Optional
+from typing import Any, Iterator, Optional
 import urllib.request
+import urllib.parse
 import subprocess
 import sys
 import re
@@ -354,6 +355,36 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
     return {}
 
 
+def generic_purl(uri: str, comp: dict[str, Any], source: str) -> dict[str, str]:
+    """ Create a generic purl entry for a URI and source. """
+    if name := comp.get("name"):
+        if version := comp.get("version"):
+            return {
+                "purl": f"pkg:generic/{name}@{version}?download_url={uri}/{source}"
+            }
+    return {}
+
+
+def usable_download_uris(uris: list[str]) -> Iterator[str]:
+    """ Get usable normalized URIs from a list of buildroot URIs. """
+    for u in uris:
+        parts = u.split("+", 1)
+        if len(parts) == 2 and {"http", "https"} & set(parts[0].split("|")):
+            yield parts[1]
+
+
+def cyclonedx_purl(comp: dict[str, Any]) -> dict[str, str]:
+    """ Create CycloneDX purl entry for a component. """
+    for download in comp.get("downloads", []):
+        for uri in usable_download_uris(download.get("uris", [])):
+            host = urllib.parse.urlparse(uri).hostname
+            if host and host != "sources.buildroot.net":
+                if source := download.get("source"):
+                    if generic := generic_purl(uri, comp, source):
+                        return generic
+    return {}
+
+
 def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -375,6 +406,7 @@ def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
             "version": comp["version"],
             **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
         } if not comp["virtual"] else {}),
+        **cyclonedx_purl(comp),
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
