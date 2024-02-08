Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C70C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF23441C11;
	Thu,  8 Feb 2024 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUJkDWjar0hy; Thu,  8 Feb 2024 09:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E246041BA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E246041BA1;
	Thu,  8 Feb 2024 09:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9CC71BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7586846CD
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3vKQVQgkbnL for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5028846AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5028846AF
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5028846AF
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:55:36 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rY182-00F8hL-2F; Thu, 08 Feb 2024 10:55:34 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id bb2d25ef;
 Thu, 8 Feb 2024 09:55:31 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 11:55:30 +0200
Message-ID: <20240208095531.99049-4-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GRfjiE8Cdme8MEeq9XWEs9t7rYAdHBp3LG51l+DbSGA=; b=X3D805lvvzMCr9ba2QKOQDfWj+
 p4HQ15e7N8r5SWsdlt5YUnZiKebyliueywuiQea5Hl+tDEi1zdjpEVemY+vIMG1UzKFeS0ltc45DT
 +3Jo25IhMhrvoKWdfeIq9QCFk0OY4qrSOyZ2PFL5WgXygSi8tIUJV2GkP0SWjW2rNtzI9zyZ746J+
 bI0WKsnNSIMUu4emiyTEZXw+8dPcQX4VAtc9mFiIoY1z9gTOVrwANE5maWuizP3QrGOC0wfSRUhDc
 XuTh+k82yIAvgbDGvgAW2X+eLL/S6M+A3C2y/Qn5q4bmy/sey06xwzQ+/bA99iKkJCoJYmV7FdPSn
 mRWc07rA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=X3D805lv
Subject: [Buildroot] [PATCH 3/3] package/wpewebkit: do not depend on
 wpebackend-fdo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the wpewebkit package dependency on wpebackend-fdo, as it is not
needed at all during the build. What is needed is a WPE backend at run
time, which may be provided by wpebackend-fdo or wpebackend-rdk. To
reflect this, we make wpewebkit depend on either being selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in    | 9 ++++-----
 package/wpewebkit/wpewebkit.mk | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 432aa4c3a30..779af0c892e 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -24,11 +24,11 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
-comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
+comment "wpewebkit needs an OpenGL ES w/ EGL-capable implementation and an WPE backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
-		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
+	depends on !BR2_PACKAGE_WPEBACKEND_FDO && !BR2_PACKAGE_WPEBACKEND_RDK
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
@@ -41,8 +41,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WPEBACKEND_FDO || BR2_PACKAGE_WPEBACKEND_RDK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_HARFBUZZ
@@ -59,7 +59,6 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
-	select BR2_PACKAGE_WPEBACKEND_FDO
 	help
 	  WPE (Web Platform for Embedded) port of the WebKit engine,
 	  to allow embedders to create simple and performant systems
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 13143efb38b..e54ec2952ff 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -16,7 +16,7 @@ WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
-	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
+	libpng libxslt libwpe openjpeg wayland-protocols webp
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
