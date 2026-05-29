Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2782BCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAD561373;
	Fri, 29 May 2026 15:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6V4XKCCJpe-i; Fri, 29 May 2026 15:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB6061370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780069112;
	bh=XAc6ZpBHXQMCzWySpgROCNiJy7qRbYwF0Ot/nFh2D6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f1qss115iMYV+zo2uYa/bOxjK59NXFArkq3USD9DmCH0RqF5hkTFGCm+Kq/Z5NwrV
	 IsAt75+BiUtREgI8dRMl9cXP8kUfn5IXT7LT/lUYXR1io/aav/pveZnqCthF9oHM/i
	 FtQYh0XElBTaFXVlcH/ogZa4DgIYfJoyfWmgYEkiFuo9UC1af6QOMUN26bKd665M1z
	 qWBArrizekAe/bppeXTYvUFH8GQ3rUL0mcWfVlthEBOk2OPwij09YcLTG3HSYco+91
	 FJ7SRGnW57J8UkZR1pC/DS/KTkO3CH+NQhESl1qCk3Ht7GhGy0AdYPu0hwNv+5oO4j
	 4j6xPnqxH5iGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB6061370;
	Fri, 29 May 2026 15:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 434FAD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3196B83BF6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIPq3LELYm0k for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4378183C05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4378183C05
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E2E9873EE; Fri, 29 May 2026 15:38:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:38:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af55c1a39b34a4359edf9cc6f65244ff6a0738ee
X-Git-Newrev: d4ff747a2bb72ce31f789584a91d9ea064e394c0
X-Patchwork-Hint: ignore
Message-Id: <20260529153817.9E2E9873EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve-check: fix
 vulnerabilities with different analysis
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4ff747a2bb72ce31f789584a91d9ea064e394c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Before this commit, only one entry per vulnerability ID was added to the
output. In CycloneDX, if you need to provide different analyses for
different affected components with the same vulnerability ID, you must
create multiple entries with the same ID.

When running `cve-check` with the `--include-resolved` argument, the
analysis of some vulnerabilities would get overwritten, which led to
undefined analysis results.

This is especially true when running the analysis on multiple components
with the same name but different versions. For instance, if the input
SBOM includes both the `gnupg` and `gnupg2` packages, CVE-2025-68973
could be included. This CVE might be exploitable for the `gnupg` package
but resolved for `gnupg2`. Therefore, a single analysis entry cannot
cover both cases.

This commit fixes the logic for adding vulnerabilities to the output
SBOM. A vulnerability is now added as a new entry if:

1. A vulnerability with the same ID doesn't exist yet.
2. The affect of the new vulnerability is not the same as the one
   already present.

For the CVE-2025-68973 example this would result in the following
output:

```json
[
    {
        "id": "CVE-2025-68973",
        "analysis": {
            "state": "exploitable"
        }
        "affects": [
            {"ref": "gnupg"}
        ]
    },
    {
        "id": "CVE-2025-68973",
        "analysis": {
            "state": "resolved"
        }
        "affects": [
            {"ref": "gnupg2"}
        ]
    }
]
```

45 vulnerabilities were concerned by this bug over the Buildroot tree.

Co-Authored-By: Tim Soubry <tim.soubry@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve-check | 76 +++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 4d01fa5f23..af0971d06d 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -175,55 +175,54 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
 
 def vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability):
     """
-    Append 'vulnerability' passed as argument to the 'vulnerabilities' argument
-    if an entry with the same 'id' doesn't exist yet.
-    If the vulnerability already exists, the input reference is added to the
-    'affects' list of the existing entry.
+    Updates a matching 'vulnerability' from the 'vulnerabilities' list or
+    appends it as a new entry.
+
+    A vulnerability is considered 'matching' if it shares the same 'id' AND
+    either:
+
+    1. An identical 'affects' entry.
+    2. An identical 'analysis.state'.
 
     Args:
         vulnerabilities (list): The vulnerabilities array reference retrieved
             from the input CycloneDX SBOM
         vulnerability (dict): Vulnerability to add to the 'vulnerabilities' list.
     """
-    # Search if a vulnerability with the same identifier already exists in the
-    # SBOM vulnerability list.
-    matching_vuln = next(
-        (vuln for vuln in vulnerabilities if vuln.get("id") == vulnerability["id"]),
-        None
-    )
+    new_analysis = vulnerability.get("analysis", {}).get("state")
+    new_ref = next((a.get("ref") for a in vulnerability.get("affects", [])), None)
 
-    # bom-ref to the component is passed to the affects of the vulnerability
-    # passed as argument
-    bom_ref = next((a["ref"] for a in vulnerability.get("affects", [])), None)
+    # All vulnerabilities with same ID
+    matching_vulns = [v for v in vulnerabilities if v.get("id") == vulnerability.get("id")]
 
-    if matching_vuln is not None:
-        # Remove the affect to not use it while updating matching vuln.
-        if "affects" in vulnerability:
-            del vulnerability["affects"]
+    for curr_vuln in matching_vulns:
+        curr_vuln_analysis = curr_vuln.get("analysis", {}).get("state")
+        curr_vuln_refs = [a.get("ref") for a in curr_vuln.get("affects", [])]
 
-        if matching_vuln.get("analysis") is not None and "analysis" in vulnerability:
-            # We don't update vulnerabilities that already have an
-            # 'analysis'.
-            # Buildroot ignored vulnerabilities will already have
-            # an analysis and need to remain as such.
-            del vulnerability["analysis"]
+        is_same_ref = new_ref in curr_vuln_refs
+        is_same_analysis = curr_vuln_analysis == new_analysis
 
-        affects = matching_vuln.setdefault("affects", [])
+        if not (is_same_ref or is_same_analysis):
+            continue
 
-        if bom_ref is not None:
-            ref = next((a["ref"] for a in affects if a["ref"] == bom_ref), None)
-            if ref is None:
-                # Add a 'ref' (bom reference) to the component if not
-                # already present in the 'affects' list.
-                affects.append({
-                    "ref": bom_ref
-                })
+        if is_same_ref:
+            # If same vulnerability id and same affect ref, keep the previous
+            # analysis. This is the case where a vulnerability was ignored from
+            # the generated SBOM.
+            del vulnerability["analysis"]
+            del vulnerability["affects"]
+        else:
+            # The same analysis, add a new affect
+            # reference.
+            if new_ref is not None:
+                curr_vuln.setdefault("affects", []).append({"ref": new_ref})
+                del vulnerability["affects"]
 
-        # Update the metadata of the vulnerability with the one
-        # downloaded from the database.
-        matching_vuln.update(vulnerability)
-    else:
-        vulnerabilities.append(vulnerability)
+        curr_vuln.update(vulnerability)
+        return
+
+    # No same ID w/ same analysis or same ref.
+    vulnerabilities.append(vulnerability)
 
 
 def check_package_cve_affects(cve: cvecheck.CVE, cpe_product_pkgs, sbom, opt: Options):
@@ -297,8 +296,7 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
             print(f"Warning: '{vuln_id}' doesn't exist in NVD database.", file=sys.stderr)
             continue
 
-        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
-        vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
+        vuln.update(nvd_cve_to_cdx_vulnerability(cve.nvd_cve))
 
 
 def main():
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
