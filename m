Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018BDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B384660EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B384660EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CA04239C;
	Wed,  4 Aug 2021 00:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNlxEL6Despy; Wed,  4 Aug 2021 00:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD4F04235B;
	Wed,  4 Aug 2021 00:23:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61C731BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A61240F1A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWnwNI8y0HCh for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C4C4069F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C17CA81484; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:12:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af19131543926879fb6676a3352c63ac0b2038bc
X-Git-Newrev: e85bde9cc672fc228eeb079e23ef302468ae3826
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.C17CA81484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/alsa-plugins: new
 package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1874839734083464963=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1874839734083464963==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e85bde9cc672fc228eeb079e23ef302468ae3826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

During testing of bluez-alsa in particular, there is no compilation
dependency - but, some configurations will request the load of a
particular plugin:

    ALSA lib dlmisc.c:337:(snd_dlobj_cache_get0) \
      Cannot open shared library libasound_module_rate_samplerate_best.so \
      (/usr/lib/alsa-lib/libasound_module_rate_samplerate_best.so: \
       cannot open shared object file: No such file or directory)

Adding in the alsa-plugins package allows to build build the
appropriate plugins.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/alsa-plugins/Config.in         |  8 ++++++++
 package/alsa-plugins/alsa-plugins.hash |  4 ++++
 package/alsa-plugins/alsa-plugins.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e77ceb2a95..04ef3cc1a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -498,6 +498,9 @@ F:	package/libsvg-cairo/
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
 
+N:	Charles Hardin <ckhardin@gmail.com>
+F:	package/alsa-plugins/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
diff --git a/package/Config.in b/package/Config.in
index 95ad1a29f7..d49aff3de4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1297,6 +1297,7 @@ menu "Libraries"
 
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
+	source "package/alsa-plugins/Config.in"
 	source "package/alure/Config.in"
 	source "package/aubio/Config.in"
 	source "package/bcg729/Config.in"
diff --git a/package/alsa-plugins/Config.in b/package/alsa-plugins/Config.in
new file mode 100644
index 0000000000..ee0fb4c1d5
--- /dev/null
+++ b/package/alsa-plugins/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ALSA_PLUGINS
+	bool "alsa-plugins"
+	depends on BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_HWDEP
+	help
+	  Advanced Linux Sound Architecture Plugins
+
+	  http://www.alsa-project.org/
diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
new file mode 100644
index 0000000000..8ecbd19965
--- /dev/null
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20  alsa-plugins-1.2.5.tar.bz2
+sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
new file mode 100644
index 0000000000..396f47adaf
--- /dev/null
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# alsa-plugins
+#
+################################################################################
+
+ALSA_PLUGINS_VERSION = 1.2.5
+ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
+ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
+ALSA_PLUGINS_LICENSE = LGPL-2.1+
+ALSA_PLUGINS_LICENSE_FILES = COPYING
+ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
+
+ALSA_PLUGINS_CONF_OPTS = \
+	--disable-jack \
+	--disable-usbstream \
+	--disable-pulseaudio \
+	--disable-libav \
+	--disable-maemo-plugin \
+	--disable-maemo-resource-manager \
+	--with-speex=no
+
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
+ALSA_PLUGINS_DEPENDENCIES += libsamplerate
+ALSA_PLUGINS_LICENSE += , GPL-2.0+ (samplerate plugin)
+ALSA_PLUGINS_LICENSE_FILES += COPYING.GPL
+else
+ALSA_PLUGINS_CONF_OPTS += --disable-samplerate
+endif
+
+$(eval $(autotools-package))

--===============1874839734083464963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1874839734083464963==--
