Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DC8C43219
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F4885686;
	Sat, 11 Dec 2021 10:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7ppAnjObbpA; Sat, 11 Dec 2021 10:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C938568E;
	Sat, 11 Dec 2021 10:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CECB31BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C657F42364
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-E6Nt48gTeM for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:02:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C4942369
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 406388277E; Sat, 11 Dec 2021 09:56:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 10:56:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee3e17a7179a68c25b2a420ef7a26d3f3fba14c1
X-Git-Newrev: 82760316a1a98461d8c46f6fb5947a5fa8d037b4
X-Patchwork-Hint: ignore
Message-Id: <20211211095654.406388277E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thermald: bump to 2.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=82760316a1a98461d8c46f6fb5947a5fa8d037b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version).

Add new dependencies:
- host-autoconf-archive
- libevdev
- upower
- xz (liblzma)

Create a pre-configure hook to avoid this error when reconfiguring:
automake: error: cannot open < gtk-doc.make: No such file or directory
Based on the solution used in 178eb1d7ea165d87460224d297ce615bb63090f0.
During the build gtk-doc is already disabled by pkg-autotools.

Create a post-patch hook to avoid this error when reconfiguring:
aclocal: error: couldn't open directory 'm4': No such file or directory
Based on the solution used in 6bf74ce3dbfec8979e379bc1b919f29d09f0d87b.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...int-fix-32-bit-build-error-with-musl-v1.2.patch | 53 ----------------------
 package/thermald/Config.in                         | 17 +++++--
 package/thermald/thermald.hash                     |  2 +-
 package/thermald/thermald.mk                       | 28 +++++++++++-
 4 files changed, 41 insertions(+), 59 deletions(-)

diff --git a/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch b/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch
deleted file mode 100644
index db5bc99a91..0000000000
--- a/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 074575bf3640485ab6d43ae1efed3eff9cebae13 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Thu, 5 Mar 2020 13:45:57 +0800
-Subject: [PATCH] thd_trip_point: fix 32-bit build error with musl v1.2.0
-
-Error log:
- ../git/src/thd_trip_point.cpp: In member function 'bool cthd_trip_point::thd_trip_point_check(int, unsigned int, int, bool*)':
-| ../git/src/thd_trip_point.cpp:250:19: error: format '%ld' expects argument of type 'long int', but argument 6 has type 'time_t' {aka 'long long int'} [-Werror=format=]
-|   250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
-
-musl 1.2.0 have new feature:
-time_t is now 64-bit on all archs (not just 64-bit archs)
-
-Commit id:
-https://git.musl-libc.org/cgit/musl/commit/?id=38143339646a4ccce8afe298c34467767c899f51
-
-Release note link for musl 1.2.0:
-https://git.musl-libc.org/cgit/musl/diff/
-
-use %jd and typecast with intmax_t which is maximum width integer type
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-[Upstream: https://github.com/intel/thermal_daemon/commit/a7136682b9e6ebdb53c3c8b472bcd5039d62dc78.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/thd_trip_point.cpp | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/src/thd_trip_point.cpp b/src/thd_trip_point.cpp
-index 46f692d..6358c27 100644
---- a/src/thd_trip_point.cpp
-+++ b/src/thd_trip_point.cpp
-@@ -242,15 +242,9 @@ bool cthd_trip_point::thd_trip_point_check(int id, unsigned int read_temp,
- 				time_t tm;
- 				time(&tm);
- 				if ((tm - cdevs[i].last_op_time) < cdevs[i].sampling_priod) {
--#if defined __x86_64__ && defined __ILP32__
--					thd_log_info("Too early to act zone:%d index %d tm %lld\n",
-+					thd_log_info("Too early to act zone:%d index %d tm %jd\n",
- 							zone_id, cdev->thd_cdev_get_index(),
--							tm - cdevs[i].last_op_time);
--#else
--					thd_log_info("Too early to act zone:%d index %d tm %ld\n",
--							zone_id, cdev->thd_cdev_get_index(),
--							tm - cdevs[i].last_op_time);
--#endif
-+							(intmax_t)tm - cdevs[i].last_op_time);
- 					break;
- 				}
- 				cdevs[i].last_op_time = tm;
--- 
-2.29.2
-
diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index f32a4b274e..6d74a164b6 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -2,12 +2,18 @@ config BR2_PACKAGE_THERMALD
 	bool "thermald"
 	depends on BR2_i386 || BR2_x86_64 # needs <cpuid.h>
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_USE_WCHAR # upower -> libgudev
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # upower -> libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus, upower
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
+	depends on BR2_PACKAGE_HAS_UDEV # upower
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_UPOWER
+	select BR2_PACKAGE_XZ
 	help
 	  Thermal Daemon is a Linux daemon for monitoring and
 	  controlling platform temperatures. Once the system temperature
@@ -16,8 +22,13 @@ config BR2_PACKAGE_THERMALD
 
 	  https://01.org/linux-thermal-daemon
 
-comment "thermald needs a toolchain w/ C++, wchar, threads"
+comment "thermald needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+comment "thermald needs udev /dev management"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 34094ac8c0..0a37f0e413 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aaf5ffdc12344eef2417b41b433094bb30e4ebf321f0140b090f97bfcf24ea1f  thermald-1.9.1.tar.gz
+sha256  80c92902a89b72a9df85c51a8b5fc472cc01b4410600ef1f56d62c4ac23890c1  thermald-2.4.6.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 5619258c44..9b303104e3 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,17 +4,41 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 1.9.1
+THERMALD_VERSION = 2.4.6
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-THERMALD_DEPENDENCIES = dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
+THERMALD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+THERMALD_DEPENDENCIES = \
+	$(TARGET_NLS_DEPENDENCIES) \
+	host-autoconf-archive \
+	dbus \
+	dbus-glib \
+	libevdev \
+	libxml2 \
+	upower \
+	xz
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
 THERMALD_CPE_ID_VENDOR = intel
 THERMALD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+# avoid this error when reconfiguring:
+# automake: error: cannot open < gtk-doc.make: No such file or directory
+define THERMALD_GTK_DOC_HOOK
+	echo "CLEANFILES=" > $(@D)/gtk-doc.make
+endef
+THERMALD_PRE_CONFIGURE_HOOKS += THERMALD_GTK_DOC_HOOK
+
+# Autoreconf is missing the m4/ directory, which might actually be missing
+# iff it was the first argument, but unfortunately we are overriding the
+# first include directory above. Thus we need that hook here.
+define THERMALD_CREATE_M4
+	mkdir -p $(@D)/m4
+endef
+THERMALD_POST_PATCH_HOOKS += THERMALD_CREATE_M4
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 THERMALD_DEPENDENCIES += systemd
 THERMALD_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
