Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E668CF8860
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EC0611D1;
	Fri,  4 Oct 2024 22:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWeJfnHDyw4V; Fri,  4 Oct 2024 22:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48693611D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48693611D2;
	Fri,  4 Oct 2024 22:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A26451BF35F
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 22:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACD1C40D9F
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 22:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiYJ-q5jEFEx for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 22:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 621CE40D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 621CE40D97
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 621CE40D97
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 22:05:45 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1swqQg-0051Zh-II; Sat, 05 Oct 2024 00:05:42 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6a0caf59;
 Fri, 4 Oct 2024 22:05:41 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 01:05:38 +0300
Message-ID: <20241004220541.2290809-2-aperez@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004220541.2290809-1-aperez@igalia.com>
References: <20241004220541.2290809-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kfy0lK61vCnCYltEMEJuMpQ1uqxiZ+3syb449DoGGak=; b=H1Y9DDSXN3Pxacznat/20GmMTf
 Kv7PQuDEn7qTLcs/FlicfYjm8I+TNZPJMEKhlNHZk/UGCTbcbOc/ihFe8UdKAzEIS534zdNeDEv+3
 IE8zUJGGTLmiOHDFdI+PxH6AkDBLlzQqa4p4a+FqRRw5CrcSHU4RJP5hZ9YOgz1D2aoAU4Z3OZS1j
 lUNEz2f4a501iN//AMZ4dnDebMnZa8MEgbhk4XLDDVngilcvs+sHeaXu+E+GVCReM+IkGi4AXAuwl
 FGw4gtaG+L42jWS9+RCOp3gCDnVPAAHOSSBgVdClqotrmUHrIw3Hs9KZ8buLHMeDAWJlyHDrWoGdx
 sNir9mxA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=H1Y9DDSX
Subject: [Buildroot] [PATCH 1/2] package/libdex: bump to version 0.8.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch "0001-add-stack-protector-option.patch", which is included in
the release.

https://gitlab.gnome.org/GNOME/libdex/-/blob/0.8.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0001-add-stack-protector-option.patch     | 45 -------------------
 package/libdex/libdex.hash                    |  4 +-
 package/libdex/libdex.mk                      |  5 ++-
 3 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 package/libdex/0001-add-stack-protector-option.patch

diff --git a/package/libdex/0001-add-stack-protector-option.patch b/package/libdex/0001-add-stack-protector-option.patch
deleted file mode 100644
index 9021831a39..0000000000
--- a/package/libdex/0001-add-stack-protector-option.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 107efb2f1a014c4475e122677faddbe0dbef1000 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 23 Jul 2024 14:54:59 +0200
-Subject: [PATCH] add stack-protector option
-
-Allow the user to disable stack-protector as it is not supported by all
-toolchains
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/libdex/-/commit/a65d33aebbe43024a046b3f3cc4a1c6c533838d0
----
- meson.build       | 2 +-
- meson_options.txt | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index d0ca81d..2f7aac2 100644
---- a/meson.build
-+++ b/meson.build
-@@ -126,7 +126,7 @@ test_c_args = [
-   ['-Werror=format-security', '-Werror=format=2'],
-   '-FImsvc_recommended_pragmas.h',
- ]
--if get_option('buildtype') != 'plain'
-+if get_option('buildtype') != 'plain' and get_option('stack-protector')
-   if host_machine.system() != 'windows'
-     test_c_args += '-fstack-protector-strong'
-   endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 519cd97..9e3364a 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -4,6 +4,9 @@ option('docs',
- option('examples',
-        type: 'boolean', value: true,
-        description: 'Build example programs')
-+option('stack-protector',
-+       type: 'boolean', value: true,
-+       description: 'Enable stack-protector')
- option('vapi',
-        type: 'boolean', value: true,
-        description: 'Generate vapi data (requires vapigen)')
--- 
-GitLab
-
diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index ec22f330d9..7e08676fe4 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.6/libdex-0.6.1.sha256sum
-sha256  d176de6578571e32a8c0b603b6a5a13fa5f87fb6b5442575b38ec5af16b17a92  libdex-0.6.1.tar.xz
+# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.0.sha256sum
+sha256  659ab5d0eb7f10bd36af0cde08055158987690b9714e7f5b001c788ec1d01a25  libdex-0.8.0.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 360b389255..0d27b35675 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBDEX_VERSION_MAJOR = 0.6
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+# The middle number is even for stable releases, odd for development ones.
+LIBDEX_VERSION_MAJOR = 0.8
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
