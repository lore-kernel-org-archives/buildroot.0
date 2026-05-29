Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD324CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13C341F1E;
	Fri, 29 May 2026 15:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mowsF-Wqg_pU; Fri, 29 May 2026 15:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A340741FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780067200;
	bh=O7oui/WhZE+t9K9ZdMleAx2Jkma8fe4G0w5xSlopSjQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LBzLgTkfJMWin84msudx1yUIPMAY9kk0J0K3XQjqNZ/EINR46MEK8yMP5MUWwnZWo
	 e7+pRAZ6dex+8vcPw4ORzeD5BopCz4ALLUjQ17jwX1lQP18rri4i0m/v75JGlLkeiC
	 aNusyRpE6OQm8f9liH6QpJvnkV+aTqsIPwxGOB26QeV1PU2Bw1T5h3pGKjdDVPZczj
	 SiO+u578JysL9nsHpBPovzWc5xZwXnCdBNVxvMeJJvJZ+bAfZYoX6MyIgN4c+uHSei
	 elZ61MXoizec9V6H5IFyVElfuHiZ9vj8u4vXwu8cbOgTR8UrR6q0CIl6aYnZf8qn9Q
	 PbLCDwSLmg0wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A340741FB4;
	Fri, 29 May 2026 15:06:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E853D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F1D6822F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shBwDFuq-ZMU for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46552822D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46552822D4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46552822D4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so850063f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780067194; x=1780671994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0QnUlNdTl1KEI3NAD4TFBGm1B7dkojchrikfuvBBcdQ=;
 b=Bj8nEgtjZA8MMNuY0ZDf2XIDUrPXKkfDlHywydDfqwb08lCxERLLNbROtuTlz+4lmD
 0eFgbXlaUXFYWxGhB06vdjT1Assu4CIrdR898uHLA0xERswTYEHr01GMrjvjC6s5JZGT
 L5uWNz+S6TLLvrRjuqtYjLZptTz77r1X8+qRX8ukhuUgYP68SJnS2cGSSJgdTERG7I/a
 Q3vowUalFM0gz2kPYIRd2V+bsTACo0NclrlHOroMoKo3VcpXl+5Qo2Dnm2GPvZ5DMVDh
 eCczp7CA4D0mMjogV4pQePfHOZBAlfuYTTBvUwUSs3jcxacyB2zx8zowWJMMbFG7tLDO
 Jusw==
X-Gm-Message-State: AOJu0Yw21i/M4EppbOarmvRLjJEQL2WcQu35u0z1Fo/A7iRSQFRbrtak
 rlMIR60mwv68CXHQI6jBCXbH9OpPfJLY2RWlR3X31Gousu7auk+96Ew7VD6QyyKsUbH0ZFzhZoC
 XbN3H
X-Gm-Gg: Acq92OH2ZtABlXiw5q3o2mJfl5r8p52ORmgCrgnT2c6u9konnaN1Es2rEQkod7vVUnG
 AzGkJ/pa3qE/DA+x9vKZzAQH79Aayal6WrvPBPmx06RNf80+BHtP0GvyiK0DSzSvJwT9+FpU01X
 56h4GC3dy9FZcAnaptdzPRizzw/mPgFTxHxV0odiMObVw2EgQET84Wr8FARJGiorNVS7kHdgpeO
 rMbEAps6Aa/eHeo5eTHsYo/FzEFAIp5Cv5AejLk3kdJThMJLO3sqJxK3ytrwghGZ3Jnhd44S67Z
 2cm8d3aFvmEXFYPJDe8GZFQ/llhddvfLJ71uKQaEJPUoxLSYCdc/x5wIj1sS7Kgabck2Ul5TopQ
 oycu/Z7kYIAZ1OOXPxc0kXqnhb/yLs9qw34dA4qVhYLC9Cd1d4o0m1QYns7e5hJ0QXxmKDndzqh
 bMTApWsTJW3+ACW8Gqft3HmJLXnyVICBiJVZhzjxn6L3q0jq5IxlkOBvE2aA==
X-Received: by 2002:a05:6000:50:b0:45e:ed7f:1dd with SMTP id
 ffacd0b85a97d-45ef6b4f927mr245311f8f.25.1780067193629; 
 Fri, 29 May 2026 08:06:33 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3559645sm4091190f8f.26.2026.05.29.08.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:06:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 17:06:30 +0200
Message-ID: <20260529150631.447940-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-1-thomas.perale@mind.be>
References: <20260529150631.447940-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780067194; x=1780671994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QnUlNdTl1KEI3NAD4TFBGm1B7dkojchrikfuvBBcdQ=;
 b=eF/VaN+95ISHtzwqxPYRtFhFSFi1p1k+qZLv24b54wd32Cgn+CN2DIlf4TmICpm81j
 g4l0kRCuU7ncrVhvPkh+RKOCgbzsFE+BqfJfWsKvB9Z2Ene+MHWwcoHEhLbO66yGaYQA
 /V/IcAxE1lGzOc0cAY/lK+d9z85/8nJg2FGrWZB5A8MGGWSx6WqPR/p67asbG1H5kzFv
 iqoKLiZXg5lvmGun3t5E3kWGspc8s9Mfo1cAMxjNPmnZLUD8XKzjBy88izlPKRaIxAf6
 K/7Fw/XFfUW0jWIsSw9d45pqjguIH2Y0aOSjqy4R2KMpyEl7q523S/CIbgXLOp/DE054
 qVMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eF/VaN+9
Subject: [Buildroot] [PATCH v2 4/5] support/scripts/cve-check: fix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 support/scripts/cve-check | 76 +++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 881d9c03c0..9aafa5fcdf 100755
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
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
