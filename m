Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A81EDEBFA
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D4560703;
	Tue,  3 Mar 2026 22:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSt5kdeKLsk4; Tue,  3 Mar 2026 22:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DE56072E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772576645;
	bh=nXJui0ypHFaRu9EAgl0BTh0Un7KiIULJPCez9qez69M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aSrsBkIQUA4PWvVbDVSXPUSsXfjwgOLMYrbkzydDOCbRHYFDkoaRhwjK7KRXyuqAU
	 LDAfS8WuZP/AqPW/Q92BpuaeopRiol4tTUxMSBiso0UGVRq3KuZt5y/v34fO4NKmXY
	 BDv0iov4A4Yc+IchUMEU/+olQSp3xL2KeeGIRvlOMu9QIt2Cn066bxgEYw7+qYuOCG
	 croCXM83+eSEzYPVSP62BVXiVgjPHsiQ8lcQdEetP7Kc8c1f6K3crgOYGcEfGP7u8K
	 NX7nuLUtw/LCkMgvccy+6CVRvhBZoVQZnvdqCP2wL32VVWSVa1tvj64ELU+DZAhVD6
	 Ipqun8rWMkowQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63DE56072E;
	Tue,  3 Mar 2026 22:24:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 973DC25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 955548129D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oObZYHDe5-9 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 22:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B029F81274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B029F81274
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B029F81274
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso51848185e9.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 14:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576638; x=1773181438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sj1mEKkGVXsq8SHBqSOkB84uKoZTWglMOyOfDAs8lI0=;
 b=G4yTDGf0NregUnjfmNJypWhmwqYrRJ2lqUhn0BEyAxWKB3wyqYdr+A8tOqcUPJTMxA
 LOF1/XJfdemTr+5+y8c7yzct9pvSwdvAeJM8CZs55knz7m0fcfyur+z6ZsZ/C6xxxn2v
 jYwLquyGDLSPjTDyFRHsPtl2EQR0dN9JSOeVuIYSqCijYtZz1Ah5PnyiqIUGuGSU7jVh
 S0RyjDur2dRZFkDA6+fFWNwX/pFUAIz/KN5fgm3g/zCAyPFPgK+lKAySxjng/MLtxyc4
 jaQnF0Hfxu2c00PT7uNXeBr0xw5AVcGKR5igZ/THAEpDiZR0cDGuOJA88sI45xXi0Pwd
 x7rQ==
X-Gm-Message-State: AOJu0Yx1X62By36cPfrKsmU9/8AHiaWAxDvIAI8qxXFksMc2XfMt8u9l
 OLoeP35NYN6gch5OFQj6bTGr7PJhecYyyzrX+wPIemrjRx+FLT0DsCG/nVlpBr4qSbVH7RM2z58
 MlEUC
X-Gm-Gg: ATEYQzzy1JEOG61ALq0LR2D7oVAX4o83LUOrzx+J2ty2sbvRuYHfey9VPtGowLtpLJN
 16KE8IpUDoOeQ05+0/MnmauXoL/wAX1HXAGacq7sYwBvO2BeEQx4DP2IAaWtAkdiLMW6+jN+xhv
 JAbgfOVNO/p3/RuC2YEb3eWHEe1zqDvdDMZwyL8AVTM2Il3OuiJsFTrgFdZjEb3tZrNVThc7IiE
 WCAG0PQmiMNdRUOBEyXB1HTn8YbBmc3W9UpTU0vGt1RN0DB9SYmWdwzU7sGkI0JTTpOBG/x89rC
 qCKQsAbPMEttccgBbruPIJJjp6S3SebqM0DALfNHiJHavxnCQmeHjMdZ6rQ3DWA/uyRcTZSYDVW
 jzTWSoJZ5bO+rbggEDwYslg2h3GYcd/HPcaUkvW1BrFgtZDgDrPxvg2i51tz5YTw8roXwrqn9Kb
 rQvWgW25NcstVD6XE=
X-Received: by 2002:a05:600c:3e12:b0:480:6ab1:ed0d with SMTP id
 5b1f17b1804b1-483c9babd97mr319130575e9.9.1772576638320; 
 Tue, 03 Mar 2026 14:23:58 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187b6ffbsm7992775e9.2.2026.03.03.14.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:23:58 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Mar 2026 23:23:51 +0100
Message-ID: <20260303222352.95612-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222352.95612-1-thomas.perale@mind.be>
References: <20260303222352.95612-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772576638; x=1773181438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sj1mEKkGVXsq8SHBqSOkB84uKoZTWglMOyOfDAs8lI0=;
 b=b7dMTnIkvwHXS68yXqkW9tMso4V3Qw4jMEjN+5FosX+TWOSzUaoc43nkqCClCG4XoG
 JzYaHW97oraCLoacZoAZ01fFLWmX19rMYFAbDwyZZ4ts9DQBv2hlO3QF7Ty5w3IPV4oJ
 OaUR6Ie2avq4vjf0Z0bWzaH5Ax6+I7UGtLvLQIM0xWC+23DUeCsVb7GwBbIB96pL1nXr
 oAvKr+syXm2HZP+T4WNgru8hINo5o+PKHGe5nMyKx2U3EeiHDzopxlHPudypfl6JdvY0
 VMit5Yt6nmwo1z+rD13AcANWW6NS9lXMybFgLJmNXPxBst3Xv/AiPCS9wdqpZ8na10D8
 fV9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b7dMTnIk
Subject: [Buildroot] [PATCH 3/4] support/scripts/cve-check: fix
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
index 1c006e4ce4..44c5cdc57d 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -157,55 +157,54 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
 
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
@@ -279,8 +278,7 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
             print(f"Warning: '{vuln_id}' doesn't exist in NVD database.", file=sys.stderr)
             continue
 
-        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
-        vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
+        vuln.update(nvd_cve_to_cdx_vulnerability(cve.nvd_cve))
 
 
 def main():
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
