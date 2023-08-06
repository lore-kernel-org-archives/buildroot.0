Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E21C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFA581C58;
	Sun,  6 Aug 2023 12:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFA581C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5K8ZQj2ZG6XL; Sun,  6 Aug 2023 12:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF2A818AC;
	Sun,  6 Aug 2023 12:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF2A818AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43CAA1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5298760E0A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5298760E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcH0ZeEU7roU for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:24:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D8FD60804
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D8FD60804
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 750A78437A; Sun,  6 Aug 2023 12:24:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 14:22:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07acc00add7ac09114f3c01b85d794a31c68229c
X-Git-Newrev: e34063c5be6963cb3fd87e6852af0854ec1c2dc1
X-Patchwork-Hint: ignore
Message-Id: <20230806122428.750A78437A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: fix build with gcc 12.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e34063c5be6963cb3fd87e6852af0854ec1c2dc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of ccache from 4.7.4 to 4.8.2 in Buildroot commit
1db3f0f84449843476c2887d2ea09323c66f33a4 ("package/ccache: bump
version to 4.8.2"), it started failing to build on machines that use
gcc 12.3, due to a bug in gcc:

/home/buildroot/autobuild/instance-0/output-1/build/host-ccache-4.8.2/src/storage/local/LocalStorage.cpp:701:24:   required from here
/home/buildroot/autobuild/instance-0/output-1/build/host-ccache-4.8.2/src/Logging.hpp:33:7: internal compiler error: Segmentation fault
   33 |       Logging::log(std::string_view(message_));                                \
      |       ^~~~~~~

Upstream ccache has committed a workaround to avoid this compiler bug,
which we backport in this commit.

Fixes:

  http://autobuild.buildroot.net/results/cd341365d1c429bfca505a742e86b3090897db23/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-Work-around-GCC-12.3-bug-109241.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch b/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
new file mode 100644
index 0000000000..42872597cd
--- /dev/null
+++ b/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
@@ -0,0 +1,29 @@
+From 689168c292f1ed26c5f4a3070aeb649dad7facb5 Mon Sep 17 00:00:00 2001
+From: Joel Rosdahl <joel@rosdahl.net>
+Date: Tue, 1 Aug 2023 12:30:12 +0200
+Subject: [PATCH] fix: Work around GCC 12.3 bug 109241
+
+See also #1289.
+
+Upstream: https://github.com/ccache/ccache/commit/689168c292f1ed26c5f4a3070aeb649dad7facb5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/storage/local/LocalStorage.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/storage/local/LocalStorage.cpp b/src/storage/local/LocalStorage.cpp
+index 3e5abe5074..d0a904e553 100644
+--- a/src/storage/local/LocalStorage.cpp
++++ b/src/storage/local/LocalStorage.cpp
+@@ -854,7 +854,9 @@ LocalStorage::recompress(const std::optional<int8_t> level,
+           auto l2_content_lock = get_level_2_content_lock(l1_index, l2_index);
+           l2_content_lock.make_long_lived(lock_manager);
+           if (!l2_content_lock.acquire()) {
+-            LOG("Failed to acquire content lock for {}/{}", l1_index, l2_index);
++            // LOG_RAW+fmt::format instead of LOG due to GCC 12.3 bug #109241
++            LOG_RAW(fmt::format(
++              "Failed to acquire content lock for {}/{}", l1_index, l2_index));
+             return;
+           }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
