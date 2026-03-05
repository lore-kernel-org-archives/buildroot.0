Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C32F30951
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4C040B90;
	Thu,  5 Mar 2026 11:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_9P1S0G0B4v; Thu,  5 Mar 2026 11:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C9240BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711899;
	bh=Z2Tdllez82omdALAy5g5N9Abo355wKiLpuB8zJP/vZg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6p8t7OJgX92RHp3gz6k/qoF4/kIasd9/9VhtVthUurcGmCvI6PlinNHDlBIE26XL
	 vfzfoNg2lE+40GK4+8hglcR3aDVoPiJph+yjjl7OFesH64DnC6I6mralNp7Nhl4nG2
	 RkPOshJ2RH23By1E84h3eCXmyNLSucf7vKu6nLeEg225FGyFCqypksn9uTOW0/h/pE
	 dOGLaBngU55aL1yEEqPrgk8RC39XaOU6e2s/73USzrCo8M2iE+6JWGaQiHk8VekAMc
	 BYe2ColTMYmuA038Ya9CRSxucyPzFchvSQN55F3b8StZulHSH3syYGySyRPrnkH+Pi
	 /83IyCuK+5YMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73C9240BAA;
	Thu,  5 Mar 2026 11:58:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9223223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F15740061
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8btIDXmXH_3H for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A9C44011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9C44011A
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A9C44011A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id EC04B5A0005;
 Thu, 05 Mar 2026 12:58:13 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aH3r-qGn6VPp; Thu,  5 Mar 2026 12:58:12 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id D3DDB5A000C;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:52 +0100
Message-ID: <20260305115752.1861153-9-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=plx9IZD1EyCOJ6hziWPeokiIvnxxbGW02B9HHWS5yhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=or3mtPocsleuCTXV9TIRkPlxJzU/6lyuDAUo9bUinO0jpie62ITVi5/uowPc660YS
 D0w4HT01nH/vqvs16wB0kO9wFS8xzENYA7rZMpeJXipTN8Hy34YjP02P5p5ePE2jsV
 knVtrtF5XPAfUZxoK0zO61nM/l0rp173PMeLI67HjBrRVoi411u6wbMQi0bQ8taiUp
 Qbmqql9Hfk3JuZ6JehBefEspmPl1tm8ppM4erH01sCLrVNE4iMT7WYrkOWZqWx4+KK
 7LcbSlIjYPshZ8ttKRYVqS7LkcCa4ssOXJ3BUEmavWoNpA8/d5ISCgE5amE7uZBq1R
 XQOUAXi1MuF8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=or3mtPoc
Subject: [Buildroot] [PATCH v2 8/8] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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

BSI TR-03183-2 5.2.5 [1] lists the "Hash value of the source code of the
component" under "Optional data fields for each component", and as such
CycloneDX "MAY additionally include the [...] information, if it exists".

As hash values are available in Buildroot, try to open package .hash files
and read hash values for the source distribution. Add all found hashes to
externalReferences source-distribution entries.

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 43 +++++++++++++++++++
 utils/generate-cyclonedx                      | 37 ++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 9116c0ec844b..0e567cb32be9 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -340,3 +340,46 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 }
             ],
         )
+
+    def test_external_references_hashes(self):
+        with tempfile.TemporaryDirectory() as tmpdir:
+            pkg_dir = Path(tmpdir) / "package" / "foo"
+            pkg_dir.mkdir(parents=True, exist_ok=True)
+            (pkg_dir / "foo.hash").write_text(
+                "# source archive checksums\n"
+                "sha256 1111111111111111111111111111111111111111111111111111111111111111 foo-1.2.tar.gz\n"
+                "sha1 2222222222222222222222222222222222222222 foo-1.2.tar.gz\n"
+                "sha256 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa LICENSE\n"
+            )
+
+            info = self._make_show_info()
+            info["package-foo"]["package_dir"] = str(pkg_dir)
+            info["package-foo"]["downloads"] = [
+                {
+                    "source": "foo-1.2.tar.gz",
+                    "uris": ["http|https+https://mirror.example.org/foo"],
+                },
+            ]
+
+            result = self._run_script(show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        self.assertEqual(
+            foo["externalReferences"],
+            [
+                {
+                    "type": "source-distribution",
+                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
+                    "hashes": [
+                        {
+                            "alg": "SHA-256",
+                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
+                        },
+                        {
+                            "alg": "SHA-1",
+                            "content": "2222222222222222222222222222222222222222",
+                        },
+                    ],
+                }
+            ],
+        )
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index fcf6b64470ad..e0318d07ef88 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -369,6 +369,42 @@ def usable_download_uris(uris: list[str]) -> Iterator[str]:
                 yield parts[1]
 
 
+def cyclonedx_source_hashes(comp, source):
+    """Create CycloneDX hashes for a source distribution.
+
+    Args:
+        comp (dict): The component information from the show-info output.
+        source (str): The source distribution filename to look for in the hash file.
+    Returns:
+        dict: Hash information in CycloneDX format, or empty dict
+    """
+    mapping = {
+        "sha1": "SHA-1",
+        "sha256": "SHA-256",
+        "sha512": "SHA-512",
+        "md5": "MD5",
+    }
+    pkgname = comp["name"]
+    if pkgname.startswith("host-"):
+        pkgname = pkgname[len("host-"):]
+
+    hashes = []
+    path = brpath / comp["package_dir"] / f"{pkgname}.hash"
+    if path.exists():
+        with path.open() as f:
+            for line in f:
+                line = line.strip()
+                if not line.startswith("#") and line.endswith(f" {source}"):
+                    alg, hash = line.split()[0:2]
+                    hashes.append({
+                        "alg": mapping[alg],
+                        "content": hash,
+                    })
+    if hashes:
+        return {"hashes": hashes}
+    return {}
+
+
 def cyclonedx_external_refs(comp):
     """Create CycloneDX external references for a component.
 
@@ -385,6 +421,7 @@ def cyclonedx_external_refs(comp):
                         {
                             "type": "source-distribution",
                             "url": f"{uri}/{source}",
+                            **cyclonedx_source_hashes(comp, source),
                         }
                     ]
                 }
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
