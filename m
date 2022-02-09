Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD824C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A50041559;
	Wed,  9 Feb 2022 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgEZCVUYqJ9W; Wed,  9 Feb 2022 21:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6A9D4151B;
	Wed,  9 Feb 2022 21:36:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 400771BF9C6
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 077B640241
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdVwKJPFthPG for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 571344148D
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5DF4A8323E; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36f31032087332806342fcc6eb97a94b80201f49
X-Git-Newrev: 5f479fbffba50768dd6add82d83aad50104c3843
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.5DF4A8323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/owfs: drop python support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f479fbffba50768dd6add82d83aad50104c3843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python support only works with python2, so drop it.

Notice that there is a PR adding python3 support, but it is not yet merged:

https://github.com/owfs/owfs/pull/32

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/owfs/owfs.mk | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 7c69a5251b..986dca921a 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -67,30 +67,8 @@ else
 OWFS_CONF_OPTS += --disable-avahi
 endif
 
-# setup.py isn't python3 compliant
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-OWFS_CONF_OPTS += \
-	--enable-owpython \
-	--with-python \
-	--with-pythonconfig=$(STAGING_DIR)/usr/bin/python-config
-OWFS_MAKE_ENV += \
-	CC="$(TARGET_CC)" \
-	PYTHONPATH="$(PYTHON_PATH)" \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
-OWFS_DEPENDENCIES += python host-swig
-# The configure scripts finds PYSITEDIR as the python_lib directory of
-# host-python, and then prepends DESTDIR in front of it. So we end up
-# installing things in $(TARGET_DIR)/$(HOST_DIR)/lib/python which is
-# clearly wrong.
-# Patching owfs to do the right thing is not trivial, it's much easier to
-# override the PYSITEDIR variable in make.
-OWFS_EXTRA_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-
-else
+# python2 only (https://github.com/owfs/owfs/pull/32)
 OWFS_CONF_OPTS += --disable-owpython --without-python
-endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # zeroconf support uses dlopen()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
