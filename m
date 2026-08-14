Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E5C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 05:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836AB406F5;
	Fri, 14 Aug 2026 05:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3u5p0R8_X5p; Fri, 14 Aug 2026 05:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B4A406F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786686143;
	bh=6FjXHG5nbh7HcnNXAMv22wXSWtLfEz98B9G9d74cphs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HLwD4vSqu5jmNOCO9Z7IzJs+inSIc4HNbRePsmL9/1i0qbiga8ureUeTq+F/y5LYa
	 wHjCx8UZyPLxKkLVXbPralnrh2+TjmszIfatU98cX/1kI0f0FwsgXl5w6YzdU/7VUn
	 56ukJhTy920qrwZosv0fCnOihaUDQjfQR8LeSn6UD78ljE5ayEzCfh1HdVxRQdHpHV
	 1adi83DIz5sDUHmAFNCTj2saIkwMuBQoUNioayfuIhGVkm+ktegBW+41MTQ/ZMhwGa
	 2/AWyuvls1Qq3pvG0A1PVTVPRIPLWLVV5Zl84wX85Q47T2gEan9/XNZdS8CEDR8noO
	 RwC4GEqFiuM8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B4A406F7;
	Fri, 14 Aug 2026 05:42:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF537282
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7F3B40080
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYwFEGH19jMX for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 05:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25B7940068
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B7940068
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ez1umFt5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25B7940068
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786686137;
 bh=3eR87vI2Ax0lDyk5di4RXi+sR2xKRy1q4ai1jnfLBXQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ez1umFt5mZjrntj1/UG/K9G0qsGpNNHwh4XadliXqxZ3W2zaYtJk1zhQVdkVmmPum
 QMDdy0QiZAA+snIjA5qq5ehquCjayLYMWwovEiw4WLx3rsQwqPZqMEQBnbcRRfQfZ9
 FJ0LgVp4OwsK/fh04mtyMv7K4OvHVMDZI+Z7asNiZMO00ibfS5fDgJyWApJwxmXDga
 J7WtG/D8qnu7aoRD4dcG/ArXu36s6jsMCg163ngfAiFtTlCoZJgJrid3vEw0y8st/M
 renDM+qy6tVNbEH2+elkDFzgwGycLoT2bxNrgLlOJoLpAO2oLq7cRQyMDYj9O51NBn
 jhgPokLQAhIfA==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83F08A4C4D6A;
 Fri, 14 Aug 2026 07:42:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wukgK-000000004rF-2Cei;
 Fri, 14 Aug 2026 05:42:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Fri, 14 Aug 2026 07:42:13 +0200
Message-ID: <20260814054216.7491-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 1/3] package/libdvdcss: needs gcc >= 8
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

Buildroot commit cd3a2f0ff35346ad5fd6a9867113260addccf127 switched the
build system to meson which depends on c17:
https://code.videolan.org/videolan/libdvdcss/-/commit/9f16597859120b96006415c084039f63efc84b83#line_0cc1139e3_A5

Add the necessary dependency and propagate to reverse dependencies to
fix a build error caught by the Gitlab pipelines:

br-test-pkg/bootlin-aarch64-glibc-old/build/libdvdcss-1.5.0/meson.build:1:0:
 ERROR: None of values ['c17'] are supported by the C compiler. Possible
 values for option "c_std" are ['none', 'c89', 'c99', 'c11', 'gnu89',
 'gnu99', 'gnu11']

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b4f4db5ed78a4121de247715bfb0c4c7d1ca5808

 package/dvdauthor/Config.in                    | 4 ++++
 package/gstreamer1/gst1-plugins-ugly/Config.in | 4 ++++
 package/libdvdcss/Config.in                    | 4 ++++
 package/libdvdnav/Config.in                    | 6 ++++--
 package/libdvdread/Config.in                   | 4 ++++
 5 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/dvdauthor/Config.in b/package/dvdauthor/Config.in
index 9ba5411d6b..23477e91e0 100644
--- a/package/dvdauthor/Config.in
+++ b/package/dvdauthor/Config.in
@@ -17,9 +17,13 @@ if BR2_PACKAGE_DVDAUTHOR
 
 config BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR
 	bool "dvdunauthor"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss -> libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  This option enables the dvdunauthor program, which requires
 	  libdvdread.
 
+comment "dvdunauthor needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 endif
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index 54766ffa8c..aff495c1ac 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -35,10 +35,14 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss -> libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
+comment "dvdread needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
 	bool "mpeg2dec"
 	select BR2_PACKAGE_LIBMPEG2
diff --git a/package/libdvdcss/Config.in b/package/libdvdcss/Config.in
index a8c3b84cf5..8e6f6ea984 100644
--- a/package/libdvdcss/Config.in
+++ b/package/libdvdcss/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDVDCSS
 	bool "libdvdcss"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # std=c17
 	help
 	  libdvdcss is a simple library designed for accessing DVDs like
 	  a block device without having to bother about the decryption.
 
 	  http://www.videolan.org/developers/libdvdcss.html
+
+comment "libdvdcss needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 77cba5f135..8276e466db 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss -> libdvdread
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBDVDREAD
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  https://www.videolan.org/developers/libdvdnav.html
 
-comment "libdvdnav needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libdvdnav needs a toolchain w/ threads, gcc >= 8"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 3579054158..efa86a4e38 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss
 	select BR2_PACKAGE_LIBDVDCSS
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
 	  https://www.videolan.org/developers/libdvdnav.html
+
+comment "libdvdread needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
