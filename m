From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 10:50:22 +0100
Subject: [Buildroot] [PATCH v6] openblas: new package
In-Reply-To: <20160620172736.GB3502@free.fr>
References: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160620172736.GB3502@free.fr>
Message-ID: <57690DDE.8000404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, thanks you very much for your review. Below are some
comments, please keep scrolling.

On 20/06/16 18:27, Yann E. MORIN wrote:
> Vincent, All,
> 
> [Gah, you were too fast respinning after our IRC discussion, I said I
> did not yet do a complete review and that I was going to do one "soon".
> Here it is! ;-) ]
> 
> On 2016-06-20 17:45 +0100, Vicente Olivert Riera spake thusly:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
> [--SNIP--]
>> diff --git a/package/openblas/Config.in b/package/openblas/Config.in
>> new file mode 100644
>> index 0000000..08389e2
>> --- /dev/null
>> +++ b/package/openblas/Config.in
>> @@ -0,0 +1,62 @@
>> +config BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>> +	bool
>> +	default y if BR2_i386 || BR2_x86_64
>> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>> +	default y if BR2_sparc || BR2_sparc64
>> +	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
>> +
>> +config BR2_PACKAGE_OPENBLAS
>> +	bool "openblas"
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>> +	help
>> +	  An optimized BLAS library based on GotoBLAS2 1.13 BSD version.
>> +
>> +	  https://www.openblas.net/
>> +
>> +if BR2_PACKAGE_OPENBLAS
>> +
>> +config BR2_PACKAGE_OPENBLAS_TARGET
>> +	string "OpenBLAS target CPU"
>> +	# "Target Architecture Variant" matches
>> +	default "P2"           if BR2_x86_pentium2
>> +	default "KATMAI"       if BR2_x86_pentium3
>> +	default "NORTHWOOD"    if BR2_x86_pentium4
>> +	default "PRESCOTT"     if BR2_x86_prescott
>> +	default "BANIAS"       if BR2_x86_pentium_m
>> +	default "CORE2"        if BR2_x86_core2
>> +	default "NEHALEM"      if BR2_x86_corei7
>> +	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
>> +	default "HASWELL"      if BR2_x86_core_avx2
>> +	default "ATOM"         if BR2_x86_atom
>> +	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
>> +	default "OPTERON"      if BR2_x86_opteron
>> +	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
>> +	default "BARCELONA"    if BR2_x86_barcelona
>> +	default "STEAMROLLER"  if BR2_x86_steamroller
>> +	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
>> +	default "POWER4"       if BR2_powerpc_power4
>> +	default "POWER5"       if BR2_powerpc_power5
>> +	default "POWER6"       if BR2_powerpc_power6
>> +	default "POWER7"       if BR2_powerpc_power7
>> +	default "POWER8"       if BR2_powerpc_power8
>> +	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
>> +	default "PPC970"       if BR2_powerpc_970
>> +	default "PPC440"       if BR2_powerpc_440
>> +	default "PPC440FP2"    if BR2_powerpc_440fp
>> +	default "P5600"        if BR2_mips_32r2
>> +	default "SICORTEX"     if BR2_mips_64
>> +	default "I6400"        if BR2_mips_64r6
>> +	default "CORTEXA15"    if BR2_cortex_a15
>> +	default "CORTEXA9"     if BR2_cortex_a9
>> +	default "ARMV7"        if BR2_cortex_a5 || BR2_cortex_a7 || \
>> +	                          BR2_cortex_a8 || BR2_cortex_a9 || \
>> +				  BR2_cortex_a12 || BR2_cortex_a17
> 
> Incorrect indentation for the ARM variants.

Fixed.

> Also, cortex_a9 is duplicated for armv7: it already has its own entry.

Fixed.

> 
>> +	# "Target Architecture" matches
>> +	default "SSE_GENERIC"  if BR2_i386 || BR2_x86_64
> 
> Are you sure we want to default to "SSE_GENERIC" for i386? AFAIK, SSE
> arrived quite late in the x86 32-bit line; CPUs up to and including some
> of the pentiums do not have SSE.

Ok, SSE_GENERIC only for BR2_x86_64.

> For example i486, i586, x1000, i686, pentiumpro, pentium_mmx, pentium2,
> k6, k6_2 and athlon do not have SSE.
> 
> Is there an even lower "target CPU" that openBLAS knows of? Or should we
> just disable openBLAS for the aforementioned CPUs?
> 
> Note: I haven't looked at the other archs, but arm springs to mind too
> (what would be the value for armv4, armv5 or armv6? Should it also be
> disabled for those as well?)

