Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A9DC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 12:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815B26064C;
	Sat, 24 Feb 2024 12:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wa251Q7dvO0r; Sat, 24 Feb 2024 12:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8940B60888
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8940B60888;
	Sat, 24 Feb 2024 12:10:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBC31BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 12:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F04F160888
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bvHGLalg3jV for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 12:10:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08F0F6064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F0F6064C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08F0F6064C
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:10:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18966A4C0E8E
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 13:10:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35636)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rdqr1-000000007FG-3F2q
 for buildroot@buildroot.org; Sat, 24 Feb 2024 13:10:07 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 13:10:07 +0100
Message-Id: <20240224121007.435474-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708776608;
 bh=4thJzVGtaCBAJQiw1WM0833IBj69vNKUWaMb75n0RkM=;
 h=From:To:Subject:Date:From;
 b=dvTLt8u7w/MwktQQyHFAncjMpS2Vjj0nIoUdUVlSu4ix4nOEYmC1xtcwJTvQ/cTjc
 VVvVSWgiQwpXEy9ArHDNWsfJ8fVd00AoSYgS6ZyGOLKsv22BP/gZa8vxXSKTvO/GVY
 8MVlwkaxbaNCKCsItZJwDByUL4ng7e2h2zguoqYd51taZBtDYvSkBMixzsXg/V+j6+
 sXQ1cwkRvO/fX6setgejVhQh1Yxm6gGwMlnfFyyx+EedHgRYAJ/T9siDygaPwdW/Vf
 zcT0mYhW+V1wUYK+iqDuKxawoiT1B0OA1CIxae/GCIHwPxKPhi5sUi8jNSH0v7ptes
 yAnWxvHMtJo+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=dvTLt8u7
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.9.1
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

Removed patch which is included in this release.

Updated license hash due to various version and copyright year bumps:
https://github.com/ccache/ccache/commits/master/LICENSE.adoc

Release notes: https://ccache.dev/releasenotes.html#_ccache_4_9_1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-fix-Work-around-GCC-12.3-bug-109241.patch | 29 -------------------
 package/ccache/ccache.hash                    |  4 +--
 package/ccache/ccache.mk                      |  2 +-
 3 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch

diff --git a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch b/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
deleted file mode 100644
index 42872597cd..0000000000
--- a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 689168c292f1ed26c5f4a3070aeb649dad7facb5 Mon Sep 17 00:00:00 2001
-From: Joel Rosdahl <joel@rosdahl.net>
-Date: Tue, 1 Aug 2023 12:30:12 +0200
-Subject: [PATCH] fix: Work around GCC 12.3 bug 109241
-
-See also #1289.
-
-Upstream: https://github.com/ccache/ccache/commit/689168c292f1ed26c5f4a3070aeb649dad7facb5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/storage/local/LocalStorage.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/storage/local/LocalStorage.cpp b/src/storage/local/LocalStorage.cpp
-index 3e5abe5074..d0a904e553 100644
---- a/src/storage/local/LocalStorage.cpp
-+++ b/src/storage/local/LocalStorage.cpp
-@@ -854,7 +854,9 @@ LocalStorage::recompress(const std::optional<int8_t> level,
-           auto l2_content_lock = get_level_2_content_lock(l1_index, l2_index);
-           l2_content_lock.make_long_lived(lock_manager);
-           if (!l2_content_lock.acquire()) {
--            LOG("Failed to acquire content lock for {}/{}", l1_index, l2_index);
-+            // LOG_RAW+fmt::format instead of LOG due to GCC 12.3 bug #109241
-+            LOG_RAW(fmt::format(
-+              "Failed to acquire content lock for {}/{}", l1_index, l2_index));
-             return;
-           }
- 
diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 736122e0ab..a2537077b6 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
+sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  55ce274f2b898dad70d3695ab13f82656fd455bd8fb6d1c85d6f7c453bef0b2e  LICENSE.adoc
+sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index ac4bc4aba5..1ac825439b 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.8.2
+CCACHE_VERSION = 4.9.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
