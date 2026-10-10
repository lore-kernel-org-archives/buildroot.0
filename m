Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1348CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940E460653;
	Sat, 10 Oct 2026 07:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdjP9-gm4Vdt; Sat, 10 Oct 2026 07:18:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90FCD60658
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616736;
	b=k37UaDVVqjG4P6n782WPUjFueQMZvSAc8WIHfhCST9hWLjFB0jXN1dfTPUy1v+jjvjWP
	 fa6bQA6Esd10y1MC784fZKqsRS0QRx0b7d3SZJBo5HHvL5kk/uKykwuMbxHu8JWPUFAVY
	 aKvkz4eUHy4TSVKxrrbpHyRP3R9DT+lHmcuPYPIRUu7ZBfdeiynfw4LhG24Kb6NOFMeq+
	 pXjpbPw8vxG/5vHmuYqc7hKil6UmBwhosI9QU9cRpxNW+O+RUtzwVs7KENHPnuAoBEpLy
	 LYHfskwIIKX3asDad5olRiQfE6PWvAMjDkzJJh5gESf+G2uqF9bLLewgvmf81Ewo7SQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616736;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xdss5TYMNEAwW1F8h47K8/vHmhADHkmtCUcZ2YWIgCQ=;
	b=Sh+dDvC5e8qsJ3TyrWqkZaA6IXvGD+iutwU8LX0p7UZRANocm9M8id8fXY8q2di9sfT8
	 gdpoyRvjnR3tmG2rUGOZuIWT489ZrMO/l86smZrwrGvKh9PBkQrBFXJbwLY5UMVg1jTkt
	 gPfgoo0lP3+HSxfWXQOyiEhJYCVB8xwqXwgVWBADg7dI4xxRD+SGO9+0KQZOzr4y7yvhS
	 yVYN7IRGzDKkmZSWk8QYyEgM0bijHgILe4Oyfyrs5K5QjDS8WSVW0TzDHFzABEDyItaVi
	 sjEEB8V9gcNBxb3ASW+KXiCnn5Qr/uPMXAG3pN2BCouKzr4HK4eB+KJhu7wtwx2yf9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616736;
	bh=xdss5TYMNEAwW1F8h47K8/vHmhADHkmtCUcZ2YWIgCQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B7bnYrJGCjDBlgTfKFnjDlUB29zbz72UR+B3YO+Z8iQ3Ap/FLLBnX1KfUGvZnKGA2
	 zNpJ9FoVAe9lfeoqRPpULpP3GeFpBttcjkL7pNqn8YGl3OyvlmFDyQKdze0FOwIzIJ
	 EtRo7gvArMog7VUDDp+M/TqjaUE84YKf2TAdTQXcXLndSLKNa2/0J7klyfUwzoYRDE
	 x5cwyUKSUU8xV6xxe2IJag/idYNw/Ca4qb2n5o0rRdcGhi66+uGrE9fIiEK74FlalD
	 zI/xJPX8qYBGr7iipqj4e+RfVfRg2I9gjsv+61LuQqBUkqjzV0Jw7I1mT9KRfJs6LU
	 CfDDIO7jspNlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FCD60658;
	Sat, 10 Oct 2026 07:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E60D235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3927D813C5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGSQ2q02Qh0I for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F2C3813B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616734;
 b=FT/Mp0/WZ64/WRFWLKhoj/3p/UIyJ6qYv2CagODTEHIRpfP/8s2q+yS9yODAdoh46/us
 VVh3tEgWKbOzQrhaX3zPPDKAEhG58TBYikjtNfhtXGW6qwTIMxTd508WLEtXQMi+yowUr
 +rwUh+ottNh2U5sVe96Uykjb4hOfhmkfZsLnOajbro4wA6P+9Mlie+h3gKIu2X2oIuSfc
 m+L7hlVXU6tsS91OmUvxiOQZRBN6v4a9Jw6sbmNFL+AYTFRgdWG5DCwOF2IqsCXynr537
 t/exlTZA140/P9d9cWZ6kvyxgdGwopnUvy/BnV2GDmdz7DKkPnUQESA1gXh9Q0KbQ8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616734;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OyGtPOA/lLVBxgkD1JAvGAurjptu4ukbQXklc2DmJRQ=;
 b=kr4x0VAcFPRa0mSiPzWVi3y85R3vvE7i5a8IjIJv8LjGeyBYFn1dSITkt9GBHLHXyHKE
 73l+Xp6vazkQfxIGxYI2jBCXDjgyx8E8qTByc0P7lB1vNVZGPUqwPsZQ6H4vqOSUB/7Nu
 uQmYvB9GCdK3m/ccIjYalwFWlcwLqfl+e++U95gkLTI1ofZK9QxYqbpTRP/5SagFDZz74
 ra4nGaDJHQ6y+b/T138U8I0QhP3zPzrrHmOVDKkklZKnf9c/Qk2LEKtEeKHmpAphG9iHp
 MA1iCxIa11YBkAXpnoYTVeM1u3Jr++5WleqNW97kiLxWhk0L7BrETYg2wkbZV5KKLVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F2C3813B0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFDE68E688; Sat, 10 Oct 2026 07:17:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:12:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e401eddad884bb92ec5c0075845575209a3c374
