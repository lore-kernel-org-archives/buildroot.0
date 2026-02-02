Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19205E7DEFC
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E571140B71;
	Mon,  2 Feb 2026 16:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJ3Fcn0y5ihw; Mon,  2 Feb 2026 16:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28544092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770048787;
	bh=+n//l9P0FZfk2XDtedhlr2tuHODMQYdoSv8L+SawhRE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hE71MSHPyr01uKxj2t6hujO/x0vTL07wRlyPenC/cWmJz7L8AUoBoypPlxCR0hnoA
	 z2mGZmPsf6SlsWMekK9MzBrSnxyd0V45cJPewiOmfQOLIBiP29i9SO7p8tvvpjhFM2
	 ge/C5uiDMDCBbE3yIwdZsHWxsI/xchMMwNtaEXM63YzVvXA8K5zrJckHoMOgrlhCb4
	 bfENx8E7Lj5UOVwKISi/LVb59E4TW3JHg6K2xDeOibz84kN1jX9ElLM5KyKajdoEQv
	 8smS7FiIep6poCqjhTkPBUfFx1Oz4Y+cshunqfSv1GxK2FeZ5/hRJ0Vb3w2vKpgEBM
	 vLSn2YTZ8OvVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28544092B;
	Mon,  2 Feb 2026 16:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 632E91E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548C1401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9032LdrtxJph for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AF5B402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF5B402E7
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF5B402E7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so2851175f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 08:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770048782; x=1770653582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fGBKVwnc7VbSfqemDcOFJ51uCoiHR9ptjDtYduiEuzE=;
 b=XMyz0CSVjxu413peFMVP6U96sGyqRsxZBZ0rlETZu+VpBgHyk5Bj/4Mp0gDcosJggq
 SLFy1BFbx0iTAzioPfb8XD9Xb9fmny3iP0OmHeWyC/gJW6DRVJO9P1lnmQKJJq/A9tDT
 p8USM8aJI+1xS1sV2TWu2S2yW7PISAOlDCtEGqw9V2Ys1nV7O/ARMAswOuSKmAwvQJTI
 1tGGa0LhdgXFrxR0WGnzyuYdX2azD4L+G7rIr1GF0b2NNxjFqxKwKF/os/jS2Yvge3Fu
 moS0z9BsJRM2J/TmnVN9XW+4KYIYaUBWmlTw23uYO2+NvnhdV5C0Q7CDjsoT1LrethJK
 /XoQ==
X-Gm-Message-State: AOJu0YxUYpdjruf6IHTP9AZGRLO7vEDsck4f66IZeAaaIW41zNVU86d4
 Qf6DHNaLahrokO4RmblBZKMABDgpw89DlR0qQylAaVYD7uKvCzRSenoGyDJFAL6kGOZBdRpESgL
 GmaJv
X-Gm-Gg: AZuq6aJSGBavCFFwblpZcPJR+2GusPSDti3l772da261JuF9JLa1SMbHtNe7DHeJGD/
 7vISrkNQReGXvQ+E616qBt+rA0pniKWsR1U67F2E70ONeVRmx3TYW5UuMrP8Us7VCXbgIrFuJtw
 NHr08NrI/PignELB+Ytao0K2Cm9ow4vy1fx+tRyujHNqVsdPEW6yGwuyxxdiasnf7xkG8CwUcv7
 e/VAbb93mv3oRnKOqkZxFKciOGSOf0xqR6zlNQnDSDcDWPB4upxrUsG6/UAXBO0A/7eh2kya3kG
 0xC1OASIcrcV3nm/boO6bCLCLNmLi/nF7KxyAacyRV9pcOPX040FMsSCbnXr0tf9Psae7j8KFhd
 l4xLxQykXNt39YOe/6eMMpCHcRnSu+eNq9QQylJgL2wKbf6/14Kaqn2YhDzlKQNoZ7KZbNaLb1V
 CaD9+XEDY9wf8o7p5Jqp419Ds7CGkVUqwX4jOsW8oob+I=
