Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E63ECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A3561410;
	Fri, 16 Oct 2026 13:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgTf-PTjjC0Q; Fri, 16 Oct 2026 13:13:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 644EE613FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156439;
	b=DzIsc1B9IHlfmQArEY/VRbaePOXPpX5A22613MedKGfZDUpOHxh++L/aTF7oE2T4QxDb
	 F0AdUg3j2P4LZ001Api2gfRXyTAbN0iNUPAHYOpYFFUOLz/MFnQtk192NNK62K2SHOTT7
	 TYxq1IOLFsxaY3d2aHx7vbvAgoWYuqDTwvnd9W2ezcx+WMmwrSx+wafqagEf4RtxJMHPD
	 RH4AaAePiGvmkRtMPRTGheJywaFwA44nySOL4H6MCjU2c8rSSnmikjMSw7pIjfZg8Bzc/
	 YekmGy4ekDtXH67JN3tC5GRBl/U0H8rfjm95uGdSlAoGOx07NCjiS/6IPBC5J0oWILQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156439;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=26mVWjcjQ7Kz1pQv7fEKx8esr+q5If/LF8LtCqsMk7U=;
	b=XzwVBBixILibbwhfGmqDehwAg5eqLO+/oS7mAo7NnJmWpmu9RFBlfCsIZkBrh99hDfst
	 CRIb4KOlk1ZVsoRg0caJIBz4jgfJlC4YXfURohNjxjRvQ5Zj5OV0S/kjzR9T8k/gNry7m
	 ao4Bn5heAAbqIAPl3Whx2mieMPjAsQlTGX0EzFAATtSc+88hXtsoEArk1c0pODPik0lLr
	 K78y86GlSNP4PbsNv6zJn0uHqpmMMU167PtT51Rzs8k8t+H8a2D2MLJS9ca9pqx1vmWEN
	 Cxw+YQhdPmBAd/vydHNUAAAqTXE8scXor24JhnCNGggVOALC05loYZpYQWrSPVYhRww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156439;
	bh=26mVWjcjQ7Kz1pQv7fEKx8esr+q5If/LF8LtCqsMk7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MqKwTHBo0xfTZ3hsmT/OH+md7WkzSVL1+xf5XTKpjm+ZxUrVSuKGv0Z9tPF0wOaFJ
	 f8iqFBaBkp0+Z7USpgv3/Be3wW1ZErRobC1q/enNsrWDYW/e4pkpXMF/Of5rLOruZ0
	 e/yUYOKkv5sEqLzJCCAKXSvM4cK+GQZ7e2xkg/6AhbLDOWx9NJGxHL+RLR0sFvIEk3
	 5e+Q/XomqEo2n4CmfaK5jITOJv61JC6ZYLbBwFTbdOM/kluCvpWaTGAAz/nsk+wtFD
	 2gRkA0cuSwPfAJmyH4onvXUjD3o4kYIFIDma7xwxt9N4gY65fNTibbhXGJAGtXMf+z
	 5p99mWAioGb7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644EE613FF;
	Fri, 16 Oct 2026 13:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22634105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 184B160F21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XazHuBHM5ijl for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B184460F03
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=s0x4RzkrU5i2Nq00f0QZptV7ScGjTFeGNMkHW55J6zPNjGUva5tn5hOs3EoJV2EMU2J5
 PPy3mBPfs7ft1tGoxpOfeYJB2sjop5blXk9GsGNmtZ5wS3yxRwNahh/qpfkjWDFYwOlzS
 1B5Tvqq9whq/10d0pCd/cgQDcT0V0J3G2fNtpAS5piShaJ2Oxvj/hulWpFMc++Ani4B+3
 eT+p+mEO2GKFXIo16hNPgBfBFGP4mpu5pxnePVbAm8Yeo2JpFAsQU8P6pXLDuiYBZbplI
 w2XM9FC1KxQHB5o4jYWGsZeEqs6XayjsEOOxFa70tRARltbKeFytnlAiB+lb8MixcTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=U+mYz9KN5GltWlUfQ/KsZX3ak4QDHmt9rvONeVoDnZs=;
 b=LdzvUO/HNf6FeILpfd6yet6VOnjbuNMTpu5ayuvqJiTKktzBMgcx65d7hGRPv+HgC6W+
 9oF4Bhc6NrcbtGp2Q+iNNqmqCJ3MVZ03prgE52eyYHYOiGld0yWXVMj1pK60cjK7sq9ML
 Z2suBBb/vuSZ4HNUQW2cwWi8ps1gGrOONJ7zxVJBElpPI3E4Ev8CCVKhzkMIntCTdVAMo
 4jyYAqW+9SqP/CjBbxxfep9H2AXRu0VBcxH+kpcpa/w3OJsHE/PkrWAXJ8que0qp+AlTX
 XvZWIYUZYkyGXRwWGCEA794AxQAaanj0hBw0UL8pBxnSNpVyZAtarAu3w/jslXLvA4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B184460F03
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1D53960D3; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:32 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d3ad19688db4360bf33fc0336fed200eecce793e
X-Git-Newrev: deb11f1c6d95052f71cbaa20670a4598c4c4b02f
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.A1D53960D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8005352340649297827=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8005352340649297827==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/deb11f1c6d95052f71cbaa20670a4598c4c4b02f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 03e9ac7d9cc87f825b62208488abd40a4b7df175)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============8005352340649297827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8005352340649297827==--
