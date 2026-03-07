Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD33F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 19:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7466983D51;
	Sat,  7 Mar 2026 19:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSux90LzKfFa; Sat,  7 Mar 2026 19:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A81E83CD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772910536;
	bh=FsXCEXPNQ077p7zYVPgrYdh7YOY5TL7sSZ1HwIBUDiI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gPtpWPz0noOBCMZrwZAqb+X/EA1fiKRV2aD+hsRBqWq0Lm9DHydGCwCUl+q8uzMnE
	 aFVVhk1ZyYDdDeasz5n1AalUoAk14/9sz9G+TO7djZtcLYjrRdC1jN+bAWC0PClU3K
	 MGwBvb5tSgDWTelXxtY02TMO6uTP2uJ98JIqdyIUtBlTjvsnoVv3hxPSnyvYuqi7Aw
	 QyBZSKKq3ZuM3NoQkuFrGLqI7zvGaK8ofIkipwMFmGeaJEXq1X4AcoBNCLDJ+M974g
	 HIypL9f4M9GwbhyyveC2Eq06ucORtnnyF4wznEemi5GnvSi37hhvpPtHMKi5dlraR6
	 IgELfaY5CYRSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A81E83CD3;
	Sat,  7 Mar 2026 19:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21CDF223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13B0383CD3
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sh3MaJm1O3VQ for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 19:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 227AF83CD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 227AF83CD1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 227AF83CD1
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:08:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9F68A4C37D8;
 Sat,  7 Mar 2026 20:08:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyx19-000000002zL-1iaT;
 Sat, 07 Mar 2026 19:08:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Sat,  7 Mar 2026 20:08:50 +0100
Message-ID: <20260307190851.853162-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772910531;
 bh=IiZ/sQOAOahCzkpfSNAAL5Tw/oj3JsLRomBPP56/qHk=;
 h=From:To:Cc:Subject:Date:From;
 b=TGFyuXFTk7cgeV0xpz5/8Mk3sR5piKGv78fWo/f9uZbOBdOc5xYmI2nREQRrA55ke
 LkHjsvZ7tSq7SBzuNJSrkY5u44gOLPeEsmBXTnWnOebpjMUMqblN3cHV7ZtLtnRJDf
 NoA6FXAQmf8VhJZ7zE23wb5b07vIiMExgUviTXil5KJUOz8MKutWBKC1TioSjO8Gns
 bIebpGjIf/4eWwT58Ek+p3Z0Eq66fHfVLytx/8jVnRQVWFVsbvrU4YgZaR146O8gV6
 WyWuIqVko6ay8i/sJcdeWr8Znux8LzLtbHK3w3gA3XgjA+D+NcR3PXMrDHbhSpBNo1
 KvCuzVjiT0fzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TGFyuXFT
Subject: [Buildroot] [PATCH 1/2] package/libvips: fix static build
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

Buildroot commit 72c7d99e22eb7706e413992cf7084438fea657bb switched the
build system to meson which causes an error during configure:

output/build/libvips-8.17.2/meson.build:108:4:
 ERROR: Problem encountered: GModule is not supported on your system,
 please reconfigure with -Dmodules=disabled

using this defconfig:

  BR2_arm=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
  BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
  BR2_TOOLCHAIN_EXTERNAL_CXX=y
  BR2_STATIC_LIBS=y
  BR2_PACKAGE_LIBVIPS=y

Added configure options for -Dmodules to fix the problem which was not
yet caught by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvips/libvips.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index e7641fa8cd..729d5fb9e3 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -31,6 +31,12 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_STATIC_LIBS),)
+LIBVIPS_CONF_OPTS += -Dmodules=enabled
+else
+LIBVIPS_CONF_OPTS += -Dmodules=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBVIPS_CONF_OPTS += -Dintrospection=enabled
 LIBVIPS_DEPENDENCIES += gobject-introspection
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
