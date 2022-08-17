Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC9EC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB03383103;
	Wed, 17 Aug 2022 06:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB03383103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fi3rU48i46Cl; Wed, 17 Aug 2022 06:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B95B7830C5;
	Wed, 17 Aug 2022 06:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B95B7830C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28A901C113E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 048CE61054
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 048CE61054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNhGAloTZNWS for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:38:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39F6F60F8E
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F6F60F8E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ECED187943; Wed, 17 Aug 2022 06:24:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 08:09:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f7904e30e03bf109f0f9a89e0a231523b22246c8
X-Git-Newrev: 37a853accc702892da6a5871bffebe29052c9be1
X-Patchwork-Hint: ignore
Message-Id: <20220817062421.ECED187943@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/glibc: fix struct
 stat for microblaze with largefile
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

commit: https://git.buildroot.net/buildroot/commit/?id=37a853accc702892da6a5871bffebe29052c9be1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 5399a7a55bbc596bf4d41b106beda5eea369328b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
