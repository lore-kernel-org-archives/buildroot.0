Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E6C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A566410B8;
	Sun,  3 Dec 2023 16:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A566410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymJ-I29o2uui; Sun,  3 Dec 2023 16:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F34409F0;
	Sun,  3 Dec 2023 16:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F34409F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 670661BF94D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CE9660A6D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE9660A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQ9Y2_3ZacUM for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DE81607BC
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE81607BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29D7D87549; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:23:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cf5d91d8bf1dc48af612e785bde869e47048ec3
X-Git-Newrev: 5eb79ff3b951fb756e17d8a06b5608b179ddbd60
X-Patchwork-Hint: ignore
Message-Id: <20231203162610.29D7D87549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmemcached: fix build with gcc
 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eb79ff3b951fb756e17d8a06b5608b179ddbd60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

/home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c: In function 'ascii_get_response_handler':
/home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (int x = 0; x < keylen; ++x) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/202aeec4dda822ac341d8882f84f968a303697c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index f86cdd3bbf..63df8f5c20 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -16,7 +16,9 @@ LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
 # Force Release otherwise libraries will be suffixed by -dbg which will raise
 # unexpected build failures with packages that use libmemcached (e.g. c-icap)
-LIBMEMCACHED_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+LIBMEMCACHED_CONF_OPTS += \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
