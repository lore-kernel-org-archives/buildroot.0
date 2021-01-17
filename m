From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:29:58 +0100
Subject: [Buildroot] [git commit] package/zstd: build multithreaded library
 if supported
Message-ID: <20210117141124.3C349875F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52154e52069d20105f62191e6c9f903f188a5129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libzstd.so is built without multi-threading support by default.
The 'HAVE_THREAD' flag is not respected by lib/Makefile, only by
programs/Makefile.

Use the %-mt recipe in lib/Makefile to enable multithreading.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zstd/zstd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e26e67f46b..c3af9bd58c 100644
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
