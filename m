Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792BAD33994
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 16:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3083C84968;
	Fri,  5 Dec 2025 16:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOGwdzVL1r_E; Fri,  5 Dec 2025 16:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CBD3849E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764952875;
	bh=vH5NdVl6vCzU0X85/wnatBdmxz5fbslycT5J8HXZ010=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dKCNyba7EwtjMpvmzvU7ss7uJ5JoR+g1b5xo1+WCpQWnhgDaMR+wcqflym5yvGq3/
	 ljilNV1uwRRAvTgmyDg+bdORJ7/PrvUa0jIzNAsISGJY0UCQfD4CJseG1LjNHsugoA
	 jCKrOnzdoAzUMmWfTQhwvZ6YzNNGWiulzW8mBfnhONCrbdYaUZSTeIJK9mOhJsrMUx
	 459qVzuWPNMlwMAs7NUZcEcf+HLVdkrXx4gH175vrvxSWX+NxL5ln0CSWX0Htp1Lo0
	 HtJLVO8lbBdE5Pu3mGWlkzwCu1sPa9gEC1Pvb3b/pdYxKi7+jIC57h/r8UO5n8Lses
	 qvrPINkbFZg5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBD3849E1;
	Fri,  5 Dec 2025 16:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96770199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DCE74030A
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Lnmgnq2BNsG for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 16:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B310A4025C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B310A4025C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B310A4025C
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:41:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1FB1A4C77FD;
 Fri,  5 Dec 2025 17:41:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35436)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRYri-000000001iI-3rPI;
 Fri, 05 Dec 2025 16:41:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri,  5 Dec 2025 17:41:07 +0100
Message-ID: <20251205164107.1647948-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764952868;
 bh=83gF+gTdtJqeiAl0OCMSgGe3dX5xvdjX4QDPVZySP8k=;
 h=From:To:Cc:Subject:Date:From;
 b=F8NGVTZSV4n0OFsZ0UYXFYBkqeITZiqbLWjRIwFG7IO7wId4H2ZXun6SmpRMBaDt2
 eT7red3R7l8iZ9zWUYyo2acfj2oeMZJQYho55MKzhttddzN39VGxvPtcBPnU/xgCdM
 PR9uBMeyZpy6687nvnIfJ9r7x1DBLPXSbE3/9GIejY7AJz0XKYruVkMrXz0O7B9E3C
 yTETbE29cNtBQs6EU3XDOWHotnCvRn9EHkIvrg+apvcynJC+XfTKKpLLCEy4S/VJPc
 rM6u9IAgtrU2gzI5RDRlylxIgVoOpEHIlSByGaUvTCmM4mcwomqXKsOHjkKGyqr0Z2
 YFwmoW/XHQe/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=F8NGVTZS
Subject: [Buildroot] [PATCH/next 1/1] package/libcamera-apps: fix build
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

Buildroot commit bbefbb8cf79f977903fafb9d0199688a03ba1920 in -next
branch bumped libcamera to version 0.6.0 which breaks the build:

../core/options.cpp:405:44: error: conversion from
 'std::basic_string_view<char>' to non-scalar type
 'const std::string' {aka 'const std::__cxx11::basic_string<char>'}
 requested
  405 |                 const std::string cam_id =
 *cameras[camera]->properties().get(libcamera::properties::Model);

Added upstream patch, included since version 1.10.0, to fix the problem.

Please note that since version 1.9.1 this package is incompatible with
the current version of ffmpeg used in buildroot so bumping it is not an
option atm:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ore-Switch-libcamera-string-controls.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch

diff --git a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
new file mode 100644
index 0000000000..fcebffe3da
--- /dev/null
+++ b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
@@ -0,0 +1,46 @@
+From f3011b5fae183a463630b4168626dfefe9b4c74e Mon Sep 17 00:00:00 2001
+From: Naushir Patuck <naush@raspberrypi.com>
+Date: Thu, 16 Oct 2025 14:45:33 +0100
+Subject: [PATCH] core: Switch libcamera string controls to use
+ std::string_view
+
+This is a change to the libcamera API, switch to std::string_view from
+std::string.
+
+Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
+
+Upstream: https://github.com/raspberrypi/rpicam-apps/commit/f3011b5fae183a463630b4168626dfefe9b4c74e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ core/options.cpp    | 2 +-
+ core/rpicam_app.cpp | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/core/options.cpp b/core/options.cpp
+index cf704c2a..d3296548 100644
+--- a/core/options.cpp
++++ b/core/options.cpp
+@@ -418,7 +418,7 @@ bool OptsInternal::Parse(boost::program_options::variables_map &vm, RPiCamApp *a
+ 	std::vector<std::shared_ptr<libcamera::Camera>> cameras = app->GetCameras();
+ 	if (camera < cameras.size())
+ 	{
+-		const std::string cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
++		const std::string_view cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
+ 
+ 		if (cam_id.find("imx708") != std::string::npos)
+ 		{
+diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
+index 9e5a2d0c..0f0b5ffa 100644
+--- a/core/rpicam_app.cpp
++++ b/core/rpicam_app.cpp
+@@ -128,8 +128,7 @@ std::string const &RPiCamApp::CameraId() const
+ 
+ std::string RPiCamApp::CameraModel() const
+ {
+-	auto model = camera_->properties().get(properties::Model);
+-	return model ? *model : camera_->id();
++	return std::string(camera_->properties().get(properties::Model).value_or(camera_->id()));
+ }
+ 
+ void RPiCamApp::OpenCamera()
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
