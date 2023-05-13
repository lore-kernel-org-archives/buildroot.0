Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CBC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92ADF42E6E;
	Sat, 13 May 2023 10:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92ADF42E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZv66siNTksm; Sat, 13 May 2023 10:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5607B42E2A;
	Sat, 13 May 2023 10:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5607B42E2A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 475331BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213E584BCD
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213E584BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ykwI9uvy5bR for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:07:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B77084BC9
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B77084BC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 583B28645F; Sat, 13 May 2023 10:07:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 12:06:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 271745c37a044310e2c4a2142ace48f66914df2c
X-Git-Newrev: 8a2b772e8c421c139a4959998fc4ab05ea69d34a
X-Patchwork-Hint: ignore
Message-Id: <20230513100720.583B28645F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] br2-external: make the list of external
 trees public
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a2b772e8c421c139a4959998fc4ab05ea69d34a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the list of external trees is a private variable, but for
debugging or compliance, one may need to get that list.

Add a Kconfig option so that the list appears in the .config file, and
export the already existing .mk variable in the environment, so that
post-build or post-image scripts can use it.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/br2-external | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 2c33e6eacc..5815c6ded0 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -126,7 +126,7 @@ do_mk() {
         done
         printf '\n'
 
-        printf 'BR2_EXTERNAL_NAMES = \n'
+        printf 'export BR2_EXTERNAL_NAMES = \n'
         printf 'BR2_EXTERNAL_DIRS = \n'
         printf 'BR2_EXTERNAL_MKS = \n'
 
@@ -181,6 +181,14 @@ do_kconfig() {
 
     printf 'menu "External options"\n\n' >>"${outputdir}/.br2-external.in.menus"
 
+    {
+        printf 'config BR2_EXTERNAL_NAMES\n'
+        printf '\tstring\n'
+        # Use star-expansion: we really one a single arg.
+        printf '\tdefault "%s"\n' "${BR2_EXT_NAMES[*]}"
+        printf '\n'
+    } >>"${outputdir}/.br2-external.in.paths"
+
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
         eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
         eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
