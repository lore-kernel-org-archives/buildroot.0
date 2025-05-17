Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF25C3DA6D
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 07:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927E1607DF;
	Sat, 17 May 2025 07:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gocsbHLx7hjV; Sat, 17 May 2025 07:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65606080C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65606080C;
	Sat, 17 May 2025 07:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C73C1223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8EB840125
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lupLYTBUz-K9 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 07:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD0EC40967
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD0EC40967
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:14:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A76C286E0A; Sat, 17 May 2025 07:14:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 09:07:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 359908d33ccf4b44a8b035f6c3ae6ffc52d40453
X-Git-Newrev: cc93da91ac44ebf9ed6cf29d6a24c0632854f5a4
X-Patchwork-Hint: ignore
Message-Id: <20250517071428.A76C286E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: revert update to 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc93da91ac44ebf9ed6cf29d6a24c0632854f5a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mtd package fails to compile when BR2_PACKAGE_MTD_TESTS=y is enabled
with the following error.

> make[1]: *** No rule to make target
> 'tests/ubifs_tools-tests/images/good.gz', needed by 'all-am'.  Stop.

This issue was reported upstream and a patch submitted. However we can't
apply the patch to fix the problem. The issue is that a file is missing
from the released tarball, so only a new MTD release can fix it.

This reverts commit 0c230eef9075a37248488ecf0a877012115f7b58.

Upstream: https://lore.kernel.org/linux-mtd/20250220112554.2150046-1-m.olbrich@pengutronix.de/
Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 84b9e83bff..0eb90a5118 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc
-sha256  2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598c10  mtd-utils-2.3.0.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
+sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 4ff43a1dce..77050e7e40 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.3.0
+MTD_VERSION = 2.2.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -12,7 +12,6 @@ MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
-MTD_DEPENDENCIES = host-pkgconf
 
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -29,7 +28,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += zlib
+MTD_DEPENDENCIES += host-pkgconf zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -44,7 +43,7 @@ MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux
+MTD_DEPENDENCIES += util-linux host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
@@ -84,7 +83,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-pkgconf host-acl host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
