From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Jun 2018 20:02:04 +0200
Subject: [Buildroot] [PATCH 1/1] pinentry: link with libatomic when needed
Message-ID: <20180614180204.17438-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following errors might occur on architectures required to use gcc
libatomics:
sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding
symbols: DSO missing from command line

This is often the case for sparcv8 32 bit toolchains.

See d28591a2ee39704f6795c8aa1d0a3db7e909facc,
55a9d6d55888b04ec6c476399e5b98a2412995f5 and
03f6e005e6a9617767b24a9026da9477848020cc.

Fixes:
 - http://autobuild.buildroot.net/results/fd6bee70ff20bee9607a9f6f557a3a793d00cd9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pinentry/pinentry.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 4081a8a5d6..8911562db9 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -18,6 +18,10 @@ PINENTRY_CONF_OPTS += \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--without-libcap       # requires PAM
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PINENTRY_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
+endif
+
 # build with X if available
 ifeq ($(BR2_PACKAGE_XORG7),y)
 PINENTRY_CONF_OPTS += --with-x
-- 
2.14.1
