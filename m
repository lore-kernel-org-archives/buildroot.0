Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60180106B539
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5300261376;
	Wed, 25 Mar 2026 13:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5HhaV7Beq-u; Wed, 25 Mar 2026 13:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11B826136C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774445637;
	bh=O37uHSBxuD52zgxnU8Vku2AXg3kBKETQ4TNuRF96Hqo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jxo8ubijjkW0w11LrrSvrCSXWvlw/i2ecx4HCF80r60HQifzN0gMzG1Zhnm7aQG76
	 RQaOtafSKATa0YzhBwtcmbQ/fzufJwJLqc+udTsYaLlaYgEYOap11qLmcrLUijYcOm
	 on9ak4sINIuRHonmqcTdVDWhKp5NFyAmSDcIcEFoYcqAHOt/rFmuXd6TdjO+UeO9BY
	 h8S5hq4esrTfr8RqemW+9GSaxIFWHgfWzmozhn7mTiD/z8kh6k2jXUINzsacRz4YAA
	 QZNVuIT7inW/N8vaWYP1txfopcJlIJOgSRGDUUx7f4KbcQBCPEXm9DEM/3q5Zs9aHs
	 jjsuptgXeKilA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11B826136C;
	Wed, 25 Mar 2026 13:33:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC72F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1304B41190
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V605j5vTUtB6 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C03EC41116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03EC41116
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C03EC41116
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 71CE95A0003;
 Wed, 25 Mar 2026 14:33:48 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5k_v6q4JU_Q; Wed, 25 Mar 2026 14:33:47 +0100 (CET)
Received: from zbook.home (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 33A715A0004;
 Wed, 25 Mar 2026 14:33:46 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 25 Mar 2026 14:33:40 +0100
Message-ID: <20260325133343.1008245-3-martin@strongswan.org>
In-Reply-To: <20260325133343.1008245-1-martin@strongswan.org>
References: <20260325133343.1008245-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1774445626;
 bh=gxSAMouLf155N2FhJR5qwjpq6XNLUyY8J3wCpAwPhBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NUGAlaKcJSipmGRQNkPK/g4NnmqL78h4u/SGE4UsfBHhJvNTkTVEEkSBHYxUlJicN
 Ha2voQSbeh/8pygNVgNviLgHEdOt+ahRQr8BHvKBLt3HHevlMIT2JkYv+7h+grB7Tp
 WFQnZnXPWGsodCqvNfIUATXCl+LzL8NClI6vs+GzVwZQ9OCTkRX65VNSGlxCl7nZOH
 2SLM8yW+t/Cg0FhzKAcnhn7QmXYAvIeUSlec7FUI1VbvT5gvzyS82PqkhOi0W8tEWu
 G7A/2jMWxbz/dG+ljZjzfc/bhEtfcWDT1o+oAi/T5YpwA/xx0+ge0UfD+ntnQeFk9r
 N1BJtratKvgUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=NUGAlaKc
Subject: [Buildroot] [PATCH v3 2/5] utils/generate-cyclonedx: remove
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
index 20f67b48a7a8..9b041ffb61fb 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -126,6 +126,9 @@ class TestGenerateCycloneDX(unittest.TestCase):
         foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
         self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
 
+        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
+        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
+
     def test_virtual(self):
         result = self._run_script(["--virtual"])
 
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 35198a47cfdd..70abd7af7c89 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -385,6 +385,22 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
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
@@ -447,7 +463,7 @@ def main():
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
