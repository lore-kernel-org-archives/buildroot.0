From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed,  4 Mar 2015 22:02:15 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix a runtime bug (no text
	displayed in GUI) when an external glibc toolchain is used
Message-ID: <1425502935-18002-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Problem seen on Sourcery CodeBench ARM 2014.05 toolchain.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/kodi/Config.in |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 74aeb72..a6e1560 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -7,6 +7,13 @@ comment "kodi needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
+# Otherwise no text is displayed in user interface when compiled with an
+# external glibc toolchain (iconv_open() is required at runtime for UTF-8 to
+# UTF-32 conversion)
+comment "kodi needs an external glibc toolchain which copy gconv libraries"
+	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS && BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	depends on !BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
+
 config BR2_PACKAGE_KODI_EGL_GLES
 	bool
 	default y
-- 
1.7.9.5
