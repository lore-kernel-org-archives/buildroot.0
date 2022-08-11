Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7321C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A9C4183A;
	Thu, 11 Aug 2022 11:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A9C4183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHUFOiGtS8HK; Thu, 11 Aug 2022 11:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7FF341832;
	Thu, 11 Aug 2022 11:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FF341832
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 443681BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB0C414C5
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB0C414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVWWdil1QPtH for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:44:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B4141795
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B4141795
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD5C38712C; Thu, 11 Aug 2022 11:29:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:43:17 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bb5c40b896135be524c80b52860aa43cc4604fb2
X-Git-Newrev: df77da086d95cac0d87adc31e5c6c6fb84c0cfd0
X-Patchwork-Hint: ignore
Message-Id: <20220811112945.CD5C38712C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libpsl: require
 libiconv if !BR2_ENABLE_LOCALE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df77da086d95cac0d87adc31e5c6c6fb84c0cfd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes build error

Checking for function "iconv_open" : NO
Header <iconv.h> has symbol "iconv_open" : NO

output/build/libpsl-0.21.1/meson.build:101:4:
 ERROR: Problem encountered: iconv implementation not found

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_LIBPSL=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4245a28f0e63de48be7a198fa3ec2d53f1f0607f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
