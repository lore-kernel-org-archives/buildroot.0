Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52538E9DE66
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FCE41095;
	Thu,  9 Apr 2026 08:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPb9Ie_soJMQ; Thu,  9 Apr 2026 08:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 717234108B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775722476;
	bh=LOAG9Vutpu+JAn+l8nhtcXKaIY3Ij1XLoARUByXqP+Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxkefK+Utpsf808AxfqgKjVEbyqLQbbhthEaNBaA2W4uaDp4lgjcO5zUnef864VfC
	 kvpoQIvWYki4onc5nEj353qFt7UY4/iUM4mkhnUdbW2dasKI1wu8K1a2WR9Pc6NExD
	 a/6d2qilCSf8NhnUJHPNe9hRDlMYhq0G7OZcL11wxzt5mbF26+hqLqnG6uv4qbqoPk
	 i1FQk80vXxdFwMejzdBNTjs4CLnkeRDjgblZqZaDAtx5r+hsKtQPPtmhfJoGyXOpAM
	 sUWBY1ZgSmkApbrRjJMfND951YpithXess+CfXBPErm3afMkm3bhs7nq9Zai/pc+ZV
	 TdTDggEgBMPnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717234108B;
	Thu,  9 Apr 2026 08:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FABB1D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0158182726
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGFDg7NSJs_z for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A4758254A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A4758254A
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A4758254A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id CC3A25A0009;
 Thu, 09 Apr 2026 10:14:22 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rfjj8BEnfQGl; Thu,  9 Apr 2026 10:14:21 +0200 (CEST)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 2116A5A000A;
 Thu, 09 Apr 2026 10:14:18 +0200 (CEST)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  9 Apr 2026 10:14:01 +0200
Message-ID: <20260409081401.2060709-7-martin@strongswan.org>
In-Reply-To: <20260409081401.2060709-1-martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775722458;
 bh=V9sn0a/le4/vrYMMq8wy9/V5VX0paIycQzrEI/EJ6f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CvaR2Ea3P7vqhDsJVxHQQCo/ZR6wsoXrIVYxkkYubth+NuPLmJSaIRkegvzcRk9Ub
 uenyHXYajdovX0N1EhhAORfLhAw9ZNFcPlvxxhWxqsfqdWhaJqReTIeC+pDQmRhpkC
 Iv3eKl2yyF86U9vrDZYyIMesf8czfavvVu35J0R+HvagTlzjsPoqnxv+4WAm+3SIL0
 sgJ7dOXYeRAC/lDnumt/g/qCYDPchDJju/p0ddEXDkJ+k9I6C5lJnEYt5XmVLgdgEW
 gaDOaW7z4U2Y1eibWYs//ymwID+aULI4SiVwGeuAZG2YSesRV0sac8LU5bqOPV8uGl
 9VLaHwQ/n3Gcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=CvaR2Ea3
Subject: [Buildroot] [PATCH v4 6/6] utils/generate-cyclonedx: generate vcs
 externalReferences for source repos
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

Some packages do not have a http/https download URL for a source tarball,
but are acquired over a version control system like git. If so, add
externalReferences of type "vcs" for such URLs.

As most git repositories use a https:// transport that may not indicated the
repository type, add a "comment" due to the lack of a better mechanism in
CycloneDX.

While the hashes are calculated over a tarball created locally, it still may
be useful, so add them for "vcs" externalReferences as well.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 30 ++++++++++++++++++-
 utils/generate-cyclonedx                      |  8 +++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 84f94f050760..77690b1b98bc 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -147,6 +147,8 @@ class TestGenerateCycloneDX(unittest.TestCase):
             {
                 "source": "foo-1.2.tar.gz",
                 "uris": [
+                    "git+git://git.example.org/foo",
+                    "svn+https://svn.example.org/foo",
                     "https+https://sources.buildroot.net/foo",
                     "http|https+https://mirror.example.org/foo",
                 ],
@@ -160,10 +162,20 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertEqual(
             foo["externalReferences"],
             [
+                {
+                    "type": "vcs",
+                    "url": "git://git.example.org/foo",
+                    "comment": "git repository",
+                },
+                {
+                    "type": "vcs",
+                    "url": "https://svn.example.org/foo",
+                    "comment": "svn repository",
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
-                },
+                }
             ],
         )
 
@@ -183,6 +195,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 {
                     "source": "foo-1.2.tar.gz",
                     "uris": [
+                        "git+git://git.example.org/foo",
                         "http|https+https://mirror.example.org/foo",
                     ],
                 },
@@ -194,6 +207,21 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertEqual(
             foo["externalReferences"],
             [
+                {
+                    "type": "vcs",
+                    "url": "git://git.example.org/foo",
+                    "comment": "git repository",
+                    "hashes": [
+                        {
+                            "alg": "SHA-256",
+                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
+                        },
+                        {
+                            "alg": "SHA-1",
+                            "content": "2222222222222222222222222222222222222222",
+                        },
+                    ]
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 382d91ce55af..4166abd9ff04 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -325,6 +325,7 @@ def cyclonedx_external_refs(comp):
         dict: External reference information in CycloneDX format, or empty dict
     """
     SOURCE_DIST_SCHEMES = {"http", "https"}
+    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
 
     refs = []
     for download in comp.get("downloads", []):
@@ -336,6 +337,13 @@ def cyclonedx_external_refs(comp):
                     "url": f"{uri}/{source}",
                     **cyclonedx_source_hashes(comp, source),
                 })
+            elif set(schemes) & VCS_SCHEMES:
+                refs.append({
+                    "type": "vcs",
+                    "url": uri,
+                    "comment": f"{schemes[0]} repository",
+                    **cyclonedx_source_hashes(comp, source),
+                })
     if refs:
         return {"externalReferences": refs}
     return {}
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
