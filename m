Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC86C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 01:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F31F416CE;
	Wed,  4 May 2022 01:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LP4k6c77vJBB; Wed,  4 May 2022 01:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10E60409DD;
	Wed,  4 May 2022 01:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0E61BF33A
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 01:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07B4D40B95
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 01:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIwA54zeNt_k for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 01:40:55 +0000 (UTC)
X-Greylist: delayed 00:07:36 by SQLgrey-1.8.0
Received: from monstilationax (41.68.233.220.static.exetel.com.au
 [220.233.68.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FF8D400DA
 for <buildroot@buildroot.org>; Wed,  4 May 2022 01:40:54 +0000 (UTC)
Received: by monstilationax (Postfix, from userid 1000)
 id CE635384027E; Wed,  4 May 2022 11:33:15 +1000 (AEST)
From: Matt Flax <flatmax@flatmax.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 11:33:09 +1000
Message-Id: <20220504013309.2949046-1-flatmax@flatmax.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtkiostream: new package
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
Cc: Matt Flax <flatmax@flatmax.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides many useful software engineering and signal
processing includes and linkable library.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
---
 package/Config.in                  |  1 +
 package/gtkiostream/Config.in      | 36 ++++++++++++++++++++++++++++++
 package/gtkiostream/gtkiostream.mk | 21 +++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 package/gtkiostream/Config.in
 create mode 100644 package/gtkiostream/gtkiostream.mk

diff --git a/package/Config.in b/package/Config.in
index befeadc27b..8e3dd0c08d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1328,6 +1328,7 @@ menu "Audio/Sound"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
+	source "package/gtkiostream/Config.in"
 	source "package/libao/Config.in"
 	source "package/libasplib/Config.in"
 	source "package/libbroadvoice/Config.in"
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
new file mode 100644
index 0000000000..9951e9d465
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_GTKIOSTREAM
+        bool "gtkiostream"
+  depends on BR2_TOOLCHAIN_HAS_OPENMP
+  depends on BR2_USE_WCHAR # required by Flac
+  depends on BR2_INSTALL_LIBSTDCPP # required by Eigen
+	select BR2_PACKAGE_EIGEN
+  select BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
+	select BR2_PACKAGE_FFTW
+  select BR2_PACKAGE_FFTW_DOUBLE
+  select BR2_PACKAGE_FFTW_SINGLE
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBSAMPLERATE
+  select BR2_PACKAGE_ALSA_UTILS
+  select BR2_PACKAGE_ALSA_UTILS_AMIXER
+  select BR2_PACKAGE_ALSA_UTILS_APLAY
+  # The following are for sox
+  select BR2_PACKAGE_FILE
+  select BR2_PACKAGE_FLAC
+  select BR2_PACKAGE_LAME
+  select BR2_PACKAGE_LIBMAD
+  select BR2_PACKAGE_LIBPNG
+  select BR2_PACKAGE_LIBSNDFILE
+  select BR2_PACKAGE_LIBVORBIS
+  select BR2_PACKAGE_OPENCORE_AMR
+  select BR2_PACKAGE_OPUSFILE
+  select BR2_PACKAGE_LIBID3TAG
+  select BR2_PACKAGE_LIBGSM
+  select BR2_PACKAGE_LIBAO
+  select BR2_PACKAGE_SOX
+        help
+          gtkiostream package
+
+          https://github.com/flatmax/gtkiostream
+
+comment "gtkiostream needs OpenMP"
+	depends on !BR2_TOOLCHAIN_HAS_OPENMP
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
new file mode 100644
index 0000000000..36a84e86c7
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# GTKIOSTREAM
+#
+################################################################################
+GTKIOSTREAM_VERSION = HEAD
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+GTKIOSTREAM_LICENSE = GPLv2
+GTKIOSTREAM_INSTALL_STAGING = YES
+GTKIOSTREAM_INSTALL_TARGET = YES
+GTKIOSTREAM_CONF_OPTS = --disable-octave
+GTKIOSTREAM_DEPENDENCIES = host-pkgconf libsamplerate eigen fftw-double fftw-single alsa-utils sox
+
+GTKIOSTREAM_AUTORECONF = YES
+
+define GTKIOSTREAM_M4
+  pushd $(@D); ./tools/autotoolsClean.sh;	mkdir -p m4; popd
+endef
+GTKIOSTREAM_PRE_CONFIGURE_HOOKS += GTKIOSTREAM_M4
+
+$(eval $(autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
