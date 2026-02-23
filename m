Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CDEEC1120
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 19:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200B9820F3;
	Mon, 23 Feb 2026 19:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyXueMyxlNxj; Mon, 23 Feb 2026 19:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA9182143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771873211;
	bh=JfRogooFmGFXfLBjbU69ByHEtNi++s1x+TYeFRQ7lW8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KW4kMhNBLPtwlb8UoMPCvEpy6mm0p9CtOKd/zzr619aKNYTpBOjAePk/O+f2OaM2L
	 KB01epJznrmJQuZbKuqbB+jfWfS6/shQDMYWNtKBKeZ9Ji+l5IplzOP1xM7ragMSQF
	 GMA8ND7EdHNiEhZQYBQfuH2OMOYsjh7qkqh+Y8Nw9rt8k2Un5qADRYlGxB1x+3jORh
	 PaspnnIneCBH8+hTKho3NEI2GTr5OQ/ErQSXSVmH5uBgm/FK+8NEForFO9p2+gLMjH
	 24en4UyFUe0Ct5OiuEa2o6skISeXdVJtwpPDrKNjp8/b5cthEWcOxLxsyqrP6ZfRNU
	 5bLKBBD6innzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA9182143;
	Mon, 23 Feb 2026 19:00:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5AD1B8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 19:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4BB06125B
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 19:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NZFjPU4KzwI for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 19:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1121D6076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1121D6076F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1121D6076F
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 19:00:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1DA2A4C1F31;
 Mon, 23 Feb 2026 20:00:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60812)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vubA6-0000000006P-3GJp;
 Mon, 23 Feb 2026 19:00:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Feb 2026 20:00:06 +0100
Message-ID: <20260223190006.1289815-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771873206;
 bh=Jrgby4gwRLyC414+RwCJy8S1hAUFlz5wUYUG+9Sg2oM=;
 h=From:To:Cc:Subject:Date:From;
 b=AHQbmD4oal7Y24TFiL7GxcppsunmXkEXQ0Apu4koWYYGZU4m/jw4Q6KrLp5D1ZjFr
 CjZM/W3PzrCJH3JYTMHWWaZKKbKVhxFMI9hcB2Yt7/cNOcOOKTBy1QGAw45G76VXPL
 b4cUvwYYJL4vul0K79uRsGLNSWEFlMIVTuzbx6SCN1iyRi958v2UnII1Mx2Njt84Md
 RajgEjFm8pCLz+6LXSsacEMM033WtRAY5mCFVtByyh0jT2P0OQDWEglp2OrmI+k6ck
 oxcNMhagLQ5eAJemX97lOq7g78MPE+ymmU8w4G+FBqpQVnb5OyER63O90rqBS5fLlJ
 6kiMCU+04q1ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AHQbmD4o
Subject: [Buildroot] [PATCH/RFC 1/1] package/{qt5,
 wpe}webkit: prevent parallel build with other webkit packages
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5webkit/qt5webkit.mk | 14 ++++++++++++++
 package/wpewebkit/wpewebkit.mk     |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6912359674..1aafdb0f84 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -24,6 +24,20 @@ ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
 QT5WEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
 endif
 
+# To prevent OOM when building several webkit packages in parallel we
+# force a build order:
+# 1. webkitgtk
+# 2. wpewebkit
+# 3. qt5webkit
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK),y)
+QT5WEBKIT_DEPENDENCIES += webkitgtk
+endif
+ifeq ($(BR2_PACKAGE_WPEWEBKIT),y)
+QT5WEBKIT_DEPENDENCIES += wpewebkit
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_OPENGL=ON \
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 03deb6e991..88b542b865 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -44,6 +44,15 @@ WPEWEBKIT_DEPENDENCIES += fontconfig freetype
 WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=ON
 endif
 
+# To prevent OOM when building several webkit packages in parallel we
+# force a build order:
+# 1. webkitgtk
+# 2. wpewebkit
+# 3. qt5webkit
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES)$(BR2_PACKAGE_WEBKITGTK),yy)
+WPEWEBKIT_DEPENDENCIES += webkitgtk
+endif
+
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
