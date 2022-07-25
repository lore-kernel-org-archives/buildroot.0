Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9B8CCA473
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91E440943;
	Mon, 25 Jul 2022 10:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A91E440943
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8gHuA-WYfjl; Mon, 25 Jul 2022 10:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97EC4087B;
	Mon, 25 Jul 2022 10:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97EC4087B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FFBB1BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 291EC60C23
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 291EC60C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-R05SmMxsGg for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:38:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1561860BDF
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1561860BDF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D256185D39; Mon, 25 Jul 2022 10:24:25 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 12:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68bca98ee8fc40426259826cfb0600e8995ff10c
X-Git-Newrev: 5399a7a55bbc596bf4d41b106beda5eea369328b
X-Patchwork-Hint: ignore
Message-Id: <20220725102425.D256185D39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: fix struct stat for
 microblaze with largefile
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

commit: https://git.buildroot.net/buildroot/commit/?id=5399a7a55bbc596bf4d41b106beda5eea369328b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On microblaze, there is a separate version of struct stat for largefile
and for non-largefile. When the struct was updated to include the
st_mtim, st_atim and st_ctim members for POSIX, the largefile version
was forgotten. Since we only use largefile in Buildroot, that means that
microblaze didn't have these members in struct stat. This breaks the
build of some packages.

Change the define around st_mtim etc. to __USE_XOPEN2K8 to enable it in
posix context (i.e. by default).

Fixes:
 - http://autobuild.buildroot.org/results/dd944a3bd4ac0c94b2bec8ac209100daaf43903d (zstd)
 - http://autobuild.buildroot.org/results/4609c8e2af24d9536eb33397a4659ad740aca742 (dieharder)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 ...-is-not-posix-conformant-on-microblaze-wi.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch b/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
new file mode 100644
index 0000000000..9797f3a935
--- /dev/null
+++ b/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
@@ -0,0 +1,37 @@
+From 87d415cc133ff493ccd02464c061cb171d11ef2f Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Mon, 25 Jul 2022 11:25:15 +0200
+Subject: [PATCH] struct stat is not posix conformant on microblaze with
+ __USE_FILE_OFFSET64
+
+Commit a06b40cdf5ba0d2ab4f9b4c77d21e45ff284fac7 updated stat.h to use
+__USE_XOPEN2K8 instead of __USE_MISC to add the st_atim, st_mtim and
+st_ctim members to struct stat. However, for microblaze, there are two
+definitions of struct stat, depending on the __USE_FILE_OFFSET64 macro.
+The second one was not updated.
+
+Change __USE_MISC to __USE_XOPEN2K8 in the __USE_FILE_OFFSET64 version
+of struct stat for microblaze.
+
+Upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=29403
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
+index a2787e88343..850697f4fa6 100644
+--- a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
++++ b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
+@@ -89,7 +89,7 @@ struct stat
+         __blksize_t             st_blksize; /* Optimal block size for I/O.  */
+         int                     __pad3;
+         __blkcnt64_t            st_blocks;  /* Number 512-byte blocks allocated.  */
+-# ifdef __USE_MISC
++# ifdef __USE_XOPEN2K8
+         /* Nanosecond resolution timestamps are stored in a format
+          * equivalent to 'struct timespec'. This is the type used
+          * whenever possible but the Unix namespace rules do not allow the
+-- 
+2.35.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
