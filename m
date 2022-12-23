Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7EEC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 13:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11C9F40469;
	Fri, 23 Dec 2022 13:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11C9F40469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aGTWF8mY_ng; Fri, 23 Dec 2022 13:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9BB9405CA;
	Fri, 23 Dec 2022 13:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9BB9405CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10A981BF289
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 13:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4F1607FF
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 13:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED4F1607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgFQZoVtxIjf for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 13:35:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BCC61012
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37BCC61012
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 13:35:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 208EC1814B9; Fri, 23 Dec 2022 14:35:00 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 14:34:00 +0100
Message-Id: <20221223133401.97844-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1671802503; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=y5kXdF8/Oz3KuHXH9vIaY/fFCjavjpYBCYgMJZ1uljg=;
 b=gAqypkSlmc5OC82c9cuvkLW4qkSiU5V0DLZFT+XadIIMBq7ot62sKswJHjjX2T1BKiPbCA
 fC3BWi/sgrFVM/EEVaezZwK7M/jkyh4ZmA+uiMffdgXKQ5oxtr7ryCb5pWGptTPt4pH7NW
 LyFfWijZT4lirGR8djcOmGQAPgNDwsk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=gAqypkSl
Subject: [Buildroot] [PATCH v2] package/boost: Boost.Atomic needs atomic
 intrinsics
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Urquiza <fabiorush@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael <buildroot@heine.tech>

similar to previous problems with nios2 and not-available atomic ints
the build for Boost.Atomics also fails for ARC Targets which don't
have the ATOMICS_EXT flag set.

according to [0] "Boost.Atomic has a hard requirement of the native
atomic operations on bytes". The same tests mentioned there fail for
ARC.

so introduce a dependency on BR2_ARC_ATOMIC_EXT for BR2_arc.

add depends clause for all packages using boost-atomic/filesystem.

Fixes:
  http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493

[0] https://github.com/boostorg/atomic/issues/42#issuecomment-734130348

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

I'm not 100% sure if BR2_ARC_ATOMIC_EXT is the correct
flag to use. I'm open to suggestions for better ways and what to
propagate to dependent packages.
---
 package/bitcoin/Config.in       | 1 +
 package/boost/Config.in         | 4 ++++
 package/botan/Config.in         | 4 ++--
 package/cc-tool/Config.in       | 2 ++
 package/domoticz/Config.in      | 4 +++-
 package/gnuradio/Config.in      | 1 +
 package/gqrx/Config.in          | 1 +
 package/i2pd/Config.in          | 3 +++
 package/libcpprestsdk/Config.in | 1 +
 package/log4cxx/Config.in       | 1 +
 package/mongodb/Config.in       | 1 +
 package/osm2pgsql/Config.in     | 2 ++
 package/pulseview/Config.in     | 2 ++
 package/supertux/Config.in      | 2 ++
 package/uhd/Config.in           | 2 ++
 15 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index a344811d6b..d46e8df9bc 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
diff --git a/package/boost/Config.in b/package/boost/Config.in
index b99b01f22e..d06f164a39 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -19,6 +19,7 @@ if BR2_PACKAGE_BOOST
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	help
 	  C++11-style atomic<>.
 
@@ -108,6 +109,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -129,6 +131,7 @@ comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
@@ -200,6 +203,7 @@ config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
diff --git a/package/botan/Config.in b/package/botan/Config.in
index 8f7f3f5c7a..9c35484275 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -18,8 +18,8 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
-	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
+	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	help
 	  Botan is a crypto library for C++
 
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index fa5674b36d..5dca40cbbb 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CC_TOOL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on BR2_USE_WCHAR # boost-filesystem
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
@@ -20,6 +21,7 @@ config BR2_PACKAGE_CC_TOOL
 
 comment "cc-tool needs a toolchain w/ C++, threads, wchar, gcc >= 4.9 "
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 85361eecf0..bb4e49bf9a 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -8,7 +8,8 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_3
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-atomic
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
@@ -36,6 +37,7 @@ config BR2_PACKAGE_DOMOTICZ
 comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 103175946c..3766470cf7 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index adcdbb0896..fd4274f3a0 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index c1ba08ef75..6076d43837 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_I2PD
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
@@ -30,6 +31,7 @@ comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
 
@@ -37,4 +39,5 @@ comment "i2pd needs exception_ptr"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index e533b30393..58818978d7 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_BOOST
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 27a5f06988..34e54e90be 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LOG4CXX
 	depends on BR2_USE_MMU # apr
 	depends on BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 1ea4282573..4053e4dbdb 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	default y if BR2_aarch64 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index e903e92c49..834cfb5a93 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OSM2PGSQL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on BR2_USE_WCHAR # boost, libosmium
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST
@@ -24,6 +25,7 @@ config BR2_PACKAGE_OSM2PGSQL
 
 comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index f122551b9f..0bec0594ab 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libsigrok->libzip
@@ -34,6 +35,7 @@ comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library,
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index e8e96a3ae5..62d2d67c7b 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SUPERTUX
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_USE_WCHAR # Boost
@@ -40,6 +41,7 @@ comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 6, NPTL, dynamic l
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 75554259d0..4514c9529b 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -1,6 +1,7 @@
 comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -12,6 +13,7 @@ config BR2_PACKAGE_UHD
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT) # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
