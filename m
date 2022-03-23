Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E91CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DD460F46;
	Wed, 23 Mar 2022 20:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Atm1V10fx4N9; Wed, 23 Mar 2022 20:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E05260B4A;
	Wed, 23 Mar 2022 20:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 983481BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 868DD41938
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63t2eWvI_ONg for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:45:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC499418B0
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:45:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D784585538; Wed, 23 Mar 2022 20:36:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:44:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8a46311b5e0680609d3432d4256fbe83558c3b9
X-Git-Newrev: 8afb945bf04816a0df594f8b310f5f9994b55104
X-Patchwork-Hint: ignore
Message-Id: <20220323203601.D784585538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: bump version to 7.82.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8afb945bf04816a0df594f8b310f5f9994b55104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://curl.se/changes.html

Updated license hash due to copyright year bump:
https://github.com/curl/curl/commit/0409192b1fde6b7a4f09667e80ca5dc555eab3f1

The NSS crypto backend requires a special option now, without it
configure errors out with:

configure: error: NSS use must be confirmed using --with-nss-deprecated. NSS support will be dropped from curl in August 2022. See docs/DEPRECATE.md

Since it will be removed entirely soon anyway, and since this version
doesn't fix any CVEs so doesn't need to be backported to stable
branches, drop the NSS option entirely.

Since NSS is going to be removed soon, drop the --without-nss as well.
It is never going to be enabled automatically.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: drop NSS option entirely, as suggested by Baruch Siach.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy             |  6 ++++++
 package/libcurl/Config.in    |  4 ----
 package/libcurl/libcurl.hash |  6 +++---
 package/libcurl/libcurl.mk   | 10 +---------
 4 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3b066bbf72..48c5ebb81e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_LIBCURL_LIBNSS
+	bool "libcurl NSS removed"
+	select BR2_LEGACY
+	help
+	  NSS was deprecated in libcurl 7.82.0.
+
 config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 	bool "weston fbdev removed"
 	select BR2_LEGACY
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index d8072c0afc..8c601c3a70 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -61,10 +61,6 @@ config BR2_PACKAGE_LIBCURL_GNUTLS
 	bool "GnuTLS"
 	depends on BR2_PACKAGE_GNUTLS
 
-config BR2_PACKAGE_LIBCURL_LIBNSS
-	bool "NSS"
-	depends on BR2_PACKAGE_LIBNSS
-
 config BR2_PACKAGE_LIBCURL_MBEDTLS
 	bool "mbed TLS"
 	depends on BR2_PACKAGE_MBEDTLS
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 63d6ba306c..4be245041c 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.81.0.tar.xz.asc
+# https://curl.se/download/curl-7.82.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  a067b688d1645183febc31309ec1f3cdce9213d02136b6a6de3d50f69c95a7d3  curl-7.81.0.tar.xz
-sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
+sha256  0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c  curl-7.82.0.tar.xz
+sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4b2e52829c..97857954db 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.81.0
+LIBCURL_VERSION = 7.82.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -68,14 +68,6 @@ else
 LIBCURL_CONF_OPTS += --without-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL_LIBNSS),y)
-LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
-LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
-LIBCURL_DEPENDENCIES += libnss
-else
-LIBCURL_CONF_OPTS += --without-nss
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL_MBEDTLS),y)
 LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += mbedtls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
