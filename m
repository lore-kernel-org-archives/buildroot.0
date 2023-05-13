Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E637EC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8145C42E04;
	Sat, 13 May 2023 10:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8145C42E04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTT1Q4Tujz0Q; Sat, 13 May 2023 10:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53BFB42E44;
	Sat, 13 May 2023 10:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53BFB42E44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52C8F1BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A4184012B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A4184012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADlENBNN5xgL for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:07:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 724B0400AB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 724B0400AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60EF886461; Sat, 13 May 2023 10:07:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 12:06:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a2b772e8c421c139a4959998fc4ab05ea69d34a
X-Git-Newrev: 9ae089e2e93e26cc59b6aaee1760d43ee8e98889
X-Patchwork-Hint: ignore
Message-Id: <20230513100720.60EF886461@busybox.osuosl.org>
Subject: [Buildroot] [git commit] br2-external: make version of external
 trees available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ae089e2e93e26cc59b6aaee1760d43ee8e98889
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For various reasons, like debugging or compliance, it is important to
identify what br2-external trees versions were used for a specific
build.

Add a Kconfig option that contains the version as computed by
support/scripts/setlocalversion; this will appear in the .config file
(but not in defconfig files, which is what we want).

Also generate that variable on the .mk side, so that it gets properly
exported in the environment, for post-build of post-iamge scripts to use
as they see fit (like, ensuring there is no dirtyness when in a CI for
example).

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/br2-external | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 5815c6ded0..8aea479d20 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -66,7 +66,7 @@ do_validate() {
 
 do_validate_one() {
     local br2_ext="${1}"
-    local br2_name br2_desc n d
+    local br2_name br2_desc br2_ver n d
 
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
@@ -104,8 +104,10 @@ do_validate_one() {
 
     # Register this br2-external tree, use an absolute canonical path
     br2_ext="$( cd "${br2_ext}"; pwd )"
+    br2_ver="$( support/scripts/setlocalversion "${br2_ext}" )"
     BR2_EXT_NAMES+=( "${br2_name}" )
     eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
+    eval BR2_EXT_VERS_${br2_name}="\"\${br2_ver}\""
     eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
 }
 
@@ -113,7 +115,7 @@ do_validate_one() {
 # for the br2-external tree
 do_mk() {
     local outputdir="${1}"
-    local br2_name br2_desc br2_ext
+    local br2_name br2_desc br2_ext br2_ver
 
     {
         printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
@@ -139,12 +141,14 @@ do_mk() {
         for br2_name in "${BR2_EXT_NAMES[@]}"; do
             eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
             eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+            eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
             printf '\n'
             printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
             printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
             printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
             printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
             printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
+            printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
         done
     } >"${outputdir}/.br2-external.mk"
 }
@@ -152,7 +156,7 @@ do_mk() {
 # Generate the kconfig snippets for the br2-external tree.
 do_kconfig() {
     local outputdir="${1}"
-    local br2_name br2_desc br2_ext br2
+    local br2_name br2_desc br2_ext br2_ver br2
     local -a items
 
     items=(
@@ -192,11 +196,15 @@ do_kconfig() {
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
         eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
         eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+        eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
 
         {
             printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
             printf '\tstring\n'
             printf '\tdefault "%s"\n' "${br2_ext}"
+            printf 'config BR2_EXTERNAL_%s_VERSION\n' "${br2_name}"
+            printf '\tstring\n'
+            printf '\tdefault "%s"\n' "${br2_ver}"
             printf '\n'
         } >>"${outputdir}/.br2-external.in.paths"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
