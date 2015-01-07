From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 10:12:18 +0100
Subject: [Buildroot] [PATCH v4] leveldb: new package
In-Reply-To: <1420469267-26272-1-git-send-email-ste@junkomatic.net>
References: <1420469267-26272-1-git-send-email-ste@junkomatic.net>
Message-ID: <20150107101218.22b5455f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve James,

On Mon,  5 Jan 2015 14:47:47 +0000, Steve James wrote:

> +comment "leveldb needs a toolchain w/ C++, threads"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)

I find it more natural to have

	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

> +LEVELDB_FLAGS += -DNDEBUG -I. -I./include -pthread -DOS_LINUX -DLEVELDB_PLATFORM_POSIX
> +LEVELDB_CFLAGS += $(LEVELDB_FLAGS) $(TARGET_CFLAGS)
> +LEVELDB_CXXFLAGS += $(LEVELDB_FLAGS) $(TARGET_CXXFLAGS) -std=c++0x
> +
> +LEVELDB_MAKE_ARGS += CFLAGS="$(LEVELDB_CFLAGS)" CXXFLAGS="$(LEVELDB_CXXFLAGS)"

I don't really like this solution, because you have to duplicate flags
from the leveldb Makefile into Buildroot, which isn't very future
proof. Instead, I would prefer:

 (1) A patch for leveldb that changes the CFLAGS, LDFLAGS, LIBS and
     CXXFLAGS line from:

       CFLAGS += ...

     to

       override CFLAGS += ...

     This way, we can pass CFLAGS and LDFLAGS in the environment, and
     leveldb Makefile can still add more flags.

     This patch can (should?) be submitted to leveldb upstream
     developers.

 (2) A simplification of leveldb.mk to remove all this complexity. I
     got it to work with the following change:

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 1612c9d..8688599 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -11,18 +11,9 @@ LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
 
-LEVELDB_FLAGS += -DNDEBUG -I. -I./include -pthread -DOS_LINUX -DLEVELDB_PLATFORM_POSIX
-LEVELDB_CFLAGS += $(LEVELDB_FLAGS) $(TARGET_CFLAGS)
-LEVELDB_CXXFLAGS += $(LEVELDB_FLAGS) $(TARGET_CXXFLAGS) -std=c++0x
-
-LEVELDB_MAKE_ARGS += CFLAGS="$(LEVELDB_CFLAGS)" CXXFLAGS="$(LEVELDB_CXXFLAGS)"
-
-# The lelveldb build has some basic autoconf-style behaviour.
-# We hard-wire it here to the right outcome for Buildroot
-LEVELDB_MAKE_ARGS += TARGET_OS=Linux
-
 define LEVELDB_BUILD_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LEVELDB_MAKE_ARGS) -C $(@D)
+       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+               OPT=-DNDEBUG TARGET_OS=Linux -C $(@D)
 endef
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)


> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define LEVELDB_INSTALL_STAGING_STATIC
> +	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a $(STAGING_DIR)/usr/lib
> +endef
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define LEVELDB_INSTALL_STAGING_SHARED
> +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib

Full path for the destination is needed:

							$(STAGING_DIR)/usr/lib/libleveldb.so.1.18

> +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
> +endef
> +endif
> +
> +define LEVELDB_INSTALL_STAGING_CMDS
> +	$(LEVELDB_INSTALL_STAGING_STATIC)
> +	$(LEVELDB_INSTALL_STAGING_SHARED)
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
> +	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h $(STAGING_DIR)/usr/include/leveldb

I'm not sure of the behavior of $(INSTALL) -D for multiple source files.

> +endef
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define LEVELDB_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
> +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so
> +endef
> +endif

It would be good to add a comment above all these installation rules to
indicate that the leveldb build system doesn't provide any "make
install" rule.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
