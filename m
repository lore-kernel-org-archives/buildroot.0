Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5D7E7717F
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8F084611;
	Sun, 15 Dec 2024 10:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87e_novrnYdw; Sun, 15 Dec 2024 10:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34BE78461A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34BE78461A;
	Sun, 15 Dec 2024 10:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE8D69
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C0AA41332
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wk-u1YKIrJ6j for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F25234131D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F25234131D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F25234131D
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:55:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0221EA4C3BF0;
 Sun, 15 Dec 2024 11:55:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54102)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMmHh-000000007l0-05a6;
 Sun, 15 Dec 2024 10:55:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 11:55:33 +0100
Message-Id: <20241215105537.1396270-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734260138;
 bh=nQtT6s03WBvsmXO5kzd4fGotMf8bJagm2Y5HxqwWdSY=;
 h=From:To:Cc:Subject:Date:From;
 b=MWeEf0SC72geal+aS5yztQxeuyK3BeIn6bP8i0SoTWhcS/62jf8PGNLFAXQfab5lN
 q5ymPow+mm/XDZyHAn1bYkMuZHwtvynnC31cIOFvBmz+MaxCQQO3UrqMTrmYHQXIOn
 kPZNETOE9d3RsAbll6DrCMxXtjwC2z8ctaH4oIdR+TQikMegpJeN25+ZNeU8gjFnH6
 QGJlk4B7sH1COHDcFi3fpWZh3s0Epi9wgzv1OkQv2TFotIiPyqppVwCOS/bKcfSz/U
 rNXfPc/9zdgJRzjvIKRTqY/0qzcoOF6T7VNIIN28gRY6AqrJeINSWfOoPqjJURmX3+
 4tnbV7VcBhupQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=MWeEf0SC
Subject: [Buildroot] [PATCH 1/5] package/webkitgtk: disable libdrm usage
 when not available
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error

-- Could NOT find LibDRM (missing: LibDRM_INCLUDE_DIR LibDRM_LIBRARY)
CMake Error at Source/cmake/OptionsGTK.cmake:320 (message):
  libdrm is required for USE_LIBDRM
Call Stack (most recent call first):
  Source/cmake/WebKitCommon.cmake:237 (include)
  CMakeLists.txt:21 (include)

with this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y

due to libdrm being enabled by default:
https://github.com/WebKit/WebKit/blob/f736325e66bfa8e85f85387299448476f3e1fb3c/Source/cmake/OptionsGTK.cmake#L59

This is a port of buildroot commit 65f8174648a3df922892cfac1ad15279d1bffde3
for the wpewebkit package, quoting its commit message:

    Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
    libdrm package has not been selected.

    WPE WebKit can be built without libdrm support, and it will still work
    with backends that use other platform-specific methods to handle
    graphics buffers and/or presenting content onto an output. For example
    this is the case with wpebackend-rdk configured to use rpi-userland,
    which uses dispmanx to produce the output instead of DRM/KMS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 19740b3b4e..9328327ac2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -92,6 +92,13 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_LIBBACKTRACE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_LIBDRM=ON
+WEBKITGTK_DEPENDENCIES += libdrm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_LIBDRM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBJXL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=ON
 WEBKITGTK_DEPENDENCIES += libjxl
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
