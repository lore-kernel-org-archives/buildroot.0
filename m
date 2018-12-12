From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 12 Dec 2018 10:24:14 +0100
Subject: [Buildroot] [PATCH v2 1/5] boot/optee-os: new package
In-Reply-To: <20181210224606.36e6ad5e@windsurf>
References: <1542990817-28362-1-git-send-email-etienne.carriere@linaro.org>
 <20181210224606.36e6ad5e@windsurf>
Message-ID: <CAN5uoS8DS+bxnMdS1jAY_Xs_xWoxu+X7ESCTNgF5xNm4=rMpoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Dec 2018 at 22:46, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> Thanks for this second iteration, and thanks for submitting OPTEE to
> Buildroot, this would be a very useful addition. I now took the time to
> look into it, and I have a few questions.
>

Hello Thomas,

Thanks for spending time on this.

To sump up, I agree with most comments and will push a v3 to fix the issues.
Thanks for all the suggestions and directives on BR files style and ways.

Please find some answers below, the main issue I think is the 32b/64b
dual support.
And also a short note on test configs.

regards,
etienne

> On Fri, 23 Nov 2018 17:33:33 +0100, Etienne Carriere wrote:
>
> > diff --git a/boot/Config.in b/boot/Config.in
> > index 8e0c8e5..cd14731 100644
> > --- a/boot/Config.in
> > +++ b/boot/Config.in
> > @@ -13,6 +13,7 @@ source "boot/gummiboot/Config.in"
> >  source "boot/lpc32xxcdl/Config.in"
> >  source "boot/mv-ddr-marvell/Config.in"
> >  source "boot/mxs-bootlets/Config.in"
> > +source "boot/optee-os/Config.in"
> >  source "boot/riscv-pk/Config.in"
> >  source "boot/s500-bootloader/Config.in"
> >  source "boot/syslinux/Config.in"
> > diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> > new file mode 100644
> > index 0000000..7a598c6
> > --- /dev/null
> > +++ b/boot/optee-os/Config.in
> > @@ -0,0 +1,100 @@
> > +config BR2_TARGET_OPTEE_OS
> > +     bool "optee_os"
> > +     depends on BR2_aarch64 || BR2_ARM_CPU_ARMV7A
>
> Shouldn't this be:
>
>         depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
>
> indeed, with depends on BR2_aarch64 || BR2_ARM_CPU_ARMV7A, you don't
> allow using OPTEE on a Cortex-A53/57/72 that would be used in 32-bit
> mode. Is this wanted ?

Oh, thanks! you're absolutely right. Any Armv8-A should be able to run OP-TEE.

>
> > +     help
> > +       OP-TEE OS provides the secure world boot image and the trust
> > +       application development kit of the OP-TEE project. OP-TEE OS
> > +       also provides generic trusted application one can embedded
> > +       into its system.
> > +
> > +       http://github.com/OP-TEE/optee_os
> > +
> > +if BR2_TARGET_OPTEE_OS
> > +
> > +choice
> > +     prompt "OP-TEE OS version"
> > +     default BR2_TARGET_OPTEE_OS_LATEST
> > +     help
> > +       Select the version of OP-TEE OS you want to use
> > +
> > +config BR2_TARGET_OPTEE_OS_LATEST
> > +     bool "sync with latest registered release tag"
>
> Please use:
>
>         bool "3.3.0"
>
> so that it is similar with what we do in boot/uboot/Config.in for
> example.

Ok, i'll check that.

>
> > +     help
> > +       This fetches the latest registered release tag from
>
> Don't say "latest", because it's not true: it's fetching one specific
> version.

Agree, this is why I stated "latest *registered* release tag".
I will change to  "This fetches the target release tag from..."

>
> > +       the OP-TEE OS official Git repository.
> > +
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> > +     bool "sync on custom OP-TEE OS Git repository"
>
> Just:
>
>         bool "Custom Git repository"
>
> > +     help
> > +       Sync with a specific OP-TEE Git repository.
>
> "Sync" is not really correct here. Actually, I think a help text is not
> really needed. See what boot/uboot/Config.in is doing, and follow that
> example.

Ok, thanks. simpler is better.

