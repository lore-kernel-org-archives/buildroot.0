Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0FEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 08:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE5A60E90
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 08:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EE5A60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 367964030F;
	Tue, 14 Sep 2021 08:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLpQd-S44X7i; Tue, 14 Sep 2021 08:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FD1740305;
	Tue, 14 Sep 2021 08:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF9B1BF389
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 08:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B87740305
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 08:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pq2Z_Q4OjSvz for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 08:02:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4717B401EE
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 08:02:40 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id b6so8683353ilv.0
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/2TT898rZl+OXFFKnS5O8BGPFI2MS6wO0+wkTHZVIU=;
 b=fbHuMPgzyj0F7OJTbn5Buy8xTTLsV2ZkvmLMHdihOnxHuKIFfQbEPs4AFoz6nFMCzw
 8jYVJhJXQoltnCh0ZWEUROAMet4pXiQrBHJEckf2nvE/y5Qe/sPX3J5lTRLzHSLo5+ZC
 3M1iimWjxlUMumGuVDI5+76FNy2NR/RWBgYwULh8V34oi9u3RGFnKr5ODvzE+SzCtjRp
 7is9y5GLgaDhUnGaW3G+28sJL2tPix7LNbKKyVEz8LYdiYwEOsSMTvG6/EYXBu0iVvgR
 COurjDEWWveOL0TpDvewOVafbXuVy/1NLmYWhbMnu8Gr0KJTENY/GaYTkN2OgkPaAzjc
 egQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/2TT898rZl+OXFFKnS5O8BGPFI2MS6wO0+wkTHZVIU=;
 b=bwF5Msw/db3GLeFvqzX59WsWjk8E185UWqJuHIOb1uDa0GAz+7GwZTNlauseelICXx
 dwQzDwBG8OwAjfMCzxMl4qxllt/UqpBC1t54gMsXSz/Ot0h2QonBBRtfmkwZv1SHIPPE
 HqoNpG5msyKq/52Uqhl1Hth2YCIOoNXsgmEfWu3Rm7Fp18c5FWp7k7+sNWCITyHxzGIb
 3X7tg0nkWANNuEMXjlJptCW3yfTamaW0XfrYulDbz2hxJprfFAjYpVtyRn+FpDAmqi51
 HzbznBCHv8SUabLV0olySM/NflHWtTBrGxdiNf7LNp8IKTiqr2+UCFbdXS526edUkuA+
 PWNA==
X-Gm-Message-State: AOAM530pWCl/Xk9FnmCNUxYTK8fsNft4grsw/jtgxiuEtpDEpikxi3a9
 D2UwUvVK6tabSEArLJ/vifE3FYM38K4=
X-Google-Smtp-Source: ABdhPJzdmAFyZUz3IIaETPnYZkdwJYkAZAP1ry2cxzoAPaBPt/MgcC/JH8A76SrXUn2kmq9iTyRWyQ==
X-Received: by 2002:a05:6e02:1aa5:: with SMTP id
 l5mr10925693ilv.271.1631606558926; 
 Tue, 14 Sep 2021 01:02:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id o5sm6171369ilk.88.2021.09.14.01.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 01:02:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 02:02:34 -0600
Message-Id: <20210914080234.2338889-1-james.hilliard1@gmail.com>
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
 package/gstreamer1/Config.in                  |  1 +
 .../0001-Fix-gstd_chmod.sh-DESTDIR-path.patch | 27 ++++++++++++++
 ...treamer-check-1.0-unless-tests-are-e.patch | 33 +++++++++++++++++
 package/gstreamer1/gstd/Config.in             | 17 +++++++++
 package/gstreamer1/gstd/gstd.hash             |  3 ++
 package/gstreamer1/gstd/gstd.mk               | 35 +++++++++++++++++++
 6 files changed, 116 insertions(+)
 create mode 100644 package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
 create mode 100644 package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
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
diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
new file mode 100644
index 0000000000..3f73dbd1c4
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
+	  GStreamer Daemon, also called gstd, is a GStreamer framework for
+	  controlling audio and video streaming using an InterProcess
+	  Communication protocol
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
index 0000000000..fccb774c2e
--- /dev/null
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -0,0 +1,35 @@
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
+	-Dwith-gstd-logstatedir=/var/log/gstd
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
