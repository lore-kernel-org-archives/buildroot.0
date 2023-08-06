Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234C9C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D215A409EF;
	Sun,  6 Aug 2023 14:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D215A409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En3X9lH3HElG; Sun,  6 Aug 2023 14:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A596F409B4;
	Sun,  6 Aug 2023 14:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A596F409B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA221BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 967DA8128D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967DA8128D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEaBnycWcoab for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1BCD81332
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1BCD81332
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B337284459; Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:24:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 38a098df133aaa2ebf09742054b02db5a44f58e5
X-Git-Newrev: dff67170f73959e6826ec3e87e892747f8d3a5fb
X-Patchwork-Hint: ignore
Message-Id: <20230806142426.B337284459@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: add http/2
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

commit: https://git.buildroot.net/buildroot/commit/?id=dff67170f73959e6826ec3e87e892747f8d3a5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support added in 2.33.2:
  https://wpewebkit.org/release/wpewebkit-2.33.2.html
  "HTTP/2 support when building with libsoup3."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in    | 6 +++---
 package/wpewebkit/wpewebkit.mk | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 7a8dc557c3..f1d38c7cad 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -36,9 +36,9 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_USE_WCHAR # icu, libsoup
+	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
@@ -51,7 +51,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_OPENJPEG
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 6712291c22..bf0b095372 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -15,7 +15,7 @@ WPEWEBKIT_LICENSE_FILES = \
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
-	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
+	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
@@ -28,8 +28,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
-	-DUSE_AVIF=OFF \
-	-DUSE_SOUP2=ON
+	-DUSE_AVIF=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
