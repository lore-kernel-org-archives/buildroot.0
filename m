Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27533CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF36E60B5A;
	Fri, 16 Oct 2026 13:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdPAIoCj3tRi; Fri, 16 Oct 2026 13:09:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9B1BA60EEE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156183;
	b=b5dQqoYnzs6bHQMUN3uJWBe4lswGvhDkJ4apBoiNC6txmapyewn6GtDA0QQOPRmktSDf
	 CXCrPwkZ/KNnIGyavlom7PrnJkiO154ULN7FpYgnMG4Lb9BZ1SjE+IGEsRk+kZs9nrhwD
	 FPxpYyO+OjtB2t+F3y4dity/HpNPU1uCAUqf7Hlu61EVndU1NA4OYaIbN51xsXomkYNIt
	 3c+kGpX4mfmRcxdJ0GQObU2m2DERrXtw2+okKYaIJJlHQt0PF142VR6+AXO/CBBlZEK0u
	 4kzPdUwqaCsXzBSFQcIfLTQFUXdzzTd/uUgg5oHT89osXcxn1zxq5YGwI/0Fe+vnMfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=05k/Dh5gUFPeVKRKdoSYkAuYkwn5Kb+tqi7JPJ93QoY=;
	b=QxqyEaNw5Su30vLey1s8PkaOLg290v+eW7fIpCSAlpYXjx3BsxPos6Flxyo0MZl1C9v3
	 uO0usnOzb7qt+hKFXuJaeEgqPVDREa9W8YjiOdxLgys+AsRSAkDoHynSk0hsRj73cYF5W
	 HB7FHVM5kCrK4BGrOLuvbxSfxmcY7LAW3p7osr1jgP2e18JrFf/beO7KqnNOA1pnC6TVA
	 WqLO/+2FneNjs69ImXWBUaCy5IpSdOwzM0DzJ1Npeq+2LNeJ8kFsQNTrgQkJBGBBZd18g
	 +4Ytr+n9k7orBgPVkyrIxii1pXtVEXCSQo3YwAHYBS7jNTZBhdl7uMTmGeR6QzhHbUA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156183;
	bh=05k/Dh5gUFPeVKRKdoSYkAuYkwn5Kb+tqi7JPJ93QoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kZzy5Uur3Si8aXJWOV5usz2EDhN/yE1HXKCUQatkjhVEM1b4B6gerrLEAstePyQ1G
	 HHIpQi9BFbZvIRtywOBzrHeDWUsX38r2m5r5kzj//0IVyC/zWVziiD17Ok7qAsrTwg
	 CGy29zdolcGTqtSDYERMg8QKMznyvnVsyfEHcYhRHMlVXUcPDnGB3ijd2U5actZwtj
	 5fb1jeqVCrrEDgSpFMdFxHmybotMQWAnwK00ibMn0TWE7pR6gThJ2r29D3QqdrXQmq
	 0XZVwXfcxSixDVMxs90oT8V9meLz9N+Pfzkb+sAWKnwXaTc56ir1PCkfzGtbe9lnGs
	 gH6xHa60pR7LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B1BA60EEE;
	Fri, 16 Oct 2026 13:09:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4448255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95DB4409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7H-lTMDxAGw for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD969409FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=lUM8EgFMUhP5gBn72Rhs4mTz+ZvYy8EdiCnQ9bf6i6zhAh7B3IVitp/pF52pdxP22Xsv
 Dzpy1RYKa65U++SgZ/xh3+5iLLLiupAN7tZNYWEl52fGNnI5lFFkbphJXDs0fXpZphuOh
 nIhl8/Nlzc+Pr9gHMt2+PRM/SONjB85sYD8KC85mLGl1YTlvzHS+plbQLa/QFex5pxeau
 8AaMWPIPc4/9EYP5qi/X7ZTRzG2rOgisgUSjJ4/7zNyD3QagfWZXnK/ttB2j1EbVJkDvy
 0+sj9bmvwnGu/G5bByTG1/fzq9wZlv2Qz0WuOKiyo17/852PgNSfinvYs2Zk1t9A+EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z6X08l4emmmHNY6j8AJwPejiw6oNDu45CwttllB96I4=;
 b=UhS3j17+twV9Cq1/SJ6tnlI9hPH5RA0ovvZKmc8MX+VW0nOcSeMosz1z8vWhTdOHIcV1
 voJCHeFMVTKP6EkfNYvmilkMGIfAGXPt6MSFc71FmzkoulFm6f9WSvpVsiARHXYESkX+w
 sMOzxNUT4YZkO2bOUGVnWeqVRG+0hEnUyOBKuBeFB1ShLYUO1PkqFAUtT7KUEwGi6J2l7
 NCXELO4fQI/Rs2tAEH+6Y9kohfSZUgmBjMZFTJFU5bB1lK/HgLOSAzT2MR04bH+H7d1WY
 MncxaDFc2M47LFxGn98pYXeR3tAzb5T8sdiAyjiO6no7z2SbV0iuIaZox1XDWz1lNZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD969409FE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E2AA960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8c060cf938222f0b06e8ae3c95558b8af4bd572f
X-Git-Newrev: 6f3491dcf05e992fd878ee841e8144c052c8c130
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.9E2AA960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4913059946716078713=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4913059946716078713==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f3491dcf05e992fd878ee841e8144c052c8c130
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============4913059946716078713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4913059946716078713==--
