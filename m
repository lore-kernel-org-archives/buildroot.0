From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Wed, 7 Jun 2017 12:12:07 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/libv4l: build of v4l2 utilities
	on noMMU platform
In-Reply-To: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
Message-ID: <1496830327-5235-3-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependencies on MMU, dynamic libraries and locale

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 package/libv4l/Config.in | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 4da0034..638aeff 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
@@ -21,7 +19,6 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
-	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
@@ -37,12 +34,8 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
-comment "libv4l-utils tools need a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
-
 endif
 
-comment "libv4l needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+comment "libv4l needs a toolchain w/ threads, C++ and headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.9.1
