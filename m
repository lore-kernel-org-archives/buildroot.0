Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A127AC0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 22:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99FD60743;
	Tue,  1 Aug 2023 22:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D99FD60743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xow8c5yARsDL; Tue,  1 Aug 2023 22:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6FF60BD0;
	Tue,  1 Aug 2023 22:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F6FF60BD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9CA1BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 22:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 656AE60B0C
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 22:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656AE60B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBzNbfD6Lyuz for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 22:00:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADBA660BF2
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 22:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBA660BF2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0710A4C00F1
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 23:59:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36500)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQxPK-0006nj-1a
 for buildroot@buildroot.org; Tue, 01 Aug 2023 23:59:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 23:59:58 +0200
Message-Id: <20230801215958.1751367-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690927198;
 bh=CvQTiRQmQXuRqn8VpuQ9Y6HWz9QdOlPQSjGKvCnYyC0=;
 h=From:To:Subject:Date:From;
 b=H7TTtIFHFujcfqg+PUHyBLZICUAShqfsfua4jHagz7JWPJwA6B2ujMVwP7I4gnI7Z
 eDjx3EgZpzhjvr7Gcv56Fjt43OKbQ08Pr5V/wnz8X/elNbJJdhSB0d9qRJe4BbBu6k
 0Ik5qN4EQymDd7Cs7ki5CWNqS7wjCx/PdHBdyqj+NFj/zRbMo0iddu6kYwYnv8Q4Zo
 RzzFQe/T/XUfYk2MsaFUZJQ3pcxfgIwowI5OHvHA3Fs00me6cp5WyS9Ovex9NzkQi1
 A86xYBQr7xubOSwAKN6gBYcxrySiHhe9ZUl519O6iBIBprQaE3PL370hdOT6+E1BXG
 lQCqPfrEe0ekA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=H7TTtIFH
Subject: [Buildroot] [PATCH 1/1] package/ccache: fix build with gcc 12.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/cd3/cd341365d1c429bfca505a742e86b3090897db23/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-fix-Work-around-GCC-12.3-bug-109241.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
