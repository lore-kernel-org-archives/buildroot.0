From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Nov 2013 09:08:14 +0100
Subject: [Buildroot] [PATCH] libcap-ng: disable on avr32 which lacks TLS
Message-ID: <1385107694-2132-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap-ng needs TLS support, which is not available on avr32.
Also, disable reverse dependencies.

Fixes:
  http://autobuild.buildroot.net/results/73c/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libcap-ng/Config.in | 1 +
 package/ofono/Config.in     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..da5b447 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	depends on !BR2_avr32 # lacks TLS
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index c431e08..2f4f2b9 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on !BR2_avr32 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-- 
1.8.4.2
