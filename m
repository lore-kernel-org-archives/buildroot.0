Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EFCE9DE65
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3822D41053;
	Thu,  9 Apr 2026 08:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veklAvE_w0_r; Thu,  9 Apr 2026 08:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D804940F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775722471;
	bh=nzEEtXDIL3EP+yRxcPab0XK571xKe1PW9l3KdhMIJ9g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cU6LTEG7iDeP8PNaduRgc6m7JkCHF7A0vkywxYy6MGUsk1nevJcf7JXGFsTKafY80
	 7gxs5eKatfqnwUPBW2qv1S3Qt3Zh4aFcgtfSg9+/yEkYTffqnyPmSGppHtYC+64kIJ
	 5nJnKPqwIl7DoLJAlVRnZybQ5XxHxqSec2sh4hvdrlbNi04qGK3TUGaDXC7tOVsCDx
	 Q5DkCLAUhonYC3z2CI+wzx/oM4GqCBAXN1NRe9FYgOdnmK7BgP0FbXxCBC0H+95jpu
	 7F4GLgsznKu9rgiG2ZtmPzEv0FEKnOWZX6Z4BjC2ssNRwvsm1Gv5S99QMnXbmdPdx6
	 KwRrWODVwp1Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D804940F33;
	Thu,  9 Apr 2026 08:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D6891D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A06607E0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJY97TJL6CzI for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C163F60D92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C163F60D92
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C163F60D92
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 0591C5A0006;
 Thu, 09 Apr 2026 10:14:21 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq0kokaAOGqC; Thu,  9 Apr 2026 10:14:19 +0200 (CEST)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 0441D5A0007;
 Thu, 09 Apr 2026 10:14:18 +0200 (CEST)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  9 Apr 2026 10:13:58 +0200
Message-ID: <20260409081401.2060709-4-martin@strongswan.org>
In-Reply-To: <20260409081401.2060709-1-martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775722458;
 bh=aO4qeil6ItUC8W9Jt1QjwxklpYtrvQlZvm2rJNsrnAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QM64Rq/cWEyofI5QvcPDN5Rny3X0EIzOxz433MNU6cU/383jLPbwDgP4oJ4CHo4cS
 wK/zu5+SSnZJq6sfvsmA6DhUR6U9VmKDXtOnAFLlD9232uZDV1xBFHJ5/mOGnaAwEG
 4i+65VjzzF01YQ4FkNXtmw/Ce+dmDjNPfMWtgRdI30nqGkm2Ggw8dA0lHgL8aqbUrg
 exwQiIpigOC20ab8WskmQfXCAq2t7PHb8qGbp4CMPBv35DNm+vBSdHsWMG1t6tTHUI
 SRYmFJrUGX7MC73OsLRHdS73NtOczgpZGLcx0LqYea1Pht+H5aheuTXT1zN6wChGDt
 o+BxE/TBwZDag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=QM64Rq/c
Subject: [Buildroot] [PATCH v4 3/6] utils/generate-cyclonedx: generate
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
 .../tests/utils/test_generate_cyclonedx.py    | 26 ++++++++++
 utils/generate-cyclonedx                      | 47 +++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index bf1b8e099bf9..a071ff867923 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -140,3 +140,29 @@ class TestGenerateCycloneDX(unittest.TestCase):
 
         foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
         self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
+
+    def test_external_references(self):
+        info = self._make_show_info()
+        info["package-foo"]["downloads"] = [
+            {
+                "source": "foo-1.2.tar.gz",
+                "uris": [
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
+                },
+            ],
+        )
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index f4d5afd847e5..a3b7293f9a5e 100755
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
@@ -261,6 +263,50 @@ def cyclonedx_patches(patch_list: list[str]):
     }
 
 
+def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
+    """Parse download URIs into (schemes, url) tuples.
+
+    Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
+    Buildroot schemes with the stripped URL, excluding
+    sources.buildroot.net mirrors.
+
+    Args:
+        uris (list): Array of URI strings from the show-info output.
+    Yields:
+        tuple[list[str], str]: (schemes, url) for each usable URI.
+    """
+    for uri in uris:
+        scheme, _, stripped_uri = uri.partition("+")
+        if stripped_uri:
+            parsed = urllib.parse.urlparse(stripped_uri)
+            if parsed.hostname != "sources.buildroot.net":
+                yield scheme.split("|"), stripped_uri
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
+    SOURCE_DIST_SCHEMES = {"http", "https"}
+
+    refs = []
+    for download in comp.get("downloads", []):
+        source = download.get("source")
+        for schemes, uri in parse_uris(download.get("uris", [])):
+            if set(schemes) & SOURCE_DIST_SCHEMES and source:
+                refs.append({
+                    "type": "source-distribution",
+                    "url": f"{uri}/{source}",
+                })
+    if refs:
+        return {"externalReferences": refs}
+    return {}
+
+
 def cyclonedx_component(name, comp):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -284,6 +330,7 @@ def cyclonedx_component(name, comp):
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
