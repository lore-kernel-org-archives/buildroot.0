From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 15:44:02 -0300
Subject: [Buildroot] [PATCH] libgpgme: handle argp-standalone
Message-ID: <1375296242-3252-1-git-send-email-gustavo@zacarias.com.ar>
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
 package/libgpgme/libgpgme.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index ee983df..7b71855 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -11,6 +11,12 @@ LIBGPGME_LICENSE = LGPLv2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
 
+# Handle argp-standalone or it errors out during build
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
+LIBGPGME_CONF_ENV += LIBS="-largp"
+LIBGPGME_DEPENDENCIES += argp-standalone
+endif
+
 # libgpgme, needs to know the gpg binary path on the target.
 LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
-- 
1.8.1.5
