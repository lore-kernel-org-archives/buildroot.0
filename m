Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27289C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 22:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C6F60F6B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 22:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91C6F60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3395C840B8;
	Sat, 18 Sep 2021 22:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hLBCZSsFgA1; Sat, 18 Sep 2021 22:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2200C840FA;
	Sat, 18 Sep 2021 22:47:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11131BF29A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 22:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 908DB840FA
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 22:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38sE9lS8GEp5 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 22:46:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B2FE840B8
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 22:46:57 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id f6so17070034iox.0
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgSrpDEzdv0b8y3RCrQYoI7ehZj/GHDGP3K/ObpShcc=;
 b=Q6e8QrbOSucZOvtzybboPXoOVNOrvJ3/dNbQ+4AxIHJBtiriIcSSjqyziaeqwBIFa9
 M+1JmRbr6xSG2tpPz2nWTuYMaNhlmzWswBIRc+nxZbCwOPDLml8S4bI3+z977ntIGs6J
 dnDBLU3kvb+J8a6r8JXO7U7NP89SRw47aiVV+fqpslb/1tbqqnmyHRPgih63JCQKuJ6d
 wzDTRQmy6EVmFQ2JzpXPsa5hsmmy+qkL8XLAoLKTQJLfCqgpjTCr/25m4Hanv5evDy6d
 13/tLCHcPL41qJaG09w64cTtUpIAH3MEObDrqjbrIac5gQg1szvZWn6/YfazfzE6zkuG
 52xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgSrpDEzdv0b8y3RCrQYoI7ehZj/GHDGP3K/ObpShcc=;
 b=aCxTY58eGPjls2NnathxoK3+Cz/4v0l/DSGgHu9DKcAtShvmFJNYtIlcBcLP4sgUE+
 yWuG5ebRYmVLEWIyDtJUQ8ix35EcBRRYvJE/XNtfOEL88NeTU/o4uNPVhnzVpdp6y75B
 EpRbOlTEOFddBu0X5BX9engBpY1jLRQo/ptOeVEA5nsj2+hWCOiKjCxWSnyfNsb28TFf
 KoeFIbXJ3WQq/aGl+LKGMtD1HqekHHp8KbyV/twajuYlvGczvmwb0xh0UrHooGDC//Yk
 4CJ5C40KCPgJakICoOrxDY5mu6TQink+PyePEjRRMX2TJKG4CO4dgHhvWNmNQqIRuddE
 U0Ng==
X-Gm-Message-State: AOAM530gpG1EbBG5bj7mZWjuhjeYNN2+wTww3dScc2c//WWb88gZwjmu
 Ei0R/5bP6Q+ytDsdwtiQ2k6rofGjgkY=
X-Google-Smtp-Source: ABdhPJx1z/8t1WgmEf/CnBysuKMlH7c0c/dcTb0y3ObfG58qHSVm06I60qpH/fMht+U9A1ogR6f++A==
X-Received: by 2002:a05:6638:264f:: with SMTP id
 n15mr14282698jat.37.1632005216279; 
 Sat, 18 Sep 2021 15:46:56 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id v9sm6190715ilc.16.2021.09.18.15.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 15:46:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 16:46:53 -0600
Message-Id: <20210918224653.202357-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - use ln -s -relative for symlink
  - fix kconfig formatting

Changes v1 -> v2:
  - fix service startup
  - fix symlink paths
---
 package/gstreamer1/Config.in                  |  1 +
 .../0001-Fix-gstd_chmod.sh-DESTDIR-path.patch | 27 +++++++++++++
 ...treamer-check-1.0-unless-tests-are-e.patch | 33 ++++++++++++++++
 ...tive-symlink-for-gstd-gst-client-exe.patch | 38 +++++++++++++++++++
 ...td-check-user-xenv.sh-for-systemd-se.patch | 34 +++++++++++++++++
 package/gstreamer1/gstd/Config.in             | 17 +++++++++
 package/gstreamer1/gstd/gstd.hash             |  3 ++
 package/gstreamer1/gstd/gstd.mk               | 37 ++++++++++++++++++
 8 files changed, 190 insertions(+)
 create mode 100644 package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
 create mode 100644 package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
 create mode 100644 package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
 create mode 100644 package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
 create mode 100644 package/gstreamer1/gstd/Config.in
 create mode 100644 package/gstreamer1/gstd/gstd.hash
 create mode 100644 package/gstreamer1/gstd/gstd.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 4a8111333e..a2a15397e9 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -17,5 +17,6 @@ source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-shark/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
+source "package/gstreamer1/gstd/Config.in"
 source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 endif
