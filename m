Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3241EF30950
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E30158219F;
	Thu,  5 Mar 2026 11:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9kmrlA04IhS; Thu,  5 Mar 2026 11:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D7A82144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711898;
	bh=quqGtPeUpyAwOZOaDPbU4KD08ZRWBKOxm9ArVnvJ9tQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNGamFDXCVXKQ3BqHoGUqobkQ/j5WrnCN6Qn8ZVFsZn/ifQ2/9PuZ79dz7KlCY8q2
	 qGyf2tJMkjEO/nK0ChBrisYaZkVp4o5mJdc1j9Juy23QmU3g7ALScsQQeqBSJbQUCj
	 0Zyj3/lzJoiYff1gWY8i21UlGQixfzVUTxh6/2HC3CPccM7ryVYNGTVFsPy1b7yihj
	 P39Jpw6bb3DqkDmmOwP/ASIDFv4wDMSL7iPAzDIYX8OorMwABA8yrDkt6ceQDqUv2v
	 tdEkrDErH27ACJgvBbc23QOtXvnPfqiKoysjQoThdNDSK+Q/FIoXDT2usrRSl1DH7L
	 F2AULmIUz17NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09D7A82144;
	Thu,  5 Mar 2026 11:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3D1223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 895C840945
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQA1OqH3AzmW for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46906408C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46906408C7
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46906408C7
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 9B3F85A0007;
 Thu, 05 Mar 2026 12:58:10 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4y33gPhbFXrh; Thu,  5 Mar 2026 12:58:09 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id C3A6C5A000A;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:50 +0100
Message-ID: <20260305115752.1861153-7-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=kiqmnKrl5KhiOQiiFGzTDVi8YClHYrOMtYms+pxRsL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZbUQZDOF2sf5xxco96XG3qpY/qM7peY9yxvYsQe8HZRONGZ8zObgx8UwveXTKijZj
 ajZwYEZ60jvdaWZvKgJR460PbFDdc1WFJfP/C58aIKmRM7neWEidtwBBCLi2dgEks+
 JhAp9QRucAEdvXCeXpT/9kJm263XSAbj5osy9MsSG64f7DKiNr+AOJ7jmYH8agR2PF
 7WRFOErvcTnckUUVzklJjKPpPPVTR4leuRW5kB4kVN01ABvApOcPpRqdC1SCFvAOYf
 GqFzs/asnHEmmvVq6UwzoaASh+5F03Mi6T0DArqwHtBQCYHG5iwPy/prnjpcwCVrVI
 qquRM/1l7QkGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=ZbUQZDOF
Subject: [Buildroot] [PATCH v2 6/8] utils/generate-cyclonedx: find
 manufacturer URL under *_TARGET symbols
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

Some host-focused packages installed to the target have a BR2_PACKAGE_*_TARGET
symbol containing the manufacturer URL, so fall back to such a symbol in the
package's Config.in. This fixes manufacturer URL lookup for binutils.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py    | 29 +++++++++++++++++++
 utils/generate-cyclonedx                      |  3 ++
 2 files changed, 32 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 8e068c80f423..eb3132d65775 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -284,3 +284,32 @@ class TestGenerateCycloneDX(unittest.TestCase):
             component["manufacturer"],
             {"url": ["https://manufacturer.example/libacme"]}
         )
+
+    def test_comp_manu_target(self):
+        with tempfile.TemporaryDirectory() as tmpdir:
+            pkg_dir = Path(tmpdir) / "package" / "binutils"
+            pkg_dir.mkdir(parents=True, exist_ok=True)
+            (pkg_dir / "Config.in").write_text(
+                "config BR2_PACKAGE_BINUTILS_TARGET\n"
+                "    bool \"binutils target\"\n"
+                "    help Manufacturer URL\n"
+                "    https://manufacturer.example/binutils-target\n\n"
+            )
+            show_info = {
+                "binutils": {
+                    "name": "binutils",
+                    "version": "2.0",
+                    "type": "target",
+                    "virtual": False,
+                    "licenses": "MIT",
+                    "package_dir": str(pkg_dir),
+                    "dependencies": [],
+                },
+            }
+            result = self._run_script(show_info=show_info)
+
+        component = self._find_component(result, "binutils")
+        self.assertEqual(
+            component["manufacturer"],
+            {"url": ["https://manufacturer.example/binutils-target"]}
+        )
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 22ade1fb82d6..93c7b5b28b92 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -348,6 +348,9 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
         if non_lib_pkgdir != pkgdir:
             return cyclonedx_manufacturer(pkgname, non_lib_pkgdir)
 
+    if not pkgname.endswith("-target"):
+        return cyclonedx_manufacturer(f"{pkgname}-target", pkgdir)
+
     return {}
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
