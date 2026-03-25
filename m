Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5FD106B53A
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82CE461374;
	Wed, 25 Mar 2026 13:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cZIpZkTnQrV; Wed, 25 Mar 2026 13:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4FB61362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774445635;
	bh=G8MAU1AqdbRaWbgT/66F9kpXH4ShKSfbPcVzlTpjD8Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlMnQSFtYYnOjvuuOBpvZCn49QebMGFHnF8mK+XLnNGnuNvOl2th6HjbDoWyngouV
	 ebEgl7YRXhzKpmlUCIennTOylGq7e+tCdKm0+yt/DCBa8ql0Xwcp7TpyFSg4gdxT1D
	 Mo6b37NPmWUfc44mEXqPWU01uM7FI/gVNUrrZ3k6it+VrWTiwB6V7SQDI4pFUmVZzS
	 ezhzCJcbIrgLqO3QONNLpnpLVPbPfxUppl6C062RygQrGFDpxCRXlupOsS/80K8SlS
	 2/KQtTMgYy+Qf5KoqgP1dfoUIbjkf6GuWjijuaGhxgPgHpgGOA8WsVt/eOkwKYXzHc
	 rWqFI+wlJMNLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4FB61362;
	Wed, 25 Mar 2026 13:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09065F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E28078230A
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG7FT82Gy48Y for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6E1A8224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E1A8224A
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6E1A8224A
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id D21635A0004;
 Wed, 25 Mar 2026 14:33:48 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RVGyHh38nfl; Wed, 25 Mar 2026 14:33:47 +0100 (CET)
Received: from zbook.home (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 470B75A0005;
 Wed, 25 Mar 2026 14:33:46 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 25 Mar 2026 14:33:41 +0100
Message-ID: <20260325133343.1008245-4-martin@strongswan.org>
In-Reply-To: <20260325133343.1008245-1-martin@strongswan.org>
References: <20260325133343.1008245-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1774445626;
 bh=s8cI2l7vsRTFraMZPpRAV1O4dKAMLBwkSVPUmwKHoFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q5WU8XElFXWMRZGIr6n4tOIq+YOaF6YkBuAIkoTrhDB6kGTK1dfNGEO4aJ+mGvonC
 IV0Mwk5HuUNmeEmLH7bwfvjhW7QJk83/WQGPULAz6Epwbf/jDEhG32VGX0Pixxe8G/
 PxYVIyO9WyJDelZig88GhWqqboCQ8UGV/K85H4I93zKfc8qCy/QuVq7B9j3EEHASaR
 7IKefPMPCzuOdFQzPDeAGJJJI7Ce2RdaCYaqvejJmbweKM2eDjHNDL7MXAtYF46b7w
 P+NBWxwUbV+EUfBDhK9e7UV51atOL9dfrCT8bVRySm+tlMnCiVfqRw/gXAvoGjJu6k
 uj2e45+OVjRAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=q5WU8XEl
Subject: [Buildroot] [PATCH v3 3/5] utils/generate-cyclonedx: generate
 externalReferences with source-distribution
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

BSI TR-03183-2 5.4.2 [1] lists source code URIs under "Additional data fields
for each component", and as such "MUST additionally be provided, if it exists".

If a http or https source download URI is available from show-info, extract
it and include it as an externalReference of type "source-distribution" in the
CycloneDX output.

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 27 +++++++++++++
 utils/generate-cyclonedx                      | 40 +++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 9b041ffb61fb..9c2bd2bc9180 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -137,3 +137,30 @@ class TestGenerateCycloneDX(unittest.TestCase):
 
         foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
         self.assertEqual(foo_deps["dependsOn"], ["package-bar", "package-virtual", "skeleton-baz"])
+
+    def test_external_references(self):
+        info = self._make_show_info()
+        info["package-foo"]["downloads"] = [
+            {
+                "source": "foo-1.2.tar.gz",
+                "uris": [
+                    "git+https://git.example.org/foo",
+                    "https+https://sources.buildroot.net/foo",
+                    "http|https+https://mirror.example.org/foo",
+                ],
+            },
+        ]
+
+        result = self._run_script(show_info=info)
+        foo = self._find_component(result, "package-foo")
+
+        self.assertIn("externalReferences", foo)
+        self.assertEqual(
+            foo["externalReferences"],
+            [
+                {
+                    "type": "source-distribution",
+                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
+                }
+            ],
+        )
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 70abd7af7c89..3946380ae3ef 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -14,6 +14,8 @@ import gzip
 import json
 import os
 from pathlib import Path
+from typing import Iterator
+import urllib.parse
 import urllib.request
 import subprocess
 import sys
@@ -261,6 +263,43 @@ def cyclonedx_patches(patch_list: list[str]):
     }
 
 
+def usable_download_uris(uris: list[str]) -> Iterator[str]:
+    """Filter the download URIs to find usable HTTP/HTTPS URLs.
+
+    Args:
+        uris (list): Array of URI strings from the show-info output.
+    Returns:
+        Iterator[str]: An iterator over usable HTTP/HTTPS URLs.
+    """
+    for uri in uris:
+        parts = uri.split("+", 1)
+        if len(parts) == 2 and {"http", "https"} & set(parts[0].split("|")):
+            if urllib.parse.urlparse(parts[1]).hostname != "sources.buildroot.net":
+                yield parts[1]
+
+
+def cyclonedx_external_refs(comp):
+    """Create CycloneDX external references for a component.
+
+    Args:
+        comp (dict): The component information from the show-info output.
+    Returns:
+        dict: External reference information in CycloneDX format, or empty dict
+    """
+    for download in comp.get("downloads", []):
+        for uri in usable_download_uris(download.get("uris", [])):
+            if source := download.get("source"):
+                return {
+                    "externalReferences": [
+                        {
+                            "type": "source-distribution",
+                            "url": f"{uri}/{source}",
+                        }
+                    ]
+                }
+    return {}
+
+
 def cyclonedx_component(name, comp):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -284,6 +323,7 @@ def cyclonedx_component(name, comp):
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
+        **cyclonedx_external_refs(comp),
         **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
         "properties": [{
             "name": "BR_TYPE",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
