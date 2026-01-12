Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07688D25056
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D580480DB2;
	Mon, 12 Jan 2026 08:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VozxTRQXw05O; Mon, 12 Jan 2026 08:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF41814C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207741;
	bh=jbP8OJszdgCIjTO1sRfInSZhHjHRt7kXSMOV0NnFgDU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIS/nprYi1roiMh14Zu2U+8GMIv2vfTtIBQ8/sil4vkyVVbhAvhCxI5VOLX/LxjKa
	 /Xm/DkX18kHdNOrhqOTykXgxC1XmOkcH0VfSJPPEf68RDOoyJ4Jo7Mnfnes+TS2+No
	 lADdI/kEmfe/Okw/i1GxZAHnuTFMvskmOid0WB9qWROePfHdDL7sY6MajR2QM8I+rU
	 zS661M847bN/SdwmvLWWZOXbL4mQPhYj2UJPjHxSgQFFtcA+8GhpDOA7isGeXVOkR5
	 S+OsZIGO682FpPScndcFWJVCH6KNYciLXGl+zcKQSVv7terWA4zUtJ6y28wB8lv+8u
	 Mn8zpvp8vRqiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF41814C8;
	Mon, 12 Jan 2026 08:49:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 384041CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F193415C0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5ELbzkzkaMv for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B538415BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B538415BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B538415BF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD735A4C422E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-3Wsc
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:54 +0100
Message-ID: <20260112082950.2528445-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206670;
 bh=UtJ6UiqUEPeZLsHcuQRzCVYiPFuiAzbUVS4xxPe7JXs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TRXxlPlYk3O0tJFJAxSnnWNXeYnCz7Ijw5IV8Dj3IuXbjlJaSD8KQCQFL+xoyASLL
 BlbT6Y1bgO/srYyzpM2GWdBuqR3xa+CHiGyA/mv5fjxTaqoxMDbzRvuxU6cvg/NyPB
 WEu0gzSPzARUsI+a/OEqPqCaXS0bhMmEnZ2RHmkFQ3XO5QLzO54yTEIClWkMzVNZkG
 oXX60c5Uqg0ddAlG/4mscr7IIwBfh1wrYZ6wgiOsWzVXEeeWSuyqG26hWMjZcCM6db
 ZjuAP1xlRuUOLcsfT9uNFTP/m7dWgKaOE/IrxUx/anQuKCt8kRO62LHhLA9LZP6B5+
 6ju9KDJDKqTeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TRXxlPlY
Subject: [Buildroot] [PATCH 046/102] package/x11r7/xdriver_xf86-video-fbdev:
 bump version to 0.5.1
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

https://lists.x.org/archives/xorg-announce/2024-November/003553.html

Switched _SITE to URL mentioned in latest release notes.

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash  | 5 +++--
 .../xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk    | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index 0b38a9b41b..3d3593c540 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
-sha256  dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699  xf86-video-fbdev-0.5.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-November/003553.html
+sha256  9c2bc0fb9af092804138e8d5cb5627cabf2919ef60f0d1544a95c4ac2047f387  xf86-video-fbdev-0.5.1.tar.xz
+sha512  ab345d796fb6a404c44a5caec31497fd36dce8882befad644b3f6fac1969c0a4ba9243e911e86a29a149ee7b0847ba676a28a49e15f1789238f2726b9dcea1a8  xf86-video-fbdev-0.5.1.tar.xz
 # Locally calculated
 sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index a480befdd0..65b2c19b5e 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.0
-XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.1
+XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_FBDEV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
