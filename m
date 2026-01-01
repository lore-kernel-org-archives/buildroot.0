Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C9CEED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 992BE403D6;
	Thu,  1 Jan 2026 19:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XB-HPk2bSPDG; Thu,  1 Jan 2026 19:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1BF403E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767294376;
	bh=AD1krbCTCwqf8wLXWgesjM0Kv6TMlVWT9P/JH9mwJCk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNUiHRnZv7WJYL6VmcSdGU08T0Gn1uP0n7lUvKD1rMZoDTymgP+SpWP7kD1aS33GO
	 A29HjtK4b3fFwaM6T03SpgK9zeumuHaDIlUM3PfXCFHU7UjCGRyzEE23GSYNPXuDW/
	 1R/ObobPvX89e4b9MIqINV6SY32HP1zeFRO7keUmbrqVaNEkzr8d++x6vjTRWLrN13
	 vMv9riga4tOqxaxgcfk6LfrakY2BK5BLR6gyjaHjhS52ne2Hk///vq8zPeH2ahyUzE
	 eQls4obxQ4+BUQAuloeH3EDYSSqwBX6TKszwyM17vlHW/y1r8NnQ5f/f4/iGva2hte
	 mS0rkM1aQAlgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1BF403E9;
	Thu,  1 Jan 2026 19:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB1119D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C7E9402A8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz4hNNzLMFQE for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 257154020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 257154020B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 257154020B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:06:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7EB69A4C2EFB;
 Thu,  1 Jan 2026 20:05:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33848)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbNyx-000000003yY-3YXE;
 Thu, 01 Jan 2026 19:05:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:05:11 +0100
Message-ID: <20260101190511.1604441-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101190511.1604441-1-bernd@kuhls.net>
References: <20260101190511.1604441-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767294312;
 bh=TCgAiYUJXSqbFToRXB07vD/wzurWN3fO73S5caQ0izc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gj7z2S5tTCS+DBWs7ilRksMU/A3vvfIKdQDbm5nCiDhY9NgKRq+zWNdAh+yj/yYoq
 b0B8ezSbK+cQFj84gRsyfWnOjZashmB/MAOnV3bnqhm5R5jGU1Up7lSxAD4lL7noWR
 qcF0bouGU0OmWR4rUB8r8kyJVx4QVzQkkTFbAyiIUjQPKWXGDXQoSby+fU2/qa6w5O
 eJLFjC7r9QujaiyecjnpwVBfc6U6czQSeyCzS/AmOIu21p2Um2DH6EBjztlhDu6iTS
 cNaqyqS9EBhhXsHT0hCRAnYW8VKhqYGeoZaq5jHf0qy5u1fdqq1B5UADCXnDQzFtBw
 sUU+ShsN0OMKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gj7z2S5t
Subject: [Buildroot] [PATCH 5/5] package/libcamera-apps: bump version to
 1.10.1
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

This bump adds compatibility with ffmpeg 8.x:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

Removed patch which is included in this release.

Switched _SITE to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ore-Switch-libcamera-string-controls.patch | 46 -------------------
 package/libcamera-apps/libcamera-apps.hash    |  3 +-
 package/libcamera-apps/libcamera-apps.mk      |  5 +-
 3 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch

diff --git a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
deleted file mode 100644
index fcebffe3da..0000000000
--- a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f3011b5fae183a463630b4168626dfefe9b4c74e Mon Sep 17 00:00:00 2001
-From: Naushir Patuck <naush@raspberrypi.com>
-Date: Thu, 16 Oct 2025 14:45:33 +0100
-Subject: [PATCH] core: Switch libcamera string controls to use
- std::string_view
-
-This is a change to the libcamera API, switch to std::string_view from
-std::string.
-
-Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
-
-Upstream: https://github.com/raspberrypi/rpicam-apps/commit/f3011b5fae183a463630b4168626dfefe9b4c74e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- core/options.cpp    | 2 +-
- core/rpicam_app.cpp | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/core/options.cpp b/core/options.cpp
-index cf704c2a..d3296548 100644
---- a/core/options.cpp
-+++ b/core/options.cpp
-@@ -418,7 +418,7 @@ bool OptsInternal::Parse(boost::program_options::variables_map &vm, RPiCamApp *a
- 	std::vector<std::shared_ptr<libcamera::Camera>> cameras = app->GetCameras();
- 	if (camera < cameras.size())
- 	{
--		const std::string cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
-+		const std::string_view cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
- 
- 		if (cam_id.find("imx708") != std::string::npos)
- 		{
-diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
-index 9e5a2d0c..0f0b5ffa 100644
---- a/core/rpicam_app.cpp
-+++ b/core/rpicam_app.cpp
-@@ -128,8 +128,7 @@ std::string const &RPiCamApp::CameraId() const
- 
- std::string RPiCamApp::CameraModel() const
- {
--	auto model = camera_->properties().get(properties::Model);
--	return model ? *model : camera_->id();
-+	return std::string(camera_->properties().get(properties::Model).value_or(camera_->id()));
- }
- 
- void RPiCamApp::OpenCamera()
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index b11ea7fe67..e329e30eac 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,4 @@
+# From https://github.com/raspberrypi/rpicam-apps/releases/tag/v1.10.1
+sha256  5b261f4fc05f63d13223fc17951c64aa257e76a9a85b4772e3eb058b42f4631c  rpicam-apps_1.10.1.orig.tar.xz
 # Locally computed
-sha256  b5535933ebc398616fd1b261fa9e3755dfb419e10ee7866078a8a8d99f54a59a  libcamera-apps-v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index df7be41496..9074e4a5c4 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.10.1
+LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/rpicam-apps/releases/download/v$(LIBCAMERA_APPS_VERSION)
+LIBCAMERA_APPS_SOURCE =  rpicam-apps_$(LIBCAMERA_APPS_VERSION).orig.tar.xz
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
