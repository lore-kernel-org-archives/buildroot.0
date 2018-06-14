From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Jun 2018 20:23:19 +0200
Subject: [Buildroot] [PATCH 1/1] tor: link with libatomic when needed
Message-ID: <20180614182319.19543-1-fontaine.fabrice@gmail.com>
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
 - http://autobuild.buildroot.net/results/0f7107d0b703223f567c6749722bc82c81a04d54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tor/tor.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f7af718b9b..fb02741d3a 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -47,6 +47,10 @@ endif
 # uses gnu extensions
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+TOR_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
+endif
+
 define TOR_INSTALL_CONF
 	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
 		$(TARGET_DIR)/etc/tor/torrc
-- 
2.14.1
