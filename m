Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C43EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AEC340B74;
	Mon, 21 Aug 2023 20:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AEC340B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id id1z0Qp4HYr5; Mon, 21 Aug 2023 20:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9531640B72;
	Mon, 21 Aug 2023 20:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9531640B72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6AE1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31CB84150C
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CB84150C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YY_IP28IeSYZ for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E0E409E3
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E0E409E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A7A686025; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 14:22:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 07acc00add7ac09114f3c01b85d794a31c68229c
X-Git-Newrev: e34063c5be6963cb3fd87e6852af0854ec1c2dc1
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.6A7A686025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ccache: fix build with
 gcc 12.3
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
