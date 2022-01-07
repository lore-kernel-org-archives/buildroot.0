Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D6B7824CB;
	Fri,  7 Jan 2022 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsAdTFiqrawO; Fri,  7 Jan 2022 21:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 989B382496;
	Fri,  7 Jan 2022 21:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00F581BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F095E60AFA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYQrzXjEkq07 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CB3A6070A
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 736A9834B1; Fri,  7 Jan 2022 21:03:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:09:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7fcfb71d7a2256a34554866e2b456a710b8ad0f
X-Git-Newrev: 6e518c47dd6a16d0dee66b208d365728453cc655
X-Patchwork-Hint: ignore
Message-Id: <20220107210342.736A9834B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e518c47dd6a16d0dee66b208d365728453cc655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version
0.8.1 in commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: xxhash.o: in function `XXH3_hashLong_128b_internal.constprop.0':
(.text+0xcbc): undefined reference to `static_assert'

Fixes:
 - http://autobuild.buildroot.org/results/559/5595b21a711b482b84e582fc9f56e5468c9eb6d6/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch b/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch
new file mode 100644
index 0000000000..3b65ae1d6c
--- /dev/null
+++ b/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch
@@ -0,0 +1,29 @@
+From 6189ecd3d44a693460f86280ccf49d33cb4b18e1 Mon Sep 17 00:00:00 2001
+From: Yann Collet <cyan@fb.com>
+Date: Sun, 26 Dec 2021 15:15:26 -0800
+Subject: [PATCH] do no longer depend on `<assert.h>` for XXH_STATIC_ASSERT
+
+since some versions are buggy.
+
+Use `_Static_assert` instead, which is part of the C11 language.
+[Retrieved from:
+https://github.com/Cyan4973/xxHash/commit/6189ecd3d44a693460f86280ccf49d33cb4b18e1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ xxhash.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/xxhash.h b/xxhash.h
+index 311a69c7..5dfd5c45 100644
+--- a/xxhash.h
++++ b/xxhash.h
+@@ -1749,8 +1749,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ /* note: use after variable declarations */
+ #ifndef XXH_STATIC_ASSERT
+ #  if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)    /* C11 */
+-#    include <assert.h>
+-#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
++#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { _Static_assert((c),m); } while(0)
+ #  elif defined(__cplusplus) && (__cplusplus >= 201103L)            /* C++11 */
+ #    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
+ #  else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
