Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1339DF30954
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A6181EC1;
	Thu,  5 Mar 2026 11:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jol663zdYB6K; Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F174C81EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711670;
	bh=9cJ+yoLYpQxy4b1gMprLAViMnD8B94vD+Rq+FIE+6o0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxsTWti8kavtKkEpUTnBnbJtJIQdxS28OuRfMELLM9aIPS83MRU7NiLIytN3/0L9D
	 TZxssXg4rZs+KEC5OHhrFrsTGvKDLGlXP87v129qRZxbVq+AU46N5q8YDDTSlSL1Ew
	 3c+IVP926HQWN2/pROkD+QE2QERZonNTHPyhNAwNucj3R529qgWdg/2zumLONjYfOi
	 wahojZM+1kYM3+hYoC6UVvPCTAoPxvImA7nTlpBD1VLHkH9WsYqz3Xkfz/sCc5TIdg
	 H2RyoA53W54E/qC4G1rqabsR5XoAe4aI/YZlKCdN6KiyjRxP+mv1wwyynzuMaerdcV
	 /pCONT9FXOxAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F174C81EA8;
	Thu,  5 Mar 2026 11:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5EB3223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCA560B21
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qamzU76-Chwl for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A3F060B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A3F060B08
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A3F060B08
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id B20775A0006;
 Thu, 05 Mar 2026 12:54:24 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE_Hqewm4jAG; Thu,  5 Mar 2026 12:54:23 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 6877A5A0008;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:09 +0100
Message-ID: <20260305115413.1860514-4-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=WbFcdcQ169DvOPQ6Du8hOCtVQ6+SdSMLUTX655Y8PKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mxVFWEWj24JLYurDqEQHWJrmxK/Ptb0Qqww0F8MakUVWIWHJb7/eQUqmEMaZIT+al
 FBKe+7feGAQNXUY7Pqld7sEdXId5IddEjBZ8ZMhQaKqlXlBi22ZuKSRshU07m05mfi
 hgOEfifO2tRDFh12Zsm0DXQ2/82hp4WHPReWuTALy3/Hb6QSApWsKPUBJqRTrO3+XK
 OLl7vz/1dj36bOxgJ9MJJTr3dubuOebrwpEERhDzL/OApQKtW4Vo+/vRlvaxKMtzKn
 1vYqK9IjFitqUjaqvncJ5n48ZPsVQ9YSBbjvVs/Iql7g4Vy8xpzpyCeMYdZnOBSqFU
 vNK9kHm0qvfVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=mxVFWEWj
Subject: [Buildroot] [PATCH v2 3/7] utils/generate-cyclonedx: add option to
 control patch diff inclusion in SBOM
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

Including raw patch data can be verbose, and it does not always make sense.
Patch diff data is optional in CycloneDX, so add an option to control whether
the diff is included. The patch inclusion mode is modeled as an enum, as future
changes will add more modes.

If a patch has no diff and resolves no CVEs, omit it from the SBOM.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    |  9 +++
 utils/generate-cyclonedx                      | 71 +++++++++++--------
 2 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 1ebc938f943f..dc850dd4e2b6 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -140,3 +140,12 @@ class TestGenerateCycloneDX(unittest.TestCase):
 
         foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
         self.assertEqual(foo_deps["dependsOn"], ["package-bar", "package-virtual", "skeleton-baz"])
+
+    def test_diff_none(self):
+        info = self._make_show_info()
+        info["package-foo"]["patches"] = [NO_UPSTREAM_PATCH]
+        result = self._run_script(["--with-diff", "none"], show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        patch = foo["pedigree"]["patches"][0]
+        self.assertNotIn("diff", patch)
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index ac6fea91804b..adae419b9cca 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -13,7 +13,9 @@ import bz2
 import gzip
 import json
 import os
+from enum import Enum
 from pathlib import Path
+from typing import Any
 import urllib.request
 import subprocess
 import sys
@@ -43,6 +45,13 @@ VULN_WITH_PEDIGREE = set()
 
 SPDX_LICENSES = []
 
+class DiffMode(str, Enum):
+    INLINE = "inline"
+    NONE = "none"
+
+    def __str__(self) -> str:
+        return self.value
+
 if not SPDX_SCHEMA_PATH.exists():
     # Download the CycloneDX SPDX schema JSON, and cache it locally
     cyclonedxpath.mkdir(parents=True, exist_ok=True)
@@ -197,7 +206,7 @@ def read_patch_file(patch_path: Path) -> str:
     return content
 
 
-def cyclonedx_patches(patch_list: list[str]):
+def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
     """Translate a list of patches from the show-info JSON to a list of
     patches in CycloneDX format.
 
@@ -207,61 +216,58 @@ def cyclonedx_patches(patch_list: list[str]):
     Returns:
         dict: Patch information in CycloneDX format.
     """
-    patch_contents = []
-    for patch in patch_list:
-        patch_path = brpath / patch
+    patch_contents: list[dict[str, Any]] = []
+    for path in patch_list:
+        patch_path = brpath / path
+        patch: dict[str, Any] = {}
         if patch_path.exists():
             try:
                 content = read_patch_file(patch_path)
             except Exception:
                 # If the patch can't be read it won't be added to
                 # the resulting SBOM.
-                print(f"Failed to handle patch: {patch}", file=sys.stderr)
+                print(f"Failed to handle patch: {path}", file=sys.stderr)
                 continue
 
             header = patch_retrieve_header(content)
 
-            issue = {}
             cves = extract_cves_from_header(header)
             if cves:
                 VULN_WITH_PEDIGREE.update(cves)
-                issue = {
-                    "resolves": [
-                        {
-                            "type": "security",
-                            "name": cve
-                        } for cve in cves
-                    ]
-                }
+                patch["resolves"] = [
+                    {
+                        "type": "security",
+                        "name": cve
+                    } for cve in cves
+                ]
 
-            patch_contents.append({
-                "diff": {
+            if mode is DiffMode.INLINE:
+                patch["diff"] = {
                     "text": {
                         "content": content
                     }
-                },
-                **issue
-            })
+                }
         else:
             # If the patch is not a file it's a tarball or diff url passed
             # through the `<pkg-name>_PATCH` variable.
-            patch_contents.append({
-                "diff": {
-                    "url": patch
+            if mode is not DiffMode.NONE:
+                patch["diff"] = {
+                    "url": path
                 }
-            })
 
+        if patch:
+            patch["type"] = "unofficial"
+            patch_contents.append(patch)
+
+    if not patch_contents:
+        return {}
     return {
         "pedigree": {
-            "patches": [{
-                "type": "unofficial",
-                **content
-            } for content in patch_contents]
+            "patches": patch_contents
         },
     }
 
-
-def cyclonedx_component(name, comp):
+def cyclonedx_component(name, comp, diff_mode: DiffMode):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
     Args:
@@ -284,7 +290,7 @@ def cyclonedx_component(name, comp):
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
-        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
+        **cyclonedx_patches(comp.get("patches", []), diff_mode),
         "properties": [{
             "name": "BR_TYPE",
             "value": comp["type"],
@@ -409,6 +415,8 @@ def main():
                         default=sys.stdout)
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
+    parser.add_argument("--with-diff", type=DiffMode, choices=list(DiffMode), default=DiffMode.INLINE,
+                        help="Patch diff mode (default:'inline')")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -456,7 +464,8 @@ def main():
             }
         },
         "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+            cyclonedx_component(name, comp, args.with_diff)
+            for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, br2_root_deps(filtered_show_info_dict, args.virtual)),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
