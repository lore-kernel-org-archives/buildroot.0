Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB58CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3436881F21;
	Wed, 24 Jun 2026 10:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C294SqfzLzxA; Wed, 24 Jun 2026 10:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C67481F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296037;
	bh=RkZnUSgL0LRnMOOz18f98xL9WDbm4nrlq7rzd6Izs3g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=I281cASBHTaSZ0iRdGQx/MgwIvbNQf8t8jDBnWMEBmfnE/c8U0YYyaRwrh0OmDxfs
	 7fjh2/Bk8gQU5xaKDeSbhE+LTLHS3zoGnfbjliVCBeAww0BGEhhmrCiAu4/XK/m5EQ
	 Uxs3Z85+TxVK9XS87qFgA3gUGm9KhP1KXBH3a1jYycEIZMJI2mlKcnC1GpLL5df+hf
	 7WHrSvjiWugmIgWMG7e7G9X5l8qPvR2t8tHXSL04vgjtPdOx383rue+nuBfYbmy4mJ
	 JidFLDq6t6M6CpxZC9n70H95InKqVeoV5XpOUQqX0xeAvabof7RBm5mx/jxvr8t4zy
	 Nfi1Eg+gZEvXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C67481F2C;
	Wed, 24 Jun 2026 10:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 950A2256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B96F404BC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oj3PzB21eIlg for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 188BA40331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 188BA40331
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 188BA40331
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-46066e640easo565314f8f.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296027; x=1782900827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eSxGlRUEg4fgmdhuapv0SiTwNJ3PTsqOud7mRn3FZQ4=;
 b=s5iZVQBx7C1tmcW0gYy5+ilNYlORUzWxnciXzwZxc2QvT1Yn+o07WSd7o/zOxdtTYI
 NhlHJOY0OBEhMkyVdPCiNKudTKsMSe2lXiSHbXZBetaB3nuOsIPj4spIA7rG4w4tRuQa
 t0iGdFX/Yyscg8xoWU4q6DcnQ0bNrl3fJ7K0LfvyLtpa+6DuawxnPK5UZegxHwS8RsOa
 WRoD/mcv97O+0N0a8ZeEk41Yrmh07hxq2uxryOQuMfkaLTpUTu75dNXnvApx3XRunv4B
 P+l9nq+FJccY3gF3jtjgLU3WE2mrfuZdS65hPvIdR7Q/bWoN/zeoVDk2u+Imyd+QbGVJ
 6Gew==
X-Gm-Message-State: AOJu0YzzNbgg14Xa9omzW7cWORnulIzcR7zVby02MZTJAqnNN8IeNhS7
 dbdz08QBjcngv7iUMU2kR27LuroSgsHz2yPS4+7Hwx9NLQiA/cnRsd3sX+b1JBdkD21jbETV1Eq
 s+MGq
X-Gm-Gg: AfdE7ck9170fjQciAFtX/tSHm2xRRVGI5OhfdDhoNErLZ/AR0BM3DUiOLtCTuu7gP5U
 I6vkJJ+S4pzAq4Wlov8FGYuD1xHEgbltMQ+asLjQ+ZkLCEFYm7yyuau/Tj2dLMDn75wahg62lwl
 l45wlYAIU8cBWfuju7Wgs63fm+Yulx5nsJ48HWaureblVVBaidQq9Oh1au9KTvr6OE3V8bWrqMH
 OmOSKYk7eRTJglReE/HLuGgmShbus7yP/SexrAV8wdwCGG8GKg3hLiRTvs27yeQB4zfxbg/L3K7
 iBDdkkPFUxLzRnZkINDGB+zblPhr/u9Dvjji56eb3VypPZ9Y5R3AN5TcX++RLla17g7OS9WFVgJ
 Dli9WLgsOaalZOroqm/8EWjxNmh78pVk5TFy1pHynCXiVuMGlWL1KK3SWVtZflrE9NoC806HAEB
 0b8oY8
X-Received: by 2002:a05:6000:3108:b0:460:65dc:e9a0 with SMTP id
 ffacd0b85a97d-46c09ec74f6mr3979934f8f.8.1782296026794; 
 Wed, 24 Jun 2026 03:13:46 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:40 +0200
Message-ID: <20260624101340.80670-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296027; x=1782900827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSxGlRUEg4fgmdhuapv0SiTwNJ3PTsqOud7mRn3FZQ4=;
 b=FgduQGcNi7xdJby0zHvd8PMoajGUieHnNZNfGkY2hPikFsZH5T8+o/I6hY2RXmRTvV
 XjJlsLmsplkj5ioYWb3iDlFzXNzu4d9dJyOy8wO81ujLJ6vsf3Gq0iFaYkPAysdvieN/
 Gb9mjSFx1GRbbEnIbt4FsqoaCzK7ACLCbxU2zyZw51gjsO2QbiZ7OwS2YRM5nHyxC+/K
 +tYnTLCEMw4iALQucA3Y9rkIyCbvoF5QxUoVXZ465RcpYJNbJx71CiBO/T8Hsx24EtZX
 Gw3NVE9VRkliqbt6qqv1N71qhplxzXZ18dSQiLMlJgsFYshwchLwuGu6pPIClWT3S0Gc
 n8JA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FgduQGcN
Subject: [Buildroot] [PATCH 9/9]
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

This add test case for such scenario.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../tests/utils/test_generate_cyclonedx.py    | 69 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index b91add2349..2f1109b178 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -6,6 +6,7 @@ import subprocess
 import tempfile
 import unittest
 from pathlib import Path
+from collections import defaultdict
 
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
+        ignored = next(v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "in_triage")
+        self.assertTrue(ignored is not None)
+        self.assertEqual(len(ignored["affects"]), 1)
+        self.assertEqual(ignored["affects"][0]["ref"], "gnupg")
+
+        resolved = next(v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "resolved_with_pedigree")
+        self.assertTrue(resolved is not None)
+        self.assertEqual(len(resolved["affects"]), 1)
+        self.assertEqual(resolved["affects"][0]["ref"], "gnupg2")
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
