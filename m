From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2015 14:46:42 +0200
Subject: [Buildroot] [PATCH] package/beecrypt: fix C++ support
Message-ID: <1439642802-9968-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

C++ support unconditionally needs shared libraries; it uses
dlopen/dlsym.

Also, fix the conditions under which the comment is shown.

Finally, explicitly require C++ support when configuring.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/beecrypt/Config.in   | 6 ++++--
 package/beecrypt/beecrypt.mk | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index b9685ef..fc93a77 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -17,13 +17,15 @@ config BR2_PACKAGE_BEECRYPT_CPP
 	depends on BR2_USE_WCHAR # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_ARCH_HAS_ATOMICS # icu
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ICU
 	help
 	  Enable C++ support. This pulls in the (large) icu package.
 
-comment "C++ support needs a toolchain w/ wchar"
+comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries"
 	depends on !BR2_BINFMT_FLAT
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
 
 endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index cd0b4ac..e66cec1 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -19,6 +19,7 @@ BEECRYPT_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
+BEECRYPT_CONF_OPTS += --with-cplusplus
 else
 BEECRYPT_CONF_OPTS += --without-cplusplus
 
-- 
1.9.1
