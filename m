Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FDC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 497EA80CEB;
	Thu, 12 Jun 2025 20:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWtI_pJqgfAb; Thu, 12 Jun 2025 20:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5125B80C7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5125B80C7E;
	Thu, 12 Jun 2025 20:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24ED027A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1185540987
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fS1aeEo4NEI for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC8640933
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC8640933
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D2B68354A; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6c930d4513a42ef1a5b98ebeabaa37262f3a2a91
X-Git-Newrev: 11ca118cc4f69dc0b11cd84fff6aecda262f87fe
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.4D2B68354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{atkmm, atmm2_28,
 gtkmm3, libglade}: propagate at-spi2-core dependencies
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11ca118cc4f69dc0b11cd84fff6aecda262f87fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since commit d1757fdfb0010d29f20cd68cb6e16f019e236424, at-spi2-core
depends on !BR2_STATIC_LIBS, but this wasn't properly propagated to
reverse dependencies, so let's do this propagation now.

Fixes the following warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_AT_SPI2_CORE
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_PACKAGE_ATKMM [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a9bfc39660b1e56b5fcba64f0563b0e607dcabb7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/atkmm/Config.in     | 6 ++++--
 package/atkmm2_28/Config.in | 6 ++++--
 package/gtkmm3/Config.in    | 6 ++++--
 package/libglade/Config.in  | 5 +++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 571d7e69ad..cdae340266 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
@@ -14,7 +15,8 @@ config BR2_PACKAGE_ATKMM
 
 	  http://www.gtkmm.org/
 
-comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
index e88073b87a..8dc70210fa 100644
--- a/package/atkmm2_28/Config.in
+++ b/package/atkmm2_28/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM2_28
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_LIBSIGC2
@@ -17,7 +18,8 @@ config BR2_PACKAGE_ATKMM2_28
 
 	  http://www.gtkmm.org/
 
-comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 76af6b24f9..ac38ba06fc 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,9 +1,10 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
 	depends on BR2_PACKAGE_LIBGTK3
+	depends on !BR2_STATIC_LIBS # atkmm
 	select BR2_PACKAGE_ATKMM2_28
 	select BR2_PACKAGE_CAIROMM1_14
 	select BR2_PACKAGE_GLIBMM2_66
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 8d0d26f159..0f889542fa 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
@@ -14,7 +15,7 @@ config BR2_PACKAGE_LIBGLADE
 
 	  https://download.gnome.org/sources/libglade/
 
-comment "libglade needs a toolchain w/ wchar, threads"
+comment "libglade needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
