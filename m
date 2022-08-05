Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FA9C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7B080AC0;
	Fri,  5 Aug 2022 16:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7B080AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srVzVhcv-Lc8; Fri,  5 Aug 2022 16:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E648125D;
	Fri,  5 Aug 2022 16:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E648125D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2061BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AAD7404F6
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AAD7404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_oSnSXm6q1J for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:29:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C244032A
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61C244032A
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5D7C486E90; Fri,  5 Aug 2022 16:15:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Aug 2022 18:01:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 192b754bf420c1fd55f4590f97fd36175db64ff4
X-Git-Newrev: 240aae4793022e4fe26ed7fa745d30e33a02fc4b
X-Patchwork-Hint: ignore
Message-Id: <20220805161529.5D7C486E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: fix dependency on
 rapidjson
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

commit: https://git.buildroot.net/buildroot/commit/?id=240aae4793022e4fe26ed7fa745d30e33a02fc4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rapidjson has been added as a dependency of pistache as part of commit
2f3218567953185008ec862f814bebecb9d6ed82 ("package/pistache: bump
version & switch to meson build"), using a "depends on". However, as
it is a library dependency, a "select" is normally used in Buildroot.

rapidjson's only dependency is on C++ support, which is already a
dependency of pistache.

In addition, use = instead of += for the rapidjson dependency in the
.mk file, as it's an unconditional dependency.

Cc: Thomas Ruschival <thomas@ruschival.de>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pistache/Config.in   | 2 +-
 package/pistache/pistache.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 806c27077a..53a4b73a58 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_RAPIDJSON
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
 	  for C++. It is entirely written in pure C++17 and provides
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index 65d9b2412c..f4de5e3b2a 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -10,7 +10,7 @@ PISTACHE_LICENSE = Apache-2.0
 PISTACHE_LICENSE_FILES = LICENSE
 
 PISTACHE_INSTALL_STAGING = YES
-PISTACHE_DEPENDENCIES += rapidjson
+PISTACHE_DEPENDENCIES = rapidjson
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PISTACHE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
