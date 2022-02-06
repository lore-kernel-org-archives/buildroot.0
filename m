Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FD2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BDC403A8;
	Sun,  6 Feb 2022 09:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lr4xEmV7z2uA; Sun,  6 Feb 2022 09:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFCA403D0;
	Sun,  6 Feb 2022 09:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7571BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AA5D40362
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4fTDanE5onr for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:45:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D1F640361
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:45:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D166720009;
 Sun,  6 Feb 2022 09:45:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nGe6Y-0002zC-Jt; Sun, 06 Feb 2022 10:45:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 10:45:03 +0100
Message-Id: <20220206094504.11415-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206094504.11415-1-peter@korsgaard.com>
References: <20220206094504.11415-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/avahi: add pygobject support,
 move to python3
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

The python support in avahi needs pygobjet to do anything:

Building avahi-python:              no   (You need python, pygobject and python-dbus!)

So add optional support for it.  Python-gobject is only available for
python3, so change the python logic to use python 3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 04c4164af6..1992669a92 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -40,7 +40,6 @@ AVAHI_CONF_OPTS = \
 	--disable-gtk \
 	--disable-gtk3 \
 	--disable-gdbm \
-	--disable-pygobject \
 	--disable-mono \
 	--disable-monodoc \
 	--disable-stack-protector \
@@ -104,16 +103,16 @@ else
 AVAHI_CONF_OPTS += --disable-glib --disable-gobject
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 AVAHI_CONF_ENV += \
-	am_cv_pathless_PYTHON=python \
-	am_cv_python_version=$(PYTHON_VERSION) \
-	am_cv_python_platform=linux2 \
-	am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-	am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	am_cv_pathless_PYTHON=python3 \
+	am_cv_python_version=$(PYTHON3_VERSION) \
+	am_cv_python_platform=linux5 \
+	am_cv_python_pythondir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	am_cv_python_pyexecdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	py_cv_mod_socket_=yes
 
-AVAHI_DEPENDENCIES += python
+AVAHI_DEPENDENCIES += python3
 AVAHI_CONF_OPTS += --enable-python
 else
 AVAHI_CONF_OPTS += --disable-python
@@ -127,6 +126,13 @@ else
 AVAHI_CONF_OPTS += --disable-python-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_GOBJECT),y)
+AVAHI_CONF_OPTS += --enable-pygobject
+AVAHI_DEPENDENCIES += python-gobject
+else
+AVAHI_CONF_OPTS += --disable-pygobject
+endif
+
 AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
 
 AVAHI_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
