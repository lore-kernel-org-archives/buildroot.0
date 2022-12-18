Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F199C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B385605A5;
	Sun, 18 Dec 2022 13:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B385605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sojJ3hEJntkR; Sun, 18 Dec 2022 13:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474FA60593;
	Sun, 18 Dec 2022 13:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474FA60593
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 957551BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C75160B5D
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C75160B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JERJ1QYZ4OQ8 for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:43:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 946CD60B0C
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 946CD60B0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 829A2867C6; Sun, 18 Dec 2022 13:43:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:42:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7165965fe57725c32ce3a9c69274d1a4c2c54c80
X-Git-Newrev: af6f7aa76db5aed1eada0b27bd0375610a2fc728
X-Patchwork-Hint: ignore
Message-Id: <20221218134349.829A2867C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: bump version to 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=af6f7aa76db5aed1eada0b27bd0375610a2fc728
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notable changes in this new version include support for the Apple
Aarch64 ABI, and compare-and-swap atomic instructions.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[Peter: drop _AUTORECONF]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...kefile.am-don-t-install-lightning.h-twice.patch | 38 ----------------------
 package/lightning/lightning.hash                   |  2 +-
 package/lightning/lightning.mk                     |  4 +--
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch b/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
deleted file mode 100644
index fb5299c25f..0000000000
--- a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 604c931bc673c507254a84c0f423c9ec8ce6e3a1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 10 Oct 2019 20:36:46 +0200
-Subject: [PATCH] include/Makefile.am: don't install lightning.h twice
-
-Commit 17164ed32d8f3530153b9cad67a4399c65f24512 added lightning.h to
-nodist_include_HEADERS without removing it from include_HEADERS
-
-This raises the following error on one of the buildroot autobuilders:
-/usr/bin/install -c -m 644 lightning.h '/home/test/autobuild/run/instance-3/output-1/target/usr/include'
-/usr/bin/install -c -m 644 lightning.h '/home/test/autobuild/run/instance-3/output-1/target/usr/include'
-/usr/bin/install: cannot create regular file `/home/test/autobuild/run/instance-3/output-1/target/usr/include/lightning.h': File exists
-
-Fix this by removing lightning.h from include_HEADERS
-
-Fixes:
- - http://autobuild.buildroot.org/results/05ebc75598627d2a08e08e194f51cb8464f97b95
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index e754dd3..8f91594 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -14,7 +14,6 @@
- # License for more details.
- #
- 
--include_HEADERS = lightning.h
- SUBDIRS =		\
- 	lightning
- 
--- 
-2.23.0
-
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 2840a97f91..998ae3743b 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed856b866dc6f68678dc1151579118fab1c65fad687cf847fc2d94ca045efdc9  lightning-2.1.3.tar.gz
+sha256  4e3984ff1ccf0ba30a985211d40fc5c06b25f014ebdf3d80d0fe3d0c80dd7c0e  lightning-2.2.0.tar.gz
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index da8c07e61f..8ab2ca1f9d 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.1.3
+LIGHTNING_VERSION = 2.2.0
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
 LIGHTNING_CPE_ID_VENDOR = gnu
-# We're patching include/Makefile.am
-LIGHTNING_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
