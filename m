From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Jun 2013 13:56:16 +0100
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
Message-ID: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Several object files are shared between the libbz2.so shared library
and the libbz2.a static one. MIPS will refuce to build a relocatable
object when creating a new shared library with the following error:

blocksort.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used
when making a shared object; recompile with -fPIC

This is because these files are build without -fPIC when creating the
static library and later on they are used to build the shared one.

This is easily fixed if we add the shared library build rule before
creating the static library so object files are always compiled with
-fPIC.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/bzip2/bzip2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 5f8c35e..c49109a 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -18,9 +18,9 @@ endef
 endif
 
 define BZIP2_BUILD_CMDS
+	$(BZIP2_BUILD_SHARED_CMDS)
 	$(TARGET_MAKE_ENV)
 		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover $(TARGET_CONFIGURE_OPTS)
-	$(BZIP2_BUILD_SHARED_CMDS)
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-- 
1.8.2.1
