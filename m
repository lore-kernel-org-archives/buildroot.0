From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:22 +0200
Subject: [Buildroot] [PATCH 042/100] libglib2: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-43-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/Config.in   | 1 -
 package/libglib2/libglib2.mk | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 62e29ef..ea946ba 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_PCRE
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 577dcec..eeceeee 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -101,8 +101,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system
 
 LIBGLIB2_DEPENDENCIES = \
-	host-pkgconf host-libglib2 host-gettext \
-	libffi pcre util-linux zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
+	host-pkgconf host-libglib2 \
+	libffi pcre util-linux zlib $(TARGET_NLS_DEPENDENCIES)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
 	host-gettext \
-- 
2.9.4
