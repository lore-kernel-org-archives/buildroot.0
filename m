Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EFCFCE091
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CEB61636;
	Thu, 26 Feb 2026 14:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5REMrqT4l6yW; Thu, 26 Feb 2026 14:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F224C61637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116050;
	bh=r2BtynKodIRjrBn7ymoC8qSE1M2CP5DhcgAIcnptBs4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnPV7o5SfAPBw9pxa5e+FSYOQNY9eaqHPHQ1+4niym+tEbR6V191W+QP6PM1TjsgD
	 QY7JZa+YDfXlu8ZopSnFXNoKu91TDxmKRZFJL/LLJQJuUEXqCfPVcuWxsnTcAHUm37
	 akytKeDT7sm++fKjAY7BPvYLHVDyq6sDWkCFLt/tJ7WUO+ESazC8wvPy5cmu94q3Vo
	 D1GFWjfLWxKg5I3TrGI4IHs9Xslp7t5CfE/VzBZgxZW1nNpe5pm9oQBd2DRbp3LLqg
	 cWWaa14/xrtopCxWmrDxExA/1MNB8+oQbwK+OQWe4uyo366qu7MN0uJWbBZGBsiMwl
	 oW1XH4DXTnuyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F224C61637;
	Thu, 26 Feb 2026 14:27:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE8223D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40EB88414B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ds3whiAhPsm for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 215DA84070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 215DA84070
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 215DA84070
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 7B6F15A0003;
 Thu, 26 Feb 2026 15:27:22 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJY7rb0mMPoD; Thu, 26 Feb 2026 15:27:21 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 7067F5A000C;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:27:00 +0100
Message-ID: <20260226142700.1064999-10-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=H/XpKiKw/KG4wuaGwEJLiRyowcXs6JFUBTUfHchyIzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxIi3WdOlENmMu5IayzJPJxH6vLYF47cyAqXqKW9py/EgZ8sR2bZtvY/PC3T0v5Qd
 oRsBBezDTw1qU/q/wtcZLmS8GhIi7vPAqCN3Wn8kA3Tu3SaDDlEwhJLkkVxPUJWxfB
 zQIb17cFKNfzqfP0ect+yGjhhteyEisM7o9fZLvtds1tOqWt1LldRm/JxaU9fvjOiw
 pFVFjjVkLZPC8+BGqm3TmSjzFmN0boGN3DrIlTQLIpys8aSQyg9cx13/BEvPxRkiUU
 vDNnWOEXk/d0lbFGYw5GV2fypuf6TweLMODMl9Q/7ZLPh84byCZlbUcYNEvJ8vrMj5
 RynHmcagiRK9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=XxIi3WdO
Subject: [Buildroot] [PATCH 9/9] support/testing/utils: add
 utils/generate-cyclonedx metadata and purl tests
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

Extend the existing test_generate_cyclonedx.py test suite to cover the new
functionality, including metadata fields, manufacturer URL extraction from
Config.in and purl generation based on download URLs.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index d41a0b0aef46..28755469a0be 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -5,6 +5,7 @@ import os
 import subprocess
 import tempfile
 import unittest
+from datetime import datetime
 from pathlib import Path
 
 import infra
@@ -42,6 +43,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "patches": [UPSTREAM_PATCH],
                 "dependencies": ["skeleton-baz", "package-virtual"],
                 "ignore_cves": ["CVE-2025-0001"],
+                "package_dir": "package/package-foo",
             },
             "skeleton-baz": {
                 "name": "skeleton-baz",
@@ -50,6 +52,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "virtual": False,
                 "licenses": "Apache-2.0",
                 "dependencies": [],
+                "package_dir": "package/skeleton-baz",
             },
             "host-tool": {
                 "name": "host-tool",
@@ -58,6 +61,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "virtual": False,
                 "licenses": "GPL-3.0-only",
                 "dependencies": [],
+                "package_dir": "package/host-tool",
             },
             "package-virtual": {
                 "name": "virtual-provider",
@@ -65,6 +69,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "type": "target",
                 "provides": ["package-foo"],
                 "dependencies": [],
+                "package_dir": "package/package-virtual",
             },
         }
 
@@ -163,3 +168,154 @@ class TestGenerateCycloneDX(unittest.TestCase):
         foo = self._find_component(result, "package-foo")
         patch = foo["pedigree"]["patches"][0]
         self.assertNotIn("diff", patch)
