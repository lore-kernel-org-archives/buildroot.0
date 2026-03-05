Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39E6F30954
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1C281EC2;
	Thu,  5 Mar 2026 11:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WQcKM9trvth; Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD7581EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711896;
	bh=zpRYs6AMgChcjNNvacSybNPiC8o5JE6Vs3TYOvbRK7A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PcXZipkHJUTiDtlXsLOqSG2IDRKMeZl+S1m5vxsZmsu7QsohZUfFXU5ZlmLW548SV
	 00ory/k51O40Idqp3+TY/KW5wMIxoPGvYp54R3kUNHgU/Lqj2rj9MmyDVkAjORkt5j
	 CHYKmuImmSaybF/5sajC6csG0KibpfyKmAhIZdiBcZoNqvatWZvSwp+Nyzm++D/BsZ
	 tryVSsOVprNcueHDD1z66GAUh4o8aPpHPhP5Uj8X1KpWu3UPaV5bTIBS5dtiP1sih6
	 Uclxj03EZf8/1R9KBLgjJfOV4K87sGiyhdEKJczRET5qcX4BjSu1QKVoT7lg+4Iq4p
	 RU7B0yRSH4v7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD7581EFA;
	Thu,  5 Mar 2026 11:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9085625B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 812AF408C6
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2FLEvbSfcwR for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18EAD40945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18EAD40945
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18EAD40945
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 67F475A0005;
 Thu, 05 Mar 2026 12:58:10 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yPkVCLI1JC1; Thu,  5 Mar 2026 12:58:09 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id BBC805A0009;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:49 +0100
Message-ID: <20260305115752.1861153-6-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=bWIeYNpAB0hzF1bp6isQsY5PcqBuGvRW7vnB3S8EbPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRj1vGgOrqsEDtb+DUnavcF0rS/lc9Lm+cyKKEoOALW+oecq2m8HMzZa1VjE6BPj9
 nz47S4bizjpZuj+7jbdyjiro96cP47jkQAe2ZUexVea7Rr0srHZRs28hFu7G0649A+
 3Ixaz8UKkX4XoNdHHmncq6BB/TvhrzJrMVJJIau9+ngea1Vx008iEranyfwytSbh2a
 eFAb/bX9exRefxeP+uH48lfegmPh3+cqRu8RttW22G7eUjw+J+DdkhpubebzKUmXsA
 1gHYCXH8D/sXtErqzua8BXjxz3qCbiZ2wngLfdbNcDjmwiqCGdpTM4wVrKj15UJy71
 NmHRF3A6Rmvwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=VRj1vGgO
Subject: [Buildroot] [PATCH v2 5/8] utils/generate-cyclonedx: check for
 manufacturer URLs in non-lib package
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

Some lib packages have their BR2_PACKAGE_ entry in the non-lib package Config.in.
If no URL is found, fall back to looking for a BR2_PACKAGE_ entry in the non-lib
package. This fixes manufacturer URL lookup for the openssl and zlib packages.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 30 +++++++++++++++++++
 utils/generate-cyclonedx                      |  6 ++++
 2 files changed, 36 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index c5069bc29539..8e068c80f423 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -254,3 +254,33 @@ class TestGenerateCycloneDX(unittest.TestCase):
             component["manufacturer"],
             {"url": ["https://manufacturer.example/foo"]}
         )
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
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 6943d6bd83ee..22ade1fb82d6 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -342,6 +342,12 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
                                 "url": [ line ]
                             }
                         }
+
+    if pkgname.startswith("lib"):
+        non_lib_pkgdir = str(Path(pkgdir).with_name(pkgname[len("lib"):]))
+        if non_lib_pkgdir != pkgdir:
+            return cyclonedx_manufacturer(pkgname, non_lib_pkgdir)
+
     return {}
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