>
> > +endchoice
> > +
> > +config BR2_TARGET_OPTEE_OS_VERSION
> > +     string
> > +     default "3.3.0"         if BR2_TARGET_OPTEE_OS_LATEST
> > +     default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
> > +                             if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
> Please put this option after the REPO_URL/REPO_VERSION options.
>
>
> Put a:
>
> if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
> here.
>
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
> > +     string "sourcetree-site"
>
>         string "URL of custom repository"
>
> > +     depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
> Drop this.

Ok, so you prefer this way:

#if BR2_FOO_xxx
config BR2_FOO_yyy
   (...)
#endif

rather than:

config BR2_FOO_yyy
   depends on BR2_FOO_xxx
   (...)

I will do. Is there any reason why BR prefers the former vs the later?


>
> > +     help
> > +       Specific location of the reference source tree Git
> > +       repository.
> > +
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION
> > +     string "git reference to pull"
>
>         string "Custom repository version"
>
> > +     depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
> And that
>
> > +     help
> > +       Reference in the target git repository to sync with.
>
> Finish with an
>
> endif
>
> here.
>
> > +# Building core, TA libraries/devkit and/or generic TA services
>
> This comment is not really needed.
>
> > +config BR2_TARGET_OPTEE_OS_CORE
> > +     bool "Build core"
> > +     default y
> > +     help
> > +       This option will build and install the OP-TEE core
> > +       boot images.
> > +
> > +config BR2_TARGET_OPTEE_OS_SDK
> > +     bool "Build TA devkit"
> > +     default y
> > +     help
> > +       This option will build and install the OP-TEE development
> > +       kit for building OP-TEE trusted application images. It is
> > +          installed in the staging filetree in /lib/optee directory.
>
> Indentation of the last line is odd.
>
> filetree -> directory
>
> > +config BR2_TARGET_OPTEE_OS_SERVICES
> > +     bool "Build service TAs"
> > +     depends on BR2_TARGET_OPTEE_OS_SDK
> > +     default y
> > +     help
> > +       This option install the generic trusted applications built
> > +       from OP-TEE OS source tree. These are installed in the target
> > +       /lib/optee_armtz directory. At runtime OP-TEE OS can load
> > +       trusted applications from a non secure filesystem into the
> > +       secure world for execution.
> > +
> > +# Building TA libraries and/or core images require target platform info
>
> This comment is also not very useful.
>
> > diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
> > new file mode 100644
> > index 0000000..02828a3
> > --- /dev/null
> > +++ b/boot/optee-os/optee-os.hash
> > @@ -0,0 +1,4 @@
> > +# From https://github.com/OP-TEE/optee_os/archive/3.3.0.tar.gz
> > +sha256 7b62e9fe650e197473eb2f4dc35c09d1e6395eb48dc1c16cc139d401b359ac6f  optee-os-3.3.0.tar.gz
> > +# Locally computed
> > +sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
>
> Please put the license hash in boot/optee-os/3.3.0/optee-os.hash, so
> that it applies only to the 3.3.0 version and not to custom versions.

Ok, I get your point. Thanks.

>
> > diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> > new file mode 100644
> > index 0000000..14ad143
> > --- /dev/null
> > +++ b/boot/optee-os/optee-os.mk
> > @@ -0,0 +1,101 @@
> > +################################################################################
> > +#
> > +# optee-os
> > +#
> > +################################################################################
> > +
> > +OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
> > +OPTEE_OS_LICENSE = BSD-2-Clause
> > +OPTEE_OS_LICENSE_FILES = LICENSE
>
> Move the OPTEE_OS_INSTALL_STAGING = YES and OPTEE_OS_INSTALL_IMAGES =
> YES here.
>
> > +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> > +OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
> > +OPTEE_OS_SITE_METHOD = git
> > +BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
> > +else
> > +OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
> > +endif
> > +
> > +OPTEE_OS_DEPENDENCIES = openssl host-python-pycrypto
>
> Are you sure these are needed? I could build for arm32 without them. If
> you really need openssl for the target, then the Config.in should
> select BR2_PACKAGE_OPENSSL.

I see, my mistake. I had to set "OPTEE_OS_DEPENDENCIES = host-openssl"
but I forgot the "host-" prefix.
I will fix. thanks.

