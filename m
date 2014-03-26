From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 16:01:32 +0100
Subject: [Buildroot] [git commit] beecrypt: only build C++ support if
	dependencies are available
Message-ID: <20140326150517.4F60E9C3B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=205839d085508b83d9437f2fbe002ef076aa0cdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of automatically pulling in the (big) icu library if the toolchain
dependencies are available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/beecrypt/Config.in   |    7 -------
 package/beecrypt/beecrypt.mk |    2 +-
 2 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 8d63e5e..84754e5 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-	       !BR2_arc && !BR2_BINFMT_FLAT
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
@@ -10,8 +8,3 @@ config BR2_PACKAGE_BEECRYPT
 
 comment "beecrypt needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "beecrypt C++ support needs a toolchain w/ wchar"
-	depends on !BR2_arc
-	depends on !BR2_BINFMT_FLAT
-	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 223b44f..c77782c 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -22,7 +22,7 @@ BEECRYPT_CONF_OPT = \
 		--without-python \
 		--disable-openmp
 
-ifeq ($(BR2_PACKAGE_ICU),y)
+ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR)$(BR2_PACKAGE_ICU),yyy)
 # C++ support needs icu
 BEECRYPT_DEPENDENCIES += icu
 else
