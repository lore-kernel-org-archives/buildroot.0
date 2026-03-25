Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46FD106B539
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5694D60F34;
	Wed, 25 Mar 2026 13:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj6vsXOBmKzs; Wed, 25 Mar 2026 13:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D71C6130C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774445633;
	bh=//Y3CvFtOOBAH2F4VvCi38JS21RFbLLUNvpEFfC9Lz4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ga6F5oQqOzM9Z8MjLg2bZ4o/VdqnmEY5pKeL6rJ9fBTnJLUF2yDoxpVtaelXTN0sB
	 8F2+kEUBrWBZirAw8ZwPZOW81PlnRnanjEDhVOp+yTv+v3ABhZTLtiUMt2aw8KEVfT
	 IJ/zVlYW4Gn3uFQUGGX4DOeMGUeGfi2xVeQk1Zf+s67W0JWmhtl0gMD1O57FBy4OIM
	 PD+JLxVbOFPgi209SoZ+j6flCKkN0gYOiendMmRl5ugb+AFvxLL5fE1JzwQog3YPuC
	 vqO8HszUv64akgnQDlGTQJLDpGkw9RYL9VIIeKBw6+cQTBc3gUd4K6RMoczcFrIqi1
	 fOCTwaeQWV82g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D71C6130C;
	Wed, 25 Mar 2026 13:33:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A9F7353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BEFD4021A
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfEQwucsiDKa for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7BA5401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7BA5401F1
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7BA5401F1
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 8AE4A5A0002;
 Wed, 25 Mar 2026 14:33:47 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sLN2UKrD3nU; Wed, 25 Mar 2026 14:33:46 +0100 (CET)