>
> > +# On 64bit targets, OP-TEE OS can be built in 32bit mode, or
> > +# can be built in 64bit mode and support 32bit and 64bit
> > +# trusted applications. Since buildroot currently references
> > +# a single cross compiler, build exclusively in 32bit
> > +# or 64bit mode.
> > +OPTEE_OS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)"
> > +OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_core="$(TARGET_CROSS)"
>
> OPTEE_OS_MAKE_OPTS = \
>         CROSS_COMPILE="$(TARGET_CROSS)" \
>         CROSS_COMPILE_core="$(TARGET_CROSS)"
>
> > +ifeq ($(BR2_aarch64),y)
> > +OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)"
> > +endif
> > +ifeq ($(BR2_arm),y)
> > +OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
> > +endif
> > +
> > +# Get mandatory PLAFORM and optional PLATFORM_FLAVOR
> > +OPTEE_OS_MAKE_OPTS += PLATFORM=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM))
> > +ifneq ($(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR),)
> > +OPTEE_OS_MAKE_OPTS += PLATFORM_FLAVOR=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR))
> > +endif
> > +OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
> > +
> > +# Requests OP-TEE OS to build from subdirectory out/ of its synced sourcetree root path
> > +# otherwise the output directory path depends on the target platform name.
> > +OPTEE_OS_BUILDDIR_OUT = out
> > +
> > +ifeq ($(BR2_aarch64),y)
> > +OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm64
> > +endif
> > +ifeq ($(BR2_arm),y)
> > +OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
> > +endif
> > +
> > +ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
> > +define OPTEE_OS_BUILD_CORE
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
> > +             $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) all
> > +endef
> > +define OPTEE_OS_INSTALL_CORE
>
> This should be:
>
> define OPTEE_OS_INSTALL_IMAGES_CMDS
>
> > +     mkdir -p $(BINARIES_DIR)
> > +     cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee.bin $(BINARIES_DIR)
> > +     cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee-*_v2.bin $(BINARIES_DIR)
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_TARGET_OPTEE_OS_SDK),y)
> > +define OPTEE_OS_BUILD_SDK
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
> > +              $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) ta_dev_kit
> > +endef
> > +define OPTEE_OS_INSTALL_SDK
>
> This should be:
>
> define OPTEE_OS_INSTALL_STAGING_CMDS

Ok, i will split install to target FS and install to staging.

>
> > +     mkdir -p $(STAGING_DIR)/lib/optee
> > +     cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK) $(STAGING_DIR)/lib/optee
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
> > +# Core build already generates the TA services binaries. Install them.
>
> Is it the "core" that builds the TA services binaries? According to
> your Config.in dependencies, you can install the TA services binaries
> without building the Core, so it's not very consistent.
>
> Also, in my testing, building the zynq7k-zc702 platform, it never
> installed anything:
>
> >>> optee-os 3.3.0 Installing to target
> mkdir -p /home/thomas/projets/buildroot/output/target/lib/optee_armtz
> true

I will check that!
Since optee tag 3.3.0 at least 1 TA shall be build (from ta/avb/) and
hence installed.



