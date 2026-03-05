Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E729F3094E
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA15C40B7A;
	Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqin7gQcZeS5; Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F30C040B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711671;
	bh=Q1ZfirH06/QGtyM4yBhY7c2kzVwC5huVL9/AuNCGBjE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jEUZTPGjIZD+dem+OtwEA4Md3QCpbjsPrczg5v4CVjvEPC65GOvAEmW5ENzMRUaXW
	 OcpN9jUH2QrimZ0Szic586SyLMzV6FnKTjbp8mOHewk6zlqPnsc5gc1Ha8i9YilCrR
	 5S6o4I9knDuLx/J9SJSHR/5DDAtrfzB6BhpJnqjpAiViwv+iQ2mupbX/sBGNQcNmpO
	 BAUEdRk9M10PRfW0juId1E6gxU+xNUAPcHhnvGqPJR7/sNKhvbw/KM80BiKl8FtN9b
	 r7rXgadhKtvQpGIZPIba11RXG6p42mJWOkIJ7vD2ol+U4AeO4rStr8IwYkGwoM0T1c
	 cjPoCcCiIQ1XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F30C040B7B;
	Thu,  5 Mar 2026 11:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00E1C223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB2A740A92
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnBsnh7rc7_b for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1085F40945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1085F40945
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1085F40945
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id AAF0A5A0004;
 Thu, 05 Mar 2026 12:54:23 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiydYr8I5dWs; Thu,  5 Mar 2026 12:54:22 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 56ED75A0006;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:07 +0100
Message-ID: <20260305115413.1860514-2-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=9gbdCLd25Yp3x2Dq8oYl9D6kkSmJkZnlczptr64ppiM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hsSb22QyT6duh2oJp+sv0NK5ykCSO0yniH9HJ8ySbMowawkDy3t7srfp8anJX8/Vo
 ErHXk1EaBUCBecKJ0v7V5zBCcOXnWvWoWh5e6WGZ6CafCjUcdmaqd//hpPk+QkhIFZ
 cgRbHpfZPpESOoTCrHrBLssD7NydP5t3jfJzJ5wow/MaSJoPe/oLX8boaJNpe/7c+C
 SXcKOX7HxO1Jf0Q/4rmORvORL9qgM4uLzGWYJtsfUfWyaSxapGR39KVa5Ukp+vvuzg
 K/uPZ73GNG3isT+UXIr5E4D/UvK2jyjxnIaxYwQIUmbP8HlJgc0XZAbRf8SaTCyTSK
 7ArfH9DvQIcpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=hsSb22Qy
Subject: [Buildroot] [PATCH v2 1/7] support/testing/utils: add basic tests
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
 .../tests/utils/test_generate_cyclonedx.py    | 139 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 ++
 .../test_generate_cyclonedx/no_upstream.patch |  10 ++
 3 files changed, 160 insertions(+)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
new file mode 100644
index 000000000000..8baa4acce183
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -0,0 +1,139 @@
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
+                "patches": [NO_UPSTREAM_PATCH],
+                "ignore_cves": ["CVE-2025-0002", "CVE-2025-0003"],
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
+        self.assertEqual(len(vulnerabilities), 3)
+        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
+        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "resolved_with_pedigree")
+        self.assertEqual(vulnerabilities["CVE-2025-0003"]["analysis"]["state"], "in_triage")
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
