Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3BBF55104
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FC741BC3;
	Sat,  7 Mar 2026 20:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4LUS1ohRCjE; Sat,  7 Mar 2026 20:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2158417F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772914345;
	bh=GEh1GtswYyNI3YaEfVOUPDJAT1zXjpRAPJCCnqjMWqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SZx6Pa9n1GsGwBCtWbIlImnvTqgbNUerEuql86eFnCTi09YXalQb87PmN1iLYUoZE
	 tUKKTr6F3Q2jpl8Gg3HmMdhjMqdG0Gt8gReOiX8ehCH7+UfFSbQ3LRpcXpCGMpHQt+
	 VPlwyOWfRpv/qh7xyfloI0SInS7Cii9vKyaNeF9LmDAzv/HCVhAdb3EOV2DJisEZsk
	 jEn7gNPT5MLpEpKCoIg16QkjN7NA+fz0tx59rcg76u5dyYgf5YeEvWynXh6Dsakgae
	 c62gMr0q/AF5HhWVMmFcq8ihD48QT0qv1mTxWRt6v27g/Bz3oTSAxub7vGP8of7EoX
	 k2f4BfgaYBXQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2158417F6;
	Sat,  7 Mar 2026 20:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E053A158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65A4417F6
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35c5BkYHxjEM for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F36417A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9F36417A9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D452085E18; Sat,  7 Mar 2026 20:12:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 20:52:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df6e7a6664482da53c8a65a526e8dc3f5dd8aae2
X-Git-Newrev: 86d0fcd77bba8f4fe0e4d1a054d903de3d40fd15
X-Patchwork-Hint: ignore
Message-Id: <20260307201223.D452085E18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvips: fix static build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86d0fcd77bba8f4fe0e4d1a054d903de3d40fd15
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
