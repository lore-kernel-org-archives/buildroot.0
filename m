From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Mar 2019 16:22:12 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/botan: link with
 libatomic when needed
Message-ID: <20190315151950.199138EF90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fdb9492039632585e38234b6ee7367197f574ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

On some architectures, atomic built-ins are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/a442734c570e4a02854014d831ba3aab9f592430

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ae7ba64501a7f2bb80dd5b2ea99fae747cc8b1eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e07b786c85..a96a12178b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -17,9 +17,16 @@ BOTAN_CONF_OPTS = \
 	--os=linux \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)" \
+	--ldflags="$(BOTAN_LDFLAGS)" \
 	--prefix=/usr \
 	--without-documentation
 
+BOTAN_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+BOTAN_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_SHARED_LIBS),y)
 BOTAN_CONF_OPTS += \
 	--disable-static-library \
