From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:14:09 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] pinentry: link with
 libatomic when needed
Message-ID: <20180718210952.9E2877FFAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5053a263e10fbec8118f8248da36f699729bd411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:

 http://autobuild.buildroot.net/results/fd6bee70ff20bee9607a9f6f557a3a793d00cd9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: use LIBS instead of LDFLAGS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 265e25834f29f0852cea0004c307a8d9ea1f72ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/pinentry.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 4081a8a5d6..d0179728bd 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -18,6 +18,10 @@ PINENTRY_CONF_OPTS += \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--without-libcap       # requires PAM
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PINENTRY_CONF_ENV += LIBS=-latomic
+endif
+
 # build with X if available
 ifeq ($(BR2_PACKAGE_XORG7),y)
 PINENTRY_CONF_OPTS += --with-x
