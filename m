Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A507CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D8C660749;
	Thu, 14 Aug 2025 19:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGG8_9AGQ0gY; Thu, 14 Aug 2025 19:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C9E6074E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C9E6074E;
	Thu, 14 Aug 2025 19:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 871A9228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0790B40476
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qL7mKrzzoV34 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4330B40475
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4330B40475
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40890875ED; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:25:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f65bbd34f8503a74a92673524c4c74166c8a4595
X-Git-Newrev: 2745db5d2a8ffbceb872656d9536a6c467f60078
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.40890875ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 add project name and version options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2745db5d2a8ffbceb872656d9536a6c467f60078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add options to customize the project name and version in the generated SBOM
metadata and set buildroot generate-cyclonedx as a tool in the metadata
section.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9cbbc477626c433fe78614de9474f8446b7e2389)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index d662f02527..34e5672a43 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -279,6 +279,10 @@ def main():
                         default=sys.stdout)
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
+    parser.add_argument("--project-name", type=str, default="buildroot",
+                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
+                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
 
     args = parser.parse_args()
 
@@ -299,11 +303,27 @@ def main():
         "specVersion": f"{CYCLONEDX_VERSION}",
         "metadata": {
             "component": {
-                "bom-ref": "buildroot",
-                "name": "buildroot",
+                "bom-ref": args.project_name,
+                "name": args.project_name,
+                "version": args.project_version,
                 "type": "firmware",
-                "version": f"{BR2_VERSION_FULL}",
             },
+            "tools": {
+                "components": [
+                    {
+                        "type": "application",
+                        "name": "Buildroot generate-cyclonedx",
+                        "version": f"{BR2_VERSION_FULL}",
+                        "licenses": [
+                            {
+                                "license": {
+                                    "id": "GPL-2.0"
+                                }
+                            }
+                        ]
+                    }
+                ],
+            }
         },
         "components": [
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
