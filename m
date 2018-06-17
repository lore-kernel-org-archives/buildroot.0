From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 22:51:13 +0200
Subject: [Buildroot] [git commit] tor: link with libatomic when needed
Message-ID: <20180617204910.BA25E883BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1da7a8aed6a12eeb9ad7f3870a79be859e137f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following error occurs on architectures required to use gcc
libatomic for atomic intrinsics:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is for example the case on sparcv8 32 bit.

Fixes:

 http://autobuild.buildroot.net/results/0f7107d0b703223f567c6749722bc82c81a04d54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: use LIBS instead of LDFLAGS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tor/tor.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 39006e7caf..fe22633bf6 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -47,6 +47,10 @@ endif
 # uses gnu extensions
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+TOR_CONF_ENV += LIBS=-latomic
+endif
+
 define TOR_INSTALL_CONF
 	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
 		$(TARGET_DIR)/etc/tor/torrc
