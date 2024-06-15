Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDF8C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB60D4060D;
	Sat, 15 Jun 2024 19:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5q2g9byAXVT; Sat, 15 Jun 2024 19:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0EB94094F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0EB94094F;
	Sat, 15 Jun 2024 19:04:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37B051BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29F34026F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMHqevqxV6wo for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3684044D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB3684044D
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B661887F13; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:29:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 35fe226f79e7a1c86822db4faf98115c5acd0a43
X-Git-Newrev: 6ec2b2cad4c0bd45de77ef7290be79deb1b0cfaf
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.B661887F13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/download/helpers:
 use appropriate TAR
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ec2b2cad4c0bd45de77ef7290be79deb1b0cfaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 86f6c7929e4afcdeff72bb475d31af9fb9f00f60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/helpers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/helpers b/support/download/helpers
index 90a7d6c1ec..5a9702ca38 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -59,7 +59,7 @@ mk_tar_gz() {
     LC_ALL=C sort <"${tmp}.list" >"${tmp}.sorted"
 
     # Create POSIX tarballs, since that's the format the most reproducible
-    tar cf - --transform="s#^\./#${base_dir}/#S" \
+    ${TAR} cf - --transform="s#^\./#${base_dir}/#S" \
              --numeric-owner --owner=0 --group=0 --mtime="${date}" \
              --format=posix --pax-option="${pax_options}" \
              -T "${tmp}.sorted" >"${tmp}.tar"
@@ -78,7 +78,7 @@ post_process_unpack() {
     local one_file
 
     mkdir "${dest}"
-    tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
+    ${TAR} -C "${dest}" --strip-components=1 -xzf "${tarball}"
     one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |sed 's/\x0.*//')"
     touch -r "${one_file}" "${dest}.timestamp"
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
