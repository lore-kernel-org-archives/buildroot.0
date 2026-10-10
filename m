Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA9DCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269976071B;
	Sat, 10 Oct 2026 20:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgUbG777nEl0; Sat, 10 Oct 2026 20:26:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C9046074F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663962;
	b=C+9x/zwZmvEmyGVZ8Mo6rQyAkY+Daaem40Atji3qHbTgZr48I65RfJL+je+tV3lCNBFA
	 bgmh18sPdCSMOKvSEvJoBz53A3A3DmlpY70mKQRS9E/niNdZgce42jxNkRgfN3AxCOyAj
	 Xi+dWWwOgF+PDPcsgREXnLJB5+ZNWwbQlAIVNbvDeYcIqnhjNLQDyrPnpezRq96oGYyPf
	 BA5EEXTgyuNWks33TXLyV43eDJ7/NSDeMqMvwKBaN++oAi+lAE4fUk6kdzFKehFeiI7nA
	 LQ4p97v9O0pcUaNi6661x83tfFmVHRsZbahohUzSD7F+k7SDo4FT/HWD6DJi5T7sAsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ew2AGVE4Wy6Y+Two2dPxPX6oj5aWRqxbLrM3UZUMAMg=;
	b=gx6jV8PKpfShcWZqTgcB9maXOiZFpSrWcOkLrh0SHIg0UTaYlTcMiUkTeCAQBewzXigL
	 L6BWP5yeCwiJw+INWP7HYVv8ErBVV/vOzXle/wGgERdePs8srg2Dsjg43GLhvFig0EXB6
	 4T+k9pmhE2srPgXNIXXm69+SnCXALwVwJrogWfoW9NpiNmbYPFThUEhyOVBvg0yh1nr+d
	 pWJolh50IHho0VzAcj8+P2u3U4HHFo0AoMl8GhIEu0vuQq/54Mo61+UUFXmNTpBeOPngo
	 mn2G6NhkcNiUORYR2BM67Gi8Dtg6NJdbQ4Kty8rcmu/5A2oBO9dTcGlRcGGuteUSDiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663962;
	bh=Ew2AGVE4Wy6Y+Two2dPxPX6oj5aWRqxbLrM3UZUMAMg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AUnvOboJRvzVYpiJa8mkS4bO1+yMUpUvEFblbbBROfRnVmI9kiPdQQ+NuL6ozA8Fv
	 PXkjOmy51ssF87dV3F2Yo7IrNx7nke7Bch+sU5/PZeIoNB2LxZXtQ0uFTr99xPVdBr
	 4ES79ksCsz4qYV2sYfBYM9dpk3FjOaDuav01+k2P05p030uTAVhv6sl++W6arTXej7
	 XjERSVz9Y3u8LBQprgf3rl9C+0jZVpgBPwYiKJ1pXmx5jZ/6Pkx+QVbOYiH1xBSnT7
	 qgnAIooURR9e7j2/C/TsmJ07jbZamjPlsmz212uW6yIGsJz0c1H90fpMPiLF0Ujd9V
	 2oJJ6PnmY3xPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9046074F;
	Sat, 10 Oct 2026 20:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F258ADE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4DC56061D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DP430fEUUe7L for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AE4F60628
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=Yz7OYZxgkcb65yOAw/Pg30Rp0rSqMTHAMAETX+dIYYJPBNXHMYDyeNz9OsZjPerBrCNT
 JgBENzC5Nrxe0THVP9qRUJocORKBL8vB53aqe/UJTAUfeEVVMr2SfGS5KIfnYuzsbEHBk
 +98Pj23swjI013n9d61uqYM61aq14wcV3ivFmvzKUUOwcL6WQwghQfn5UK/bwLFMmOar0
 8UoSJJlaoL+f9vKV4sdiS5GZXXNwnM89jeLPNxzZC+SFMcKvIhcPxaN9lFD7Vsv/jIXG5
 scOebONmn/UP6XXfymfokb+/FTUQF6l/x+UUjPkzV/MjAYk6UW93ZAHv6kIdMCtHSAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cQER3yVkECujeYRPWl8jgNPo+l9ABzH8swnGDBmedW0=;
 b=Oei7YhMG1cpw/T3TnmfVhO8FW1ugCJnYCxFB4NEfZlK9eK82QwCn81RVm42Y0KQ3mTfj
 l5Qgo21caxYJR9q2q4vC6o9NoP63G2KpqBsM90CZAI9SnG4hQZtwTy+zJJZDpSHlIPDir
 BsHsyj9ekPFLXAlOeHPe4VuxXsfCcUv/zvGm6fKrDQpb6BJxcvAjCucKn8O02jQ4KA5fk
 difftyatDs9RDWIr6BRH3dl11M7KDvoW2hZxuSZ7mZaOxH/eT6RPe3WE8d0A4jAmU8H24
 MaN5a5ZjQc1olPTGmKrGX5XZR8cchvMes0iXb2Nyp3zzNKo+/CsKpzC1BaLPD3lKefQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE4F60628
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D302992241; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ba8e2869bdf86b3fa767a5e49897eb575988255
X-Git-Newrev: 504bb61bc68dabc6d0124901c8e5bec1aa93dc32
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.D302992241@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: support custom
 schema version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/504bb61bc68dabc6d0124901c8e5bec1aa93dc32
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
