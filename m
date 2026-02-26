Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A44FCE08C
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FB28128E;
	Thu, 26 Feb 2026 14:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0HrjWEMGBq3; Thu, 26 Feb 2026 14:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFBD83417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116262;
	bh=lvfexE8ldacHJCsOuG3CAATis/TZ7aG8BN8mF9QntKg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuVE6pkgSEdi8ILrfjlByb2LYDlM652zbcUff1AwFYvwcHNMT7OAOySbJ6Y/41ca8
	 +rfsNtwWg505AW3BcnQtuMi1pQEhy1RvqbcxB8A35Y9q9y7gZX295P3tIn+9ttfDSG
	 kRpVq98SoJCrrr6jPQTJthsqKiw9gVJhjjDBhbYszBq8a50d+nNo2QSYdkldzd328U
	 qo8YrKTzTjG1l5cR2jPbYXCxjMioYQ1OsHoWa+cYG1zrdDiJp2YRnTrdXvxsOt2LgV
	 ao71e5bMzGBgooH2PMNf+rPZZuuH4s1zG2X+eE5EsSO3pUgWRAlT/V28kCszlCClhm
	 98xfms2kN/bDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFBD83417;
	Thu, 26 Feb 2026 14:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C8523D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCAEE615E4
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TxT-ZpspcYI for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD62F6120C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD62F6120C
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD62F6120C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 6AA465A0009;
 Thu, 26 Feb 2026 15:20:56 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoIKgTMlZLfP; Thu, 26 Feb 2026 15:20:55 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 52FED5A000A;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:23 +0100
Message-ID: <20260226142023.1064241-9-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=ayIS6plcaQwTbWLVIv2EJ+BTDwilhsUxtogru2lAlvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GQOce9lr7ifa0IXfyOnY+k+zLkVEQ4yaxUsNnUJa9r2ebU4nPLFN0dRAcIHUWea0G
 h9iH9b88KTyVVy8Tjiam5tjDQ7OcWmDytL162HDHoM9KLg3phHpbX6I2pQG90/sftV
 SHLcMrGmpO7+mLt0+ClFHOqU78lqRz4HJcoJSN8b/5UnZo/AQu6NifIw6myQW2IrWJ
 iKGTZi59IU4LYimmRtdGEsEkL41oue3bKqrL9anTzcaiAMTZHBKWcESfVhUkH2R4HV
 Zc0Bxd0R4xkBzT7aQCLQkB8DIL95ZqsSwUNjueXntOBde5GegjwgPOTEsehM3mVKS4
 tcc8Id8g7jeNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=GQOce9lr
Subject: [Buildroot] [PATCH 8/8] support/testing/utils: add tests for
 utils/generate-cyclonedx
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
script invocation, patch metadata extraction, package filtering and the
different diff modes.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 165 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 ++
 .../test_generate_cyclonedx/no_upstream.patch |  10 ++
 3 files changed, 186 insertions(+)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
new file mode 100644
index 000000000000..d41a0b0aef46
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -0,0 +1,165 @@
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
+UPSTREAM_PATCH = "support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch"
+NO_UPSTREAM_PATCH = "support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch"
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
+                "patches": [UPSTREAM_PATCH],
+                "dependencies": ["skeleton-baz", "package-virtual"],
+                "ignore_cves": ["CVE-2025-0001"],
+            },
+            "skeleton-baz": {
+                "name": "skeleton-baz",
+                "version": "0.1",
+                "type": "target",
+                "virtual": False,
+                "licenses": "Apache-2.0",
+                "dependencies": [],
+            },
+            "host-tool": {
+                "name": "host-tool",
+                "version": "0.3",
+                "type": "host",
+                "virtual": False,
+                "licenses": "GPL-3.0-only",
+                "dependencies": [],
+            },
+            "package-virtual": {
+                "name": "virtual-provider",
+                "virtual": True,
+                "type": "target",
+                "provides": ["package-foo"],
+                "dependencies": [],
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
+        self.assertEqual(len(result["components"]), 3)
+        self.assertIn("vulnerabilities", result)
+        vulnerability = result["vulnerabilities"][0]
+        self.assertEqual(vulnerability["id"], "CVE-2025-0001")
+        self.assertEqual(vulnerability["analysis"]["state"], "resolved_with_pedigree")
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
+        self.assertNotIn("package-virtual", names)
+
+        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
+        self.assertEqual(foo_deps["dependsOn"], ["skeleton-baz"])
+
+    def test_customized(self):
+        args = [
+            "--virtual",
+            "--no-skeleton",
+            "--no-host",
+            "--no-vuln",
+            "--with-diff", "url-only",
+            "--project-name", "custom-project",
+            "--project-version", "1.2.3",
+        ]
+        result = self._run_script(args)
+
+        metadata = result["metadata"]["component"]
+        self.assertEqual(metadata["bom-ref"], "custom-project")
+        self.assertEqual(metadata["name"], "custom-project")
+        self.assertEqual(metadata["version"], "1.2.3")
+        self.assertNotIn("vulnerabilities", result)
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertEqual(names, {"package-foo", "package-virtual"})
+        self.assertNotIn("skeleton-baz", names)
+        self.assertNotIn("host-tool", names)
+
+        foo = self._find_component(result, "package-foo")
+        self.assertNotIn("properties", foo)
+        patch = foo["pedigree"]["patches"][0]
+        self.assertEqual(patch["diff"], {"url": "https://patches.example/foo.patch"})
+
+        virtual = self._find_component(result, "package-virtual")
+        self.assertNotIn("properties", virtual)
+
+        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
+        self.assertEqual(foo_deps["dependsOn"], ["package-virtual"])
+
+    def test_diff_url(self):
+        info = self._make_show_info()
+        info["package-foo"]["patches"] = [NO_UPSTREAM_PATCH]
+        result = self._run_script(["--with-diff", "url"], show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        patch = foo["pedigree"]["patches"][0]
+        self.assertIn("text", patch["diff"])
+        self.assertIn("world", patch["diff"]["text"]["content"])
+
+    def test_diff_none(self):
+        info = self._make_show_info()
+        info["package-foo"]["patches"] = [NO_UPSTREAM_PATCH]
+        result = self._run_script(["--with-diff", "none"], show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        patch = foo["pedigree"]["patches"][0]
+        self.assertNotIn("diff", patch)
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
diff --git a/support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch b/support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch
new file mode 100644
index 000000000000..63d14ab49e31
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch
@@ -0,0 +1,10 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+CVE: CVE-2025-0002
+
+diff --git a/bar.txt b/bar.txt
+index 0000001..0000002 100644
+--- a/bar.txt
++++ b/bar.txt
+@@
+-hello
++world
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
