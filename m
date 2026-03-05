Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5AAF30951
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD5581F1A;
	Thu,  5 Mar 2026 11:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbn2CB2Wc1MF; Thu,  5 Mar 2026 11:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1737C81EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711672;
	bh=PQKLw8wZF1Jcex7dW2Q9D0ByIcz0+QPy0X9IjmXSnoc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/vqCV2iOARlujDBDt33yz1HzzkONI0GBeCuCZdqKUFkehgdtFNNWRc6Pgo/8CqkK
	 ftnwFPmISWT912Pm7gC6m8yZrDf90HlFhVo+L19X5XVEuGdoI+1aCcxmDQvOGRpLwv
	 p9ks59ff9gq5ixbERDY+3/QeNdDBEB6Fh/zJcSMLwJzwDmZPO5ILJf1+W7UaFLNJGq
	 gLvYdbqtaHkwn8VcdH2DMtXevcwbRV3uguRo9y+mSdSOX33x0CGAUn3CFmiRR8USoI
	 5ODjwBamg4p9EGj67jm1uwVPOuxtK177EW30rYahVT97EhyFYUn2/QpxN3Q2GtMn2Y
	 p5HgeJP/0QgGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1737C81EC0;
	Thu,  5 Mar 2026 11:54:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3192C223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2386E60B08
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxdybvnF2gN7 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3315360B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3315360B04
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3315360B04
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id F2E8A5A0005;
 Thu, 05 Mar 2026 12:54:23 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT9rPyMKK9Dx; Thu,  5 Mar 2026 12:54:22 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 6013D5A0007;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:08 +0100
Message-ID: <20260305115413.1860514-3-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=HwfdC8sG3x7L4vsvRMtxLolPbQ9i+78o7hRYuwEPaBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DRAQexace+qpgiDTGYNYX7yrCLXkjMzBzy2dy1cqRwci1qclo/8k1AJ8XGvPtWY2m
 NpgndpvGMw49YhFdUIIJJiuALP7+TLKaTkZ0CPb5NC/rfrzi8TgU3UQhXCRQE8FKpm
 3aViA2bMIjRR5T6sFAUdUr13vb7V+a0afu+96b6EMqZROakXV/kxKtvkNkWdcwBsz8
 KpyLLuHsD7/D4uzTawGF1MSUjPhHcbd+e4bEa+5uSo/ipbqNfqAkObB43MP+xGlL53
 IYT1kCn1dFZSaZCLyuO88Khs9VSB0j0oA3MMqUYHRvyZ8b8cy2OFmy8+2AYMgR4nvd
 bVJx4W75WZ7sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=DRAQexac
Subject: [Buildroot] [PATCH v2 2/7] utils/generate-cyclonedx: remove
 indirect dependencies from root component
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

Commit dc4af8bfa979 ("utils/generate-cyclonedx: use direct dependencies")
removes indirect dependencies from any listed component, as required by
CycloneDX. The root component, however, still includes indirect dependencies,
as it just takes the components from the show-info output.

Fix this by collecting all component dependencies, and then filter the root
component dependencies to include direct dependencies only.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../tests/utils/test_generate_cyclonedx.py     |  3 +++
 utils/generate-cyclonedx                       | 18 +++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 8baa4acce183..1ebc938f943f 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -129,6 +129,9 @@ class TestGenerateCycloneDX(unittest.TestCase):
         foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
         self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
 
+        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
+        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
+
     def test_virtual(self):
         result = self._run_script(["--virtual"])
 
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3cf..ac6fea91804b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -381,6 +381,22 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
     return list(deps)
 
 
+def br2_root_deps(show_info_dict, virtual=False) -> list:
+    """Retrieve the list of direct dependencies of the root component.
+
+    Args:
+        show_info_dict (dict): The JSON output of the show-info command.
+        virtual (bool): Whether to resolve virtual dependencies to their providers.
+
+    Returns:
+        list: List of direct dependencies of the root component.
+    """
+    indirect = set()
+    for ref in show_info_dict:
+        indirect.update(br2_parse_deps(ref, show_info_dict, virtual))
+    return [ref for ref in show_info_dict if ref not in indirect]
+
+
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
@@ -443,7 +459,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
+            cyclonedx_dependency(args.project_name, br2_root_deps(filtered_show_info_dict, args.virtual)),
             *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
