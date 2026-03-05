Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E22F30950
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F4318209B;
	Thu,  5 Mar 2026 11:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DDz5BfENx9n; Thu,  5 Mar 2026 11:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 937848207D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711676;
	bh=FUMdwAUpq1h/iIkEfFZ0y+pa5tCP4oaG0yr4hULwQwM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWhypiQwHcK+5zU0DCHCmB774MiXOb/o2R6Dhe2sMMkasmxo7eQqACU1dVZL0K41I
	 tvFpAYSIL4BeEHlVJ5oo27Dxgt1kYZmv2hFatlBqGNuBSxJB6xXW8mYXb0fxwkBCkT
	 diaxNQNE6dCZ1iVrl7hlMnl7EWGmz6ZZyE/bLYK1N64oByRmKBz5eAx3/GhTQq1Q/a
	 FBwM09nYGLBk4l9I/bMc/5iR4Ps13RZPtnfekLX5d9lbXM3oDqws2X4xJeNczCMna6
	 N4iTYljO4QGVWaVKrMqSl/4MGkGL8GHbNGu+6E3NnP77ii3w3eueby+Kep8gkjCuQF
	 ZGOlTpgaxY+gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 937848207D;
	Thu,  5 Mar 2026 11:54:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4691225B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3748240B81
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAQ9NShh3VNM for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76DCB40945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76DCB40945
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76DCB40945
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2F8525A0004;
 Thu, 05 Mar 2026 12:54:28 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONqZ6HN03KMp; Thu,  5 Mar 2026 12:54:27 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 82A785A000B;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:12 +0100
Message-ID: <20260305115413.1860514-7-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=twIohclOM5qX8cjee7ESP6bOJXNsoWIQiiadDVE5+TU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xTa7Y7cwVWgCoXlhXfNo13ABuAEhCHKObBNUR8IbNtgVVwK5TNqRIoDGLFDRMeQos
 Bb1V1Bj35wNhtmAtl8YzfznFd5MwEgEk39JaNeHWNMAziD0Qeok7DQiOlTTzzRVxQY
 MFgKLSkAC9fZgsWFBl53A2zVAauETlVGu7lTHYVk9XiiN15obZaZM3xSx9WncNYzbW
 zsUDfSF0Q4esmw8cFv4IZFFInnrN2fY10yMBNG7c6lXWudO3d7wH+c9VZGbVhO/4FH
 j5xjq9kWVCeloSIXj4iCQtaOYYO0de/T3n/CvrDvBjVTG7JOoqqvseK/bOWi91WLad
 NeOycy2W+Csvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=xTa7Y7cw
Subject: [Buildroot] [PATCH v2 6/7] utils/generate-cyclonedx: allow
 filtering host packages from SBOM
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

Including build dependencies in SBOMs can be useful, but some use cases prefer
excluding them. Add --no-host to exclude host packages from the generated
CycloneDX SBOM. Host packages are filtered via the type property from the
show-info output, with the exception of toolchain packages identified by their
prefix.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 .../testing/tests/utils/test_generate_cyclonedx.py    | 11 +++++++++++
 utils/generate-cyclonedx                              |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index b6de19e4bc83..cf0561040fc9 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -184,3 +184,14 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertIn("package-foo", names)
         self.assertIn("package-bar", names)
         self.assertNotIn("skeleton-baz", names)
+
+        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
+        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
+
+    def test_no_host(self):
+        result = self._run_script(["--no-host"])
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertIn("package-foo", names)
+        self.assertIn("package-bar", names)
+        self.assertNotIn("host-tool", names)
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 97fd80357f4c..576580c13bad 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -479,6 +479,8 @@ def main():
                         help="Patch diff mode (default:'inline')")
     parser.add_argument("--no-skeleton", default=False, action='store_true',
                         help="Excludes skeleton packages from the CycloneDX output")
+    parser.add_argument("--no-host", default=False, action='store_true',
+                        help="Excludes host packages from the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -494,6 +496,8 @@ def main():
 
     if args.no_skeleton:
         filter_packages(show_info_dict, lambda name, _: name.startswith("skeleton-"))
+    if args.no_host:
+        filter_packages(show_info_dict, lambda name, comp: comp["type"] == "host" or name.startswith("toolchain-"))
 
     # Remove rootfs and virtual packages if not explicitly included
     # from the cli arguments
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
