Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1A1CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC7E60B5A;
	Fri, 16 Oct 2026 13:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Scw3NZLO11jm; Fri, 16 Oct 2026 13:09:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8F7E660EAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156179;
	b=OPeCFrJGKwpGu3E33UfRE/tsl8Yl1FK1GUFByWFWFT7wcjg/UqUe9uJJTOuXLGKhJPkM
	 uhdqNWPVH1tkklifwhArB2cX6MnqN/LFFKA3kwfieLl9N6JJ7nUcrDsSVoJcphwnaltCr
	 RPf+2hcMmifyjVxSp9c5VanA945OtYwT7nX+3up/BGeVEILGhdh6KtQUjlbodU/E+wa6A
	 FkdlKMOyIZm0o0esb5by3/e54d7+CU0vCkkIhDkrPfIz5Z3S9m8QUbIFOjuf5zbxNIo0l
	 mxf+mriimPF2H1Oyyyi6nCWW++Z7pUDp2BMULtvYRgDCYDe5TYFPsKOTeZmBOEvrXlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=j2wvxOjB4f+HFOai3pDHXV8Qi0kiCx27pjcAzdP5Vyg=;
	b=bQmobz9F77O8eUGv/lK4WDCjbIIgCeuE2uuDlTg9kP7F2ds51v2T3PvDcZYMCNYh//uz
	 DCaTjJIHMFuifbpW56GewpmaEIENH1qazn3d6yic4XG2KsXWSsANMy7Z8uRQKxFKc9x0e
	 zuaWN8TuxLUUUPkbi9/VTwrXFg+WBDaJMpu8e2KUZ0dmp1jP4TwY7p/7eWIktaBn5UN9C
	 rmukz/vP7DvFGr5+pyfN68aKbdPwhdMD6IFUywPLrnXtPU35js1z4BVAEEJr4Z/zovQkP
	 8yeidzoxnHjF5s3kXeKgdyJOT/W/R09DLVH+9RzF5gCLroziRjSYjMB9j38iX3UX0+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156179;
	bh=j2wvxOjB4f+HFOai3pDHXV8Qi0kiCx27pjcAzdP5Vyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a/GYdhgiJxxAz8bi8Lp91ttDn0nkezQZmmkuWnk5JbU2e+9hnEd8xAKopHW3M3NDe
	 l1OB9B51qJb6U5W6wT1p7qOhn9IBQLdpdAPOudBLpL7ZNICS6ECU7rvUMv8xOKv+ZH
	 jfkUAI7Ki1mugTi6irKrZW5C+76GwSylmPgmxQlYHKBTHFRiR23rQQNWyYjdre7c/5
	 HpcD+Wn9BfESLHVNklsUf4U2p1fC3XwciQDugauLe2pvGYHoddLnJpPe1W9cEdmD31
	 yVosLADed/DEWOa8HaaOE8b/RpPCWhucJ3u7MJ/6qG4h+D3XU65V7tEtMpiIDdEfCZ
	 0wn0T1+ipjrcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F7E660EAC;
	Fri, 16 Oct 2026 13:09:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CE3F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73421409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMwvcykvn0DA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9536D40A0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=KZW7ghSXKShRVBt/3ptcYUyX3fHrbSpTx28m3qJ+rIPMuQpYp7iG3ey7g7iwRCKmmJtO
 K9aGQkqTKWqeI6s7cTOPcuLudgFhzqKKGaoJ2hwAG5QGVUFmsIkoBP3QCSQ6zarr06uRh
 4SpFvdJ5KXQgIAeHoo2XZ3nZkbt/BK4rKyUhofCtxWJFW0hLhWhH7BRMbs98O4hoEbOvF
 S5l99ZoWRH/g7t0hKyVohNO4BpvtBjZ6su/Z5QCoDbQeEZLd4r1iJKOph21NaQSiv1uPe
 JYTPO6Wn5PcTlvRA9uy6HcIHK6Fh8+9iuMZ+PA1pGaMUb3gW2JfGCH2Pl6SUCxaji0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YhIC1Q8QenPZRU3666LWrguJ3dYqSx6FR4LKtPH//Ew=;
 b=sYbVnIpFHD/l0JlAJCYOIyzfvoi43pOrCizXdNSHBPWJc4Lb4zHzWOrbtF+Ny0RI30wV
 qZryVhreeAixb3qmJ4usMWVQgueSjnMgAVlaqoF1+unPCQITjxc7Qo4tECtPbkqAY7d67
 OxfWXXdy9AAJqOTfUUrvbbCyEZQdG65Nd30RgaMUFt/KmIYdVSFVAzawM17C6X5CTzrs1
 K8+yOH4+WoAernPyOl22SXQySs+BQOPhdiGHr/XgmGt6UbzwJYeUPxntuKZRtcqLRLXfE
 nD3wYMdTf1hcHkHwFplHnTl08K7jvPi1zrfLodg9zmUEedclJxWZNLAoJnAxwOIbzVw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9536D40A0D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86726960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 15eb5bac0faadf925edfe5d7fcb0f0382f6c4fc0
X-Git-Newrev: a9e15cd08a7e1075d824ba7a70cd97e59dd133b0
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.86726960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 support custom schema version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5876021354978081736=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5876021354978081736==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9e15cd08a7e1075d824ba7a70cd97e59dd133b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Support using minor revision for CycloneDX 1.6 by passing the version
from the command line. Currently supported:

- 1.6
- 1.6.1 [1]
- 1.6.2 (default) [2]

This is used to fetch the latest SPDX license list available upstream.

[1] https://github.com/CycloneDX/specification/releases/tag/1.6.1
[2] https://github.com/CycloneDX/specification/releases/tag/1.6.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout: also rename the SPDX schema in the test]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 504bb61bc68dabc6d0124901c8e5bec1aa93dc32)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/tests/utils/test_generate_cyclonedx.py |  2 +-
 utils/generate-cyclonedx                               | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index b91add2349..4ecd90e347 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -21,7 +21,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
 
         cyclonedx_dir = Path(self.schema_dir.name) / "cyclonedx"
         cyclonedx_dir.mkdir(parents=True)
-        schema_path = cyclonedx_dir / "spdx-1.6.schema.json"
+        schema_path = cyclonedx_dir / "spdx-1.6.2.schema.json"
         schema_path.write_text(json.dumps({"enum": SCHEMA_LICENSES}))
 
         self.env = os.environ.copy()
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 290c3f96e5..a60c8e9526 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -22,7 +22,7 @@ import sys
 import re
 
 
-CYCLONEDX_VERSION = "1.6"
+DEFAULT_CYCLONEDX_VERSION = "1.6.2"
 
 brpath = Path(__file__).parent.parent
 
@@ -538,6 +538,9 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
+                        choices=["1.6", "1.6.1", "1.6.2"],
+                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
 
@@ -545,7 +548,7 @@ def main():
         parser.print_help()
         sys.exit(1)
 
-    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(args.cdx_version))
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
@@ -553,10 +556,11 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-        "specVersion": f"{CYCLONEDX_VERSION}",
+        "$schema": f"http://cyclonedx.org/schema/bom-{cdx_spec_version}.schema.json",
+        "specVersion": cdx_spec_version,
         "metadata": {
             "component": {
                 "bom-ref": args.project_name,

--===============5876021354978081736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5876021354978081736==--
