Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E20EECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0EB81499;
	Wed, 14 Sep 2022 09:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0EB81499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovcsHl7w8ygF; Wed, 14 Sep 2022 09:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE7F8143A;
	Wed, 14 Sep 2022 09:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE7F8143A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4EA1BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1744E60BBC
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1744E60BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUHJ5-MaU61B for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:47:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36A6A60757
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A6A60757
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 231A883925; Wed, 14 Sep 2022 09:47:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:45:47 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 236fc63332fb9a35be297c15bd67ade3c23097fa
X-Git-Newrev: 098ac1548425eadc952cf0218ee0b2d1d8691d9b
X-Patchwork-Hint: ignore
Message-Id: <20220914094748.231A883925@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/pistache: fix
 dependency on rapidjson
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

commit: https://git.buildroot.net/buildroot/commit/?id=098ac1548425eadc952cf0218ee0b2d1d8691d9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 240aae4793022e4fe26ed7fa745d30e33a02fc4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
