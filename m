From: Shyam Saini <shyam@amarulasolutions.com>
Date: Fri, 23 Nov 2018 17:18:39 +0530
Subject: [Buildroot] [PATCH 4/5] optee-examples: new package
In-Reply-To: <1542900177-17343-4-git-send-email-etienne.carriere@linaro.org>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
 <1542900177-17343-4-git-send-email-etienne.carriere@linaro.org>
Message-ID: <CA+drQ_MhVNac6jwaotfSX-us1Z-2osK=D_WZqYoz754UY8YycA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 22, 2018 at 8:53 PM Etienne Carriere
<etienne.carriere@linaro.org> wrote:
>
> This package generates embedded Linux based OS userland client
> applications and OP-TEE OS trusted applications all embedded in
> the file system. These applications shows how to use the APIs
> OP-TEE OS is based on, both in the non secure and secure worlds.
>
> Package is added next to the OP-TEE client package in the BR
> package configuration.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  package/Config.in                          |  1 +
>  package/optee-examples/Config.in           | 57 ++++++++++++++++++++++++++++++
>  package/optee-examples/optee-examples.hash |  4 +++
>  package/optee-examples/optee-examples.mk   | 48 +++++++++++++++++++++++++
>  4 files changed, 110 insertions(+)
>  create mode 100644 package/optee-examples/Config.in
>  create mode 100644 package/optee-examples/optee-examples.hash
>  create mode 100644 package/optee-examples/optee-examples.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 38200af..35870d0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2049,6 +2049,7 @@ menu "Security"
>         source "package/checkpolicy/Config.in"
>         source "package/optee-benchmark/Config.in"
>         source "package/optee-client/Config.in"
> +       source "package/optee-examples/Config.in"
>         source "package/paxtest/Config.in"
>         source "package/policycoreutils/Config.in"
>         source "package/refpolicy/Config.in"
> diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
> new file mode 100644
> index 0000000..1a19791
> --- /dev/null
> +++ b/package/optee-examples/Config.in
> @@ -0,0 +1,57 @@
> +config BR2_PACKAGE_OPTEE_EXAMPLES
> +       bool "Embed OP-TEE examples"
> +       depends on BR2_aarch64 || BR2_arm
> +       help
> +         Enable the OP-TEE examples package that brings examples of
> +         implementation of OP-TEE non-secure client applications and
> +         secure trusted applications. OP-TEE examples is a
> +         component delivered by the OP-TEE project.
> +
> +if BR2_PACKAGE_OPTEE_EXAMPLES
> +
> +choice
> +       prompt "OP-TEE exmaples version"
> +       default BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
> +       help
> +         Select the version of OP-TEE exmaples you want to use
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
> +       bool "sync with latest release tag"
> +       help
> +         Sync on latest release tag. This currently fetches the
> +         latest registered release tag from the OP-TEE official
> +         Git repository.
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT
> +       bool "sync with a specific Git"
> +       help
> +         Sync with a specific OP-TEE Git repository.
> +
> +endchoice
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
> +       string
> +       default "3.3.0"         if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
> +       default BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_VERSION \
> +                               if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT
> +       help
> +         Reference in the target Git repository to sync with.
> +
> +if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_URL
> +       string "Git repository site"
> +       help
> +         Specific location of the reference source tree Git
> +         repository.
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_VERSION
> +       string "target reference to pull in the Git repository"
> +       help
> +         Package version reference to sync with. As source file
> +         reference is a Git repository, the version reference can
> +         be any Git reference as a tag or a sha1.
> +
> +endif
> +
> +endif #BR2_PACKAGE_OPTEE_EXAMPLES
> diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
> new file mode 100644
> index 0000000..77b7466
> --- /dev/null
> +++ b/package/optee-examples/optee-examples.hash
> @@ -0,0 +1,4 @@
> +# From https://github.com/linaro-swg/optee_examples/archive/3.3.0.tar.gz
> +sha256 504642edd1510562dcc213637d8869190dd581986daf938ed3e85088830e0ef9  optee-examples-3.3.0.tar.gz
> +# Locally computed
> +sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
> diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
> new file mode 100644
> index 0000000..2edcc45
> --- /dev/null
> +++ b/package/optee-examples/optee-examples.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# optee-examples
> +#
> +################################################################################
> +
> +OPTEE_EXAMPLES_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_VERSION))
> +OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
> +OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT),y)
> +OPTEE_EXAMPLES_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_URL))
> +OPTEE_EXAMPLES_SITE_METHOD = git
> +BR_NO_CHECK_HASH_FOR += $(OPTEE_EXAMPLES_SOURCE)
> +else
> +OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
> +endif
> +
> +OPTEE_EXAMPLES_DEPENDENCIES = optee-client optee-os
> +OPTEE_EXAMPLES_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_aarch64),y)
> +OPTEE_EXAMPLES_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
> +endif
> +ifeq ($(BR2_arm),y)
> +OPTEE_EXAMPLES_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
> +endif
> +
> +define OPTEE_EXAMPLES_BUILD_TAS
> +       @$(foreach f,$(wildcard $(@D)/*/ta/Makefile), \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               $(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
> +                       O=out TA_DEV_KIT_DIR=$(OPTEE_EXAMPLES_SDK) \
> +                       -C $(dir $f) all &&) true
> +endef
> +
> +define OPTEE_EXAMPLES_INSTALL_TAS
> +       @$(foreach f,$(wildcard $(@D)/*/ta/out/*.ta), \
> +               mkdir -p $(TARGET_DIR)/lib/optee_armtz && \
> +               $(INSTALL) -v -p --mode=444 \
> +                       --target-directory=$(TARGET_DIR)/lib/optee_armtz $f \
> +                       &&) true
> +endef
> +
> +OPTEE_EXAMPLES_POST_BUILD_HOOKS += OPTEE_EXAMPLES_BUILD_TAS
> +OPTEE_EXAMPLES_POST_INSTALL_TARGET_HOOKS += OPTEE_EXAMPLES_INSTALL_TAS
> +
> +$(eval $(cmake-package))

Tested-by: Shyam Saini <shyam.saini@amarulasolutions.com>
