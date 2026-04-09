Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C24E9DE65
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4899340CEB;
	Thu,  9 Apr 2026 08:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n42Qh8AFLaeX; Thu,  9 Apr 2026 08:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DAFD40CEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775722466;
	bh=xELSs75mSCH10I21HoQ8PXm+kO8brgOmFG3cOUBuRqU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZJHPwvZj3Gc5RtRekn8nRDNeaXLZZ1fNsaYE2yzdWWZFYmKGlyOcR2yQ8+yOZpda
	 N/VG0r0aA/UdhfeOPR283sctz6KN1B6UWexNooAQIchTNWKNrMz3iItJbfzotmi052
	 4Ch67VzCSUgHhTMBihaLdgPgHPkb7Z6mS9sq+ZPKLtWkuUMJs6mmKe6dUWQLFHY0s0
	 8j6zUYnSTkd3ax0CaRXk4l7gzgR+sReXnOGqEFlbxf6aXUVAqZenjDF+SMmcG16jiZ
	 PsuFUM8vf7CK/N2xPkC56FQruuDs56Rk8OYHjZ4dYSh7iTd4OmWMf0d+E3Nhd3gg4q
	 oCRtjw5euPyyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DAFD40CEC;
	Thu,  9 Apr 2026 08:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B9E4237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21CE360EFB
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAV_4WexdcUK for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EB99607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EB99607E0
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EB99607E0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 00E875A0005;
 Thu, 09 Apr 2026 10:14:20 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SvmnbTdDqTP; Thu,  9 Apr 2026 10:14:19 +0200 (CEST)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id EEEFE5A0006;
 Thu, 09 Apr 2026 10:14:17 +0200 (CEST)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  9 Apr 2026 10:13:57 +0200
Message-ID: <20260409081401.2060709-3-martin@strongswan.org>
In-Reply-To: <20260409081401.2060709-1-martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775722457;
 bh=ZP9EDgyKgEq/iW/PQPpC6fiHQtbVrTmOrlFdVsgQAAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CV01GH0CalhlZ7H+7H0NyjVOXPhzxT4q9rP7AHW+b99lJXTG8RfL7THFqzOM8iqJh
 BNjk/rUphurrlgUuwJE44z2Kc9bvEIZnGIJxmGvm3fFwGNU9nrsuHmuyfdX+laEdQO
 QK/1ioQH0PvWmm7oH1TxQALa+AMyBhXkYTYu/4hPZ43W5bU1Q7/tWMstCt6M69RXfX
 Qqe30fPj66J1s2LTriuBL1PdiHdz7Wqtejb/LKQ+GtQvA+UrVlkuWKMAUQiemr/UfU
 g0O722irZ1xNkZtvAQr10K8MwOTiAuqoljKM/gdMXnCtbCHuarW7wWs5xGgfNLTKqC
 WlHZx49k2yZzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=CV01GH0C
Subject: [Buildroot] [PATCH v4 2/6] utils/generate-cyclonedx: remove
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
Acked-By: Thomas Perale <thomas.perale@mind.be>
---
 .../tests/utils/test_generate_cyclonedx.py    |  3 +++
 utils/generate-cyclonedx                      | 21 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index bfe5eaf054cf..bf1b8e099bf9 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -129,6 +129,9 @@ class TestGenerateCycloneDX(unittest.TestCase):
         bar_deps = next(d for d in result["dependencies"] if d["ref"] == "package-bar")
         self.assertEqual(bar_deps["dependsOn"], ["package-foo"])
 
+        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
+        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
+
     def test_virtual(self):
         result = self._run_script(["--virtual"])
 
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 35198a47cfdd..f4d5afd847e5 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -385,6 +385,25 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
     return list(deps)
 
 
+def br2_root_deps(show_info_dict, virtual=False) -> list:
+    """Retrieve the list of direct dependencies of the root component.
+
+    This function returns all components that are not a dependency of any
+    other component.
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
@@ -447,7 +466,7 @@ def main():
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
