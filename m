From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 09:20:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/openocd: fix fallout after no-C++
 fixups
In-Reply-To: <cover.1522480811.git.yann.morin.1998@free.fr>
References: <cover.1522480811.git.yann.morin.1998@free.fr>
Message-ID: <8162669309357bfbd684960e225b215ccd2abec1.1522480811.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
non-existent 'no' binary when C++ is not available in the toolchain.

However, some packages, like jimtcl as bundled in opeocd, really want to
find the binary that $CXX contains.

Revert openocd to use 'false' instead of 'no'.

Fixes:
    http://autobuild.buildroot.org/results/cbd/cbd5ab97fb0659968ff628461130627cf1745955/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/openocd/openocd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9d2576ceeb..548d8b81a0 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -11,7 +11,12 @@ OPENOCD_LICENSE = GPL-2.0+
 OPENOCD_LICENSE_FILES = COPYING
 # 0002-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
-OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
+# The bundled jimtcl really wants to find a existing $CXX, so feed it
+# false when we do not have one.
+OPENOCD_CONF_ENV = \
+	$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
+	CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
-- 
2.14.1
