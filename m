Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33EAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4264142488;
	Fri,  7 Jan 2022 10:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmaOJzNQIiVo; Fri,  7 Jan 2022 10:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7838C42487;
	Fri,  7 Jan 2022 10:27:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161F91C116E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D1B40151
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZUvsOOUSbsD for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4294640126
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7D10C83487; Fri,  7 Jan 2022 10:20:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 11:21:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2da7b07a22fc2c610f670c153e987d35d966022b
X-Git-Newrev: 0f42d06ecf350aaa2d20bf716bf549d55b95982e
X-Patchwork-Hint: ignore
Message-Id: <20220107102059.7D10C83487@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/post-process-helpers: add
 helper function for post process scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f42d06ecf350aaa2d20bf716bf549d55b95982e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

download post process scripts will often need to unpack the source
code tarball, do some operation, and then repack it. In order to help
with this, post-process-helpers provide an unpack() function and a
repack() function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/helpers | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/support/download/helpers b/support/download/helpers
index 40d5eea591..4c5eb466cc 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -72,5 +72,27 @@ mk_tar_gz() {
     popd >/dev/null
 }
 
+post_process_unpack() {
+    local dest="${1}"
+    local tarball="${2}"
+    local one_file
+
+    mkdir "${dest}"
+    tar -C "${dest}" --strip-components=1 -xf "${tarball}"
+    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
+    touch -r "${one_file}" "${dest}.timestamp"
+}
+
+post_process_repack() {
+    local in_dir="${1}"
+    local base_dir="${2}"
+    local out="${3}"
+    local date
+
+    date="@$(stat -c '%Y' "${in_dir}/${base_dir}.timestamp")"
+
+    mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
+}
+
 # Keep this line and the following as last lines in this file.
 # vim: ft=bash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
