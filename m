From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:25 +0200
Subject: [Buildroot] [PATCH 045/100] libuio: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-46-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuio/Config.in | 1 -
 package/libuio/libuio.mk | 9 ++-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/libuio/Config.in b/package/libuio/Config.in
index a96df54..97be1e3 100644
--- a/package/libuio/Config.in
+++ b/package/libuio/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBUIO
 	bool "libuio"
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libuio is a light-weight C programming library to handle UIO
 	  (Userspace I/O) device discovery and binding task.
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index bdd29e3..8f72253 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -10,6 +10,8 @@ LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
 LIBUIO_CONF_OPTS = --with-glib=no --without-werror
+LIBUIO_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+LIBUIO_LIBS = $(TARGET_NLS_LIBS)
 LIBUIO_INSTALL_STAGING = YES
 
 # Fetched from github, no pre-generated configure script provided
@@ -24,13 +26,6 @@ LIBUIO_DEPENDENCIES += argp-standalone
 LIBUIO_LIBS += -largp
 endif
 
-# libuio pulls in libintl if needed, so ensure we also
-# link against it, otherwise static linking fails
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-LIBUIO_DEPENDENCIES += gettext
-LIBUIO_LIBS += -lintl
-endif
-
 LIBUIO_CONF_ENV += LIBS="$(LIBUIO_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.9.4
