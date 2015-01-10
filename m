From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:19:50 +0100
Subject: [Buildroot] [PATCH v5] leveldb: new package
In-Reply-To: <1420823386-18874-1-git-send-email-ste@junkomatic.net>
References: <1420823386-18874-1-git-send-email-ste@junkomatic.net>
Message-ID: <20150110111950.45e3baf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve James,

Thanks for this new version!

On Fri,  9 Jan 2015 17:09:46 +0000, Steve James wrote:

> diff --git a/package/leveldb/002-facilitate-integration-into-buildroot.patch b/package/leveldb/002-facilitate-integration-into-buildroot.patch
> new file mode 100644
> index 0000000..c256f34
> --- /dev/null
> +++ b/package/leveldb/002-facilitate-integration-into-buildroot.patch
> @@ -0,0 +1,78 @@
> +From 83d4b0db22f661718e9568e8bcde549ad3fd4222 Mon Sep 17 00:00:00 2001
> +From: Steve James <ste@junkomatic.net>
> +Date: Fri, 9 Jan 2015 10:38:21 +0000
> +Subject: [PATCH 1/1] facilitate integration into Buildroot:
> +  - Add Buildroot TARGET_OS
> +  - Allow flags from the environment
> +  - Add install recipe

There are three different things being done, so it should be three
separate patches, especially for upstream submission.

However, I believe adding a Buildroot TARGET_OS is a mistake, and has
no chance of being merged upstream. Buildroot is not an OS. It builds
Linux based systems, so the existing TARGET_OS=Linux should work just
fine for Buildroot.

> +-CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
> +-CXXFLAGS += -I. -I./include $(PLATFORM_CXXFLAGS) $(OPT)
> ++override CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
> ++override CXXFLAGS += -I. -I./include $(PLATFORM_CXXFLAGS) $(OPT)
> + 
> +-LDFLAGS += $(PLATFORM_LDFLAGS)
> +-LIBS += $(PLATFORM_LIBS)
> ++override LDFLAGS += $(PLATFORM_LDFLAGS)
> ++override LIBS += $(PLATFORM_LIBS)

So this should be one patch.

> + 
> + LIBOBJECTS = $(SOURCES:.cc=.o)
> + MEMENVOBJECTS = $(MEMENV_SOURCES:.cc=.o)
> +@@ -229,3 +229,20 @@ else
> + .c.o:
> + 	$(CC) $(CFLAGS) -c $< -o $@
> + endif
> ++
> ++INSTALL_ROOT =
> ++INSTALL_PREFIX= usr
> ++
> ++install: $(SHARED) $(LIBRARY)
> ++	install -d -m 0755 $(INSTALL_ROOT)/$(INSTALL_PREFIX)/include/leveldb
> ++	install -D -m 0644 include/leveldb/*.h $(INSTALL_ROOT)/$(INSTALL_PREFIX)/include/leveldb
> ++	install -d -m 0755 $(INSTALL_ROOT)/$(INSTALL_PREFIX)/lib
> ++  ifneq (,$(LIBRARY))
> ++	install -m 0644 $(LIBRARY) $(INSTALL_ROOT)/$(INSTALL_PREFIX)/lib
> ++  endif
> ++  ifneq (,$(SHARED))
> ++	install -m 0755 $(SHARED3) $(INSTALL_ROOT)/$(INSTALL_PREFIX)/lib
> ++	ln -sf $(SHARED3) $(INSTALL_ROOT)/$(INSTALL_PREFIX)/lib/$(SHARED1)
> ++	ln -sf $(SHARED3) $(INSTALL_ROOT)/$(INSTALL_PREFIX)/lib/$(SHARED2)
> ++  endif

This should be another patch.

> ++    Buildroot)
> ++        PLATFORM=OS_LINUX
> ++        COMMON_FLAGS="$MEMCMP_FLAG -pthread -DOS_LINUX -DLEVELDB_PLATFORM_POSIX -DLEVELDB_ATOMIC_PRESENT"
> ++        PLATFORM_LDFLAGS="-pthread"
> ++        PLATFORM_CXXFLAGS="-std=c++0x"
> ++        PORT_FILE=port/port_posix.cc
> ++        CROSS_COMPILE=true
> ++        ;;

This should not be needed.

> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),)
> +# Dynamic library not required
> +LEVELDB_MAKE_ARGS += SHARED=
> +endif
> +
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),)
> +# Static library not required
> +LEVELDB_MAKE_ARGS += LIBRARY=
> +endif

I found this a bit odd to read, maybe:

# Disable the static library for shared only build
ifeq ($(BR2_SHARED_LIBS),y)
LEVELDB_MAKE_ARGS += LIBRARY=
endif

# Disable the shared library for static only build
ifeq ($(BR2_STATIC_LIBS),y)
LEVELDB_MAKE_ARGS += SHARED=
endif

is more readable.

> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)

Not needed, just call install unconditionally. It will install the
static library to $(TARGET_DIR), but that's not a problem, as it gets
removed afterwards by Buildroot anyway.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
