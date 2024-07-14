Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126DEC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAF74813B8;
	Sun, 14 Jul 2024 09:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dBQNJW-Xg7X; Sun, 14 Jul 2024 09:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6788681399
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6788681399;
	Sun, 14 Jul 2024 09:08:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8091BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2962140237
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWd175WvzFRC for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154F340186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 154F340186
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00A0186736; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:19:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0fbfe35219e63f69b1579b54694c20b16fb9a5c
X-Git-Newrev: f38e706a807d7f0fb9821f9760bd0f9fa13272a4
X-Patchwork-Hint: ignore
Message-Id: <20240714090821.00A0186736@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: pass post-process
 options to post-process helper
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f38e706a807d7f0fb9821f9760bd0f9fa13272a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we have no explicit, dedicated way to pass information to the
download post-process scripts, even though we do already need to pass
the path to the manifest when it is not the default, which we do with an
environment variable.

We'll soon need to be able to pass additional information to
post-process scripts, like instructing cargo to not use a lock file when
the package is not locked.

Extend the dl-wrapper with a new option with an argument, where the
argument will be passed as-is to the post-process script.

We explicitly do not document this new variable, as it is expected to
only be used in our package infrastructures (although there is currently
exactly one package that will directly need it, and we hope to drop that
in the future).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk      | 1 +
 support/download/dl-wrapper | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 06d2c9560e..0d84fc3773 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -186,6 +186,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 		$(call DOWNLOAD, \
 			$($(PKG)_MAIN_DOWNLOAD), \
 			$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)) \
+			$(patsubst %,-P '%',$($(PKG)_DOWNLOAD_POST_PROCESS_OPTS)) \
 		) \
 	)
 	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 239bdfa359..5445aad5a7 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -25,10 +25,10 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 main() {
     local OPT OPTARG
     local backend output large_file recurse quiet rc
-    local -a uris hfiles backend_opts
+    local -a uris hfiles backend_opts post_process_opts
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
+    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:P:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -42,6 +42,7 @@ main() {
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
         p)  post_process="${OPTARG}";;
+        P)  post_process_opts+=( "${OPTARG}" );;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -152,7 +153,8 @@ main() {
         if [ -n "${post_process}" ] ; then
             if ! "${OLDPWD}/support/download/${post_process}-post-process" \
                     -o "${tmpf}" \
-                    -n "${raw_base_name}"
+                    -n "${raw_base_name}" \
+                    "${post_process_opts[@]}"
             then
                 # cd back to keep path coherence
                 cd "${OLDPWD}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