X-Git-Newrev: 823ca6bb0d7348fbf7e224c1021d31edb5632ca7
X-Patchwork-Hint: ignore
Message-Id: <20261010071735.DFDE68E688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: bump version
 to 2.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7334366250568828225=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7334366250568828225==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/823ca6bb0d7348fbf7e224c1021d31edb5632ca7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/arvidn/libtorrent/blob/v2.1.1/ChangeLog

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bumps:
https://github.com/arvidn/libtorrent/commit/d3f7a363c2a413f4b3b4ddfd6cbe5a3208016b1c
https://github.com/arvidn/libtorrent/commit/fb2ab9946a130df7b5ee290ec363aa2214256e00

Added patch 0001 to fix a build error with gcc-9.3.0 detected by the
Gitlab pipelines which would be introduced by this bump.

Raised minimum gcc version to 8 to fix a build error detected by the
Gitlab pipelines which would be introduced by this bump:
/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/libtorrent-rasterbar-2.1.1/include/libtorrent/string_view.hpp:13:23:
 fatal error: string_view: No such file or directory

Added dependency to BR2_USE_MMU to fix a build error detected by the
Gitlab pipelines which would be introduced by this bump:
/builds/bkuhls/buildroot/br-test-pkg/bootlin-armv7m-uclibc/build/libtorrent-rasterbar-2.1.1/src/mmap.cpp:283:19:
 error: ‘::madvise’ has not been declared; did you mean ‘advise’?

Switched build system to cmake due to upstream removal of autotools:
https://github.com/arvidn/libtorrent/commit/d7db28663d3b6827c2fa8d5a44fad7c73828108a

Added new configure option webtorrent
https://github.com/arvidn/libtorrent/commit/4ef8be818fea440c921c39e5f90e5818a4749086
to disable the dependency to OpenSSL for libdatachannel:
https://github.com/paullouisageneau/libdatachannel/blob/a02b751917ac8afc8c58dc6f4461d25ff9465d48/CMakeLists.txt#L452
which was added to libtorrent-rasterbar in version 2.1.0:
https://github.com/arvidn/libtorrent/commit/8d7d82b0330f16297b21e77a5d7c355813687e16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Philipp Richter <richterphilipp.pops@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-more-c-17-that-made-it-in.patch       | 53 ++++++++++++++++++++++
 package/libtorrent-rasterbar/Config.in             |  8 ++--
 .../libtorrent-rasterbar/libtorrent-rasterbar.hash |  5 +-
 .../libtorrent-rasterbar/libtorrent-rasterbar.mk   | 22 +++------
 4 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch b/package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch
new file mode 100644
index 0000000000..afce75b9ff
--- /dev/null
+++ b/package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch
@@ -0,0 +1,53 @@
+From 2638789b7048e17aba7cc8674305f36bd349c795 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 14 Sep 2026 17:31:24 +0200
+Subject: [PATCH] fix more c++17 that made it in
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Patch was inspired by https://github.com/arvidn/libtorrent/pull/4805
+and fixes a build error with gcc-9.3.0
+
+buildroot/output/build/libtorrent-rasterbar-2.1.1/src/torrent_info.cpp:855:16:
+ error: function ‘libtorrent::torrent_info& libtorrent::torrent_info::operator=(libtorrent::torrent_info&&)’
+ defaulted on its redeclaration with an exception-specification that
+ differs from the implicit exception-specification ‘’
+
+Upstream: https://github.com/arvidn/libtorrent/pull/8869
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/libtorrent/torrent_info.hpp | 2 +-
+ src/torrent_info.cpp                | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/libtorrent/torrent_info.hpp b/include/libtorrent/torrent_info.hpp
+index 8843179a2..add61c2d7 100644
+--- a/include/libtorrent/torrent_info.hpp
++++ b/include/libtorrent/torrent_info.hpp
+@@ -213,7 +213,7 @@ TORRENT_VERSION_NAMESPACE_4
+ 
+ 		// hidden
+ 		torrent_info& operator=(torrent_info const&) = delete;
+-		torrent_info& operator=(torrent_info&&) noexcept;
++		torrent_info& operator=(torrent_info&&);
+ 
+ 		// The file_storage object contains the information on how to map the
+ 		// pieces to files. It is separated from the torrent_info object as the
+diff --git a/src/torrent_info.cpp b/src/torrent_info.cpp
+index 0a4b90b04..6fe584c39 100644
+--- a/src/torrent_info.cpp
++++ b/src/torrent_info.cpp
+@@ -856,7 +856,7 @@ namespace {
+ TORRENT_VERSION_NAMESPACE_4
+ 
+ 	torrent_info::torrent_info(torrent_info const&) = default;
+-	torrent_info& torrent_info::operator=(torrent_info&&) noexcept = default;
++	torrent_info& torrent_info::operator=(torrent_info&&) = default;
+ 
+ #if TORRENT_ABI_VERSION < 4
+ 	void torrent_info::remap_files(file_storage const& f)
+-- 
+2.47.3
+
diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index 459edc1be5..d78f9ac206 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -1,8 +1,9 @@
-comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 8"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 comment "libtorrent-rasterbar needs exception_ptr"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
@@ -11,9 +12,10 @@ comment "libtorrent-rasterbar needs exception_ptr"
 config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	bool "libtorrent-rasterbar"
 	depends on BR2_INSTALL_LIBSTDCPP # boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # string_view
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
+	depends on BR2_USE_MMU # madvise()
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index 6b6175d9de..19f11665e6 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,4 @@
+# From https://github.com/arvidn/libtorrent/releases/tag/v2.1.1
+sha256  0f163516ecef2e3331500266751de3098835a3c3ae0c2290448046c632bc0e93  libtorrent-rasterbar-2.1.1.tar.gz
 # Locally calculated
-sha256  ccbf8e8c21dc81635de95166b498922b4725f9725a23b2cfe2a6b2fead6fb9fc  libtorrent-rasterbar-1.2.20.tar.gz
-sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
+sha256  f4b492afbde73d2f4e051050a619622876a13b77e7b8b6ea3ec2868a6929b31b  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 2cc24c487a..d71907b1be 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.20
+LIBTORRENT_RASTERBAR_VERSION = 2.1.1
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
@@ -13,10 +13,7 @@ LIBTORRENT_RASTERBAR_CPE_ID_VENDOR = libtorrent
 LIBTORRENT_RASTERBAR_CPE_ID_PRODUCT = libtorrent
 LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost
 LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
-LIBTORRENT_RASTERBAR_CONF_OPTS = \
-	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
-	--disable-invariant-checks
-LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
+LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
@@ -28,20 +25,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 LIBTORRENT_RASTERBAR_CXXFLAGS += -O0
 endif
 
-LIBTORRENT_RASTERBAR_CONF_OPTS += CXXFLAGS="$(LIBTORRENT_RASTERBAR_CXXFLAGS)"
-
-ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
-LIBTORRENT_RASTERBAR_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBTORRENT_RASTERBAR_CONF_OPTS += --with-libiconv
-else
-LIBTORRENT_RASTERBAR_CONF_OPTS += --without-libiconv
-endif
+LIBTORRENT_RASTERBAR_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBTORRENT_RASTERBAR_CXXFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBTORRENT_RASTERBAR_DEPENDENCIES += openssl
-LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-encryption
+LIBTORRENT_RASTERBAR_CONF_OPTS += -Dencryption=ON -Dwebtorrent=ON
 else
-LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-encryption
+LIBTORRENT_RASTERBAR_CONF_OPTS += -Dencryption=OFF -Dwebtorrent=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))

--===============7334366250568828225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7334366250568828225==--