diff --git a/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch b/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
new file mode 100644
index 0000000000..79a65ffbdc
--- /dev/null
+++ b/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
@@ -0,0 +1,27 @@
+From f1c953b9077619a83ab21c24dc343c7e21cd220d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 01:46:25 -0600
+Subject: [PATCH] Fix gstd_chmod.sh DESTDIR path.
+
+This should fix the chmod path when cross compiling.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/247]
+---
+ gstd/gstd_chmod.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gstd/gstd_chmod.sh b/gstd/gstd_chmod.sh
+index 8e58bce..fa7fa80 100755
+--- a/gstd/gstd_chmod.sh
++++ b/gstd/gstd_chmod.sh
+@@ -3,4 +3,4 @@
+ # $1 mode
+ # $2 file
+ 
+-chmod $1 $2
++chmod $1 ${DESTDIR}/$2
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch b/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
new file mode 100644
index 0000000000..495fbfc3fa
--- /dev/null
+++ b/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
@@ -0,0 +1,33 @@
+From 586bb97459e72da30bd9991c228b6b8e9251c68b Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 01:49:49 -0600
+Subject: [PATCH] Don't require gstreamer-check-1.0 unless tests are enabled.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/248]
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1d9ce9d..76990a0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -22,10 +22,12 @@ gio_unix_dep  = dependency('gio-unix-2.0',       version : '>=2.44.1')
+ json_glib_dep = dependency('json-glib-1.0',      version : '>=0.16.2')
+ libd_dep      = dependency('libdaemon',          version : '>=0.14')
+ jansson_dep   = dependency('jansson',            version : '>=2.7')
+-gst_check_dep = dependency('gstreamer-check-1.0',version : '>=1.0.5')
+ thread_dep    = dependency('threads')
+ libsoup_dep = dependency('libsoup-2.4',		       version : '>=2.4')
+ 
++gst_check_required = get_option('enable-tests').enabled()
++gst_check_dep = dependency('gstreamer-check-1.0', required : gst_check_required, version : '>=1.0.5')
++
+ systemd_required = get_option('enable-systemd').enabled()
+ systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
+ 
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
new file mode 100644
index 0000000000..265ea8d8c3
--- /dev/null
+++ b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
@@ -0,0 +1,38 @@
+From a670beca8dcc76171dcfe3f10970d76c6f0439be Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 02:49:10 -0600
+Subject: [PATCH] Use relative symlink for gstd/gst-client exe.
+
+This should fix the symlink path when cross compiling.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/249]
+---
+ gst_client/gst_client_symbolic_link.sh | 2 +-
+ gstd/gstd_symbolic_link.sh             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst_client/gst_client_symbolic_link.sh b/gst_client/gst_client_symbolic_link.sh
+index d8d7617..b87dd12 100755
+--- a/gst_client/gst_client_symbolic_link.sh
++++ b/gst_client/gst_client_symbolic_link.sh
+@@ -4,4 +4,4 @@
+ # $1: target
+ # $2: link name
+ rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+-ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
++ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+diff --git a/gstd/gstd_symbolic_link.sh b/gstd/gstd_symbolic_link.sh
+index d8d7617..b87dd12 100755
+--- a/gstd/gstd_symbolic_link.sh
++++ b/gstd/gstd_symbolic_link.sh
+@@ -4,4 +4,4 @@
+ # $1: target
+ # $2: link name
+ rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+-ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
++ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch b/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
new file mode 100644
index 0000000000..247b5ab32f
--- /dev/null
+++ b/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
@@ -0,0 +1,34 @@
+From 05ae5237b1bc23399898f9c06463cfe2b5bba499 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 17:48:03 -0600
+Subject: [PATCH] Don't require gstd-check-user-xenv.sh for systemd service
+
+The gstd-check-user-xenv.sh script does not appear to be required
+for running the gstd service so we shouldn't require it for the
+service to start.
+
+Note that the non-systemd init script already does not require this.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/251]
+---
+ init/gstd.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/init/gstd.service.in b/init/gstd.service.in
+index 3d20ecd..9125983 100644
+--- a/init/gstd.service.in
++++ b/init/gstd.service.in
+@@ -6,7 +6,7 @@ StartLimitIntervalSec=30
+ [Service]
+ Restart=on-failure
+ RestartSec=5s
+-ExecStartPre=@GSTD_SYSTEMD_DIR@/gstd-check-user-xenv.sh
++ExecStartPre=-@GSTD_SYSTEMD_DIR@/gstd-check-user-xenv.sh
+ ExecStart=@prefix@/bin/gstd
+ 
+ [Install]
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
new file mode 100644
index 0000000000..14cda7c45f
--- /dev/null
+++ b/package/gstreamer1/gstd/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GSTD
+	bool "gstd"
+	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
+	depends on BR2_USE_MMU # libdaemon, libglib2
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_READLINE
+	help
+	  GStreamer Daemon, also called gstd, is a GStreamer framework
+	  for controlling audio and video streaming using an
+	  InterProcess Communication protocol.
+
+	  https://developer.ridgerun.com/wiki/index.php?title=GStreamer_Daemon
diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
new file mode 100644
index 0000000000..6ec84bd58d
--- /dev/null
+++ b/package/gstreamer1/gstd/gstd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  94c10c798d3618b63cc68cbe053fabd19335a57f982a47b3d66c27c37d325da3  gstd-0.13.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
new file mode 100644
index 0000000000..74783a3d11
--- /dev/null
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# gstd
+#
+################################################################################
+
+GSTD_VERSION = 0.13.0
+GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
+GSTD_LICENSE_FILES = COPYING
+GSTD_LICENSE = GPL-2.0+
+
+GSTD_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
+	gstreamer1 \
+	jansson \
+	json-glib \
+	libdaemon \
+	libglib2 \
+	libsoup \
+	readline
+
+GSTD_CONF_OPTS += \
+	-Denable-tests=disabled \
+	-Denable-examples=disabled \
+	-Denable-gtk-doc=false \
+	-Dwith-gstd-runstatedir=/var/run/gstd \
+	-Dwith-gstd-logstatedir=/var/log/gstd \
+	-Dwith-gstd-systemddir=/usr/lib/systemd/system
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+GSTD_CONF_OPTS += -Denable-systemd=enabled -Denable-initd=disabled
+GSTD_DEPENDENCIES += systemd
+else
+GSTD_CONF_OPTS += -Denable-systemd=disabled -Denable-initd=enabled
+endif
+
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
