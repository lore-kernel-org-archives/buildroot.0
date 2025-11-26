Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3695D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA89161B3A;
	Thu, 27 Nov 2025 20:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGQVoD39_eBP; Thu, 27 Nov 2025 20:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1662D61718
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1662D61718;
	Thu, 27 Nov 2025 20:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7682D2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 498368440C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAQ4ZxuqpvE9 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A6F8442D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16A6F8442D
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14EA185FC4; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:41:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eb2990afddfcf63197765628dfbf89d7128aa0fb
X-Git-Newrev: a43153651cac60c2d0d27b795dc628935a997c9e
X-Patchwork-Hint: ignore
Message-Id: <20251127200757.14EA185FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/cve-check: add cve-check script
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a43153651cac60c2d0d27b795dc628935a997c9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Enriches the input CycloneDX SBOM with vulnerability information and
analysis from the NVD database.

The NVD database is cloned using a mirror of it and the content is compared
locally. By default the path 'dl/buildroot-nvd' is used.

Example usage to analyse vulnerabilities of an input CycloneDX SBOM:

$ make show-info | utils/generate-cyclonedx | support/script/cve-check

The 'cve-check' can also be used to only enrich the vulnerabilities
present on the input SBOM with a set metadata (description, cvss,
references, ...) without applying an analysis.

With the following command the vulnerabilities ignored by Buildroot
present in the CycloneDX SBOM are enriched with description, cvss, etc
...

$ make show-info | utils/generate-cyclonedx | support/script/cve-check --enrich-only

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: fix minor flake8 issues]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6762c42e74e3694fe626a4457028d53ed9288bbc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 325 ++++++++++++++++++++++++++++++++++++++++++++++
 support/scripts/cve.py    |  23 ++++
 2 files changed, 348 insertions(+)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
