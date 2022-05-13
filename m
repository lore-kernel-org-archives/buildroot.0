Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C570C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F4D741958;
	Fri, 13 May 2022 16:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1CZOvffl_-D; Fri, 13 May 2022 16:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3851641884;
	Fri, 13 May 2022 16:54:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E90D61BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A9E41884
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwyNnkkfdL5a for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E74FB41832
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3213085DFA; Fri, 13 May 2022 16:43:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 18:53:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89e00f8b434f62b1a9062eb698ee82649725ff1e
X-Git-Newrev: 761663b6760fa79ecd195ebadb5544178c88fe4f
X-Patchwork-Hint: ignore
Message-Id: <20220513164333.3213085DFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysrepo: bump version to 2.1.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=761663b6760fa79ecd195ebadb5544178c88fe4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now fixed upstream. Add a dependency to sytemd if
enabled so cmake can find libsystemd and install the systemd service file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...FIX-build-with-musl-libc-fails-due-to-unk.patch | 42 ----------------------
 package/sysrepo/sysrepo.hash                       |  2 +-
 package/sysrepo/sysrepo.mk                         |  6 +++-
 3 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch b/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
deleted file mode 100644
index 784cfb1445..0000000000
--- a/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 896dc6aee38898fe1c6822ee6a4a4989d21c650b Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Thu, 25 Nov 2021 12:18:06 +0100
-Subject: [PATCH] sysrepo BUGFIX build with musl libc fails due to unknown type
- name 'mode_t'
-
-When building against the musl libc the build will fail due to the
-missing sys/type.h include.
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/plugins_datastore.h    | 1 +
- src/plugins_notification.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/plugins_datastore.h b/src/plugins_datastore.h
-index a64e4131..d577e929 100644
---- a/src/plugins_datastore.h
-+++ b/src/plugins_datastore.h
-@@ -18,6 +18,7 @@
- #define _SYSREPO_PLUGINS_DATASTORE_H
- 
- #include <stdint.h>
-+#include <sys/types.h>
- 
- #include <libyang/libyang.h>
- 
-diff --git a/src/plugins_notification.h b/src/plugins_notification.h
-index 2099db62..f410e8d9 100644
---- a/src/plugins_notification.h
-+++ b/src/plugins_notification.h
-@@ -18,6 +18,7 @@
- #define _SYSREPO_PLUGINS_NOTIFICATION_H
- 
- #include <stdint.h>
-+#include <sys/types.h>
- 
- #include <libyang/libyang.h>
- 
--- 
-2.30.2
-
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index b382c16036..7232711b46 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe09da5f40fb53e3fb97268a134cc0ed3003f0018d0d117c73e81e1553a11f30  sysrepo-2.0.53.tar.gz
+sha256  1182b9d5e1178ad74b3bde6d282b86d17b60e206cd8a014895f74252492d96ab  sysrepo-2.1.42.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index acb3052023..c999bd0ea7 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.0.53
+SYSREPO_VERSION = 2.1.42
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
@@ -12,6 +12,10 @@ SYSREPO_LICENSE_FILES = LICENSE
 SYSREPO_DEPENDENCIES = libyang pcre2 host-sysrepo
 HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre2
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SYSREPO_DEPENDENCIES += systemd
+endif
+
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
 	-DENABLE_TESTS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
