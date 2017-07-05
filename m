From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  5 Jul 2017 19:23:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gnuradio: link with libatomic
	when needed
Message-ID: <20170705172301.2634-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/528/52825918bf65b23241cd68d99513350703469294/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: use CMAKE_EXE_LINKER_FLAGS instead of CMAKE_C_FLAGS (Thomas)
v2: fix typo CMAKE_CXX_FLAGS -> CMAKE_C_FLAGS (Thomas)

 package/gnuradio/gnuradio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 6407dd4f8..a55c11611 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -30,6 +30,10 @@ GNURADIO_CONF_OPTS = \
 # compile time.
 GNURADIO_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Yes, this is silly, because -march is already known by the compiler
 # with the internal toolchain, and passed by the external wrapper for
 # external toolchains. Nonetheless, gnuradio does some matching on the
-- 
2.11.0
