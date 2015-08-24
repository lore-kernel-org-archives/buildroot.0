From: Nathaniel Roach <nroach44@gmail.com>
Date: Mon, 24 Aug 2015 23:44:16 +0800
Subject: [Buildroot] [PATCH 3/3] package/libmbim: Now needs libgudev under
	systemd
In-Reply-To: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
References: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
Message-ID: <1440431056-25983-3-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmbim uses code (originally from udev) that has since
	been split from the main systemd codebase into libgudev.

Fixes: http://autobuild.buildroot.org/results/638/638dbf05b785a276a33983b0237b7cad54777b85/

Tweak the package files for libmbim to require libgudev
	when building with systemd.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/libmbim/Config.in  | 1 +
 package/libmbim/libmbim.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index bd34dd4..e79d51f 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBMBIM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 8d49f28..cfba08e 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -13,6 +13,10 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2 udev
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LIBMBIM_DEPENDENCIES += libgudev
+endif
+
 # we don't want -Werror
 LIBMBIM_CONF_OPTS = --enable-more-warnings=no
 
-- 
2.5.0