Received: from zbook.home (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 24A145A0003;
 Wed, 25 Mar 2026 14:33:46 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 25 Mar 2026 14:33:39 +0100
Message-ID: <20260325133343.1008245-2-martin@strongswan.org>
In-Reply-To: <20260325133343.1008245-1-martin@strongswan.org>
References: <20260325133343.1008245-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1774445626;
 bh=KE1jh22PHINiVX6Dj61reAuPdBAZDzhLBLXcRa8G/HM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hDBmelwRsTzz/731iQ+gWdWcl+b+1q5Npetxrj2ooAWZrniMoDmcHDuPMZgcVIsxG
 ovN3w7nPMP9f60VG6EENH3WyI6LzzzQ0wQQyvS99tZLWUNbnHwzEjTKccxJq0Ppkwa
 vm4Xsb3QG3gU8SP1TR/m62G0DYDK7LOEw/zMshZHTo47aFY7hRKgTSp6P4I05tm8w8
 t/ZEJKNpMGirO2xFZD73CHkKx1/ggEfJ3kqv9deFqJWvlKzJP3wpEyXs4AFwCGN4ze
 q5BsmHwBrSwe/Hy7Mk1sVmuzP88DtpKBPKmsmm7AW1zyGNAsKo4z8qANULxXwEeAn7
 lfPIPmvKsY61w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=hDBmelwR
Subject: [Buildroot] [PATCH v3 1/5] support/testing/utils: add basic tests
 for utils/generate-cyclonedx
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

Introduce unit-tests for the generate-cyclonedx script, covering basic
script invocation, patch CVE extraction and virtual packages.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 136 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 ++
 2 files changed, 147 insertions(+)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
new file mode 100644
index 000000000000..20f67b48a7a8
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -0,0 +1,136 @@
+"""Unit tests for utils/generate-cyclonedx."""
+
+import json
+import os
+import subprocess
+import tempfile
+import unittest
+from pathlib import Path
+
+import infra
+
+PATCH = "support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch"
+SCHEMA_LICENSES = ["MIT", "Apache-2.0", "GPL-3.0-only"]
+
+
+class TestGenerateCycloneDX(unittest.TestCase):
+    def setUp(self):
+        # Provide a fake SPDX schema so the script never hits the network.
+        self.schema_dir = tempfile.TemporaryDirectory()
+        self.addCleanup(self.schema_dir.cleanup)
+
+        cyclonedx_dir = Path(self.schema_dir.name) / "cyclonedx"
+        cyclonedx_dir.mkdir(parents=True)
+        schema_path = cyclonedx_dir / "spdx-1.6.schema.json"
+        schema_path.write_text(json.dumps({"enum": SCHEMA_LICENSES}))
+
+        self.env = os.environ.copy()
+        self.env["BR2_DL_DIR"] = self.schema_dir.name
+        self.script = infra.basepath("utils/generate-cyclonedx")
+        self.cwd = infra.basepath()
+
+    def _make_show_info(self) -> dict:
+        return {
+            "package-foo": {
+                "name": "foo",
+                "version": "1.2",
+                "type": "target",
+                "virtual": False,
+                "licenses": "MIT",
+                "cpe-id": "cpe:2.3:a:example:foo:1.2:*:*:*:*:*:*:*",
+                "patches": [PATCH],
+                "dependencies": ["skeleton-baz", "package-virtual", "package-bar"],
+                "ignore_cves": ["CVE-2025-0001"],
+                "package_dir": "package/package-foo",
+            },
+            "skeleton-baz": {
+                "name": "skeleton-baz",
+                "version": "0.1",
+                "type": "target",
+                "virtual": False,
+                "licenses": "Apache-2.0",
+                "dependencies": [],
+                "package_dir": "package/skeleton-baz",
+            },
+            "package-bar": {
+                "name": "bar",
+                "version": "0.2",
+                "type": "target",
+                "virtual": False,
+                "licenses": "MIT",
+                "ignore_cves": ["CVE-2025-0002"],
+                "dependencies": [],
+                "package_dir": "package/package-bar",
+            },
+            "host-tool": {
+                "name": "host-tool",
+                "version": "0.3",
+                "type": "host",
+                "virtual": False,
+                "licenses": "GPL-3.0-only",
+                "dependencies": [],
+                "package_dir": "package/host-tool",
+            },
+            "package-virtual": {
+                "name": "virtual-provider",
+                "virtual": True,
+                "type": "target",
+                "provides": ["package-foo"],
+                "dependencies": [],
+                "package_dir": "package/package-virtual",
+            },
+        }
+
+    def _run_script(self, extra_args=(), show_info=None):
+        data = show_info if show_info is not None else self._make_show_info()
+        completed = subprocess.run(
+            [self.script, *extra_args],
+            cwd=self.cwd,
+            env=self.env,
+            input=json.dumps(data),
+            text=True,
+            capture_output=True,
+            check=True,
+        )
+        return json.loads(completed.stdout)
+
+    def _find_component(self, result: dict, name: str) -> dict:
+        for component in result["components"]:
+            if component["bom-ref"] == name:
+                return component
+        self.fail(f"component {name} missing")
+
+    def test_default(self):
+        result = self._run_script()
+
+        self.assertEqual(len(result["components"]), 4)
+        self.assertIn("vulnerabilities", result)
+        vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
+        self.assertEqual(len(vulnerabilities), 2)
+        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
+        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "in_triage")
+
+        foo = self._find_component(result, "package-foo")
+        patch = foo["pedigree"]["patches"][0]
+        self.assertIn("text", patch["diff"])
+        self.assertIn("content", patch["diff"]["text"])
+
+        host = self._find_component(result, "host-tool")
+        self.assertEqual(host["properties"][0]["value"], "host")
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertIn("skeleton-baz", names)
+        self.assertIn("package-bar", names)
+        self.assertNotIn("package-virtual", names)
+
+        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
+        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
+
+    def test_virtual(self):
+        result = self._run_script(["--virtual"])
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertEqual(names, {"package-foo", "skeleton-baz", "host-tool", "package-virtual", "package-bar"})
+
+        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
+        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "package-virtual", "skeleton-baz"])
diff --git a/support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch b/support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
new file mode 100644
index 000000000000..f18e51ebb9ec
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
@@ -0,0 +1,11 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+CVE: CVE-2025-0001
+Upstream: https://patches.example/foo.patch
+
+diff --git a/foo.txt b/foo.txt
+index 0000001..0000002 100644
+--- a/foo.txt
++++ b/foo.txt
+@@
+-foo
++bar
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
