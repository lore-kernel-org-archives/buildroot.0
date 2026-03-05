Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB7EF30952
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A5540945;
	Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCyTj0jctqaW; Thu,  5 Mar 2026 11:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8D1409FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711895;
	bh=5I3H7oyU5Qqdy8VYFR5E6vDySzmkemjVHQww+/C6pIE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fv3G7fAV7CxhYvMPxCU41F9FLBIUNDhgS6j0QvnLclTFbH+yQmJZeivRUWN47hleC
	 clIea/nfQXUd2N+FPhym5nSAC99AcLdMePFbaLiT0MuoDdOPIA6w+gqC1AZ6crn2vj
	 Bi4+3BKDPhYUKG6gQjJiqp5oElAyY4bFDiIzJdrBvrcp3eYOIidVmM+JcxuAdaIigz
	 lpimaXYRy1bqYqZo5fWsc7d1XBrxC9ZY1tq0S0Q7n/GyV4Fz1xhjE9mSoDFxy8F3iT
	 iqUGWOUtLe0TUNk3nOPRwM97+tjxjQ693+L4BHJohX5xGv2EtjDeFNwTO06gCKVRje
	 72+3tkCT8QoIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8D1409FB;
	Thu,  5 Mar 2026 11:58:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FBED223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4548340061
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj5_ZEuqKbHI for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A2D34011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A2D34011A
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A2D34011A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 4BDFD5A0006;
 Thu, 05 Mar 2026 12:58:09 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oq7yESsC8oo; Thu,  5 Mar 2026 12:58:08 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id B2C395A0008;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:48 +0100
Message-ID: <20260305115752.1861153-5-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=uDomk0uDtGi0r47Og8Tl+OsJRlA6mpkrLvBZd0n+Dpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JsduXeG2Z6WdnjMUdvBWJ0+MoedjpvTktRT24IpYK0lEuCcet/xO1h4g5yrg5BPr7
 l4CX5tEX574lIICPPTUojeGlcICD+DXamevh7yVY6WIQbZsmpHG7b8s/Lyc/wBIdv/
 v0oaiwg/xJyjunA/2MqEdze2Ymy9+IJoNmPtqpx1SQ25HQ+UPn+S70QtqIptZ2xflb
 7Kp1qmL3Wahs4SWg55GG7ZeuOelorHXITSDeW1wZVhfD9YmwJjp7z5NIz5q7XRNEA1
 rYUCd+CrzlkytJN9uDZGL6QEYU4bbn5PouLydtei9d2RgjgqMgYxmjFIganca6E6y8
 BjSOG0agj6fgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=JsduXeG2
Subject: [Buildroot] [PATCH v2 4/8] utils/generate-cyclonedx: extract
 manufacturer URL from package Config.in
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

While there is no real metadata for upstream projects that could act as the
SBOM component manufacturer, the common convention in Buildroot is to add a URL
as the last line of the package's Config.in entry. BSI TR-03183-2 5.2.2 [1]
states that a component manufacturer shall be identified by:

    Email address of the entity that created and, if applicable, maintains the
    respective component. If no email address is available this MUST be a
    "Uniform Resource Locator (URL)", e.g. the creator's home page or the
    project's web page.

Given the lack of upstream email addresses in Buildroot, the URL given in
Config.in is usually a very good fit. When collecting component information for
the SBOM, check for such a URL and, if found, use it as the manufacturer URL in
the component.

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 30 ++++++++++++++
 utils/generate-cyclonedx                      | 40 +++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 4942d6f6d95a..c5069bc29539 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -224,3 +224,33 @@ class TestGenerateCycloneDX(unittest.TestCase):
             "name": "Example Corp",
             "url": ["https://example.com", "https://example.org"],
         })
+
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
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index d9acfef0a7e9..6943d6bd83ee 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -306,6 +306,45 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
         },
     }
 
+
+def cyclonedx_manufacturer(pkgname, pkgdir):
+    """Create CycloneDX manufacturer info from a package's Config.in metadata.
+
+    This function reads the package's Config.in file, locates the configuration
+    entry corresponding to the package symbol, and inspects the last non-empty
+    lines in that entry. If the last lines contain a HTTP/HTTPS URL, it is
+    returned as the manufacturer URL in CycloneDX format.
+
+    Args:
+        pkgname (str): Name of the package, as given in the show-info output.
+        pkgdir (str): The directory of the package
+
+    Returns:
+        dict: Manufacturer information in CycloneDX format, or empty dict
+    """
+    if pkgname.startswith("host-"):
+        pkgname = pkgname[len("host-"):]
+    path = brpath / pkgdir / "Config.in"
+    if path.exists():
+        symbol = f"BR2_PACKAGE_{pkgname.upper().replace('-', '_')}"
+        regex = rf"^(?:menuconfig|config)\s+{symbol}\b.*?(?=^\S|\Z)"
+        pattern = re.compile(regex, re.MULTILINE | re.DOTALL)
+        with path.open() as f:
+            content = f.read()
+            match = pattern.search(content)
+            if match:
+                lines = match.group(0).strip().splitlines()
+                for line in reversed(lines):
+                    line = line.strip()
+                    if line.startswith("http://") or line.startswith("https://"):
+                        return {
+                            "manufacturer": {
+                                "url": [ line ]
+                            }
+                        }
+    return {}
+
+
 def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -322,6 +361,7 @@ def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
+        **cyclonedx_manufacturer(comp["name"], comp["package_dir"]),
         **({
             "version": comp["version"],
             **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
