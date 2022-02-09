Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A38C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804A5832D9;
	Wed,  9 Feb 2022 21:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seThKhQun9Oz; Wed,  9 Feb 2022 21:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A3C8290B;
	Wed,  9 Feb 2022 21:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 272E91BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99E4260B98
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PC6HDkliEip6 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E8D60BF2
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3A93F81335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:10:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb4ac01d5a282a1edd647b09576379094c5ed1d8
X-Git-Newrev: 55df30f8b1fb2fff0dd4dce1cab83d6bf55b9527
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.3A93F81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=55df30f8b1fb2fff0dd4dce1cab83d6bf55b9527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zfs/zfs.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 0e7e3e4e74..6b542f5c05 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -37,17 +37,7 @@ else
 ZFS_CONF_OPTS += --disable-systemd
 endif
 
-# The optional PyZFS uses different scripts depending on the python
-# version (ex: arc_summary2 or arc_summary3).
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-ZFS_DEPENDENCIES += python python-setuptools host-python-cffi host-python-packaging
-ZFS_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
-	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`" \
-	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
-ZFS_CONF_OPTS += --enable-pyzfs
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi host-python-packaging
 ZFS_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
