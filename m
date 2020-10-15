From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:43:12 +0200
Subject: [Buildroot] [git commit] package/mongrel2: bump to version 1.12.2
Message-ID: <20201015213150.030C782A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35425f7dbe6c8cf53a115d2a55ddb0dbea540dc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh second patch
- Drop third patch (already in version)
- An external mbedtls can be used since version 1.12.0 and
  https://github.com/mongrel2/mongrel2/commit/5be7fc9c90fd5c8caa233770b7e2cdff67b4bae2
  so use it with an upstream patch and drop
  MONGREL2_POST_CONFIGURE_HOOKS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix-Makefiles-for-cross-compilation.patch |  41 ++++----
 .../0003-Rename-symbol-to-prevent-conflict.patch   |  45 --------
 ...efinition-error-when-building-with-gcc10.patch} |   0
 .../0004-Support-urandom-inside-chroot.patch       | 113 +++++++++++++++++++++
 package/mongrel2/Config.in                         |   1 +
 package/mongrel2/mongrel2.hash                     |   5 +-
 package/mongrel2/mongrel2.mk                       |  21 +---
 7 files changed, 143 insertions(+), 83 deletions(-)

diff --git a/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
index 730d8ebfc0..1961f128ed 100644
--- a/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
+++ b/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
@@ -1,7 +1,7 @@
 From 298356c44a7df2b34c4e307c531d2010e2cb4b79 Mon Sep 17 00:00:00 2001
 From: Lionel Orry <lionel.orry@gmail.com>
 Date: Wed, 27 Mar 2013 15:56:56 +0100
-Subject: [PATCH 1/1] Fix Makefiles for cross-compilation
+Subject: [PATCH] Fix Makefiles for cross-compilation
 
 The CFLAGS handling in mongrel2 is really messy and it is hard to make
 it behave correctly with cross-compiling environments. This patch
