From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 10:45:56 +0200
Subject: [Buildroot] [PATCH 4/9] package/ligpgme: don't use :=,
 use += and subst
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <c64f83a0e1c183cbf0e1c6cb49c1d907ac053707.1572079551.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes it more in-line with how we handle such case in the
rest of Buildroot.

Also, move the variable assignment before its use. Even though
in a makefile that does not matter, it makes it cleaner, more
logical, and easier to follow (for us petty humans).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgpgme/libgpgme.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 1a045862dd..1951cc6675 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -11,9 +11,14 @@ LIBGPGME_LICENSE = LGPL-2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
-LIBGPGME_LANGUAGE_BINDINGS = cl
 LIBGPGME_CONFIG_SCRIPTS = gpgme-config
 
+LIBGPGME_LANGUAGE_BINDINGS = cl
+# C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
+ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),yy)
+LIBGPGME_LANGUAGE_BINDINGS += cpp
+endif
+
 LIBGPGME_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
@@ -21,12 +26,7 @@ LIBGPGME_CONF_OPTS = \
 	--disable-gpgconf-test \
 	--disable-g13-test \
 	--disable-gpg-test \
-	--enable-languages=$(LIBGPGME_LANGUAGE_BINDINGS)
-
-# C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
-ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),yy)
-LIBGPGME_LANGUAGE_BINDINGS := $(LIBGPGME_LANGUAGE_BINDINGS),cpp
-endif
+	--enable-languages=$(subst $(space),$(comma),$(LIBGPGME_LANGUAGE_BINDINGS))
 
 # Handle argp-standalone or it errors out during build
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-- 
2.20.1
