Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C6FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E3A403C8;
	Mon,  7 Feb 2022 18:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ghxJrEKqreT; Mon,  7 Feb 2022 18:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E176403C1;
	Mon,  7 Feb 2022 18:25:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31DE81BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6494010F
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzohL8EBV406 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4AD640158
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9BB0882AB5; Mon,  7 Feb 2022 18:17:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 19:21:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff44d53b647c20b5221fe960d7411ddf8094a3cc
X-Git-Newrev: 71dc252bb96c5d8f667f11abf3e0b8ba59fd4131
X-Patchwork-Hint: ignore
Message-Id: <20220207181734.9BB0882AB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: add pygobject support,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71dc252bb96c5d8f667f11abf3e0b8ba59fd4131
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
