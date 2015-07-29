From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 23:12:28 +0200
Subject: [Buildroot] [PATCH] package/golang: new package
In-Reply-To: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
References: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150729231228.0a59fcde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 29 Jul 2015 22:35:01 +0200, Yann E. MORIN wrote:

> diff --git a/package/golang/golang.hash b/package/golang/golang.hash
> new file mode 100644
> index 0000000..146e39c
> --- /dev/null
> +++ b/package/golang/golang.hash
> @@ -0,0 +1 @@

Origin of the hash?

> +GOLANG_ARCH =

Defining a variable to nothing is not very useful I believe.

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

Are you sure using VFPV3/VFPV2 is correct here? Looking at the GOARM
values, it seems really like you're trying to check if we're building
for ARMv5, ARMv6 or ARMv7. So what about using BR2_ARM_CPU_ARMV5,
BR2_ARM_CPU_ARMV6 and BR2_ARM_CPU_ARMV7 instead ?

> +define GOLANG_BUILD_CMDS
> +	cd $(@D)/src/; \
> +	$(GOLANG_ENV) \
> +	GOROOT_FINAL="/usr/lib/go" \
> +	GO_NO_HOST=1 \
> +	./make.bash --no-banner

Indent the lines after the cd, maybe, and do not excessively split
lines.

	cd $(@D)/src && \
		$(GOLANG_ENV) GOROOT_FINAL="/usr/lib/go" GO_NO_HOST=1 \
			./make.bash --no-banner

> +# We must install both the src/ and include/ subdirs because they
> +# contain the go "runtime".
> +define GOLANG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go $(TARGET_DIR)/usr/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt $(TARGET_DIR)/usr/bin/gofmt
> +	rm -rf $(TARGET_DIR)/usr/lib/go/

Why this rm -rf ?

> +	mkdir -p $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/src $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/include $(TARGET_DIR)/usr/lib/go/
> +	cp -a $(@D)/pkg $(TARGET_DIR)/usr/lib/go/
> +endef
> +
> +define HOST_GOLANG_BUILD_CMDS
> +	cd $(@D)/src/ ; \
> +	$(GOLANG_ENV) \
> +	GOROOT_FINAL="$(HOST_DIR)/usr/lib/go" \
> +	GO_NO_TARGET=1 \
> +	./make.bash --no-banner

Ditto above.

> +endef
> +
> +# We must install both the src/ and include/ subdirs because they
> +# contain the go "runtime"
> +define HOST_GOLANG_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/host/go $(HOST_DIR)/usr/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/host/gofmt $(HOST_DIR)/usr/bin/gofmt
> +	rm -rf $(HOST_DIR)/usr/lib/go/
> +	mkdir -p $(HOST_DIR)/usr/lib/go/
> +	cp -a $(@D)/src $(HOST_DIR)/usr/lib/go/
> +	cp -a $(@D)/include $(HOST_DIR)/usr/lib/go/
> +	cp -a $(@D)/pkg $(HOST_DIR)/usr/lib/go/
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
