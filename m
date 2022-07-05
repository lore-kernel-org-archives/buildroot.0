Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B821AC43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 06:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315E982425;
	Tue,  5 Jul 2022 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 315E982425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqrwzqtoRGFj; Tue,  5 Jul 2022 06:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4310B81DBF;
	Tue,  5 Jul 2022 06:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4310B81DBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39D5F1BF2FA
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 06:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 135E960EB9
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 06:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135E960EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRB0Ahh-g91h for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 06:41:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7A660687
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C7A660687
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 06:41:23 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout03.t-online.de (Postfix) with SMTP id AD4CD407A;
 Tue,  5 Jul 2022 08:41:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.181.254]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o8cFL-0dW5lR0; Tue, 5 Jul 2022 08:41:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:42948)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o8cFL-0003eB-C8;
 Tue, 05 Jul 2022 08:41:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 08:41:19 +0200
Message-Id: <20220705064119.1041728-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657003279-014275D8-C88A18B2/0/0 CLEAN NORMAL
X-TOI-MSGID: a1e1ec5f-ec60-45a5-9845-b765e30bef02
Subject: [Buildroot] [PATCH 1/1] package/libpsl: require libiconv if
 !BR2_ENABLE_LOCALE
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

Fixes build error

Checking for function "iconv_open" : NO
Header <iconv.h> has symbol "iconv_open" : NO

output/build/libpsl-0.21.1/meson.build:101:4:
 ERROR: Problem encountered: iconv implementation not found

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_LIBPSL=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpsl/Config.in | 1 +
 package/libpsl/libpsl.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libpsl/Config.in b/package/libpsl/Config.in
index a4cbce6b43..7b02d961c8 100644
--- a/package/libpsl/Config.in
+++ b/package/libpsl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPSL
 	bool "libpsl"
 	depends on BR2_USE_WCHAR # libunistring, icu
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBIDN2 if !BR2_PACKAGE_ICU && !BR2_PACKAGE_LIBIDN
 	select BR2_PACKAGE_LIBUNISTRING if !BR2_PACKAGE_ICU
 	help
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index 5dc03a7c24..742117e8ea 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -11,6 +11,10 @@ LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+LIBPSL_DEPENDENCIES += libiconv
+endif
+
 # The order of checks is the same as done by libpsl when configured.
 ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
 LIBPSL_CONF_OPTS += -Druntime=libidn2 -Dbuiltin=libidn2
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
