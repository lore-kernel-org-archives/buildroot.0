From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Oct 2016 08:19:55 -0300
Subject: [Buildroot] [PATCH] libgpgme: improve language bindings
Message-ID: <1476357595-29340-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The C++ bindings require C++11 support with minimum gcc version 4.8, so
handle it accordingly.

The new python bindings require some work, but since they were
previously unavailable just disable them for now until someone is
interested in building/using them. Fixes:
http://autobuild.buildroot.net/results/685/6853c21aa084952bc232f0ec3e96dcb972d8fbfe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 7e86daf..c581a3c 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -11,6 +11,7 @@ LIBGPGME_LICENSE = LGPLv2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
+LIBGPGME_LANGUAGE_BINDINGS = cl
 
 # libgpgme, needs to know the gpg binary path on the target.
 LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
@@ -19,7 +20,13 @@ LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
 	--disable-gpgsm-test \
 	--disable-gpgconf-test \
 	--disable-g13-test \
-	--disable-gpg-test
+	--disable-gpg-test \
+	--enable-languages=$(LIBGPGME_LANGUAGE_BINDINGS)
+
+# C++ bindings require a C++11 capable gcc
+ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),yy)
+LIBGPGME_LANGUAGE_BINDINGS := $(LIBGPGME_LANGUAGE_BINDINGS),cpp
+endif
 
 # Handle argp-standalone or it errors out during build
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-- 
2.7.3