So you want me to disable this package for every core we have in
Buildroot that doesn't have a matching OpenBLAS core?

> 
>> +	default "SPARC"        if BR2_sparc
>> +	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
>> +	help
>> +	  OpenBLAS target CPU
>> +
>> +endif
>> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
>> new file mode 100644
>> index 0000000..1fdb0ba
>> --- /dev/null
>> +++ b/package/openblas/openblas.hash
>> @@ -0,0 +1,2 @@
>> +# Locally calculated
>> +sha256 fa32d00dfca6b7e7580dbc8696daa5bf8fee4ad7771f52450ab9dc1e9c87fe73  openblas-a8fcd89d6d1666185c8c27ea46672b9897630f21.tar.gz
>> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
>> new file mode 100644
>> index 0000000..02dc361
>> --- /dev/null
>> +++ b/package/openblas/openblas.mk
>> @@ -0,0 +1,46 @@
>> +################################################################################
>> +#
>> +# openblas
>> +#
>> +################################################################################
>> +
>> +OPENBLAS_VERSION = a8fcd89d6d1666185c8c27ea46672b9897630f21
> 
> Why can't we use a release (quite recent, 0.2.18 was relased in April)?

Because there have been important changes for MIPS after that release.
In fact in the next respin I will use a more recent commit.

>> +OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
>> +OPENBLAS_LICENSE = BSD-3

I'll put BSD-3c here, thanks Baruch.

>> +OPENBLAS_LICENSE_FILES = LICENSE
>> +OPENBLAS_INSTALL_STAGING = YES
>> +
>> +# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
>> +# hidden symbol to our toolchain infrastructure
>> +OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
> 
> No need for += here, it's the first assignment.

No += for the fist assignment anymore.

>> +# Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
>> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_STATIC_LIBS),yx)
> 
> Nit-pick: I'd prefer we use ':' as a separator.
> 
> (We currently have both: 6 use 'x', 12 use ':', so I stand that we
> should use ':' ;-] But I won;t block just for that. ;-) )

Done.

>> +OPENBLAS_MAKE_OPTS += USE_THREAD=1
>> +else
>> +OPENBLAS_MAKE_OPTS += USE_THREAD=0
>> +endif
>> +
>> +# Static-only/Shared-only toggle
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +OPENBLAS_MAKE_OPTS += NO_SHARED=1
>> +else ifeq ($(BR2_SHARED_LIBS),y)
>> +OPENBLAS_MAKE_OPTS += NO_STATIC=1
>> +endif
> 
> What about BR2_SHARED_STATIC_LIBS ?
> 
> I guess in this case, you want to behave as for BR2_SHARED_LIBS (i.e.
> only build shared libs).

No, why? For BR2_SHARED_STATIC_LIBS I just want the default behavior
which will build both shared and static libraries.

>> +define OPENBLAS_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(OPENBLAS_MAKE_OPTS) \
>> +		CROSS=1 TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET) -C $(@D)
> 
> Move CROSS=1 and TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET) in OPENBLAS_MAKE_OPTS,
> so that they also get passed during install (for consistency).

Done.

>> +endef
>> +
>> +define OPENBLAS_INSTALL_STAGING_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
>> +		-C $(@D) install PREFIX=$(STAGING_DIR)/usr
>> +endef
> 
> On IRC, you said that it was "very unlikely" that there would be a
> package that depends on OpenBLAS in the future. So, what is the point in
> installing it to staging if no package will ever use it?

Forget about that, I didn't say anything :-)

> If you don;t plan on adding such a package in the future, no need to
> install into staging; we can very well add it at the time we add our
> first package that needs OpenBLAS.
> 
> Or do you have a hidden, unmentionable reason? ;-]

Well, it's a library so there may be other packages who will use it in
order to be built at some point. Is not the default policy to install
library packages to staging? I thought it was, but maybe I'm wrong.

Would it be so bad to install it to staging just in case someone wants
to develop a package which depends on OpenBLAS but for some reason that
package cannot be added to Buildroot upstream? That way the user will
not need to modify the OpenBLAS package in order to add the
install_staging line plus the install_target_cmds function.

>> +define OPENBLAS_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
>> +		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
>> +endef
>> +
>> +$(eval $(generic-package))
> 
> Well, they have a CMakelist.txt; why can't we use cmake-package?

For two reasons. The first one is that the official documentation uses
make in the installation guide.

The second one is this line in the CMakelist.txt file:

message(WARNING "CMake support is experimental. This will not produce
the same Makefiles that OpenBLAS ships with. Only x86 support is
currently available.")

Regards,

Vincent.

> 
>> -- 
>> 2.7.3
>>
> 