>
> > +define OPTEE_OS_INSTALL_SERVICES
>
> This should be:
>
> define OPTEE_OS_INSTALL_TARGET_CMDS
>
> > +     mkdir -p $(TARGET_DIR)/lib/optee_armtz
> > +     $(foreach f,$(wildcard $(@D)/ta/*/$(OPTEE_OS_BUILDDIR_OUT)/*.ta), \
> > +             $(INSTALL) -v -p --mode=444 \
> > +                     --target-directory=$(TARGET_DIR)/lib/optee_armtz \
> > +                      $f &&) true
>
> This seems more complicated that it needs to be. You could simplify this
> entire block this way:
>
>         $(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz $(@D)/ta/*/$(OPTEE_OS_BUILDDIR_OUT)/*.ta
>
> or if you really want to use a loop:
>
>         $(foreach f,$(wildcard $(@D)/ta/*/$(OPTEE_OS_BUILDDIR_OUT)/*.ta), \
>                 $(INSTALL) -D -m 444 $(f) $(TARGET_DIR)/lib/optee_armtz/$(notdir $(f))
>         )
>
> > +define OPTEE_OS_BUILD_CMDS
> > +     $(OPTEE_OS_BUILD_CORE)
> > +     $(OPTEE_OS_BUILD_SDK)
> > +endef
> > +
> > +define OPTEE_OS_INSTALL_IMAGES_CMDS
> > +     $(OPTEE_OS_INSTALL_CORE)
> > +     $(OPTEE_OS_INSTALL_SDK)
> > +     $(OPTEE_OS_INSTALL_SERVICES)
>
> So, what is wrong here is to install everything within
> INSTALL_IMAGES_CMDS. That's why above, I suggest to use
> INSTALL_IMAGES_CMDS to install the core, INSTALL_STAGING_CMDS to
> install the SDK and INSTALL_TARGET_CMDS to install the services.

Caught :)

>
> > +endef
> > +
> > +OPTEE_OS_INSTALL_STAGING = YES
> > +OPTEE_OS_INSTALL_IMAGES = YES
>
> As explained, this should move earlier in the file.
>
> > +$(eval $(generic-package))
>
> So, with the changes described above, I could build for
> PLATFORM=zynq7k-zc702 (with the issue that no services are installed).
>
> However, on ARM64 with PLATFORM=marvell-armada7k8k, it fails to build
> entirely. It tries to pass ARM32 gcc flags to an ARM64 compiler.
>
> Defconfig:
>
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_OPTEE_OS=y
> BR2_TARGET_OPTEE_OS_PLATFORM="marvell-armada7k8k"
>
> Log:
>
>   CC      out/ta_arm32-lib/libmbedtls/mbedtls/library/aesni.o
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb?
>   CC      out/ta_arm32-lib/libmbedtls/mbedtls/library/arc4.o
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb-interwork?
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb?
>   CC      out/ta_arm32-lib/libmbedtls/mbedtls/library/asn1parse.o
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb-interwork?
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mno-unaligned-access?; did you mean ?-Wno-aligned-new??
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb?
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mfloat-abi=hard?
> make[2]: *** [mk/compile.mk:146: out/ta_arm32-lib/libmbedtls/mbedtls/library/aes.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb-interwork?
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mno-unaligned-access?; did you mean ?-Wno-aligned-new??
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mfloat-abi=hard?
> make[2]: *** [mk/compile.mk:146: out/ta_arm32-lib/libmbedtls/mbedtls/library/arc4.o] Error 1
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mno-unaligned-access?; did you mean ?-Wno-aligned-new??
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mfloat-abi=hard?
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb?
> make[2]: *** [mk/compile.mk:146: out/ta_arm32-lib/libmbedtls/mbedtls/library/aesni.o] Error 1
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mthumb-interwork?
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mno-unaligned-access?; did you mean ?-Wno-aligned-new??
> aarch64-linux-gnu-gcc: error: unrecognized command line option ?-mfloat-abi=hard?
> make[2]: *** [mk/compile.mk:146: out/ta_arm32-lib/libmbedtls/mbedtls/library/asn1parse.o] Error 1
>
> Could you have a look at solving this issue and taking into account the
> above comments for a v3 ?

Ok, I see the issue here. Indeed I didn't address it.

Optee_os as a 64bit system is able to run 32bit and 64bit TAs
(userland applications).
64bit TA support (libs and service TAs) can be built using the same
toolchain as the OS.
But the 32bit TAs and TA libs need a toolchain for Aarch32.
As BR supports a single toolchain, I guess the BR should build 64bit
TA support only on 64bit archi.

I'll see how to do that. Maybe this needs some hacking in the optee_os
source tree.
I will see how get this solved.

An alternate way would be to select a 2nd toolchain. From BR? outside BR?
I fear this is a bit complex and needs some discussions.

>
> Last, but not least, we would really need to have a test case for this
> in the support/testing/ infrastructure. At least one test for an ARM32
> platform and one test for an ARM64 platform. The minimal test would be
> to just do a build. A better test would use PLATFORM=vexpress-qemu_virt
> and PLATFORM=vexpress-qemu_armv8a and do some runtime testing.

I agree. I have prepared something for that but due to dependency
issues I am waiting for this OP-TEEs to land before proposing a board.
1st step: introduce OP-TEE components (this series)
2nd step: change BR arm-trusted-firmware integration to allow it to boot OP-TEE.
3rd step: introduce a Qemu Arm board for the setup.
(an overview of this can be seens from
https://github.com/etienne-lms/buildroot/pull/3)

The vexpress-qemu_virt is working fine but that graphics are down.

To test the  vexpress-qemu_armv8a, we need a compliant boot scheme.
I must spend a bit of time to setup a scheme using BR resources.
A way would be to have ATF to boot OP-TEE and either Linux or a U-boot
that boots Linux.
The OP-TEE project proposes a scheme using UEFI as Linux kernel. It
could be build from BR too.


> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
