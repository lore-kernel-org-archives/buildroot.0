Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D453CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3316F5B4;
	Sat, 30 May 2026 15:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rEDwqhrsqG0; Sat, 30 May 2026 15:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93E36F5B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156658;
	bh=+gJvMfR6PbwTrHUqaIKt+gXij2idlObm+M1fqrd40VI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POw6QMqDHT8xOzpMVKLAW7f2JIJKkYpjD4lvvLutG9jQj7xahwes/+tTcTihUA/l2
	 03JXVRgyKcdq1XK7tmEJ2SntCaQ4ZwmdODoarp2+oapKIGtYYu8bmEOT3ljW6ELY6u
	 hdpjMuW4B6KgRLxUHOOJU5PX7u+j55cnU5kOaVns+KPWqIgPkMoacZn2Gki5JUTEre
	 xRBmkfOxfQAwNjh4x7Ks6phQFMEAaaB/6ZUyMVwIbBpfKlLiDA+J8csvNshL5OTrVH
	 BwzuXx/N5DzVnrrfdv1vwQyudt788sj6tXZdBKZe3HfbaW9VI+BLz9uCXvmDbDR/8c
	 nINDXwziupmEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D93E36F5B5;
	Sat, 30 May 2026 15:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D452AF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D8B4268A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oF2KbGp24ZHT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFE6B407DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE6B407DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFE6B407DB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5AD5A4C3498;
 Sat, 30 May 2026 17:57:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTM3q-000000001Js-3vBY;
 Sat, 30 May 2026 15:57:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2026 17:57:15 +0200
Message-ID: <20260530155718.657095-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530155718.657095-1-bernd@kuhls.net>
References: <20260530155718.657095-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780156638;
 bh=mbEdm6TgryqjPd0+O6BHBY1YKxqseqvyYsdIV2iPVGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aeRat1VZMOWPt8hTlh+S9Okzjk0dq/2Y1RgwXxODrXDb6jtYE50bDn4Qm/vJOdAnt
 DTm3Lac4mN7I09Vm94MWxRqU0CnFE3u/m9SLKcFwMGgnmLx+xU7zF6JyK1uW5KlAWk
 dm0G2dKjbdnu3oqsa8yKy13XOxBFtRcz/z2smABc5AdI4ImObNfHVHPX0IuJ8VjxHm
 4GZ8zzoBn/HVHPOKlh2bCaKpUq66bFjKb7fw9dabe/wfog/a7xjzt/WYwVtnwchJk7
 z7B3+Q+jnX02mWWLPIiEO/VOl+W3OZWLuJDw5ol5F6Cp1P9uMXnRLjyYifmAZ8iH7x
 Z7uI9TEmwZuOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aeRat1VZ
Subject: [Buildroot] [PATCH v2 2/5] package/stellarium: add extra downloads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building Stellarium includes the download of external tarballs during
configure.

This fails with host-cmake during configure stage:

CMake Error at md4c-subbuild/md4c-populate-prefix/src/md4c-populate-stamp/download-md4c-populate.cmake:163 (message):
  Each download failed!

    error: downloading 'https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

  closing connection #-1

due to buildroot commit f87138339b17bc2b1d84c59ea176abb941413550 which
disabled SSL support for host-cmake.

This patch uses _EXTRA_DOWNLOADS to provide these tarball to allow
offline builds.

No autobuilder error was recorded, the build error can be reproduced
with this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_FORCE_HOST_BUILD=y
BR2_PACKAGE_STELLARIUM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rephrased commit message
    Series passed qt5-based Gitlab pipelines:
    https://gitlab.com/bkuhls/buildroot/-/commits/d4c3a7f6096e3dc48fa33a27c697d76fc3f38d48

 package/stellarium/stellarium.hash |  4 ++++
 package/stellarium/stellarium.mk   | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 67e053eff7..4298c3dcde 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,8 @@
 # From https://github.com/Stellarium/stellarium/releases
 sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
+# From https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L849
+sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
+# From https://github.com/Stellarium/stellarium/blob/v25.4/plugins/LensDistortionEstimator/src/CMakeLists.txt
+sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 48dadfec61..de992352a1 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -9,6 +9,19 @@ STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
+
+STELLARIUM_EXTRA_DOWNLOADS += \
+	https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz \
+	https://github.com/stevengj/nlopt/archive/refs/tags/v2.9.0.tar.gz
+
+define STELLARIUM_COPY_EXTRA_DOWNLOADS
+	mkdir -p $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
+	cp $(STELLARIUM_DL_DIR)/release-0.5.2.tar.gz $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
+	mkdir -p $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
+	cp $(STELLARIUM_DL_DIR)/v2.9.0.tar.gz $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
+endef
+STELLARIUM_POST_EXTRACT_HOOKS = STELLARIUM_COPY_EXTRA_DOWNLOADS
+
 STELLARIUM_DEPENDENCIES = \
 	qt5base \
 	qt5charts \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
