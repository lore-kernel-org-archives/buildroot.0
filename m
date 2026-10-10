Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E368CCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACAF46090C;
	Sat, 10 Oct 2026 20:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhYcg6-GrYEG; Sat, 10 Oct 2026 20:26:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82AB9608FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663970;
	b=CeLYDKvJa9RatG7NdwY4ghl5eYpnP1JRSCLyyXJbhfXA+9w+mdUIK7g9RYl2eWaHQrR6
	 jbZyuQSC0zSWHWxPyVXdtaXGolLAjUiuyJfp9KNGxbASmWYArG2PSVqktRyrek5Fzbsnn
	 HZxHyz4FYsOx1jWL6o1pQ7mYVsqw1yW4gIOeMU6sxY2SyN4pxwRIrw9xnm/vxowZd6GBS
	 Kf+UjGfx+0bdBgsWfmfII8Dxolc4qR5iIFJ/NVwLyvkVDSGaKetDGHRlqFiUBkoJlF84d
	 8ArfI/KEZ8xEpYxn0KhZwM3xbwC0QtRhMnUXuTTtQQLdGRDSZl1qQFlkYyQLLgYOWtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+4TxbxgOhciIUDh2q/ojF58DsGOpRzPhrMqaIaO2bno=;
	b=XRRcQt3WgwIjj3Tc3b4UMeGHK3EHFHKBDi4cyW+lNRZt2ABYH3yTxcHIQtwkTA4Iq7BQ
	 JAHiwaV0dTtPrt93yqBhYIIhF6g2KfwpsPvc/138wmosXD1EvXxyWSr367y4eB50khRmj
	 GV1L/UxbnGY5FGUvHYWtuZ9EFa+E//pxfxdsd1cARWKhvKWQGoWL+DdZ4sE3wTkreojh0
	 QNGFmpdJYcXKUxfb4vqjyRSOI50zgBOBw7r1HSF/YoXRT8hsxJJf/2oTYSOUeKO+/O9OY
	 yX9xWAMm3Oy9iq3zPrK9tWeOqvepO2ksLzSUOOboPQibFtAfFiiTsYkxoeX69dHluqQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663970;
	bh=+4TxbxgOhciIUDh2q/ojF58DsGOpRzPhrMqaIaO2bno=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kGsTthhINWpmUVnMl/gikNT/UWmnGE9p0uULFdIKzSyjgPMeqaDsW86zYKKpobDFj
	 v0W4VZ+GGj8Wy9tI0HDiI9uV/5PnAszaxbcBl2WT58vt8BxiC0vy13JjOcqt4PJGj/
	 xYTXNVeHU5g3ir6ajt5zVqbAtrf99ahBEUCxVi87/tM9lMCGaHBQMjHeE978aRqRr1
	 giZBGMCT6G75nTHQsz0L1PVEAw5Tl7pOfzI0uclGz2PslP5L0vLR6LAXaUeWHWLUug
	 xCd75omzNUk0mqzPmlB1u/bxMkt69vvUF/eZL9ME7HwWfG1YynDxZ+Ak550kOPeucJ
	 a5ku7CfQLu37A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82AB9608FA;
	Sat, 10 Oct 2026 20:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 864A9156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C19081065
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2Ii9bqfdYzC for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E1C48107D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=MReqaIa+z+lRD0wPqoCtH4IhhKm6pmHW5vBxcND2WTgc4OpYZzObuAd7UXjTaRD4rkAs
 je6oyDFbym5vGcK347alqh6jJGW+1Cgyalu+AtP7kUDsGHoIbKN4ZMMrA88eFvc/93i6S
 9SnQyGzL/Fww8j46RXuYw1J307yOwQ8FILC23Jhsu30xVNoka/OdNZLkMooDwmo8vTXH/
 WAWl5ppmrG8njkkx20HKV0yr3kmx7fpvU36sswd6Q123KZlcK0O/YTVkF2fXLt19F7MJP
 3q8VGn3nwQpIAz4Zs+bt/+h5T2ve/wx+fbsyqy/ul4dEOFygU5tROPwb8//XQbb58nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=epjW93W7U8B3UZQAxVw5DvsWQstJVTpUnlz8EXRA1H8=;
 b=DsiQo8/Wwfvlg03GsSKn2NfkOUpH/y6h4iEHPRIT6iLiAwYAXAOhmIbbQe8IINC5pNaF
 Q7rS2aKQj2fDTRi+Ga1yUi1ErwbISzNXpSrrmX2g2QYZVorg0HebCt5ZdaD3JCq3aOSul
 smombWiKW4BY6TmZyVcnITwrU2LJo0YUSIjn27IyWUr7TxgOZUdVgBM7f+1aWBIchepNk
 CZ+51danEuF30aiBBV58IQzAwZELiHb/aVE02Hgvv3ksETbUzacP5GssTXA4C6xgB08o9
 osR8b9spHBakHgoOjuhGfUJ7K4ykDmy2ppcmNLT47w0wAFm9SwV2ZPsbCJ+210ZEwSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E1C48107D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0138592241; Sat, 10 Oct 2026 20:24:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 345c8ffc9693d1880168e2eb704b5fba5d928c42
