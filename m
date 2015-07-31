From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 31 Jul 2015 08:33:42 +0200
Subject: [Buildroot] [PATCHv6] package/golang: new package
In-Reply-To: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
References: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55BB16C6.6080007@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> From: Christian Stewart <christian@paral.in>
>
> This patch adds golang, the Go compiler-and-interpreter.
>
> We're adding a host package to get the golang cross-compiler, and a
> target package to get the golang interpreter on the target.
>
> It is to be noted that golang's buildsystem is going at great length to
> not do anything like any other buildsystem, and is full of little
> tricks.
>
> First-off, even though it generates code for the target, the host-variant
> does not need the toolchain; it has its own built-in code generator. Yet,
> building the target variant, the toolchain is indeed required. Weird...
>
> Second, it misdetects cross-compilation: it considers that if the target
> CPU and the build CPU are the same, then this is not cross-compilation.
> Of course, this is completely stupid and wrong. So, we need to patch it
> to override its insane heuristic.
>
> Third, even so, when the target CPU is the same as the build CPU, the
> resulting binaries will be dynamically linked, otherwise, they are
> statically linked. We can't even force it one way or the other...
> Instead, we mark it as requiring dynamic libraries, and let the golang
> ill buildsystem decide whether to do static or dynamic link; we can do
> so because any sane toolchain will always have the static variants of
> the libc and libpthread, which is all that golang requires anyway.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> [yann.morin.1998 at free.fr:
>   - add architecture-specific options
>   - needs dynamic linking
>   - fix licensing info
>   - fix tab-space indentation in patch 0003
>   - fix offset in patch 0001
>   - misc cleanups
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> ---
> Changes v4 -> v6;
>    - origin of hash  (Thomas)
>    - better indent commands  (Thomas)
>    - don't "deinstall" prior to installing  (Thomas)
>    - fix offset in patch 0001
>
> Changes v3 -> v4;
>    - adopted by Yann, worked on in concert with Christian
>    - lots of refactoring and cleanups
> ---
>   package/Config.in                                  |  1 +
>   package/golang/0001-add-no-march-option-gccp.patch | 21 ++++++
>   .../0002-remove-unnecessary-march-ld-flag.patch    | 29 ++++++++
>   package/golang/0003-fix-make-bash-script.patch     | 41 +++++++++++
>   package/golang/Config.in                           | 22 ++++++
>   package/golang/golang.hash                         |  2 +
>   package/golang/golang.mk                           | 84 ++++++++++++++++++++++
>   7 files changed, 200 insertions(+)
>   create mode 100644 package/golang/0001-add-no-march-option-gccp.patch
>   create mode 100644 package/golang/0002-remove-unnecessary-march-ld-flag.patch
>   create mode 100644 package/golang/0003-fix-make-bash-script.patch
>   create mode 100644 package/golang/Config.in
>   create mode 100644 package/golang/golang.hash
>   create mode 100644 package/golang/golang.mk
>

[...]

> diff --git a/package/golang/golang.mk b/package/golang/golang.mk
> new file mode 100644
> index 0000000..58d5847
> --- /dev/null
> +++ b/package/golang/golang.mk
> @@ -0,0 +1,84 @@
> +################################################################################
> +#
> +# GOLANG

This should be in lowercase.

Regards,
Jerzy

> +#
> +################################################################################
> +
> +GOLANG_VERSION = 1.4.2
> +GOLANG_SOURCE = go$(GOLANG_VERSION).src.tar.gz
> +GOLANG_SITE = https://storage.googleapis.com/golang
> +GOLANG_LICENSE = BSD-3c
> +GOLANG_LICENSE_FILES = LICENSE
> +
> +GOLANG = $(HOST_DIR)/usr/bin/go
> +GOLANGFMT = $(HOST_DIR)/usr/bin/gofmt
> +
> +GOLANG_ENV = \
> +	CC_FOR_TARGET="$(TARGET_CC)" \
> +	LD_FOR_TARGET="$(TARGET_LD)" \
> +	GOOS=linux
> +
> +ifeq ($(BR2_i386),y)
> +GOLANG_ARCH = 386
> +ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> +GOLANG_ENV += GO386=sse2
> +else
> +GOLANG_ENV += GO386=387
> +endif
> +endif # i386
> +
> +ifeq ($(BR2_x86_64),y)
> +GOLANG_ARCH = amd64
> +endif # x86_64
> +
> +# For ARM, the selection of the instruciton set is a bit unusual,
> +# and is decided on whether the CPU has an FPU, and which one.
> +ifeq ($(BR2_arm),y)
> +GOLANG_ARCH = arm
> +ifeq ($(BR2_ARM_CPU_HAS_VFPV3),y)
> +GOLANG_ENV += GOARM=7
> +else ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
> +GOLANG_ENV += GOARM=6
> +else
> +GOLANG_ENV += GOARM=5
> +endif
> +endif # arm
> +
> +GOLANG_ENV += GOARCH=$(GOLANG_ARCH)
> +
> +define GOLANG_BUILD_CMDS
> +	cd $(@D)/src/; \
> +		$(GOLANG_ENV) GOROOT_FINAL="/usr/lib/go" GO_NO_HOST=1 \
> +			./make.bash --no-banner
> +endef
> +
> +# We must install both the src/ and include/ subdirs because they
> +# contain the go "runtime".
> +define GOLANG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go $(TARGET_DIR)/usr/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt $(TARGET_DIR)/usr/bin/gofmt
> +	mkdir -p $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/src $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/include $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/pkg $(TARGET_DIR)/usr/lib/go/
> +endef
> +
> +define HOST_GOLANG_BUILD_CMDS
> +	cd $(@D)/src/ ; \
> +		$(GOLANG_ENV) GOROOT_FINAL="$(HOST_DIR)/usr/lib/go" GO_NO_TARGET=1 \
> +			./make.bash --no-banner
> +endef
> +
> +# We must install both the src/ and include/ subdirs because they
> +# contain the go "runtime"
> +define HOST_GOLANG_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/host/go $(HOST_DIR)/usr/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/host/gofmt $(HOST_DIR)/usr/bin/gofmt
> +	mkdir -p $(HOST_DIR)/usr/lib/go/
> +	cp -a $(@D)/src $(HOST_DIR)/usr/lib/go/
> +	cp -a $(@D)/include $(HOST_DIR)/usr/lib/go/
> +	cp -a $(@D)/pkg $(HOST_DIR)/usr/lib/go/
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