@@ -10,6 +10,8 @@ restricts the Makefiles syntax to GNU Make, but help cross-compiling.
 This is not meant to be applied upstream.
 
 Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+[Fabrice: refresh for 1.12.2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile                      | 2 +-
  tools/config_modules/Makefile | 2 +-
@@ -19,57 +21,58 @@ Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
  5 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 6dce4a6..d48e05e 100644
+index 4e89c33..2f549a8 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -1,4 +1,4 @@
--CFLAGS=-g -O2 -Wall -Wextra -Isrc -Isrc/polarssl/include -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
-+override CFLAGS += -g -O2 -Wall -Wextra -Isrc -Isrc/polarssl/include -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
- LIBS=-lzmq -ldl -lsqlite3 $(OPTLIBS)
+@@ -1,5 +1,5 @@
+ CFLAGS?=-g -O2
+-CFLAGS += -Wall -Wextra -Wno-implicit-fallthrough -Wno-unused-const-variable -I./src -DNDEBUG -D_FILE_OFFSET_BITS=64 -pthread
++override CFLAGS += -Wall -Wextra -Wno-implicit-fallthrough -Wno-unused-const-variable -I./src -DNDEBUG -D_FILE_OFFSET_BITS=64 -pthread
+ CFLAGS += ${OPTFLAGS}
+ LIBS+=-lzmq -ldl -lsqlite3 -lmbedtls -lmbedx509 -lmbedcrypto
  PREFIX?=/usr/local
- 
 diff --git a/tools/config_modules/Makefile b/tools/config_modules/Makefile
-index 398490c..53f2255 100644
+index c2680d1..ada3169 100644
 --- a/tools/config_modules/Makefile
 +++ b/tools/config_modules/Makefile
 @@ -1,5 +1,5 @@
  PREFIX?=/usr/local
--CFLAGS=-I../../src -I../../src/polarssl/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
-+override CFLAGS += -I../../src -I../../src/polarssl/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
+-CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
++override CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
  LDFLAGS=$(OPTLIBS)
  
  MONGO_SRC = mongo-c-driver/src/bson.c \
 diff --git a/tools/filters/Makefile b/tools/filters/Makefile
-index f9f4556..6077b79 100644
+index 6505ad5..a968ef6 100644
 --- a/tools/filters/Makefile
 +++ b/tools/filters/Makefile
 @@ -1,5 +1,5 @@
  PREFIX?=/usr/local
--CFLAGS=-I../../src -I../../src/polarssl/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
-+ override CFLAGS += -I../../src -I../../src/polarssl/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
+-CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
++override CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
  LDFLAGS=$(OPTLIBS)
  
- all: null.so
+ all: null.so rewrite.so sendfile.so
 diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
-index b50d8a0..ba378c5 100644
+index b50d8a0..cc00062 100644
 --- a/tools/m2sh/Makefile
 +++ b/tools/m2sh/Makefile
 @@ -1,4 +1,4 @@
 -CFLAGS=-DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
-+override CFLAGS += -DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
++override CFLAGS=-DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
  LIBS=-lzmq -lsqlite3 ../../build/libm2.a $(OPTLIBS)
  
  PREFIX?=/usr/local
 diff --git a/tools/procer/Makefile b/tools/procer/Makefile
-index d0d7de0..629b2e9 100644
+index bb9aa31..d377f7f 100644
 --- a/tools/procer/Makefile
 +++ b/tools/procer/Makefile
 @@ -1,4 +1,4 @@
 -CFLAGS=-DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
-+override CFLAGS += -DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
++override CFLAGS=-DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
  PREFIX?=/usr/local
  LIBS?=-lzmq 
  SOURCES=$(wildcard *.c)
 -- 
-1.8.1.4
+2.27.0
 
diff --git a/package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch b/package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
deleted file mode 100644
index 83698164fd..0000000000
--- a/package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 8d0bc79f38913b1a55e7d151b32bbc9462c24b47 Mon Sep 17 00:00:00 2001
-From: Jason Miller <jason@jasom.org>
-Date: Fri, 14 Aug 2015 19:03:09 -0700
-Subject: [PATCH] Rename symbol to prevent conflict
-
-One of the standard headers defines max_align_t on some versions of linux.
-
-[Backported from upstream commit
-https://github.com/mongrel2/mongrel2/commit/563bac8c59b9b32205164d237cf1ec0cb48d189f.]
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- src/mem/align.h  | 2 +-
- src/mem/halloc.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/mem/align.h b/src/mem/align.h
-index 4c6e183..03a4999 100644
---- a/src/mem/align.h
-+++ b/src/mem/align.h
-@@ -30,7 +30,7 @@ union max_align
- 	void (*q)(void);
- };
- 
--typedef union max_align max_align_t;
-+typedef union max_align h_max_align_t;
- 
- #endif
- 
-diff --git a/src/mem/halloc.c b/src/mem/halloc.c
-index b097d1f..40d0c09 100644
---- a/src/mem/halloc.c
-+++ b/src/mem/halloc.c
-@@ -34,7 +34,7 @@ typedef struct hblock
- #endif
- 	hlist_item_t  siblings; /* 2 pointers */
- 	hlist_head_t  children; /* 1 pointer  */
--	max_align_t   data[1];  /* not allocated, see below */
-+	h_max_align_t   data[1];  /* not allocated, see below */
- 	
- } hblock_t;
- 
--- 
-2.1.4
-
diff --git a/package/mongrel2/0004-fix-multiple-definition-error-when-building-with-gcc10.patch b/package/mongrel2/0003-fix-multiple-definition-error-when-building-with-gcc10.patch
similarity index 100%
rename from package/mongrel2/0004-fix-multiple-definition-error-when-building-with-gcc10.patch
rename to package/mongrel2/0003-fix-multiple-definition-error-when-building-with-gcc10.patch
diff --git a/package/mongrel2/0004-Support-urandom-inside-chroot.patch b/package/mongrel2/0004-Support-urandom-inside-chroot.patch
new file mode 100644
index 0000000000..468ddb83fe
--- /dev/null
+++ b/package/mongrel2/0004-Support-urandom-inside-chroot.patch
@@ -0,0 +1,113 @@
+From 330e8c8352eb0ed3c178ac6e0102403c0a835492 Mon Sep 17 00:00:00 2001
+From: Jason Miller <jason@milr.com>
+Date: Thu, 5 Jul 2018 20:53:51 -0700
+Subject: [PATCH] Support urandom inside chroot
+
+This adds a new default entropy function that uses a /dev/urandom stream
+opened before the chroot.  If initializing that fails, it fallsback on
+HAVEGE only if HAVEGE is supported by the mbedTLS.
+
+This should remove the hard requirement on HAVEGE
+
+resolves #326
+resolves #327
+
+[Upstream status: https://github.com/mongrel2/mongrel2/pull/328]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mongrel2.c |  7 -------
+ src/server.c   | 36 +++++++++++++++++++++++-------------
+ 2 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/src/mongrel2.c b/src/mongrel2.c
+index da632d95..48ece8a5 100644
+--- a/src/mongrel2.c
++++ b/src/mongrel2.c
+@@ -404,13 +404,6 @@ void taskmain(int argc, char **argv)
+     rc = attempt_chroot_drop(srv);
+     check(rc == 0, "Major failure in chroot/droppriv, aborting."); 
+ 
+-    // set up rng after chroot
+-    // TODO: once mbedtls is updated, we can move this back into Server_create
+-    if(srv->use_ssl) {
+-        rc = Server_init_rng(srv);
+-        check(rc == 0, "Failed to initialize rng for server %s", bdata(srv->uuid));
+-    }
+-
+     final_setup();
+ 
+     taskcreate(tickertask, NULL, TICKER_TASK_STACK);
+diff --git a/src/server.c b/src/server.c
+index 45761db4..e44e199b 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -149,35 +149,45 @@ static int Server_load_ciphers(Server *srv, bstring ssl_ciphers_val)
+     return -1;
+ }
+ 
++static int urandom_entropy_func(void *data, unsigned char *output, size_t len)
++{
++    FILE* urandom = (FILE *)data;
++    size_t rc = fread(output, 1, len, urandom);
++
++    if (rc != len) return MBEDTLS_ERR_ENTROPY_SOURCE_FAILED;
++
++    return 0;
++}
++
+ int Server_init_rng(Server *srv)
+ {
+     int rc;
+-    unsigned char buf[MBEDTLS_ENTROPY_BLOCK_SIZE];
+     void *ctx = NULL;
+ 
+-    mbedtls_entropy_init( &srv->entropy );
++    FILE *urandom = fopen("/dev/urandom","r");
+ 
+-    // test the entropy source
+-    rc = mbedtls_entropy_func(&srv->entropy, buf, MBEDTLS_ENTROPY_BLOCK_SIZE);
+-
+-    if(rc == 0) {
++    if(urandom != NULL) {
+         ctx = calloc(sizeof(mbedtls_ctr_drbg_context), 1);
+ 
+         mbedtls_ctr_drbg_init((mbedtls_ctr_drbg_context *)ctx);
+         rc = mbedtls_ctr_drbg_seed((mbedtls_ctr_drbg_context *)ctx,
+-            mbedtls_entropy_func, &srv->entropy, NULL, 0);
++            urandom_entropy_func, urandom, NULL, 0);
+         check(rc == 0, "Init rng failed: ctr_drbg_init returned %d\n", rc);
+ 
+         srv->rng_func = mbedtls_ctr_drbg_random;
+         srv->rng_ctx = ctx;
+     } else {
+-        log_warn("entropy source unavailable. falling back to havege rng");
+ 
++#if defined(MBEDTLS_HAVEGE_C)
++        log_warn("entropy source unavailable. falling back to havege rng");
+         ctx = calloc(sizeof(mbedtls_havege_state), 1);
+         mbedtls_havege_init((mbedtls_havege_state *)ctx);
+-
+         srv->rng_func = mbedtls_havege_random;
+         srv->rng_ctx = ctx;
++#else
++        log_err("Unable to initialize urandom entropy source, and mbedTLS compiled without HAVEGE");
++        goto error;
++#endif
+     }
+ 
+     return 0;
+@@ -278,10 +288,10 @@ Server *Server_create(bstring uuid, bstring default_host,
+ 
+     // TODO: once mbedtls supports opening urandom early and keeping it open,
+     //   put the rng initialization back here (before chroot)
+-    //if(use_ssl) {
+-    //    rc = Server_init_rng(srv);
+-    //    check(rc == 0, "Failed to initialize rng for server %s", bdata(uuid));
+-    //}
++    if(use_ssl) {
++        rc = Server_init_rng(srv);
++        check(rc == 0, "Failed to initialize rng for server %s", bdata(uuid));
++    }
+ 
+     if(blength(chroot) > 0) {
+         srv->chroot = bstrcpy(chroot); check_mem(srv->chroot);
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index a9b09b786c..60fee6f96d 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_MONGREL2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on !BR2_STATIC_LIBS # uses dlopen()
 	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
+	select BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZEROMQ
 	help
diff --git a/package/mongrel2/mongrel2.hash b/package/mongrel2/mongrel2.hash
index b1db917c57..ea3a1cb426 100644
--- a/package/mongrel2/mongrel2.hash
+++ b/package/mongrel2/mongrel2.hash
@@ -1,3 +1,6 @@
+# From https://mongrel2.org
+sha1  6f81fa747a1e198d1a655c3677b6de686a5a51f7  mongrel2-v1.12.2.tar.bz2
+
 # Locally computed
-sha256  543553c3082f2b992649a975f6cb7324ae2aea93af05288ea4f2c1262a7f63b2  mongrel2-v1.9.2.tar.bz2
+sha256  3bffeae198c37a1efc9c12f77d5f1eb61cdf62b35d661babc2527dd030aa7d8f  mongrel2-v1.12.2.tar.bz2
 sha256  eb6e2a2baa637d06f6aa762886fbc8939934eb5fdb0b3a5b3882f2a61e9a4357  LICENSE
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 9a7f64a738..cbe7e3fb91 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -4,29 +4,14 @@
 #
 ################################################################################
 
-MONGREL2_VERSION = 1.9.2
+MONGREL2_VERSION = 1.12.2
 MONGREL2_SOURCE = mongrel2-v$(MONGREL2_VERSION).tar.bz2
 # Do not use the github helper here, the generated tarball is *NOT* the same
 # as the one uploaded by upstream for the release.
-MONGREL2_SITE = https://github.com/mongrel2/mongrel2/releases/download/$(MONGREL2_VERSION)
+MONGREL2_SITE = https://github.com/mongrel2/mongrel2/releases/download/v$(MONGREL2_VERSION)
 MONGREL2_LICENSE = BSD-3-Clause
 MONGREL2_LICENSE_FILES = LICENSE
-MONGREL2_DEPENDENCIES = sqlite zeromq
-
-define MONGREL2_POLARSSL_DISABLE_ASM
-	$(SED) '/^#define POLARSSL_HAVE_ASM/d' $(@D)/src/polarssl/include/polarssl/config.h
-endef
-
-# ARM in thumb mode breaks debugging with asm optimizations
-# Microblaze asm optimizations are broken in general
-# MIPS R6 asm is not yet supported
-ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
-MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
-else ifeq ($(BR2_microblaze),y)
-MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
-else ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
-endif
+MONGREL2_DEPENDENCIES = mbedtls sqlite zeromq
 
 define MONGREL2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
