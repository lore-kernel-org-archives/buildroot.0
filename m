From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 17 Feb 2020 08:09:20 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/fluentbit: new package
In-Reply-To: <20200217133806.21237-1-frank.vanbever@essensium.com>
References: <20200217133806.21237-1-frank.vanbever@essensium.com>
Message-ID: <CAMQcK5KdQkaC1B7RipsmEqW07BtROMgUbzC8qxNEzXWohDFiXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 17, 2020 at 7:38 AM Frank Vanbever
<frank.vanbever@essensium.com> wrote:

[...]

> diff --git a/package/fluent-bit/0001-lib-flb_libco-ppc-Fix-signature-for-co_create-API-18.patch b/package/fluent-bit/0001-lib-flb_libco-ppc-Fix-signature-for-co_create-API-18.patch
> new file mode 100644
> index 0000000000..350d7a2310
> --- /dev/null
> +++ b/package/fluent-bit/0001-lib-flb_libco-ppc-Fix-signature-for-co_create-API-18.patch
> @@ -0,0 +1,37 @@
> +From 731dab51a41d3635ceae5481d89d30148caac96d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 11 Feb 2020 19:36:21 -0800
> +Subject: [PATCH] lib: flb_libco: ppc: Fix signature for co_create API (#1886)
> +

Please site where this patch came from:

https://buildroot.org/downloads/manual/manual.html#_integrating_patches_found_on_the_web

> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/flb_libco/ppc.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/flb_libco/ppc.c b/lib/flb_libco/ppc.c
> +index e6536d56..533256b3 100644
> +--- a/lib/flb_libco/ppc.c
> ++++ b/lib/flb_libco/ppc.c
> +@@ -279,7 +279,9 @@ static uint32_t* co_create_(unsigned size, uintptr_t entry) {
> +   return t;
> + }
> +
> +-cothread_t co_create(unsigned int size, void (*entry_)(void)) {
> ++cothread_t co_create(unsigned int size, void (*entry_)(void),
> ++                     size_t *out_size) {
> ++
> +   uintptr_t entry = (uintptr_t)entry_;
> +   uint32_t* t = 0;
> +
> +@@ -325,7 +327,7 @@ cothread_t co_create(unsigned int size, void (*entry_)(void)) {
> +     t[10] = (uint32_t)(sp >> shift >> shift);
> +     t[11] = (uint32_t)sp;
> +   }
> +-
> ++  *out_size = size;
> +   return t;
> + }
> +
> +--
> +2.20.1
> +
> diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
> new file mode 100644
> index 0000000000..98efaa36ff
> --- /dev/null
> +++ b/package/fluent-bit/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_FLUENT_BIT
> +       bool "fluent-bit"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         Fluent Bit is an open source and multi-platform Log
> +         processor and forwarder which allows you to collect
> +         data/logs from different sources, unify and send them to
> +         multiple destinations.
> +
> +         http://fluentbit.io
> +
> +comment "fluent-bit needs a toolchain w/ C++, dynamic library"
> +       depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
> diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
> new file mode 100644
> index 0000000000..1a8e0d121c
> --- /dev/null
> +++ b/package/fluent-bit/fluent-bit.hash
> @@ -0,0 +1,3 @@
> +# computed locally
> +sha256  e897949356855e2a7d1a71085c7c21653b7792ef137d19d665e7b5dcd8e4d46a  fluent-bit-1.3.7.tar.gz
> +sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> new file mode 100644
> index 0000000000..c48d77a1fe
> --- /dev/null
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -0,0 +1,65 @@
> +################################################################################
> +#
> +# fluent-bit
> +#
> +################################################################################
> +
> +FLUENT_BIT_VERSION = 1.3.7
> +FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
> +FLUENT_BIT_LICENSE = Apache-2.0
> +FLUENT_BIT_LICENSE_FILE = LICENSE
> +
> +# LuaJIT and filter_lua do not support cross compilation
> +FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=OFF -DFLB_FILTER_LUA=OFF
> +
> +# Only build the daemon. Disable optional build of fluent-bit.so
> +FLUENT_BIT_CONF_OPTS += -DFLB_SHARED_LIB=OFF -DBUILD_SHARED_LIBS=OFF
> +
> +# Don't build the examples
> +FLUENT_BIT_CONF_OPTS += -DFLB_EXAMPLES=OFF
> +
> +# onigmo option does not support cross compilation
> +FLUENT_BIT_CONF_OPTS += -DFLB_PARSER=OFF -DFLB_REGEX=OFF
> +
> +# backtrace option does not support cross compilation
> +FLUENT_BIT_CONF_OPTS += -DFLB_BACKTRACE=OFF
> +
> +ifeq ($(BR2_PACKAGE_HOST_FLEX)$(BR2_PACKAGE_HOST_BISON),yy)
> +FLUENT_BIT_DEPENDENCIES += host-flex host-bison
> +FLUENT_BIT_CONF_OPTS += -DFLB_RECORD_ACCESSOR=ON -DFLB_STREAM_PROCESSOR=ON
> +else
> +FLUENT_BIT_CONF_OPTS += -DFLB_RECORD_ACCESSOR=OFF -DFLB_STREAM_PROCESSOR=OFF
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +FLUENT_BIT_DEPENDENCIES += musl-fts
> +FLUENT_BIT_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
> +endif
> +
> +# fts.h does not support _FILE_OFFSET_BITS=64 in glibc 2.22
> +FLUENT_BIT_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> +FLUENT_BIT_CXXFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CXXFLAGS))
> +
> +FLUENT_BIT_CONF_OPTS += -DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
> +                       -DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
> +
> +define FLUENT_BIT_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 0644 $(@D)/init/fluent-bit.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/fluent-bit.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf ../../../..//usr/lib/systemd/system/fluent-bit.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fluent-bit.service
> +endef
> +
> +# Install the default configuration files
> +define FLUENT_BIT_INSTALL_CONF
> +       mkdir -p $(TARGET_DIR)/etc/fluent-bit
> +       $(INSTALL) -m 0644 -D $(@D)/conf/fluent-bit.conf \
> +               $(TARGET_DIR)/etc/fluent-bit/fluent-bit.conf
> +       $(INSTALL) -m 0644 -D $(@D)/conf/plugins.conf \
> +               $(TARGET_DIR)/etc/fluent-bit/plugins.conf
> +endef
> +
> +FLUENT_BIT_POST_INSTALL_TARGET_HOOKS += FLUENT_BIT_INSTALL_CONF
> +
> +$(eval $(cmake-package))

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
