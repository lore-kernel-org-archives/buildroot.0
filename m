From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 15:59:46 -0300
Subject: [Buildroot] [PATCHv2] libgpgme: handle argp-standalone
Message-ID: <1375297186-25282-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgpgme has an internal implementation of argp parsing for when the
libc lacks such an implementation (i.e. uClibc).
However if it detects argp.h the internal implementation is disabled and
for a uClibc-based toolchain that breaks the build.
This happens when argp-standalone is installed since libgpgme never
tries to link to libargp.

Make it link against libargp, which also saves some target size. Fixes:
http://autobuild.buildroot.net/results/33c/33c5776d2b3f7fa276a27f7602eb71c4d77c7b62/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index ee983df..9995d91 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -10,6 +10,7 @@ LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
+LIBGPGME_DEPENDENCIES = libassuan libgpg-error

 # libgpgme, needs to know the gpg binary path on the target.
 LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
@@ -18,6 +19,11 @@ LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
 	--without-gpgsm \
 	--without-gpgconf \
 	--without-g13
-LIBGPGME_DEPENDENCIES = libassuan libgpg-error
+
+# Handle argp-standalone or it errors out during build
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
+LIBGPGME_CONF_ENV += LIBS="-largp"
+LIBGPGME_DEPENDENCIES += argp-standalone
+endif

 $(eval $(autotools-package))
--
1.8.1.5
