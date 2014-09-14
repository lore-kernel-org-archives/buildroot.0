From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 23:21:14 +0200
Subject: [Buildroot] [git commit] musl: two-stage gcc simplifications
Message-ID: <20140914214005.184729D42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f82c1db38cda62416bb2527dc79d8a6fe586f76e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After switching to a two stage gcc solution, there is no longer a need
to do weird things in the musl build, with certain things being done
twice (MUSL_CONFIGURE_CALL). Now the MUSL_CONFIGURE_CMDS variable only
does the configuration, and the MUSL_BUILD_CMDS only does the build,
as it should be.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk |   24 ++----------------------
 1 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 2eccb3d..2b366cf 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -18,15 +18,7 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
-# We need to run the musl configure script prior to building the
-# gcc-intermediate, so that we can call the install-headers step and
-# get the crt<X>.o built. However, we need to call it again after
-# gcc-intermediate has been built, otherwise the configure script
-# doesn't realize that libgcc has been built, and doesn't link the C
-# library properly with libgcc, which causes build failure down the
-# road. We will have the opportunity to simplify this once we switch
-# to a 2-steps gcc build.
-define MUSL_CONFIGURE_CALL
+define MUSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS)) $(MUSL_EXTRA_CFLAGS)" \
@@ -38,25 +30,13 @@ define MUSL_CONFIGURE_CALL
 			--disable-gcc-wrapper)
 endef
 
-define MUSL_CONFIGURE_CMDS
-	$(MUSL_CONFIGURE_CALL)
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) install-headers
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		crt/crt1.o crt/crti.o crt/crtn.o
-	cp $(@D)/crt/crt*.o $(STAGING_DIR)/usr/lib
-	$(TARGET_CROSS)gcc -nostdlib \
-		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
-endef
-
 define MUSL_BUILD_CMDS
-	$(MUSL_CONFIGURE_CALL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define MUSL_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) install-libs install-tools
+		DESTDIR=$(STAGING_DIR) install-libs install-tools install-headers
 endef
 
 # prefix is set to an empty value to get the C library installed in
