From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 17 Sep 2018 11:29:00 -0700
Subject: [Buildroot] [PATCH] systemd: Allow building with no init system
Message-ID: <20180917182900.15902-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's possible to build systemd, and use the systemd libraries, on a
target with no init system.

While installing systemd when trying to use SysV init will result in
systemd clobbering the SysV system and vice versa, it may well work when
no init system has been selected.  For instance, when building an SDK
the sytemd headers and libraries might be necessary but there is no
reason to have an init system selected.  Someone creating a custom init
system might also want some of the systemd libraries.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c858d89c05..71d37f6a5a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_INIT_SYSTEMD
+	depends on BR2_INIT_SYSTEMD || BR2_INIT_NONE
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
-- 
2.14.4