new file mode 100755
index 0000000000..6442b2e72c
--- /dev/null
+++ b/support/scripts/cve-check
@@ -0,0 +1,325 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Enriches the input CycloneDX SBOM with vulnerability information from the NVD
+# database.
+#
+# The nvd database is cloned using a mirror of it and the content is compared
+# locally.
+#
+# Example usage:
+# $ make show-info | utils/generate-cyclonedx | support/script/cve-check --nvd-path dl/buildroot-nvd/
+from collections import defaultdict
+from pathlib import Path
+from typing import TypedDict
+import argparse
+import sys
+import json
+
+import cve as cvecheck
+
+
+class Options(TypedDict, total=True):
+    include_resolved: bool
+
+
+DESCRIPTION = """
+Enriches the input CycloneDX SBOM with vulnerability information from the NVD
+database.
+
+The NVD database is cloned using a mirror of it and the content is compared
+locally.
+"""
+
+
+brpath = Path(__file__).parent.parent.parent
+
+
+def cve_api_get_lang_from_list(values, lang="en") -> (str | None):
+    for x in values:
+        if x.get("lang") == lang:
+            return x.get("value")
+    return None
+
+
+def nvd_cve_weaknesses_to_cdx(weaknesses) -> list[int]:
+    """
+    See the CycloneDX specification for 'cwes' [1]
+
+    [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_cwes
+    """
+    res = []
+
+    for node in weaknesses:
+        value = cve_api_get_lang_from_list(node.get("description", []))
+        if value is None:
+            continue
+
+        cwe = value.replace("CWE-", "")
+
+        if not cwe.isnumeric():
+            continue
+        res.append(int(cwe))
+
+    return res
+
+
+def nvd_cve_cvss_to_cdx(metrics):
+    """
+    See the CycloneDX specification for 'ratings' [1]
+
+    [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_ratings
+    """
+
+    KEY_METHOD_DICT = {
+        "cvssMetricV40": "CVSSv4",
+        "cvssMetricV31": "CVSSv31",
+        "cvssMetricV3": "CVSSv3",
+        "cvssMetricV2": "CVSSv2"
+    }
+
+    res = []
+
+    for key, values in metrics.items():
+        for value in values:
+            data = value.get("cvssData", {})
+            res.append({
+                "method": KEY_METHOD_DICT.get(key, "other"),
+                **({
+                    "score": data["baseScore"],
+                } if "baseScore" in data else {}),
+                **({
+                    "severity": data["baseSeverity"].lower(),
+                } if "baseSeverity" in data else {}),
+                **({
+                    "vector": data["vectorString"],
+                } if "vectorString" in data else {}),
+            })
+
+    return res
+
+
+def nvd_cve_references_to_cdx(references):
+    advisories = []
+
+    for ref in references:
+        if not {"url", "tags"}.issubset(ref):
+            continue
+
+        tags = ref["tags"]
+        if not isinstance(tags, list) or len(tags) == 0:
+            continue
+
+        advisories.append({
+            "title": next((t for t in tags if "Advisory" not in t), tags[0]),
+            "url": ref["url"]
+        })
+
+    return advisories
+
+
+def nvd_cve_to_cdx_vulnerability(nvd_cve):
+    """
+    Turns the CVE object fetched from the NVD API into a CycloneDX
+    vulnerability that fit the spec (see [1]).
+
+    [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
+    """
+    vulnerability = {
+        "bom-ref": nvd_cve["id"],
+        "id": nvd_cve["id"],
+        "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
+        "source": {
+            "name": "NVD",
+            "url": "https://nvd.nist.gov/"
+        },
+        **({
+            "published": nvd_cve["published"],
+        } if "published" in nvd_cve else {}),
+        **({
+            "updated": nvd_cve["lastModified"],
+        } if "lastModified" in nvd_cve else {}),
+        **({
+            "cwes": nvd_cve_weaknesses_to_cdx(nvd_cve["weaknesses"]),
+        } if "weaknesses" in nvd_cve else {}),
+        **({
+            "ratings": nvd_cve_cvss_to_cdx(nvd_cve["metrics"]),
+        } if "metrics" in nvd_cve else {}),
+        **({
+            "advisories": nvd_cve_references_to_cdx(nvd_cve["references"]),
+        } if "references" in nvd_cve else {}),
+    }
+
+    return vulnerability
+
+
+def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
+    """
+    Append 'vulnerability' passed as argument to the 'vulnerabilities' argument
+    if an entry with the same 'id' don't exist yet.
+    If an entry already exist the input reference is added to the 'affects'
+    list of the existing vulnerability.
+
+    Args:
+        vulnerabilities (list): The vulnerabilities array reference retrieved
+            from the input CycloneDX SBOM
+        vulnerability (dict): Vulnerability to add to the 'vulnerabilities' list.
+    """
+    # Search if a vulnerability with the same identifier already exist in the
+    # SBOM vulnerability list.
+    matching_vuln = next(
+        (vuln for vuln in vulnerabilities if vuln.get("id") == vulnerability["id"]),
+        None
+    )
+
+    # bom-ref to the component is passed to the affects of the vulnerability
+    bom_ref = next((a["ref"] for a in vulnerability.get("affects", [])), None)
+
+    if matching_vuln is not None:
+        # Remove the affect to not use it while updating matching vuln.
+        if "affects" in vulnerability:
+            del vulnerability["affects"]
+
+        if matching_vuln.get("analysis") is not None and "analysis" in vulnerability:
+            # We don't update vulnerability that already have an
+            # 'analysis'.
+            # Buildroot ignored vulnerabilities will already have
+            # an analysis and need to remain as such.
+            del vulnerability["analysis"]
+
+        affects = matching_vuln.setdefault("affects", [])
+
+        if bom_ref is not None:
+            ref = next((a["ref"] for a in affects if a["ref"] == bom_ref), None)
+            if ref is None:
+                # Add a 'ref' (bom reference) to the component if not
+                # already present in the 'affects' list.
+                affects.append({
+                    "ref": bom_ref
+                })
+
+        # Update the metadata of the vulnerability with the one
+        # downloaded from the database.
+        matching_vuln.update(vulnerability)
+    else:
+        vulnerabilities.append(vulnerability)
+
+
+def check_package_cve_affects(cve: cvecheck.CVE, cpe_product_pkgs, sbom, opt: Options):
+    vulnerabilities = sbom.setdefault("vulnerabilities", [])
+
+    for product in cve.affected_products:
+        for comp in cpe_product_pkgs.get(product, []):
+            cve_status = cve.affects(comp["name"], comp["version"], comp["cpe"])
+
+            if cve_status == cve.CVE_UNKNOWN:
+                continue
+
+            if cve_status == cve.CVE_DOESNT_AFFECT and not opt["include_resolved"]:
+                continue
+
+            vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
+
+            vulnerability["analysis"] = {
+                "state": "exploitable" if cve_status == cve.CVE_AFFECTS else "resolved"
+            }
+
+            vulnerability["affects"] = [{
+                "ref": comp["bom-ref"]
+            }]
+
+            vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
+
+
+def check_package_cves(nvd_path: Path, sbom, opt: Options):
+    """
+    Iterate over every entries of the NDV API mirror. Each vulnerability is
+    compared to the set of component passed as argument in the 'sbom'.
+    The vulnerabilities set of that 'sbom' argument is enriched with analysis
+    of vulnerabilities that match that set of components.
+
+    Args:
+        nvd_path (Path): Path of the mirror of the NVD API.
+        sbom (dict): Input SBOM containing a set of vulnerabilities that will be enriched.
+        opt (Options): Options for the analysis.
+    """
+    cpe_product_pkgs = defaultdict(list)
+
+    for comp in sbom.get("components", []):
+        if comp.get("cpe") and comp.get("version"):
+            cpe_product = cvecheck.CPE(comp["cpe"]).product
+            cpe_product_pkgs[cpe_product].append(comp)
+
+    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
+        check_package_cve_affects(cve, cpe_product_pkgs, sbom, opt)
+
+
+def enrich_vulnerabilities(nvd_path: Path, sbom):
+    """
+    Iterate over the vulnerabilities present in the 'sbom' passed as arguments
+    and enrich the vulnerability with content from the NDV API mirror.
+
+    Args:
+        nvd_path (Path): Path of the mirror of the NVD API.
+        sbom (dict): Input SBOM containing a set of vulnerabilities that will be enriched.
+    """
+    vulnerabilities = sbom.setdefault("vulnerabilities", [])
+
+    for vuln in vulnerabilities:
+        vuln_id = vuln.get("id")
+        if vuln_id is None or not vuln_id.upper().startswith("CVE-"):
+            continue
+
+        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln["id"])
+
+        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
+
+        vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
+
+
+def main():
+    parser = argparse.ArgumentParser(description=DESCRIPTION)
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
+                        default=(None if sys.stdin.isatty() else sys.stdin))
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
+                        default=sys.stdout)
+    parser.add_argument('--nvd-path', dest='nvd_path',
+                        default=brpath / 'dl' / 'buildroot-nvd',
+                        help='Path to the local NVD database',
+                        type=lambda p: Path(p).expanduser().resolve())
+    parser.add_argument("--enrich-only", default=False, action='store_true',
+                        help="Only update metadata to the vulnerability currently present " +
+                        "on the input CycloneDX SBOM. Don't do an analysis.")
+    parser.add_argument("--include-resolved", default=False, action='store_true',
+                        help="Add vulnerabilities already 'resolved' that don't affect a " +
+                        "component to the output CycloneDX vulnerabilities analysis.")
+    parser.add_argument("--no-nvd-update", default=False, action='store_true',
+                        help="Doesn't update the NVD database.")
+
+    args = parser.parse_args()
+
+    if args.in_file is None or args.nvd_path is None:
+        parser.print_help()
+        sys.exit(1)
+
+    sbom = json.load(args.in_file)
+
+    opt = Options(
+        include_resolved=args.include_resolved,
+    )
+
+    args.nvd_path.mkdir(parents=True, exist_ok=True)
+    if not args.no_nvd_update:
+        cvecheck.CVE.download_nvd(args.nvd_path)
+
+    if args.enrich_only:
+        enrich_vulnerabilities(args.nvd_path, sbom)
+    else:
+        check_package_cves(args.nvd_path, sbom, opt)
+
+    args.out_file.write(json.dumps(sbom, indent=2))
+    args.out_file.write('\n')
+
+
+if __name__ == "__main__":
+    main()
diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 27a5f2f362..3875c4258c 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -188,6 +188,29 @@ class CVE:
                     with open(os.path.join(dirpath, filename), "rb") as f:
                         yield cls(json.load(f))
 
+    @classmethod
+    def read_nvd_entry(cls, nvd_dir, cve_id):
+        """
+        Retrieve a single CVE entry contained in NIST Vulnerability Database
+        feeds.
+
+        If the CVE entry doesn't exist 'None' is returned.
+        """
+        nvd_git_dir = os.path.join(nvd_dir, "git")
+
+        _, year, minor = cve_id.split("-")
+
+        cve_subpath = f"CVE-{year}/CVE-{year}-{minor[:-2] + 'xx'}/{cve_id.upper()}.json"
+        path = os.path.join(nvd_git_dir, cve_subpath)
+
+        ret = None
+
+        if os.path.exists(path):
+            with open(path, "rb") as f:
+                ret = cls(json.load(f))
+
+        return ret
+
     def parse_node(self, node):
         """
         Parse the node inside the configurations section to extract the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
