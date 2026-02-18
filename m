Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBD1E9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 19:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B37D740737;
	Wed, 18 Feb 2026 19:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lZbpz_r57pM; Wed, 18 Feb 2026 19:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0C740899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771444700;
	bh=uO2EpbWQa7Z3G+LIdwdWSPKlARibi0e+gZAqA82QFIc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GW8XQY2JxTcu1Ze6UwiPf/VnPV+WqlMGT/aGhsyCkHzETqYAWfC+HnyzGDToAiqT/
	 1ln2SARMFSIPeC7KfBmSBJ1gaXQwypiPR4oJSKUjCCAqtiOHEKvC312B7pQE+TA/rk
	 Pd987JOYPVaDj+VLECMOWw7bQE40WdtNVOCe/JBCccaCpvr87oDbPhplhkUZQ7ujfk
	 QNCtU3CkZ9K+UnYXTnkTuhDfhC0SAh7dcRAKvuqsq3wEAbtRIYA2fqegbH/gK/y0gn
	 oGgytrswf7X1BFK0023cca4hQR+VdfnY5pXQ9TMMkbec/JLraGyiBWoQkXiFEAWvdv
	 rXD0HXEmM6tuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0C740899;
	Wed, 18 Feb 2026 19:58:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78394183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E0A281268
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFTyJIvZVlep for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 19:58:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2048381236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2048381236
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2048381236
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:58:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5ce.dip0.t-ipconnect.de [79.214.197.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1503CA4C09B1;
 Wed, 18 Feb 2026 20:58:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52694)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsngd-000000004a7-46NO;
 Wed, 18 Feb 2026 19:58:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, Julien Olivain <ju.o@free.fr>
Date: Wed, 18 Feb 2026 20:58:11 +0100
Message-ID: <20260218195812.2983207-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771444696;
 bh=+jPu+FItIm2JmyFcdlNW7WD0LcLvLIMPmlbw5kE1BgM=;
 h=From:To:Cc:Subject:Date:From;
 b=tP9G0Gm5abu9PVabYFasuHZEXyvt44lTjlKfsqgUToJ05g9HeohjZAVPPH9GaVEXK
 6IpwRBzoRIwAVUuyvrGD19igkpWa9Owo4HrhlDJJz5h45AXoKNIqxvU2m4gDZ7yjU3
 x3twyXVloq35bEbNSGvpqIw43iwFT7oCpR8E7jVGdtHpd1onuYsm1JYDpaHa9c4/7j
 XSrkqiZOv13v+vz7IDNvcGb8VcImkufodBdV04iZRTSJG9U+vUengr3R9Ll1q56mJd
 07FUio+jFQ0r7lr4CJebPIoiUasAyVOcypR/kUo2bMcmLs5f1eo0q+fiuugcDToqjO
 Fdq8cgeK6BGig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tP9G0Gm5
Subject: [Buildroot] [PATCH 1/2] package/wpewebkit: add dependencies to
 fontconfig & freetype
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

Buildroot commit 2882cf4ae649f7d5e9cee72f84e672328f550845 bumped the
package from 2.44.4 to 2.48.3. This bump includes upstream commit
https://github.com/WebKit/WebKit/commit/3b54e45d63b84f8ab8d70179184c45be78386622
which was added to wpewebkit 2.45.1:
https://wpewebkit.org/release/wpewebkit-2.45.1.html
"Use Skia by default instead of Cairo for rendering."

The upstream commit includes dependencies to fontconfig & freetype which
were not added to buildroot and cause build errors with this defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WPEWEBKIT=y
BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y

Reported-by: Julien Olivain <ju.o@free.fr>
[https://patchwork.ozlabs.org/project/buildroot/patch/20251017131035.224739-1-aperez@igalia.com/#3599999]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wpewebkit/Config.in    | 2 ++
 package/wpewebkit/wpewebkit.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 73ba4e6bdf..c8602f1de6 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -44,6 +44,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
 	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
+	select BR2_PACKAGE_FONTCONFIG if BR2_ENDIAN = "LITTLE"
+	select BR2_PACKAGE_FREETYPE if BR2_ENDIAN = "LITTLE"
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JPEG
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 15a2ea93e8..31aba2a0b9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -40,6 +40,7 @@ ifeq ($(BR2_ENDIAN),"BIG")
 WPEWEBKIT_DEPENDENCIES += cairo
 WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=OFF
 else
+WPEWEBKIT_DEPENDENCIES += fontconfig freetype
 WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=ON
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