+
+    def test_metadata(self):
+        args = [
+            "--manufacturer-name", "Acme Devices",
+            "--manufacturer-url", "https://acme.example",
+            "--manufacturer-url", "https://mirror.example",
+        ]
+        result = self._run_script(args)
+
+        metadata = result["metadata"]["component"]
+        self.assertEqual(metadata["manufacturer"], {
+            "name": "Acme Devices",
+            "url": [
+                "https://acme.example",
+                "https://mirror.example",
+            ],
+        })
+        timestamp = datetime.fromisoformat(result["metadata"]["timestamp"])
+        self.assertIsNotNone(timestamp.tzinfo)
+        self.assertEqual(result["metadata"]["lifecycles"][0]["phase"], "build")
+
+    def test_comp_manu(self):
+        with tempfile.TemporaryDirectory() as tmpdir:
+            pkg_dir = Path(tmpdir) / "package" / "foo"
+            pkg_dir.mkdir(parents=True, exist_ok=True)
+            (pkg_dir / "Config.in").write_text(
+                "config BR2_PACKAGE_FOO\n"
+                "    bool \"Foo\"\n"
+                "    help Manufacturer page\n"
+                "    https://manufacturer.example/foo\n\n"
+            )
+            show_info = {
+                "package-foo": {
+                    "name": "foo",
+                    "version": "1.2",
+                    "type": "target",
+                    "virtual": False,
+                    "licenses": "MIT",
+                    "package_dir": str(pkg_dir),
+                    "dependencies": [],
+                },
+            }
+            result = self._run_script(show_info=show_info)
+
+        component = self._find_component(result, "package-foo")
+        self.assertEqual(
+            component["manufacturer"],
+            {"url": ["https://manufacturer.example/foo"]}
+        )
+
+    def test_comp_manu_lib(self):
+        with tempfile.TemporaryDirectory() as tmpdir:
+            lib_dir = Path(tmpdir) / "package" / "libacme"
+            non_lib_dir = lib_dir.with_name("acme")
+            non_lib_dir.mkdir(parents=True, exist_ok=True)
+            (non_lib_dir / "Config.in").write_text(
+                "config BR2_PACKAGE_LIBACME\n"
+                "    bool \"Libacme\"\n"
+                "    help Provide manufacturer URL\n"
+                "    https://manufacturer.example/libacme\n\n"
+            )
+            show_info = {
+                "libacme": {
+                    "name": "libacme",
+                    "version": "3.4",
+                    "type": "target",
+                    "virtual": False,
+                    "licenses": "MIT",
+                    "package_dir": str(lib_dir),
+                    "dependencies": [],
+                },
+            }
+            result = self._run_script(show_info=show_info)
+
+        component = self._find_component(result, "libacme")
+        self.assertEqual(
+            component["manufacturer"],
+            {"url": ["https://manufacturer.example/libacme"]}
+        )
+
+    def test_purl(self):
+        show_info = {
+            "package-generic": {
+                "name": "pkg-generic",
+                "version": "1.0",
+                "type": "target",
+                "virtual": False,
+                "licenses": "MIT",
+                "package_dir": "package/pkg-generic",
+                "downloads": [
+                    {
+                        "source": "pkg-generic-1.0.tar.gz",
+                        "uris": [
+                            "https|urlencode+https://downloads.example/pkg-generic"
+                        ],
+                    }
+                ],
+                "dependencies": [],
+            },
+        }
+        result = self._run_script(show_info=show_info)
+
+        component = self._find_component(result, "package-generic")
+        self.assertEqual(
+            component["purl"],
+            "pkg:generic/pkg-generic@1.0?download_url=https://downloads.example/pkg-generic/pkg-generic-1.0.tar.gz"
+        )
+
+    def test_purl_github(self):
+        def make_pkg(name: str, uri: str, version: str, download: str):
+            show_info = {
+                name: {
+                    "name": name,
+                    "version": version,
+                    "type": "target",
+                    "virtual": False,
+                    "licenses": "MIT",
+                    "package_dir": f"package/{name}",
+                    "downloads": [
+                        {
+                            "source": download,
+                            "uris": [uri],
+                        }
+                    ],
+                    "dependencies": [],
+                },
+            }
+            result = self._run_script(show_info=show_info)
+            return self._find_component(result, name)
+
+        archive = make_pkg(
+            "github-archive",
+            "https|urlencode+https://github.com/owner/project/archive/v2.0.tar.gz",
+            "2.0",
+            "project-2.0.tar.gz",
+        )
+        self.assertEqual(
+            archive["purl"],
+            "pkg:github/owner/project@v2.0.tar.gz",
+        )
+
+        no_archive = make_pkg(
+            "github-no-archive",
+            "https|urlencode+https://github.com/owner/project/releases/latest",
+            "1.1",
+            "project-1.1.tar.gz",
+        )
+        self.assertEqual(
+            no_archive["purl"],
+            "pkg:generic/github-no-archive@1.1?download_url=https://github.com/owner/project/releases/latest/project-1.1.tar.gz",
+        )
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
