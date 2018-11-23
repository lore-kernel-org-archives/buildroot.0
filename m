From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 23 Nov 2018 10:05:39 +0100
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: OP-TEE secure world
In-Reply-To: <CA+drQ_PwioA0hqiPCnQD=+FwuxuEfyDGd=_A2tfAGhG-Rt-fFw@mail.gmail.com>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
 <CA+drQ_PwioA0hqiPCnQD=+FwuxuEfyDGd=_A2tfAGhG-Rt-fFw@mail.gmail.com>
Message-ID: <CAN5uoS_czEqeL4xK0femn8L6cXVfkGpHw0_vY+GuS9rk2YGzDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Nov 2018 at 09:35, Shyam Saini <shyam@amarulasolutions.com> wrote:
>
> Hi Etienne,
>
>
> >
> > OP-TEE OS is maintained by the OP-TEE project. It provides an
> > open source solution for development and integration of secure
> > services for Armv7-A and Armv8-A CPU based platforms supporting
> > the TrustZone technology. This technology enables CPUs to
> > concurrently host a secure world as the OP-TEE OS and a non-secure
> > world as a Linux based OS.
> >
> > The OP-TEE project maintains other packages to leverage OP-TEE on
> > Linux kernel based OSes. An OP-TEE interface driver is available
> > in the Linux kernel since 4.12 upon CONFIG_OPTEE.
> >
> > https://www.op-tee.org/
> > https://github.com/OP-TEE/optee_os
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  boot/Config.in                                     |   1 +
> >  .../3.3.0/0001-move-python-to-python3.patch        |  26 ++++++
> >  boot/optee-os/Config.in                            | 102 ++++++++++++++++++++
> >  boot/optee-os/optee-os.hash                        |   4 +
> >  boot/optee-os/optee-os.mk                          | 103 +++++++++++++++++++++
> >  5 files changed, 236 insertions(+)
> >  create mode 100644 boot/optee-os/3.3.0/0001-move-python-to-python3.patch
> >  create mode 100644 boot/optee-os/Config.in
> >  create mode 100644 boot/optee-os/optee-os.hash
> >  create mode 100644 boot/optee-os/optee-os.mk
> >
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
> > diff --git a/boot/optee-os/3.3.0/0001-move-python-to-python3.patch b/boot/optee-os/3.3.0/0001-move-python-to-python3.patch
> > new file mode 100644
> > index 0000000..b0ed5b5
> > --- /dev/null
> > +++ b/boot/optee-os/3.3.0/0001-move-python-to-python3.patch
> > @@ -0,0 +1,26 @@
> > +move python scripts to pyhton3
> > +
> > +Use python3 for scripts depending on module Crypto.
> > +
> > +Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > +
> > +diff --git a/scripts/pem_to_pub_c.py b/scripts/pem_to_pub_c.py
> > +index 6b8fa36..0b03d62 100755
> > +--- a/scripts/pem_to_pub_c.py
> > ++++ b/scripts/pem_to_pub_c.py
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + # SPDX-License-Identifier: BSD-2-Clause
> > + #
> > + # Copyright (c) 2015, Linaro Limited
> > +diff --git a/scripts/sign.py b/scripts/sign.py
> > +index ad47479..348b40a 100755
> > +--- a/scripts/sign.py
> > ++++ b/scripts/sign.py
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + #
> > + # Copyright (c) 2015, 2017, Linaro Limited
> > + #
> > diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> > new file mode 100644
> > index 0000000..5968531
> > --- /dev/null
> > +++ b/boot/optee-os/Config.in
> > @@ -0,0 +1,102 @@
> > +config BR2_TARGET_OPTEE_OS
> > +       bool "optee_os"
> > +       depends on BR2_aarch64 || BR2_arm
> > +       select BR2_PACKAGE_OPENSSL # host tool
> > +       help
> > +         OP-TEE OS provides the secure world boot image and the trust
> > +         application development kit of the OP-TEE project. OP-TEE OS
> > +         also provides generic trusted application one can embedded
> > +         into its system.
> > +
> > +         http://github.org/OP-TEE/optee_os
> > +
> > +if BR2_TARGET_OPTEE_OS
> > +
> > +choice
> > +       prompt "OP-TEE OS version"
> > +       default BR2_TARGET_OPTEE_OS_LATEST
> > +       help
> > +         Select the version of OP-TEE OS you want to use
> > +
> > +config BR2_TARGET_OPTEE_OS_LATEST
> > +       bool "sync with latest registered release tag"
> > +       help
> > +         This fetches the latest registered release tag from
> > +         the OP-TEE OS official Git repository.
> > +
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> > +       bool "sync on custom OP-TEE OS Git repository"
> > +       help
> > +         Sync with a specific OP-TEE Git repository.
> > +
> > +endchoice
> > +
> > +config BR2_TARGET_OPTEE_OS_VERSION
> > +       string
> > +       default "3.3.0"         if BR2_TARGET_OPTEE_OS_LATEST
> > +       default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
> > +                               if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> > +
> > +if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> > +
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
> > +       string "sourcetree-site"
> > +       help
> > +         Specific location of the reference source tree Git
> > +         repository.
> > +
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION
> > +       string "git reference to pull"
> > +       help
> > +         Reference in the target git repository to sync with.
> > +
> > +endif
> > +
> > +# Building core, TA libraries/devkit and/or generic TA services
> > +
> > +config BR2_TARGET_OPTEE_OS_CORE
> > +       bool "Build core"
> > +       default y
> > +       help
> > +         This option will build and install the OP-TEE core
> > +         boot images.
> > +
> > +config BR2_TARGET_OPTEE_OS_SDK
> > +       bool "Build TA devkit"
> > +       default y
> > +       help
> > +         This option will build and install the OP-TEE development
> > +         kit for building OP-TEE trusted application images. It is
> > +          installed in the staging filetree in /lib/optee directory.
> > +
> > +config BR2_TARGET_OPTEE_OS_SERVICES
> > +       bool "Build service TAs"
> > +       default y
> > +       help
> > +         This option will build and install the generic trusted
> > +         applications in the OP-TEE OS source tree and install
> > +         them in the target /lib/optee_armtz directory. At runtime
> > +         OP-TEE OS can load trusted applications from a non secure
> > +         filesystem into the secure world for execution.
> > +
> > +# Building TA libraries and/or core images require target platform info
> > +
> > +config BR2_TARGET_OPTEE_OS_PLATFORM
> > +       string "mandatory target PLATFORM"
> > +       help
> > +         Value for the mandated PLATFORM build directive provided to
> > +         OP-TEE OS.
> > +
> > +config BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR
> > +       string "optional target PLATFORM_FLAVOR"
> > +       help
> > +         Value for the optional PLATFORM_FLAVOR build directive
> > +         provided to OP-TEE OS.
> > +
> > +config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
> > +       string "Additional OP-TEE OS build variables"
> > +       help
> > +         Additional parameters for the OP-TEE OS build
> > +         E.g. 'CFG_TEE_CORE_LOG_LEVEL=3 CFG_UNWIND=y'
> > +
> > +endif # BR2_TARGET_OPTEE_OS
> > diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
> > new file mode 100644
> > index 0000000..f68d72f
> > --- /dev/null
> > +++ b/boot/optee-os/optee-os.hash
> > @@ -0,0 +1,4 @@
> > +# From https://github.com/OP-TEE/optee_test/archive/3.3.0.tar.gz
> > +sha256 f0c9572d3a341ea37bb8e89cfd511e96d6ca3b2b714b536564e8fedb93b0f44a  optee-os-3.3.0.tar.gz
> > +# Locally computed
> > +sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
> > diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> > new file mode 100644
> > index 0000000..2e04ce0
> > --- /dev/null
> > +++ b/boot/optee-os/optee-os.mk
> > @@ -0,0 +1,103 @@
> > +################################################################################
> > +#
> > +# optee-os
> > +#
> > +################################################################################
> > +
> > +OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
> > +OPTEE_OS_LICENSE = BSD-2-Clause
> > +OPTEE_OS_LICENSE_FILES = LICENSE
> > +
> > +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> > +OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
> > +OPTEE_OS_SITE_METHOD = git
> > +BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
> > +else
> > +OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,OPTEE_OS_VERSION)
> > +endif
> > +
> > +# On 64bit targets, OP-TEE OS can be built in 32bit mode, or
> > +# can be built in 64bit mode and support 32bit and 64bit
> > +# trusted applications. Since buildroot currently references
> > +# a single cross compiler, build exclusively in 32bit
> > +# or 64bit mode.
> > +OPTEE_OS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)"
> > +OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_core="$(TARGET_CROSS)"
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
>
> minor nit, please see below
> > +
> > +# OP-TEE OS builds from subdirectory build/ of its synced sourcetree root path
>
> optee_os by default uses [1] "out" as build directory, Shouldn't  we
> use the same for consistency. We can provide option
> and let the user decide?

I though i would be better to have this makefile agnostic of the
optee_os default output path.
I guess a build option with a known default value is more flexible.
However i did not find such in other BR packages. I wonder if it is a good idea.

>
> [1] https://github.com/OP-TEE/optee_os/blob/master/Makefile#L44
>
> other than that,
>
> Tested-by: Shyam Saini <shyam.saini@amarulasolutions.com>

Thanks a lot.

etienne
