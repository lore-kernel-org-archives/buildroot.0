Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A302106B53B
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88E5838C9;
	Wed, 25 Mar 2026 13:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36NxM4Ckxiur; Wed, 25 Mar 2026 13:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED71083918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774445639;
	bh=SrqnNPou9uTlv4eoNaOSAZfp5h68ICKGYAsCY6pznxg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/D0qK38gTT8xKwumW6n860Zm7aHAZWJqo9+WSfebO6sp0Qiq48hNq4PE0qAqdG+T
	 YFPZcDWGcJdu4iE1O11aRA14zDiSyjU1PmkuMqLHDXBDOCy9ReXMIQNM4hin99w9aQ
	 bLDCwGLiK5ZQmkkaVJcDAa1YZLRQWRbz5VNOQMDcUlbip/gFlsYTsP5f1uKsInLsfo
	 PeWnPf9t1j+XsUCYQFwwTq1zCq3knZw3xWNlHfCT9CLm0mup6Cs/FQutrRkP7nnRuQ
	 UT/gODZ8jtHEZ8WXBr/jw5ST5DL+2hvvFDgVGPtXd4aoua//w3XknEQrXhntnqxQOY
	 LID1us3k4f6FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED71083918;
	Wed, 25 Mar 2026 13:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CBE8353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4339741190
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5az6TfjU3hYn for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4858C41116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4858C41116
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4858C41116
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 20AF35A0006;
 Wed, 25 Mar 2026 14:33:50 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5goy3inHdB9; Wed, 25 Mar 2026 14:33:48 +0100 (CET)
Received: from zbook.home (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 6A4CB5A0007;
 Wed, 25 Mar 2026 14:33:46 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 25 Mar 2026 14:33:43 +0100
Message-ID: <20260325133343.1008245-6-martin@strongswan.org>
In-Reply-To: <20260325133343.1008245-1-martin@strongswan.org>
References: <20260325133343.1008245-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1774445626;
 bh=4gk/0Y302/VLMZgaQbtf3N8qXLZvle5hyqc52KHNag0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IT8heUetYf7XhV5UIhGH12Xc+ISIEKNArS6BYLnq9U5awwb3bR+2/O0i08AxcyNs3
 pwR2azPYh4vLawhRNJDycW26uckUI0TNH3v9fHAVWp9sGz29Y4+EvETmUU+Z68/9eg
 8exo4ZYvdbcmYc2cvK7TKx1wRymx6/RRrzh0s71doblV0bHB7XoR4d5EYctAOKjsYB
 w0Kv964zKNIQ1qdYEKQry1+YYzQpa+ljQJTuN788H/uC9jrv3v4UAltg+4BEwDMX8H
 co7UfNwGBfl/qvbPo1wApeLwBsDE5prV9/pp+MKYgtgKKAX2cEXhvw9SPzE/4DcwZU
 OckVLTKiWz85Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=IT8heUet
Subject: [Buildroot] [PATCH v3 5/5] utils/generate-cyclonedx: add hashes
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

As hash values are available in Buildroot, iterate over .hash file paths
from show-info input and read hash values for the source distribution. Add
all found hashes to externalReferences source-distribution entries.

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 42 +++++++++++++++++++
 utils/generate-cyclonedx                      | 34 +++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 9c2bd2bc9180..29f492803e10 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -164,3 +164,45 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 }
             ],
         )
+
+    def test_external_references_hashes(self):
+        with tempfile.TemporaryDirectory() as tmpdir:
+            hash_file = Path(tmpdir) / "foo.hash"
+            hash_file.write_text(
+                "# source archive checksums\n"
+                "sha256 1111111111111111111111111111111111111111111111111111111111111111 foo-1.2.tar.gz\n"
+                "sha1 2222222222222222222222222222222222222222 foo-1.2.tar.gz\n"
+                "sha256 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa LICENSE\n"
+            )
+
+            info = self._make_show_info()
+            info["package-foo"]["hashes"] = [str(hash_file)]
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
index 3946380ae3ef..4ef0548bae51 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -278,6 +278,39 @@ def usable_download_uris(uris: list[str]) -> Iterator[str]:
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
+
+    hashes = []
+    for hash_file in comp.get("hashes", []):
+        with Path(hash_file).open() as f:
+            for line in f:
+                line = line.strip()
+                if not line.startswith("#") and line.endswith(f" {source}"):
+                    parts = line.split()
+                    if len(parts) >= 3 and parts[0] in mapping:
+                        hashes.append({
+                            "alg": mapping[parts[0]],
+                            "content": parts[1],
+                        })
+    if hashes:
+        return {"hashes": hashes}
+    return {}
+
+
 def cyclonedx_external_refs(comp):
     """Create CycloneDX external references for a component.
 
@@ -294,6 +327,7 @@ def cyclonedx_external_refs(comp):
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