X-Git-Newrev: 03e9ac7d9cc87f825b62208488abd40a4b7df175
X-Patchwork-Hint: ignore
Message-Id: <20261010202436.0138592241@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 testing/tests/utils/test_generate_cyclonedx.py: test vuln with different
 analysis
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03e9ac7d9cc87f825b62208488abd40a4b7df175
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add test for CycloneDX vulnerability generation.

If multiple packages ignore the same vulnerability but provide different
analyses, the generator must produce multiple vulnerability entries with
the same vulnerability ID but different analysis information.

This situation can occur when generating a CycloneDX SBOM from the
output of 'make show-info-all'. The resulting SBOM includes packages
that exist in multiple versions within Buildroot (gnupg for instance).

In such a case, one package version may ignore a vulnerability because
it is not affected, while another package version may address it through
a patch.

Therefore, multiple vulnerability entries must be generated, each with
its own analysis and reference information.

This adds a test case for this scenario.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
[Arnout: give next() a None default to return None instead of raise
 StopIteration]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../testing/tests/utils/test_generate_cyclonedx.py | 69 +++++++++++++++++++++-
 1 file changed, 66 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 4ecd90e347..96b68beb40 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -5,6 +5,7 @@ import os
 import subprocess
 import tempfile
 import unittest
+from collections import defaultdict
 from pathlib import Path
 
 import infra
@@ -100,15 +101,23 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 return component
         self.fail(f"component {name} missing")
 
+    def _map_vulnerabilities(self, result: dict) -> dict:
+        vuln_map = defaultdict(list)
+        for vuln in result["vulnerabilities"]:
+            vuln_map[vuln["id"]].append(vuln)
+        return vuln_map
+
     def test_default(self):
         result = self._run_script()
 
         self.assertEqual(len(result["components"]), 4)
         self.assertIn("vulnerabilities", result)
-        vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
+        vulnerabilities = self._map_vulnerabilities(result)
         self.assertEqual(len(vulnerabilities), 2)
-        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
-        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "in_triage")
+        self.assertEqual(len(vulnerabilities["CVE-2025-0001"]), 1)
+        self.assertEqual(len(vulnerabilities["CVE-2025-0002"]), 1)
+        self.assertEqual(vulnerabilities["CVE-2025-0001"][0]["analysis"]["state"], "resolved_with_pedigree")
+        self.assertEqual(vulnerabilities["CVE-2025-0002"][0]["analysis"]["state"], "in_triage")
 
         foo = self._find_component(result, "package-foo")
         patch = foo["pedigree"]["patches"][0]
@@ -244,3 +253,57 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 }
             ],
         )
+
+    def test_vulnerabilities_with_different_analysis(self):
+        """
+        If multiple packages ignore the same vulnerability but provide
+        different analyses, the generator must produce multiple
+        vulnerability entries with the same vulnerability ID but different
+        analysis information.
+
+        This situation can occur when generating a CycloneDX SBOM from the
+        output of 'make show-info-all'. The resulting SBOM includes packages
+        that exist in multiple versions within Buildroot (gnupg for instance).
+
+        In such a case, one package version may ignore a vulnerability because
+        it is not affected, while another package version may address it
+        through a patch.
+
+        Therefore, multiple vulnerability entries must be generated, each with
+        its own analysis and reference information.
+        """
+
+        info = {
+            "gnupg": {
+                "name": "gnupg",
+                "version": "1.4.23",
+                "type": "target",
+                "ignore_cves": ["CVE-2025-0001"],
+                "virtual": False,
+            },
+            "gnupg2": {
+                "name": "gnupg2",
+                "version": "2.5.20",
+                "type": "target",
+                "virtual": False,
+                "patches": [PATCH],
+                "ignore_cves": ["CVE-2025-0001"],
+            },
+        }
+
+        result = self._run_script(show_info=info)
+        self.assertEqual(len(result["vulnerabilities"]), 2)
+
+        vulnerabilities = self._map_vulnerabilities(result)
+
+        self.assertEqual(len(vulnerabilities["CVE-2025-0001"]), 2)
+
+        ignored = next((v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "in_triage"), None)
+        self.assertIsNotNone(ignored)
+        self.assertEqual(len(ignored["affects"]), 1)
+        self.assertEqual(ignored["affects"][0]["ref"], "gnupg")
+
+        resolved = next((v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "resolved_with_pedigree"), None)
+        self.assertIsNotNone(resolved)
+        self.assertEqual(len(resolved["affects"]), 1)
+        self.assertEqual(resolved["affects"][0]["ref"], "gnupg2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
