Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93215F3094E
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6803140B98;
	Thu,  5 Mar 2026 11:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3FY_9V8RoXe; Thu,  5 Mar 2026 11:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946AB40B90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711675;
	bh=UrOiRZERNsxL8u6XecCb5NDWMX1YK+s8/T7bKboXzSI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BehEse0EHWcL9fwMFFPirqlcrB8CpSM2/EKx516GHIn6Mdakp9XuQKnip67H32bZQ
	 lDNBigqjAy6tnRDwhrB3dvDVJY5jMQNwuzfka5g7h2pMJ78pq+IP2adJnc2xtEnQeS
	 lsePGgF+gKDFedMY3VHSJlboDqZeMP7+Dlb4L3lSh5gJkilTGPeDqP2I7iktB/W5ZL
	 n5sUhaBtj4Ssf+Hw/yE0sNa6nmdzkuj80qDc8aYDqeNEgGRJoV/sGQjYDe0L2/rYjv
	 Xk2Z2/aoSY8mLGZwYcLmkBRGZQIIUCJ5l7ECd6291v1hCLL4GAN+mymWlNBt4g175P
	 nAO4O2YWISqTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946AB40B90;
	Thu,  5 Mar 2026 11:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4248223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA0DF60B04
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1cgd_V5LYPb for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C3A660B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3A660B08
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C3A660B08
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id B57105A0009;
 Thu, 05 Mar 2026 12:54:25 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iabKuf-fL9jh; Thu,  5 Mar 2026 12:54:24 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 7C0D25A000A;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:11 +0100
Message-ID: <20260305115413.1860514-6-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=1ful/3GJxJhDXZmZIi/lvF38wUQBUzozoGrgpx2GzuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mqlor2LAG1H4QjZLbJGyvG9AXDzg6aom25c9f5nRYLpo2vNQYpiBcxUIP67moTFW+
 smkQ8EqVVtyUTFmxFu32TGcD2PRXU0ygeHM7gKFQ2jSIkzMZMsNeS81rlDyQw35xJS
 JA2Wko4Tt1lj/QIEcNT2/ip4WdNowORje16Gt94FzNmmIdEYm8U40XFuoKM+gb6dxN
 UYoM9LUJq/mVd/y0Ziu+OMTUdAKTE+QtpOMc5gRlCDW4xut8rqiIte/bF+6fqu+V2d
 +fJe7OXKsXLx3Wq0U0VX9xukwIS4pl818ug3Z4hoXTeDN2BQ2A/i24oGpb9Z6xVgbA
 EPP95/V2HAWnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=Mqlor2LA
Subject: [Buildroot] [PATCH v2 5/7] utils/generate-cyclonedx: allow
 filtering skeleton packages from SBOM
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

Some skeleton packages do not provide software, and cluttering the SBOM with
low-value skeleton information is not desirable. Allow excluding skeleton
packages from the SBOM via --no-skeleton. Skeleton packages are identified by
the skeleton- prefix in their name.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    |  8 ++++++
 utils/generate-cyclonedx                      | 27 +++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 274e78ab3f8d..b6de19e4bc83 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -176,3 +176,11 @@ class TestGenerateCycloneDX(unittest.TestCase):
         bar = self._find_component(result, "package-bar")
         bar_patch = bar["pedigree"]["patches"][0]
         self.assertNotIn("diff", bar_patch)
+
+    def test_no_skeleton(self):
+        result = self._run_script(["--no-skeleton"])
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertIn("package-foo", names)
+        self.assertIn("package-bar", names)
+        self.assertNotIn("skeleton-baz", names)
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 4cd991dde467..97fd80357f4c 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -441,6 +441,28 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
     return [ref for ref in show_info_dict if ref not in indirect]
 
 
+def filter_packages(show_info_dict, filter):
+    """Filter the show-info packages based on a filter function.
+
+    Args:
+        show_info_dict (dict): The JSON output of the show-info command.
+        filter (function): A function that takes a package name and a
+            package dictionary as argument. If the function returns True,
+            the package will be filtered out.
+    """
+    filtered = [
+        name for name, comp in show_info_dict.items() if filter(name, comp)
+    ]
+    for name in list(show_info_dict):
+        if name in filtered:
+            del show_info_dict[name]
+        else:
+            if deps := show_info_dict[name].get("dependencies"):
+                show_info_dict[name]["dependencies"] = [
+                    dep for dep in deps if dep not in filtered
+                ]
+
+
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
@@ -455,6 +477,8 @@ def main():
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--with-diff", type=DiffMode, choices=list(DiffMode), default=DiffMode.INLINE,
                         help="Patch diff mode (default:'inline')")
+    parser.add_argument("--no-skeleton", default=False, action='store_true',
+                        help="Excludes skeleton packages from the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -468,6 +492,9 @@ def main():
 
     show_info_dict = json.load(args.in_file)
 
+    if args.no_skeleton:
+        filter_packages(show_info_dict, lambda name, _: name.startswith("skeleton-"))
+
     # Remove rootfs and virtual packages if not explicitly included
     # from the cli arguments
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
