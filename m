Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A992CFCE08F
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AACA8419B;
	Thu, 26 Feb 2026 14:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuASyqezhA4V; Thu, 26 Feb 2026 14:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EAC9841B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115970;
	bh=A6OTbQsJkFd4QcAO6GtyDWGZoqFwod8yEksaeF2OdbA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9bxE9++dvUxtrdW8rqznNh2tgr8fVpgLmdROhWrWu0VOX2T20HeLeWV/VJNr+PBi
	 kz4VDxXIKajJSYPfA4WWejwWb0JukDhNi8ePASyo5ppLCiaiJdAsmM9FEyU+HlLxY5
	 T/A+y9NM3yKh+RZ40uLCEvvAsADFpmc+BZlbdKPUHr0P2/ks1nHPLq/KOiwUDi+08H
	 Kwq7LpQvXIuy28QvwYfzh++JK/kjlA2EFYfs19BMeNK7246ClCQGypSTfVl4RSuP5n
	 9MHSPhN9b3lva1xkxqH9XsG78PA+3Ba4rir9GXRNBHyE7pFKagEK6uLstRpjgaW4ok
	 XhNhmnOrNdSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EAC9841B0;
	Thu, 26 Feb 2026 14:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C150224E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B357A8410B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOV45UjQoc8O for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96D74840FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D74840FD
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96D74840FD
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 1FAC45A0002;
 Thu, 26 Feb 2026 15:20:50 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kVT_n0CVWv3; Thu, 26 Feb 2026 15:20:49 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 0F78F5A0003;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:16 +0100
Message-ID: <20260226142023.1064241-2-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=4sXebimNmmL3Yx2WVXxBLQVkZKFaynlumN4R1dg43xk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DJ+aEfqQZ+JQtBbzvvPvWagzqR30rmiBorlXTSuRWajYZ4FIiBY7DILW94USPW5Ix
 fzKRhJyP8FavWURymmBTUx1Yw6F4Kjz7QnY1r7xRUWYprOYRhCI7jvqQCqmug/C+0i
 N8EyNibQyanEEkq/nV6eVHQhqvxvVAkjEjUnX2q/ph2ynFoE4hAwCZkxUM2yth9UYK
 bkhUjUyhd6owvpZFk2kXO86uxNDiTW2WIwaMH+3lWf92eUaS8XOuByErVz2r+gqIeS
 uXs82hQUUQHns6nBHjo596SdwDrXJ4CpyxOTjLQvAe9Av8ObuKHx1ti9srxLqw/2rg
 IjgjR9cDcGSeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=DJ+aEfqQ
Subject: [Buildroot] [PATCH 1/8] utils/generate-cyclonedx: add option to
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
 utils/generate-cyclonedx | 71 ++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3cf..25248a0e2d95 100755
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
@@ -393,6 +399,8 @@ def main():
                         default=sys.stdout)
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
+    parser.add_argument("--with-diff", type=DiffMode, choices=list(DiffMode), default=DiffMode.INLINE,
+                        help="Patch diff mode (default:'inline')")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -440,7 +448,8 @@ def main():
             }
         },
         "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+            cyclonedx_component(name, comp, args.with_diff)
+            for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
