Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C195DD25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94FAD614D6;
	Mon, 12 Jan 2026 08:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IAxpSsJoHqp; Mon, 12 Jan 2026 08:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF92E614C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205297;
	bh=9MwA5hxUG+zbBIy8igWraZkSShoCn/o/HBIhNZ0viOY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pyiX+uH1nKz4YQ9ez+Xu3c6zX5VAi8Kw+40DGWsMn3U8RTWM2mTUtjjFnV7UyBzZM
	 hQZpGvGogjPXRoj34YwbKh97a1zG8bmd+RVPIokuF12HA7HhrvnawnjKBOGmP7jL+a
	 gYLMMRbCg+SoU1JuQV3Bu2Qqz7HVbZ+4g95JXW2N5hedp/6lsPIYbbQrw5t0Vqwiur
	 dmBC+QNfPQh+qIhQmsoF8Fu2EE/xJFVYUmMjHwqYQhPFNjqHgTccB3DV9N9owaArPN
	 geaeaDqDLflURd62ZlKW/Tb7MkwTlJT5ZW+QONm89IygnJBVFhs4/HbxR5u0vs+6Qq
	 bXVMwmAayIoAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF92E614C5;
	Mon, 12 Jan 2026 08:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBE9112E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE36841486
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8pVUqplxx8D for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCEBF41485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCEBF41485
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCEBF41485
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:08:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AF5BA4C3AF5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-14ia
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:43 +0100
Message-ID: <20260112080419.2516889-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205104;
 bh=j8vyy8yvumggK6Mp75E9NCgN1v4YjnewvMhXyYnlyP8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Kcr43L5ph1FybFsnBfcM33PSZUhdmLXxvb2bMTVWEBaaqiim1pZColeqeiMkmlGRW
 MmCcUK/cxz/bJohQfczWm7JFRBU8b+b1fahxitdr39BAgbrvcUWV4FrYJuMxp6aSWz
 jezGDN/pzZxqDu30rTjFrl+7HdOvSFsm78auq1s7LBEZL3bul39HDMdLOVg/y14Klq
 de8eG1uTei/qeZzoQZQEvD7VBUnASnlQR8HMdTAtSkm4/hdRqck7kY+e2xVbFOat24
 sG4783NYHYiJsuyFNbJDjx2YJtKc4uwrb+a8XGg0n/CJT9BmRXY9sCrnUb/hmR6vhO
 OeJsQKdE56hBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Kcr43L5p
Subject: [Buildroot] [PATCH 068/104] package/x11r7/xapp_appres: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-June/003517.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_appres/xapp_appres.hash | 6 +++---
 package/x11r7/xapp_appres/xapp_appres.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_appres/xapp_appres.hash b/package/x11r7/xapp_appres/xapp_appres.hash
index 17190e60e7..cf36ff9bca 100644
--- a/package/x11r7/xapp_appres/xapp_appres.hash
+++ b/package/x11r7/xapp_appres/xapp_appres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003141.html
-sha256  8b2257e2a0a1ad8330323aec23f07c333075d7fe4e6efd88e0c18fba8223590b  appres-1.0.6.tar.xz
-sha512  6d14f6a2ad5c83a4d42d4c51ec9a9f32652dfe7624881f1f41c0b1f4946904e7e5ca81a2fd9f4f4824488ce1bd2a4047f92320626bf33b0f1afc5e6b89d3e2b9  appres-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-June/003517.html
+sha256  1114b189239fd87a8d1db433edcb4486346d29912132b91eaeee5667f13b819f  appres-1.0.7.tar.xz
+sha512  5948f869124dd7160ffe109b0fc7ccdca45c3b3f551a382a0bcf2c2af9e3832b0d4451e2868ca93a38de8e8e2caf1946ac72936b3256e99a32437d0ddd937a60  appres-1.0.7.tar.xz
 # Locally computed
 sha256  5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 9beada295c..be0a041f62 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_APPRES_VERSION = 1.0.6
+XAPP_APPRES_VERSION = 1.0.7
 XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.xz
-XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_APPRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_APPRES_LICENSE = MIT
 XAPP_APPRES_LICENSE_FILES = COPYING
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
