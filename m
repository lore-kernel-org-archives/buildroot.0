Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37601F30950
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F4881EBB;
	Thu,  5 Mar 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtU4SftkmrgR; Thu,  5 Mar 2026 11:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA2FF81ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711893;
	bh=jqxZxGurTunMGdwPyR66EDH6In6cGjBiJF7ij7Gbxto=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBFZOUw/fFhlufRTdMJ3HtXz7/RN0Zc2TramSzRcnemBZeUzH6nM3A8bufnaP7iJ5
	 8HAxJzMT1AdRkqEGxTrpLC6NhNxqzow17SnKE430IsNoSK0tFYLDbapnOgK/Cb+xEt
	 FgxUE1rgnHwxU1QR2+f3Qecw15U6g/BQDEG0UjBs9cav3GnRuTbxLX5XYje62JVwsf
	 AZ1qAn0/qJTmgNgk5zfL4cv/Sujny6hKCuRJ+Sw9tYPc05NbAheegsISslduLe2efn
	 UJ8liC6/9+g+2FCo1iBbIcedqlsvSK8qaDEpZSgm5K21z59DRXqnmZbbgBr4HsHvn2
	 M+QUl9Q6JaitA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2FF81ECA;
	Thu,  5 Mar 2026 11:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1055C223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D0F4095D
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-YyMOfiYqzd for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1F8A408C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F8A408C6
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1F8A408C6
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2605B5A0004;
 Thu, 05 Mar 2026 12:58:09 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Tk0iq8AHme0; Thu,  5 Mar 2026 12:58:06 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id A91935A0007;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:47 +0100
Message-ID: <20260305115752.1861153-4-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=K7vuFhj4U0GnyRJFQcWGNFmUwUHxSZKsw9EPCRPNOLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZijaFICTBwwp7PMQGh9TUtYK23+CGzOM5fHWvmCWihldHYk+Im2hTvqIhSswvq58K
 pkwkS6cfDxFU8t6cLqwk/oQImKuv8x/2nsT+xv3h6a6zpcj4WjkGKmNvtXDFhPy4ZQ
 zVwj03i2gsg/DccpIc7fo/Cbip3zWmk6P0qr4SI39LLElLVcwGeUnim+y7CYSxTmnm
 swOBJgqgjzKgrauPnUwUQABoSCII8KRZglAJAilkuHNUEZSM2JvdBFiMQedt5p2XOd
 lWsP1di2T9UqcpiqKvLM8/Rh+V/RcDKJ7suR9afZU7/YsCz2kXqDcbdIb9yDA3v3NL
 W+VjYPnASPwaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=ZijaFICT
Subject: [Buildroot] [PATCH v2 3/8] utils/generate-cyclonedx: add
 manufacturer name/URL options for SBOM metadata
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

The metadata component may contain a manufacturer field, identifying the
creator of the SBOM. Add options to set the manufacturer name and URL, both
optional. The URL option is repeatable to add multiple URLs.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py        | 15 +++++++++++++++
 utils/generate-cyclonedx                          | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index b9f375364da1..4942d6f6d95a 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -209,3 +209,18 @@ class TestGenerateCycloneDX(unittest.TestCase):
 
         foo = self._find_component(result, "package-foo")
         self.assertNotIn("properties", foo)
+
+    def test_manufacturer(self):
+        result = self._run_script([
+            "--manufacturer-name", "Example Corp",
+            "--manufacturer-url", "https://example.com",
+            "--manufacturer-url", "https://example.org",
+        ])
+
+        metadata = result["metadata"]
+        self.assertIn("component", metadata)
+        self.assertIn("manufacturer", metadata["component"])
+        self.assertEqual(metadata["component"]["manufacturer"], {
+            "name": "Example Corp",
+            "url": ["https://example.com", "https://example.org"],
+        })
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 7d9f951ac8a9..d9acfef0a7e9 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -486,6 +486,10 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--manufacturer-name", type=str,
+                        help="Add SBOM manufacturer to CycloneDX metadata")
+    parser.add_argument("--manufacturer-url", action="append", type=str,
+                        help="Add SBOM URL to CycloneDX metadata (repeatable)")
 
     args = parser.parse_args()
 
@@ -551,6 +555,15 @@ def main():
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
     }
 
+    manufacturer = {
+        k: v for k, v in {
+            "name": args.manufacturer_name,
+            "url": args.manufacturer_url,
+        }.items() if v
+    }
+    if manufacturer:
+        cyclonedx_dict["metadata"]["component"]["manufacturer"] = manufacturer
+
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
     args.out_file.write('\n')
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
