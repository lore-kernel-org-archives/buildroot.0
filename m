Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CCDC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBBBA80C7A;
	Sun, 14 Jul 2024 09:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbuJzo0o8sX4; Sun, 14 Jul 2024 09:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DE980B4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DE980B4E;
	Sun, 14 Jul 2024 09:08:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 263501BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7334680B28
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddoKFhgCzb0X for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E79D28137C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E79D28137C
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E42BB843FE; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:18:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cbcc0f7709976dec45aeefba9434b74a86682e2
X-Git-Newrev: e0fbfe35219e63f69b1579b54694c20b16fb9a5c
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.E42BB843FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: move tracing functions
 to helpers
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0fbfe35219e63f69b1579b54694c20b16fb9a5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

errorN() was unused, drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/dl-wrapper | 8 +++-----
 support/download/helpers    | 4 ++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index d1ba281f79..239bdfa359 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,6 +17,9 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
+# shellcheck source=helpers source-path=SCRIPTDIR
+. "${0%/*}/helpers"
+
 export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
@@ -233,10 +236,5 @@ main() {
     return ${rc}
 }
 
-trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
-warn()   { trace "${@}" >&2; }
-errorN() { local ret="${1}"; shift; warn "${@}"; exit "${ret}"; }
-error()  { errorN 1 "${@}"; }
-
 my_name="${0##*/}"
 main "${@}"
diff --git a/support/download/helpers b/support/download/helpers
index 5ed9078287..f4102e3b06 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -94,5 +94,9 @@ post_process_repack() {
     mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
 }
 
+trace() { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+warn()  { trace "${@}" >&2; }
+error() { warn "${@}"; exit 1; }
+
 # Keep this line and the following as last lines in this file.
 # vim: ft=bash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
