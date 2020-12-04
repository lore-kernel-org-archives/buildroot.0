From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  4 Dec 2020 10:57:01 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/zstd: build multithreaded library
 if supported
Message-ID: <20201204095703.4714-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

libzstd.so is built without multi-threading support by default.
The 'HAVE_THREAD' flag is not respected by lib/Makefile, only by
programs/Makefile.

Use the %-mt recipe in lib/Makefile to enable multithreading.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: split off of next patch

 package/zstd/zstd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 35002da332..37c1a8d687 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -48,6 +48,14 @@ ZSTD_BUILD_LIBS = libzstd.a libzstd
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
+# The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
+# one. Building a multi-threaded binary with a library (which defaults to
+# single-threaded) gives a runtime error when compressing files.
+# The 'lib' makefile provides specific '%-mt' targets for this purpose.
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+endif
+
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
-- 
2.26.2
