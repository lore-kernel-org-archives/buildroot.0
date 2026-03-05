Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C2F30952
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5B0821CA;
	Thu,  5 Mar 2026 11:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icZghzDFsPV6; Thu,  5 Mar 2026 11:58:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85336821C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711900;
	bh=5s8rd9I+ai4sHABxgILi7En7S86gJwyBtE0sqnBmtUs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gar9+7MhI9FzeroL8y9/e03GoMrJs7Zg588tpbT7EHZFkQisToJbvy19EaeRTr+7j
	 GvUjuNZwNmMnK+qvs2V6SVSPzOi9j4uDPQR42EgIZYzqS0uoPcH2a5aTqpxTutQQAq
	 /sR0a3hX1hhPqPilfBlbyEjvt2K3HfjQ6GdhwAsbBag7Hbx1JWJbpsbYQEkgzXslcw
	 7zbCE89zC35rtElUTS902yS1/Ve8nl1Z7xpdxeFiLCfQmGcjvulqKrkw+QgAovjqdH
	 mGoC/7IdWgY3iubPHorxxS8tGcfKawjKzl77xditMFzl6yZs3PHUryKI1dCLPLkTJO
	 uujFpbDvE0G6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85336821C1;
	Thu,  5 Mar 2026 11:58:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AA1225B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C6AE60B08
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cl8_F-u8JTN1 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EFDB60B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFDB60B04
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EFDB60B04
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5EAC85A0007;
 Thu, 05 Mar 2026 12:58:14 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfN_tTKwB4xi; Thu,  5 Mar 2026 12:58:12 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id CBFE75A000B;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:51 +0100
Message-ID: <20260305115752.1861153-8-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=DzNHYfvhF6hNdavxG49Pan1O15CWdNeityWAaKFvGIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KOP+suwfgAAWIlHJH5eBhqdYjQZhwzAPzfC/pGqVko1WeFwCuCSeTDyiNfkECBWrn
 OIU/XFU+FYvk2Rvd98ZTwsrnMMmxOhVBbcmmYU1895cdSHg6OssDAlWAAyIXGO32Sg
 v8Bk6WCKPqHlQCCiYS7sAgvl+MdXq10KfAPYa1X46A+GeL0ESNPxb2+VCReQ+Xj0l+
 QkccG3PHtyk5fE5ErkCNvKem3/3IzBHMaFGqYEZ7/xicjaaRTp3JjgZsDF7ZREz8qP
 qlKhMqAis2C+wKeJvcO2Cix0XqarcAdlDOwoDSivnDRw2/ALXbTghN8tc6LvkSo0PP
 sHvk9PX2TVX4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=KOP+suwf
Subject: [Buildroot] [PATCH v2 7/8] utils/generate-cyclonedx: generate
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
 utils/generate-cyclonedx                      | 40 ++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index eb3132d65775..9116c0ec844b 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -313,3 +313,30 @@ class TestGenerateCycloneDX(unittest.TestCase):
             component["manufacturer"],
             {"url": ["https://manufacturer.example/binutils-target"]}
         )
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
index 93c7b5b28b92..fcf6b64470ad 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -15,7 +15,7 @@ import json
 import os
 from enum import Enum
 from pathlib import Path
-from typing import Any, Optional
+from typing import Any, Iterator, Optional
 from datetime import datetime, timezone
 import urllib.request
 import subprocess
@@ -354,6 +354,43 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
     return {}
 
 
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
 def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -378,6 +415,7 @@ def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
+        **cyclonedx_external_refs(comp),
         **cyclonedx_patches(comp.get("patches", []), diff_mode),
         **({"properties": [{
             "name": "BR_TYPE",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
