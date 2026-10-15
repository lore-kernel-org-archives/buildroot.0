Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A18CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5161B60F61;
	Fri, 16 Oct 2026 13:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqikkpaeFO3t; Fri, 16 Oct 2026 13:13:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 344D5613E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156435;
	b=ZjOKR7IdPoxU1GKn+ZOoX16145gKh1nIttfHHk0upHwPzuKg9YaweH6GC2NkLbC0i5gv
	 RUyBQ+fFRuWtciuv52BgKJPzHrE2WIY0MthBDjHBF/w0ZnT+AAyD5GOF/w9xfmT1ae3Bn
	 BRqRSeUxIwdeVy1ULBOy/x/F6hRD/vyQZR9CM67OPnOdE8ODKeT8hJWnTMIb1kGzwwjmC
	 H+4YVvnLZ/qlkfOS6cxxASqSOb28wvbvpLSBczAAqdFAZGAxf7lIlCgTqRly+MKrlMHhk
	 sepJL5pHx9X+Wn7luhkmYcmnYIh+CQo08ClQnxyx63nNQOXeXVGlHYGpuYmJlyDW4Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156435;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ikOUeKVDZLWAi1Qi6Re7kRnRVMaWD2HO5HVCt5cQY1w=;
	b=O3Zl4f5BEUnR5Ga9+QuKSK1IXxxVRsEJ6YXK5GX8HS3X7GXBEB/SP3PhKYs/pF7By/58
	 WjxuKIyj3ZK4tAlyHqtvG0o5NfP2XkSrBCKZwYzKhHfpv6zj6kC/ifEeyBS8kj+GE5QFf
	 QVf2l49e/hEfFiiJcNDRLBoJ+vfiHW543P/iEToxPfz2sai6WeocE2t77t30HKcIGgSca
	 hrzmoLi6dhPydcKxlh7VpBvRNAQo54nTJ1FXyplOCJtBKbP3WpMbfZGv/51Da3NTlpry9
	 c/QzsvXOvbtt6zyTHusGd/d1jauYgoO5PHkp+ObHnnqpyAGoPq0SvijJkzKHEZZAdpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156435;
	bh=ikOUeKVDZLWAi1Qi6Re7kRnRVMaWD2HO5HVCt5cQY1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dhBw28bOKlgKEz4i2G/z632llbLXnpUjonbgGWN6qUSIqfuMigXJdWvZUpYHF1d8b
	 bMosKqtgX0WRf/9oumgnihJeZn9NEqNc83ZzuZv5neoIyt5ko4iuJsNcp1KtOjTdmO
	 MIwa4YiuhFmSQGBDLU3K5jzQiiNKgDfTsyj0aMhNXm/JD+wNvG2npSeAaWLru42L2D
	 nEbADo4F4xquANUhGLvBG83ni4KXcrGpqugDJUnLrIr5ft7NO+iadt8J0pDPikTxOJ
	 VV6EmpIjMfoq7p/d+559DycydSaVgcI5n19eWdQGfyybCFiiDNQZbYSWfleNuNcOf3
	 kGb+9h+FYAmgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344D5613E9;
	Fri, 16 Oct 2026 13:13:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFE78151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D95BC60F23
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wl4slmEmW9Gf for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 91CD760F44
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=AOAw5+7mrKgldu9WqQXsWS+1X+ndLBlZCESbTYDX48Rdahc3QtrLxARH9MdtLXGy2Ud5
 vqLiLx8m+Cs0cD4el4IG46sdHZaIRMu4V26+HpWODLBwGWYReSFeafs+YnvpKOUqib9yO
 +lNFDGM1z1jBBY2U6mOAtf33jrCxhqr7hQP5NcBpQ+sGlA9clDgidDkrxAQc3uJ5MLSjg
 LZhB4sDEqKtbMfhIP8c9XtIy3WyJgZzVHminpBWDvQugFtgsOPz2FmW6uZwwuBQypdn51
 SwxTPsJ9S+Ay3H+Q39MmQdYyTd6/zgK1KNuVqexR9PVomg+V/ND41Sp9DDdLdvRIB7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cVAeM8y7G7Ips+MSNEvNYKb3acdoXWMmA+/6FtzaD7Q=;
 b=TTzD2oovtmf7+3EsT/P0S/NZyftp5qVsUjOhpNoFYWE9VszVAkiDFIdD5m8BEdqJUtBh
 XFXcqrUlkNQ8kgzAi70av7U2ZOoCSs9HSuGG10Vb33hfqxntawTo+i2lqh3dAt4nICd0C
 lTYS9ajogFFRTpjjFYPj9vVin3OYw5wE6x0bZfgtIt9513i+3odzZRvlG5eXoIWCHDJBK
 2rgy8or2ndglh0b2R6/oYTzVdkhYn4OfBGQlgQCHnyIUm6CXVRNFx3ISEObvHhQFMV9SM
 j99vOrU74HfBMdsMk6QiVuDixSb2Bx4WQiHn1Xy/kunwt23UmoTe3zzOxXws95m4RiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91CD760F44
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81DF6960DA; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:19 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 26330fc1552635a5340d3cc755008a03e3ce02af
X-Git-Newrev: 1054e4fc0e97c30319bf38ac39a63944915de3c2
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.81DF6960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7606990180632299863=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7606990180632299863==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1054e4fc0e97c30319bf38ac39a63944915de3c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============7606990180632299863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7606990180632299863==--
