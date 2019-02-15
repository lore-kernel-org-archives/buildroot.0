From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Feb 2019 23:01:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: link with libatomic when
 needed
Message-ID: <20190215220110.13519-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/a442734c570e4a02854014d831ba3aab9f592430

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
