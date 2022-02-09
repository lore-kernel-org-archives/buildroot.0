Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B68C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB2D2404F1;
	Wed,  9 Feb 2022 16:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ia3mfSOOqypM; Wed,  9 Feb 2022 16:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0559C404DA;
	Wed,  9 Feb 2022 16:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 301C91BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B15E582D40
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHRFZJP4L-xm for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
X-Greylist: delayed 01:26:25 by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C813782C2E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42D93240007;
 Wed,  9 Feb 2022 16:52:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCs-0001HO-Rz; Wed, 09 Feb 2022 17:52:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:59 +0100
Message-Id: <20220209165213.4498-34-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 033/107] package/owfs: drop python support
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

The python support only works with python2, so drop it.

Notice that there is a PR adding python3 support, but it is not yet merged:

https://github.com/owfs/owfs/pull/32

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
