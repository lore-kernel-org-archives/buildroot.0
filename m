Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1788C433FE
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:13:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E2A6112D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2E2A6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C60605D9;
	Sat,  6 Nov 2021 18:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtFXNtzXlFtj; Sat,  6 Nov 2021 18:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C3760632;
	Sat,  6 Nov 2021 18:13:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A28B1BF350
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5972F401F2
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ArJfJ8HCQwmE for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 18:13:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEC97401CF
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 18:13:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jQBvmczejueW5jQBvmpynZ; Sat, 06 Nov 2021 19:13:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636222404; bh=rrpZWZ2dkn3rnHdgxhmuVaEFzS9rCxkVHP0AHnz8Txo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Jz58RWIa1mKsfusARLqtesKni10vyA0pdDWNLqhQ7e+gI5yJ9QYFopwqlAFQgVbHI
 X5VrB10UPe7HwoUpFZkurRESJZWNa+wZdhyN3aGDlfBVE7djGo8vhcqpWoJWElldpv
 e73r4hUlB79Rw5cF1mcEvBsIhqu+B4K1xrsvxmIruDAF+/g1F6UODfqL/vxC/K0nJ0
 iZ8xeO5RY/hxG2OZWRLMISXpW61whOeuTtXNZkBGCUPr0n1+sLjl/lFu3ga1AKrZtU
 E2oStIg8MBcVCUmTSiJ7+pMg5eFV8RwUo4xEpgWlqr4vaCYKBKc540z5jwtsd9QGq9
 yTX7wmevITApQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 19:13:22 +0100
Message-Id: <20211106181322.302485-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEhfhO28+pgbYCMOl4bry1aFF6XeoStrg5x6AB42KvAym9iRUwGkYgeSehEIFvuIOkSn5lM8JNsvN9BiuylpQ9waXMv+9WNA11raMxluhQiUVdiuIDeW
 TotZ6+tERuzt3on9EIQKRJAQ1NWCFpJffLG1Zu+1xdHLYVq0nB1FKwFWtzhjDAjTVOC14Tp9WXGjTTBJdk3JK9J3ng3+j7u0NulNCTTwrwoedaGfWeIg4ROJ
 ltoK7fIGIn5G3rjnb1TFVwEAoaJKvD8lEMRJksZ5wkyPrm1Xddb3WLbCN9NDUSH6T4gOzRff4uYY6gviYXHMduF8fPw4iqBhdoCEUiQ04eRs9HB9j/fhMYYC
 Y04hfWK+flMjgNUvpwL3KmIiYDNQ0/4jwqxEavc6bfd5fMR6dVz3tG3T/xZnkATTG5JCdYZAPZvahlKVU379D82jXrz1vMjzxHVbtmAwn3QYamz6nHKGmf8s
 Juy+S/Z2xlY7ks18
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.1.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Peter Seiderer <ps.report@gmx.net>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 3.1.0 by:
- adding upstream patch[1] to prevent build failure on 32-bit arm
- requiring BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 instead of _4_8 in this
package taking care of reverse dependencies, since now harfbuzz requires
gcc 4.9 to be built successfully.

[1]: https://github.com/harfbuzz/harfbuzz/commit/07dc34bdaf977a3be97ab5a68455ed7a67f80a06

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-around-GCC-cast-align-error-warning.patch | 35 +++++++++++++++++++
 package/harfbuzz/Config.in                    |  6 ++--
 package/harfbuzz/harfbuzz.hash                |  2 +-
 package/harfbuzz/harfbuzz.mk                  |  2 +-
 package/libass/Config.in                      |  6 ++--
 package/mupdf/Config.in                       |  6 ++--
 package/pango/Config.in                       |  2 +-
 package/qt5/qt5base/Config.in                 |  2 +-
 package/supertuxkart/Config.in                |  2 +-
 9 files changed, 49 insertions(+), 14 deletions(-)
 create mode 100644 package/harfbuzz/0002-mutex-Try-work-around-GCC-cast-align-error-warning.patch

diff --git a/package/harfbuzz/0002-mutex-Try-work-around-GCC-cast-align-error-warning.patch b/package/harfbuzz/0002-mutex-Try-work-around-GCC-cast-align-error-warning.patch
new file mode 100644
index 0000000000..965205c9d1
--- /dev/null
+++ b/package/harfbuzz/0002-mutex-Try-work-around-GCC-cast-align-error-warning.patch
@@ -0,0 +1,35 @@
+From 07dc34bdaf977a3be97ab5a68455ed7a67f80a06 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 5 Nov 2021 14:45:20 -0700
+Subject: [PATCH] [mutex] Try work around GCC cast-align error/warning
+
+Shouldn't be needed because of the alignas(). Oh well...
+
+Might fix https://github.com/harfbuzz/harfbuzz/issues/3283
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/hb-mutex.hh | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/hb-mutex.hh b/src/hb-mutex.hh
+index 4e135027f..6914b2245 100644
+--- a/src/hb-mutex.hh
++++ b/src/hb-mutex.hh
+@@ -97,10 +97,13 @@ struct hb_mutex_t
+   /* Create space for, but do not initialize m. */
+   alignas(hb_mutex_impl_t) char m[sizeof (hb_mutex_impl_t)];
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wcast-align"
+   void init   () { hb_mutex_impl_init   ((hb_mutex_impl_t *) m); }
+   void lock   () { hb_mutex_impl_lock   ((hb_mutex_impl_t *) m); }
+   void unlock () { hb_mutex_impl_unlock ((hb_mutex_impl_t *) m); }
+   void fini   () { hb_mutex_impl_finish ((hb_mutex_impl_t *) m); }
++#pragma GCC diagnostic pop
+ };
+ 
+ struct hb_lock_t
+-- 
+2.25.1
+
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 8bc88f4284..2e4219ee22 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -11,7 +11,7 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.8"
+comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 97fc5a2c5f..cf81f6634a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9  harfbuzz-3.0.0.tar.xz
+sha256  2359390944a74a933d2b1bd214754a5b3f817916a09c6d4ca3d263473cf19b8e  harfbuzz-3.1.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 4534d166ef..f3ec3887d6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.0.0
+HARFBUZZ_VERSION = 3.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
diff --git a/package/libass/Config.in b/package/libass/Config.in
index 803f6b4438..d7725d5e1b 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBASS
 	bool "libass"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_LIBFRIBIDI
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBASS
 
 	  https://github.com/libass/libass
 
-comment "libass needs a toolchain w/ C++, gcc >= 4.8"
+comment "libass needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index ff176f4b99..cf97711160 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MUPDF
 	bool "mupdf"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GUMBO_PARSER
@@ -18,7 +18,7 @@ config BR2_PACKAGE_MUPDF
 
 	  https://www.mupdf.com/index.html
 
-comment "mupdf needs a toolchain w/ C++, gcc >= 4.8"
+comment "mupdf needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/pango/Config.in b/package/pango/Config.in
index cf5170c8f3..ff529ab0dc 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e93b2dec38..a328190a98 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -237,7 +237,7 @@ config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
 		BR2_TOOLCHAIN_HAS_SYNC_4 && \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  This option enables HarfBuzz support (either system harfbuzz
 	  if the toolchain supports __sync for 4 bytes, or the qt
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 8af006d632..a18b9c1a0a 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz, openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
