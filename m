From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 18:34:39 +0200
Subject: [Buildroot] [PATCH] libcap-ng: doesn't build on AVR32,
	requires TLS support
Message-ID: <1381077279-19561-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap-ng doesn't build on AVR32, since it requires TLS support in the
compiler and C library.

Fixes:

  http://autobuild.buildroot.org/results/770/77061f301ba405a1607ce5bfa9e450182f0fdec5/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap-ng/Config.in | 2 ++
 package/ofono/Config.in     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..b799dc9 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	# tls support, needed by libcap-ng, not available on avr32
+	depends on !BR2_avr32
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 5d82170..729f15b 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on !BR2_avr32 # libcap-ng -> tls support
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-- 
1.8.1.2