X-Received: by 2002:a05:6000:1865:b0:435:9325:4702 with SMTP id
 ffacd0b85a97d-435f3a8b822mr16770312f8f.21.1770048781354; 
 Mon, 02 Feb 2026 08:13:01 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1048a54sm43785229f8f.0.2026.02.02.08.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 08:13:00 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Mon,  2 Feb 2026 17:12:55 +0100
Message-ID: <20260202161256.104871-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202161256.104871-1-thomas.perale@mind.be>
References: <20260202161256.104871-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770048782; x=1770653582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGBKVwnc7VbSfqemDcOFJ51uCoiHR9ptjDtYduiEuzE=;
 b=EhNE8eSdl9uXxCkoS+itbthzmosomDG2Yj5W8GLiyqqiKbdyrjIHWnPSZCmQF/lL1x
 QmKEZwRuUpWqRcVc4uRp1Mw4ivrOrMKYTdPZTyERA/yfbPxnmdIloKnFVV4wVbuhfHzC
 xjW6HPW78v6cEAoD61vXWoiPAtHUcUSiFCuMK+UzsJ7Ade3nqse7jgaiy88UZMJK7DJT
 zfoCTqiZa3dBcmRxpvp7ZUkhjFhh8sS72z7uaeG4eqxQPjP5ewAAk/QXfA1Oj+clgv2q
 MprrRuiM5qCh3MKO5AKUHCoRFPWwsEiEBCPK2sYZ/Bwszz8rgluEF4jFjqbVD2VpDves
 dpig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EhNE8eSd
Subject: [Buildroot] [PATCH 2/3] utils/generate-cyclonedx: optional bump to
 v1.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See changes:

- https://cyclonedx.org/news/cyclonedx-v1.7-released/
- https://github.com/CycloneDX/specification/releases/tag/1.7

Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
this bump is optional and default remains v1.6.

To allow generation of CycloneDX based on the current version of the
spec we are using a 'Context' datastructure is created that reference
the CycloneDX version spec currently in use.

This Context datastructure is then passed down to functions that
generate part of the CycloneDX SBOM.

All the top level datastructure are moved into the Context
datastructure that will be generated after the arguments from the
command line are interpreted.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 61 +++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1f7a26e870..1ef2544e1b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -18,9 +18,9 @@ import urllib.request
 import subprocess
 import sys
 import re
+from dataclasses import dataclass, field
 
-
-CYCLONEDX_VERSION = "1.6"
+DEFAULT_CYCLONEDX_VERSION = "1.6"
 
 brpath = Path(__file__).parent.parent
 
@@ -34,13 +34,16 @@ BR2_VERSION_FULL = (
     .strip()
 )
 
-# Set of vulnerabilities that were addressed by a patch present in buildroot
-# tree. This set is used to set the analysis of the ignored CVEs to
-# 'resolved_with_pedigree'.
-VULN_WITH_PEDIGREE = set()
-
-# List of supported SPDX license expression.
-SPDX_LICENSES = []
+@dataclass
+class Context:
+    # CycloneDX Spec version
+    CYCLONEDX_VERSION: str = DEFAULT_CYCLONEDX_VERSION
+    # List of supported SPDX license expression.
+    SPDX_LICENSES: list = field(default_factory=list)
+    # Set of vulnerabilities that were addressed by a patch present in buildroot
+    # tree. This set is used to set the analysis of the ignored CVEs to
+    # 'resolved_with_pedigree'.
+    VULN_WITH_PEDIGREE: set = field(default_factory=set)
 
 def br2_retrieve_spdx_licenses(version: str):
     """Populate the list of supported SPDX licenses for a given CycloneDX
@@ -99,7 +102,7 @@ def split_top_level_comma(subj):
     yield substring
 
 
-def cyclonedx_license(lic):
+def cyclonedx_license(lic, ctx: Context):
     """Given the name of a license, create an individual entry in
     CycloneDX format. In CycloneDX, the 'id' keyword is used for
     names that are recognized as SPDX License abbreviations. All other
