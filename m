Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF895C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63163826BB;
	Sat,  5 Feb 2022 17:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8SHor_3Re22; Sat,  5 Feb 2022 17:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A35826B0;
	Sat,  5 Feb 2022 17:22:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E40791BF30E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D23F04089E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPfBWTQuFKcN for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 17:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0088A4089D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 17:22:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E78782211; Sat,  5 Feb 2022 17:15:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 18:21:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adca60540f4fd271dda48b9a121986492700e73a
X-Git-Newrev: 53fa10f4c91598d49c37b30ddce84daaf7d50216
X-Patchwork-Hint: ignore
Message-Id: <20220205171500.6E78782211@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glib-networking: bump to version
 2.70.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=53fa10f4c91598d49c37b30ddce84daaf7d50216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PKCS#11 is required if gnutls is used:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/9b3d30e40f306f0e36e2a396d3b6df1edeea9f21

Add an upstream patch to fix compilation with older compilers:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/b192086b9936602a40a14d00a6883b339b9d7955

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-meson-change-std-to-gnu99.patch           | 30 ++++++++++++++++++++++
 package/glib-networking/Config.in                  |  1 +
 package/glib-networking/glib-networking.hash       |  4 +--
 package/glib-networking/glib-networking.mk         |  2 +-
 4 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/package/glib-networking/0001-meson-change-std-to-gnu99.patch b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
new file mode 100644
index 0000000000..9f266bc2c8
--- /dev/null
+++ b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
@@ -0,0 +1,30 @@
+From cdfa726bae1d82b7bd3735475fc2b2c6a31c1d2f Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Fri, 12 Nov 2021 11:51:33 +0100
+Subject: [PATCH] meson: change std to gnu99
+
+This is the same as glib and should fix issues with old
+compilers
+
+(cherry picked from commit b192086b9936602a40a14d00a6883b339b9d7955)
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b018ca7b..130a2bf0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -3,7 +3,7 @@ project(
+   version: '2.70.0',
+   license: 'LGPL2.1+',
+   meson_version: '>= 0.50.0',
+-  default_options: ['c_std=c99']
++  default_options: ['c_std=gnu99']
+ )
+ 
+ prefix = get_option('prefix')
+-- 
+2.17.1
+
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 22331255f7..38cded5e6b 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_P11_KIT if BR2_PACKAGE_GNUTLS
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 976a19f25e..6a53b436b0 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.66/glib-networking-2.66.0.sha256sum
-sha256  c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099  glib-networking-2.66.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.0.sha256sum
+sha256  66b408e7afa86c582fe38963db56133869ab4b57d34e48ec56aba621940d6f35  glib-networking-2.70.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 65630c7fed..53280700bc 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.66
+GLIB_NETWORKING_VERSION_MAJOR = 2.70
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
