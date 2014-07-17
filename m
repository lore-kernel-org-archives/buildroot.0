From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:57:24 +0200
Subject: [Buildroot] [git commit] musl: work around gcc 4.9.x bug
Message-ID: <20140717185826.53B2F9D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3d5da651b7ceef1d7929dc7a72050f7207e0587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MUSL doesn't build happily with gcc 4.9.0/1 so work around the bug when
appropiate as suggested by upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 2278799..f15e797 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -18,6 +18,12 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# gcc constant folding bug with weak aliases workaround
+# See http://www.openwall.com/lists/musl/2014/05/15/1
+ifeq ($(BR2_GCC_VERSION_4_9_X),y)
+MUSL_EXTRA_CFLAGS += -fno-toplevel-reorder
+endif
+
 # We need to run the musl configure script prior to building the
 # gcc-intermediate, so that we can call the install-headers step and
 # get the crt<X>.o built. However, we need to call it again after
@@ -29,7 +35,7 @@ MUSL_INSTALL_STAGING = YES
 define MUSL_CONFIGURE_CALL
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+		CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS)) $(MUSL_EXTRA_CFLAGS)" \
 		CPPFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))" \
 		./configure \
 			--target=$(GNU_TARGET_NAME) \
