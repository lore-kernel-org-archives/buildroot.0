From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 26 Mar 2014 18:40:54 +0100
Subject: [Buildroot] [PATCH] beecrypt: make a config option for C++ support
Message-ID: <1395855654-13145-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

beecrypt used to pull in icu automatically when C++ support was enabled,
but since icu is pretty large and slow, that automatic dependency was
removed.  However, it is not obvious to the user that he should enable
icu in order to get C++ support in beecrypt. Therefore, make the C++
support a user visible config option and mention icu in the help text.

It would also be possible to automatically enable C++ support if icu
happens to be selected for another reason, but that doesn't really seem
to offer an advantage.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/beecrypt/Config.in   | 23 +++++++++++++++++++++--
 package/beecrypt/beecrypt.mk |  3 +--
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 84754e5..462c8a6 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,3 +1,6 @@
+comment "beecrypt needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -6,5 +9,21 @@ config BR2_PACKAGE_BEECRYPT
 
 	  http://beecrypt.sf.net
 
-comment "beecrypt needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+if BR2_PACKAGE_BEECRYPT
+
+config BR2_PACKAGE_BEECRYPT_CPP
+	bool "C++ support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # icu
+	depends on !BR2_arc # icu
+	depends on !BR2_BINFMT_FLAT # icu
+	select BR2_PACKAGE_ICU
+	help
+	  Enable C++ support. This pulls in the (large) icu package.
+
+comment "C++ support needs a toolchain w/ wchar"
+	depends on !BR2_arc
+	depends on !BR2_BINFMT_FLAT
+	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+
+endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index c77782c..18087e0 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -22,8 +22,7 @@ BEECRYPT_CONF_OPT = \
 		--without-python \
 		--disable-openmp
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR)$(BR2_PACKAGE_ICU),yyy)
-# C++ support needs icu
+ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
 else
 BEECRYPT_CONF_OPT += --without-cplusplus
-- 
1.9.1
