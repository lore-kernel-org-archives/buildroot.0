Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784D5CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393B9405AB;
	Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ay0PZ7zKo93b; Tue,  6 Oct 2026 16:30:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20B0D405B6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304217;
	b=XVPgf3KL0jmK+vENrgJGb2Yad9eySqOx8HL3xcIdSQFcmDGTrAqeoKDmbYi4TdO6EuQg
	 Ng/hzH1/e8hQNwQhcXOeMnSNud+3h0EyjxVIJSSW+WahoazqPINzdYQcAPDkoQbZbz3Hb
	 1TUX41e8d4Lgak8fZ1N5w20wpT8Pqtx4adRs9NMnqSYobLJ8gf31KWFmviGXsdiiZkTYp
	 ESvVK41QHR//uFBgn1rxq+PoE9FAZmujEuoiMRyqmai96NbbTMylfPTSwNx3nMZbiUwnn
	 8+Ryf+1T2YuSLuoiSWWzZw8t5JdCrmzAQe7exKJmh5hLXg1DCPuEByVyz517GbJpN6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2er9/YTbFdfiZ9QUTaSvRjXqm6+RizrfoJwp2OP5mSM=;
	b=Tyo4Tom+aTbk0mPIcKLppxVuCEZQ/AG9elTsIGnZ7BP9I7L6TP/ogeOOtEOKW3mAELsp
	 /k47E1uGtuPR3fRgPhJqdoN8U1y8REGp/Qlwzxqx+MZICbiW8oopJVFAtSEZZIBtf6CIr
	 gAgbEKGgdwAigZTCKiVq8inHNlcuTEthJw0EAWQjMFk6jP6AgezSx1PBxE9UTsyRS03Tq
	 Gw9TSm0qlSepAkUrDnVuKkInYxYme3q+OQou4c8CekDew0EUeZeOTGsYfMzEOPCVGrrFV
	 Kilj3yaYPvnlEfeH+sJsLNdbeJM/pwoZ9TCRB5CQEn1vAUYB6GR3hYZDeW4bOmlUe9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="T6x0/vTf";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304217;
	bh=2er9/YTbFdfiZ9QUTaSvRjXqm6+RizrfoJwp2OP5mSM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXydwmrunRO4HkcShUpfdxgnI8aOwKpgKMiW7r8heReHAxM7ZYCh1+3mPJaYQfcpQ
	 t00zkPyLzzSS+B2sU8Z6aDlyKOonFCNDgf+TYGOWvZaF/EVr19uuyxisu/q8si1oK+
	 GCRNJmy2QM9yYzgBbh6GGRWEIzbtwmGPpAvchwy++lLNpxHMpqpCc4+pEVfDhjt7xc
	 5eabt0EVo0xu1MSef9+/MT+vFawOUVIfJpUU2LsI6JCeaagWAQHq2QecGrJdb+sVPS
	 b8zh/F5nTTm4wm3uRFy+2eYg56ERnqMUe6L40WpqjGI/OnLf561pvAzdzTsnh4nuGu
	 qVRqx8euWxu3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20B0D405B6;
	Tue,  6 Oct 2026 16:30:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E61F341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5036B405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AjDQy2SP-GD for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:24:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 46652403D3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303861;
 b=MH+JK+lfijoT6Cs+6DwDMpZPw9+s7Z6mSDqq9fwBoaVbsRLF1jOC1HEcxX9dZpzgQozY
 KZScHm8pGkOLIacgQ564ij7tK19a6Wiisv30dSGgohgRSZgPCRBoOZklizycSNY2hRMPP
 fBs64GVbFz2tT+gw6rb/V428cVxiAd3TsDxF1+xKBMS/8o8uRPoWlbiIuQeIHIb1M1N2m
 vwLEb2iQxT8UnMXUJfn3XAQGWUjqrenynkwKqLNHUjyBiI4MyNrRGbeiLswr7h0pOTlhc
 b7J1kAdVuRS9A8KuFkLvHVRqzhKKdrjeahXiUL1EFW8UkMDycsr0ezqrG/CKUBX5aQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303861;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ThnG3j8M7ssMgDPNaRmmMhrX6gJImy1ktRz38gGxT10=;
 b=k63MhhctVSzWZRBqc9PiSypuICsrivlAMtjUjrT3z3moMv/DzIYULPNTkmlGH3y6i0WR
 4vlWk3x7+RpGiRD7GwOwc5aUrEQzNRv+AaqVIKAvd9kuMiMmaLkAetGCT5x929asPKdhL
 9ZCGfNwOGXSJpNMY3yPjefiZ0hNpwdz4kx4lQjfw21y2QQF35KhRU73DQi12MwA+I1866
 gi1IlUl97Mh+RAOtNmLCSWEDSbxObCRfPmf9YcqjcPmHS3MUE/zVWlSQLJ/h2YFirPmFW
 cPganizDJAZhBSfRHpZyQX+7AY/5d1n8rREpoj0sbSbFIGJ+oBLS+eFRXA7MDVs954A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="T6x0/vTf"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=T6x0/vTf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46652403D3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303703;
 bh=ThnG3j8M7ssMgDPNaRmmMhrX6gJImy1ktRz38gGxT10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=T6x0/vTfr4qQtse89C7vrw29Ug10Zj/nhqrcUBRGwOUstpIPGL35zjPJGtKF0+skM
 2L1eml2AqMv8xLc9sUv9n9OvCvRsystyTkrh+1NkESor/w+HY32z0rqcnHlHqBuHFm
 TWoG++nlmZBowrDRIKc+F72N86+fubnWlA/inwAKgwqEnZPhYnVm5sBM98oLB1lNg7
 CgsaB7mWCt1Y7b774jXAHIwxcaAteM0WaXBmJxLuNx+RFJM2dzk3gQwudZmbjmbfb0
 HSnKpFX83MC49tqyG01rtsYDL54sbYWPCS7+L7E5y7qdGPSGHB+OodlC7moov1jASV
 ojZJE56vBd4sw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 jStdLWCfn0mXMWnnbowQZwu/+PlJqhxvjqlg0Lt615p5MZM0NxGS88tYK4REK4XOv2YyTsNIz7b
 XAVuKepk8ZBtWrHYxJ/6SucALtBGeZq9s1TpK/9g+/uCpE359c84GQdmrFetyeJypw2oKOnTAG4
 tShEjeLviGH9vEibEep79v5VC3KU+cRD1qXcS/x87N8l05eQBxOfpX6Hg6naIQrY4bbWVxRfiQu
 wkO0CXmtxZhy4F023hKAAwlntCDDDFi3Uf7WOmlMBgF1ClzL7j+LmLpxk+2/gF/D8JHe+P97sco
 TNoCtrkbtU8ROZ3fGsoitAfJBYfxXCEyK2/K06fx5zVkOWF3qc+7syCB5hQWlzi4UhcEjfJANPa
 WDosTX/9wlXI5r5u+GuwBK3hTNxSWdeog3vNffVpZRp1xZO5ksoevt/LTML6xEkbg73+ls8LlkL
 XSUI2WFBgCPqEq1Ee7gWTpHqfpDMbVHUxrZo4iZiQBTxivlQj7/N7E439cllULvFOWNR4rgDnVi
 G9wWd+Ad+gD3S6L2ciPd1xqsd6Im8r6Yg41JKpmhlgZTL/o+3mYwRswTDTffMqEV00r+Yna//wv
 19n+y33jeu1TGeWN9xYlCGj3L4vA0XBKUN/URtywETGgI+tzkoyf7q19mDcAjYGuO/4iSL62w+S
 blBycq0cX/9VLlgeb8QJtAiEseC0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87DB1A4C4B32;
 Tue,  6 Oct 2026 18:21:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7up-000000000ir-2VDa;
 Tue, 06 Oct 2026 16:21:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue,  6 Oct 2026 18:20:45 +0200
Message-ID: <20261006162106.3439373-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 64/84] package/libcamera-apps: bump version
 to 1.10.1
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

This bump adds compatibility with ffmpeg 8.x while support for older
versions of ffmpeg was removed upstream:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

Removed patch 0002 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
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
