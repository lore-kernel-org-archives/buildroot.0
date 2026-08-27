Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2136DC5DF9D
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 08:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD6BF60778;
	Thu, 27 Aug 2026 08:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiYstyNRko-r; Thu, 27 Aug 2026 08:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787818595;
	bh=Sz5jn70ReeAZTS4id6qTXYiqsQZA0EiqvWSMEYPMQJc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=n4L+Kv2347+wLDOvmXzr56OsuwjU7ZnY1nNBHqs3pL3hcuxL2MxcnlShQocL7UeHj
	 mlDQRgU28zD8sLYGYiV66x+n1L+5Ao3tZDaV53fgQbmvm7yE+vWYVJ2e9Te3m4dEdK
	 wMXLzhzKe9nNM+XC04sc1rSgwiUbKzOPpbZmfp5lm77++36lIoOJ3fkaDZBdZxT+Lp
	 G+N9U6dQZZer3LqEDstL3L/jy++zMdpJu3WzTRsJ26nVozIMX4BPDv4FIsh5K99hn7
	 NXFLnnxs+FasSUUUIewJ95GFrJShUh836ElnJzIQFaveQsZj4XDvqkFz2a7/46MzLg
	 cbcyb9h4AC1Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04FE60761;
	Thu, 27 Aug 2026 08:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A97378B
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 08:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B833406BF
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 08:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrlAnjsSmQuO for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 08:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757E74069A
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 08:16:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 547281A183E
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 08:16:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2487F602B8;
 Thu, 27 Aug 2026 08:16:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E311D11C783F8; 
 Thu, 27 Aug 2026 10:16:27 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 27 Aug 2026 10:16:26 +0200
Message-ID: <20260827081626.1018466-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2] package/fluidsynth: fix
 download-while-configure since 2.5.7 bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit
566bdcb97f5706aa08f40a88e4728e4a0bed8257 ("package/fluidsynth:
security bump to version 2.5.7"), fluidsynth tries to download some
"gcem" code during its configure step, which not only violates
Buildroot's policies, but also breaks the build if network is not
available during the build.

To fix this, we add an EXTRA_DOWNLOADS to grab gcem and extract it at
the right place. Some minor fix (submitted upstream) is needed to
ensure the FindGCEM.cmake logic properly finds that gcem is already in
the source tree.

Fixes:

  https://autobuild.buildroot.net/results/048df28f6ab97a16731e62d7f56c6eba565cda63/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
- Fix typo in commit log reported by Baruch (thanks for the review!)
---
 ...-finding-bundled-GCEM-with-a-sysroot.patch | 41 +++++++++++++++++++
 package/fluidsynth/fluidsynth.hash            |  1 +
 package/fluidsynth/fluidsynth.mk              | 12 ++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/fluidsynth/0001-cmake-fix-finding-bundled-GCEM-with-a-sysroot.patch

diff --git a/package/fluidsynth/0001-cmake-fix-finding-bundled-GCEM-with-a-sysroot.patch b/package/fluidsynth/0001-cmake-fix-finding-bundled-GCEM-with-a-sysroot.patch
new file mode 100644
index 0000000000..66f5224847
--- /dev/null
+++ b/package/fluidsynth/0001-cmake-fix-finding-bundled-GCEM-with-a-sysroot.patch
@@ -0,0 +1,41 @@
+From f558b8656efe8bba7dd94f4acfceb1294a7ded22 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 27 Aug 2026 08:59:32 +0200
+Subject: [PATCH] cmake: fix finding bundled GCEM with a sysroot
+
+CMAKE_FIND_ROOT_PATH_MODE_INCLUDE may be set to ONLY when cross
+compiling, to ensure that header searches use the target sysroot
+instead of accidentally finding host headers.
+
+This causes find_path() to re-root the absolute path to the bundled
+GCEM headers under the target sysroot, making FindGCEM miss
+gcem/include/gcem.hpp in situations where
+CMAKE_FIND_ROOT_PATH_MODE_INCLUDE is set to ONLY.
+
+To fix this, this commit passes NO_CMAKE_FIND_ROOT_PATH to prevent
+sysroot re-rooting when searching this source-tree path. It allows to
+properly detected gcem/include/gcem.hpp and avoid the download if
+already present.
+
+Upstream: https://github.com/FluidSynth/fluidsynth/pull/1835
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmake_admin/FindGCEM.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake_admin/FindGCEM.cmake b/cmake_admin/FindGCEM.cmake
+index 980951cc..e02d97f8 100644
+--- a/cmake_admin/FindGCEM.cmake
++++ b/cmake_admin/FindGCEM.cmake
+@@ -23,7 +23,7 @@ This will define the following variables:
+ #]=======================================================================]
+ 
+ # Find the headers and library
+-find_path(GCEM_INCLUDE_DIR NAMES "gcem.hpp" PATHS "${CMAKE_CURRENT_SOURCE_DIR}/gcem/include")
++find_path(GCEM_INCLUDE_DIR NAMES "gcem.hpp" PATHS "${CMAKE_CURRENT_SOURCE_DIR}/gcem/include" NO_CMAKE_FIND_ROOT_PATH)
+ 
+ include(FindPackageHandleStandardArgs)
+ 
+-- 
+2.55.0
+
diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 0d727e75e6..1e15d48d0d 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  ce27840221ab00dd59bf27e85ecbba480c6c2a7c9fbec4243658f68f59c07f4a  fluidsynth-2.5.7.tar.gz
+sha256  34ab0ee87a9eb26d3087fa9b49c2572ea8ee03db0c9705b83648301a3a3fc172  gcem-012ae73c6d0a2cb09ffe86475f5c6fba3926e200.tar.gz
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 1d6cb118ff..1e6043e6b8 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -12,6 +12,18 @@ FLUIDSYNTH_CPE_ID_VENDOR = fluidsynth
 FLUIDSYNTH_INSTALL_STAGING = YES
 FLUIDSYNTH_DEPENDENCIES = libglib2
 
+FLUIDSYNTH_GCEM_VERSION = 012ae73c6d0a2cb09ffe86475f5c6fba3926e200
+FLUIDSYNTH_EXTRA_DOWNLOADS = $(call github,kthohr,gcem,$(FLUIDSYNTH_GCEM_VERSION))/gcem-$(FLUIDSYNTH_GCEM_VERSION).tar.gz
+
+define FLUIDSYNTH_GCEM_EXTRACT
+	$(call suitable-extractor,$(notdir $(FLUIDSYNTH_EXTRA_DOWNLOADS))) \
+		$(FLUIDSYNTH_DL_DIR)/$(notdir $(FLUIDSYNTH_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D)/ $(TAR_OPTIONS) -
+	rmdir $(@D)/gcem
+	ln -sf gcem-$(FLUIDSYNTH_GCEM_VERSION) $(@D)/gcem
+endef
+FLUIDSYNTH_POST_EXTRACT_HOOKS += FLUIDSYNTH_GCEM_EXTRACT
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
 FLUIDSYNTH_DEPENDENCIES += alsa-lib
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
