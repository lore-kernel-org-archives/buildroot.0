Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB91E9DE67
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BF84107C;
	Thu,  9 Apr 2026 08:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcsEz2hJsnHC; Thu,  9 Apr 2026 08:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E9A40E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775722474;
	bh=Ir5TINTSEQCrHvo+BbE8McJ0zhZWJ048foE9qw0ElAo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OT3OEQOEKVbpOVM32dOlT1o8JMtthBZPksgP08soK3kfDiZ0RG+AP17pjTInVUBvd
	 wrhothTzYOMz3HzgD4ZR5hMwovo0pqXjwavnDTrZeIC4LWWek67jISPToCsrpzbEVz
	 hSx6J9WdquQy0bmE6MZqqp6oeOB9wqivR4YEDlvC3RpQrI808kSmrBUbrVxBlSEsrh
	 yvit+3VXXuPlSLrskcAQXyql+iPznXvsNzT9gJpoTSMPd4T5JOZ0js8muwyexLQUY6
	 HtTGWM6/OL/crNfR3/Ml4HudR4aJKMHU691Lqe0ninfJ4G8NB2twshI56OhvRcSG7o
	 WogEH1eYQvpGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E9A40E08;
	Thu,  9 Apr 2026 08:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1572237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9788360D92
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTWPF6ik-Oup for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8220B607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8220B607E0
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8220B607E0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5D4E75A0008;
 Thu, 09 Apr 2026 10:14:22 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0F1zGI11IWM; Thu,  9 Apr 2026 10:14:21 +0200 (CEST)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 1A3985A0009;
 Thu, 09 Apr 2026 10:14:18 +0200 (CEST)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  9 Apr 2026 10:14:00 +0200
Message-ID: <20260409081401.2060709-6-martin@strongswan.org>
In-Reply-To: <20260409081401.2060709-1-martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775722458;
 bh=CAUEZkjXzNX5e0PljDNKXkrERY6Ohfn+toI7V1z9FhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n6+ctetOeik1S0Za3qb0CJ4RqsOuV2WYbK4ozXkQixdVkCXCMp0wHA6LY6yGkHt8e
 Z0d9wavXnxxH1FsTLjqBfVlC/SUDHsd538Z3cbba69JsBpxsuMYvVIrglMVKJ08FtY
 8tTBNX/lJsDg3eddbKwBJOalet8CKFqMr2Wqdf7vaJB3RhzixUvc4kMQ7OrXnfRezL
 7HxmXRoSpzryxw/rtyYC4fk7qBInxbTFuDdPth6iP2VxR+3DLj9i96fBRocBVJpnns
 ygqqVckfg/086tv8QxoyMb8bwaAGXOFTmRg2rGGmIT5P43xTCDRGi++8bBOjyIcD2c
 gXpimJqej27lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=n6+ctetO
Subject: [Buildroot] [PATCH v4 5/6] utils/generate-cyclonedx: add hashes
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
Acked-By: Thomas Perale <thomas.perale@mind.be>
---
 .../tests/utils/test_generate_cyclonedx.py    | 44 +++++++++++++++++++
 utils/generate-cyclonedx                      | 34 ++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index a071ff867923..84f94f050760 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -166,3 +166,47 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 },
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
+                    "uris": [
+                        "http|https+https://mirror.example.org/foo",
+                    ],
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
index a3b7293f9a5e..382d91ce55af 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -283,6 +283,39 @@ def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
                 yield scheme.split("|"), stripped_uri
 
 
+def cyclonedx_source_hashes(comp, source):
+    """Create CycloneDX hashes for a source distribution.
+
+    Args:
+        comp (dict): The component information from the show-info output.
+        source (str): The source distribution filename to look for in the hash file.
+    Returns:
+        dict: Hash information in CycloneDX format, or empty dict
+    """
+    MAPPING = {
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
+                    if len(parts) >= 3 and parts[0] in MAPPING:
+                        hashes.append({
+                            "alg": MAPPING[parts[0]],
+                            "content": parts[1],
+                        })
+    if hashes:
+        return {"hashes": hashes}
+    return {}
+
+
 def cyclonedx_external_refs(comp):
     """Create CycloneDX external references for a component.
 
@@ -301,6 +334,7 @@ def cyclonedx_external_refs(comp):
                 refs.append({
                     "type": "source-distribution",
                     "url": f"{uri}/{source}",
+                    **cyclonedx_source_hashes(comp, source),
                 })
     if refs:
         return {"externalReferences": refs}
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
