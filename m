From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:24:31 +0200
Subject: [Buildroot] [PATCH v4 1/3] refpolicy: new package
In-Reply-To: <20170520204143.18154-1-Adamduskett@outlook.com>
References: <20170520204143.18154-1-Adamduskett@outlook.com>
Message-ID: <20170606232431.40c139e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sat, 20 May 2017 16:41:41 -0400, Adam Duskett wrote:
> The patch is for adding selinux reference policy (refpolicy).
> It is a complete SELinux policy that can be used as the system policy
> for a variety of systems and used as the basis for creating other policies.

I've applied, after doing a few fixes. I also have one question. See below.

>  package/Config.in                |  1 +
>  package/refpolicy/Config.in      | 37 ++++++++++++++++++++++++++++
>  package/refpolicy/refpolicy.hash |  2 ++
>  package/refpolicy/refpolicy.mk   | 53 ++++++++++++++++++++++++++++++++++++++++

Entry to DEVELOPERS file missing.

> +config BR2_PACKAGE_REFPOLICY
> +	bool "refpolicy"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # policycoreutils
> +	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
> +	depends on !BR2_STATIC_LIBS #libsemanage

Repeating dependencies is useless. Also having as a comment a package
that isn't selected by refpolicy doesn't make sense. I've fixed this.

> +	depends on !BR2_arc # libsemanage

Ditto.

> +# Do not use GitHub helper as git submodules are needed for refpolicy-contrib
> +REFPOLICY_SITE = https://github.com/TresysTechnology/refpolicy.git
> +REFPOLICY_SITE_METHOD = git
> +REFPOLICY_GIT_SUBMODULES = y # Required for refpolicy-contrib
> +REFPOLICY_LICENSE = GPLv2

We use SPDX license tags now, so GPL-2.0.

> +REFPOLICY_LICENSE_FILES = COPYING
> +REFPOLICY_INSTALL_STAGING = YES
> +REFPOLICY_DEPENDENCIES += \

+= not needed here.

> +	host-m4 \
> +	host-checkpolicy \
> +	host-policycoreutils \
> +	host-setools \
> +	host-gawk \
> +	host-python \
> +	policycoreutils
> +
> +REFPOLICY_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/site-packages

Variable unused, so dropped.

> +# Cannot use multiple threads to build the reference policy
> +REFPOLICY_MAKE = \
> +	TEST_TOOLCHAIN=$(HOST_DIR) \
> +	PYTHON="$(HOST_DIR)/usr/bin/python2" \
> +	$(TARGET_MAKE_ENV) \
> +	$(MAKE1)
> +
> +define REFPOLICY_CONFIGURE_CMDS
> +	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
> +	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
> +	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
> +endef
> +
> +define REFPOLICY_BUILD_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) bare conf DESTDIR=$(STAGING_DIR)

We usually put DESTDIR before the targets, so changed.

> +endef
> +
> +define REFPOLICY_INSTALL_STAGING_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
> +	DESTDIR=$(STAGING_DIR)

Second line should be indented with two tabs.

> +endef
> +
> +define REFPOLICY_INSTALL_TARGET_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +endef

My question is: why "install-src install-headers" for staging and just
"install" for target ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