@@ -111,13 +114,13 @@ def cyclonedx_license(lic):
     Returns:
         dict: An entry for the license in CycloneDX format.
     """
-    key = "id" if lic in SPDX_LICENSES else "name"
+    key = "id" if lic in ctx.SPDX_LICENSES else "name"
     return {
         key: lic,
     }
 
 
-def cyclonedx_licenses(lic_list):
+def cyclonedx_licenses(lic_list, ctx: Context):
     """Create a licenses list formatted for a CycloneDX component
 
     Args:
@@ -129,7 +132,7 @@ def cyclonedx_licenses(lic_list):
     """
     return {
         "licenses": [
-            {"license": cyclonedx_license(lic.strip())} for lic in split_top_level_comma(lic_list)
+            {"license": cyclonedx_license(lic.strip(), ctx)} for lic in split_top_level_comma(lic_list)
         ]
     }
 
@@ -213,7 +216,7 @@ def read_patch_file(patch_path: Path) -> str:
     return content
 
 
-def cyclonedx_patches(patch_list: list[str]):
+def cyclonedx_patches(patch_list: list[str], ctx: Context):
     """Translate a list of patches from the show-info JSON to a list of
     patches in CycloneDX format.
 
@@ -240,7 +243,7 @@ def cyclonedx_patches(patch_list: list[str]):
             issue = {}
             cves = extract_cves_from_header(header)
             if cves:
-                VULN_WITH_PEDIGREE.update(cves)
+                ctx.VULN_WITH_PEDIGREE.update(cves)
                 issue = {
                     "resolves": [
                         {
@@ -277,7 +280,7 @@ def cyclonedx_patches(patch_list: list[str]):
     }
 
 
-def cyclonedx_component(name, comp):
+def cyclonedx_component(name, comp, ctx: Context):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
     Args:
@@ -295,12 +298,12 @@ def cyclonedx_component(name, comp):
         } if "name" in comp else {}),
         **({
             "version": comp["version"],
-            **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
+            **(cyclonedx_licenses(comp["licenses"], ctx) if "licenses" in comp else {}),
         } if not comp["virtual"] else {}),
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
-        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
+        **(cyclonedx_patches(comp["patches"], ctx) if comp.get("patches") else {}),
         "properties": [{
             "name": "BR_TYPE",
             "value": comp["type"],
@@ -324,7 +327,7 @@ def cyclonedx_dependency(ref, depends):
     }
 
 
-def cyclonedx_vulnerabilities(show_info_dict):
+def cyclonedx_vulnerabilities(show_info_dict, ctx: Context):
     """Create a JSON list of vulnerabilities ignored by buildroot and associate
     the component for which they are solved.
 
@@ -344,7 +347,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
     return [{
         "id": cve,
         "analysis": {
-            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
+            "state": "resolved_with_pedigree" if cve in ctx.VULN_WITH_PEDIGREE else "in_triage",
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
         },
         "affects": [
@@ -411,8 +414,11 @@ def main():
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
-    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
+    parser.add_argument("--project-version", type=str,
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--v17", dest='cdx_version', action='store_const',
+                        const='1.7', default=DEFAULT_CYCLONEDX_VERSION,
+                        help=f"Use CycloneDX version 1.7 (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
 
@@ -420,7 +426,10 @@ def main():
         parser.print_help()
         sys.exit(1)
 
-    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+    ctx = Context(
+        CYCLONEDX_VERSION=args.cdx_version,
+        SPDX_LICENSES=br2_retrieve_spdx_licenses(args.cdx_version)
+    )
 
     show_info_dict = json.load(args.in_file)
 
@@ -431,8 +440,8 @@ def main():
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-        "specVersion": f"{CYCLONEDX_VERSION}",
+        "$schema": f"http://cyclonedx.org/schema/bom-{ctx.CYCLONEDX_VERSION}.schema.json",
+        "specVersion": f"{ctx.CYCLONEDX_VERSION}",
         "metadata": {
             "component": {
                 "bom-ref": args.project_name,
@@ -458,14 +467,14 @@ def main():
             }
         },
         "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+            cyclonedx_component(name, comp, ctx) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
-        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
+        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict, ctx),
     }
 
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
