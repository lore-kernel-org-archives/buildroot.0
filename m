Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B3CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79101408EA;
	Mon, 13 Jun 2022 20:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z82TiH66DaOi; Mon, 13 Jun 2022 20:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AB7B4048F;
	Mon, 13 Jun 2022 20:24:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAF401BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D914B60F1D
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DS3zkl-IaOz for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A45260EB9
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7183286EC6; Mon, 13 Jun 2022 20:12:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:55:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd396de5ecd0c26be64e3c8fcd6edc9afe8dec1b
X-Git-Newrev: 80fc07c67a813f9b4844d4afbc562bc759b9174c
X-Patchwork-Hint: ignore
Message-Id: <20220613201202.7183286EC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ecryptfs-utils: add host-pkgconf
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=80fc07c67a813f9b4844d4afbc562bc759b9174c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-pkgconf dependency to fix the following build failure (e.g. with
BR2_PER_PACKAGE_DIRECTORIES):

configure: error: OpenSSL not found

As a side-effect, NSS_{CFLAGS,LIBS} can be dropped

Fixes:
 - http://autobuild.buildroot.org/results/ea16957e8f048b713f5d2713aa5f0c157b62f574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index f087e81a42..737c5b0ebb 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -11,14 +11,10 @@ ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 ECRYPTFS_UTILS_CPE_ID_VENDOR = ecryptfs
 
-ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
+ECRYPTFS_UTILS_DEPENDENCIES = host-pkgconf keyutils libnss host-intltool
 ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
-#Needed for build system to find pk11func.h and libnss3.so
-ECRYPTFS_UTILS_CONF_ENV = \
-	ac_cv_path_POD2MAN=true \
-	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
-	NSS_LIBS="-lnss3"
+ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
