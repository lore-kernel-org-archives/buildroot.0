Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74248C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F33408C5;
	Sun,  6 Aug 2023 14:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F33408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5AhLMk2G3GJ; Sun,  6 Aug 2023 14:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E16A5409A5;
	Sun,  6 Aug 2023 14:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16A5409A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642651BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA65C409A1
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA65C409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9CyMoQZLwnm for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB94409A0
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCB94409A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA34184458; Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:24:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28e38f4d5cff5db7aa96a4ab5c87cf996087c977
X-Git-Newrev: 38a098df133aaa2ebf09742054b02db5a44f58e5
X-Patchwork-Hint: ignore
Message-Id: <20230806142426.AA34184458@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: add http/2
 support by using libsoup3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38a098df133aaa2ebf09742054b02db5a44f58e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support added in 2.33.2:
  https://webkitgtk.org/2021/06/08/webkitgtk2.33.2-released.html
  "HTTP/2 support when building with libsoup3."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in    | 10 +++++-----
 package/webkitgtk/webkitgtk.mk |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 23c0bf41db..6835467c46 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -31,9 +31,9 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	depends on BR2_USE_WCHAR # icu, libsoup
+	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
@@ -44,7 +44,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -82,9 +82,9 @@ comment "sandboxing support needs a toolchain w/ headers >= 3.12"
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
-	depends on !BR2_STATIC_LIBS # libsoup -> glib-networking, gnutls
+	depends on !BR2_STATIC_LIBS # libsoup3 -> glib-networking, gnutls
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	select BR2_PACKAGE_LIBSOUP_SSL
+	select BR2_PACKAGE_LIBSOUP3_SSL
 	help
 	  Enable HTTPS protocol support.
 
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 3e9d42c7c3..32f6102797 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
-	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
+	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup3 \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 
 WEBKITGTK_CMAKE_BACKEND = ninja
@@ -30,7 +30,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_AVIF=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
-	-DUSE_SOUP2=ON \
 	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
