From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 16:54:47 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/rcw: Optional RCW Generation
In-Reply-To: <20190219203157.26095-1-jared.bents@rockwellcollins.com>
References: <20190219203157.26095-1-jared.bents@rockwellcollins.com>
Message-ID: <20190223165447.1a55b9ce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Feb 2019 14:31:57 -0600
jared.bents at rockwellcollins.com wrote:

> +if BR2_PACKAGE_HOST_RCW
> +
> +config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
> +

Could you please drop this empty line ?

> +	string "RCW Source file paths"
> +	help
> +	  Path to custom RCW source files. You can provide a
> +	  list of rcw paths to copy and build, separated by spaces.
> +	  NOTE: If you want to build one common rcw file
> +	  (e.g. "X.rcwi") with main rcw file (e.g. "Y.rcw") then
> +	  include common rcw file X.rcwi in main rcw file Y.rcw
> +	  using "#include"

I am not sure this working is really relevant, people using this stuff
are supposed to know the syntax of .rcw files and that they can use
#include to include .rcwi files.

Instead the working should perhaps be:

	  Space-separated list of .rcw and .rcwi files, that will be
	  used to generate a RCW binary. The entire list of .rcwi files
	  used by the .rcw file must be specified. There must be a
	  single .rcw file in the list.

> diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
> index f4570b9bde..d33d655e6d 100644
> --- a/package/rcw/rcw.mk
> +++ b/package/rcw/rcw.mk
> @@ -9,7 +9,19 @@ RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
>  RCW_SITE_METHOD = git
>  RCW_LICENSE = BSD-3-Clause
>  RCW_LICENSE_FILES = LICENSE
> +HOST_RCW_DEPENDENCIES = host-python

Do we really need to depend on Python ? Buildroot guarantees that at
least Python 2.7 is available on the build machine, regardless of
whether host-python is built or not.

> +# The name of the file to be deliveried in the BINARIES_DIR
> +RCW_DELIVERY_FILE = PBL.bin
> +
> +# Use the host python
> +HOST_PYTHON=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)

All variables declared by a package are global, so by using
"HOST_PYTHON" as a variable name, you are "polluting" the global
namespace of variables, potentially causing a conflict. That is why we
enforce the policy that all variables defined by a package must be
prefixed by the package name.

Also, spaces around =.

> +# Get the name of the custom rcw file from the custom list
> +RCW_PROJECT=$(filter %.rcw,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))))

So, this means that only a single .rcw should be in the list ? If so,
perhaps:

ifeq ($(BR2_BUILDING),y)
ifneq ($(RCW_PROJECT),)
ifneq ($(words $(RCW_PROJECT)),1)
$(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)
endif
endif
endif

(totally untested)

> +
> +

Only one empty line here. Please run "make check-package".

> +ifeq ($(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH),"")

I am not sure why the default installation becomes conditional, as you
also have to do the same logic when a RCW file is being generated.

>  # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
>  # could use a post image or SDK to build/install PBL files.
>  define HOST_RCW_INSTALL_CMDS
> @@ -17,4 +29,23 @@ define HOST_RCW_INSTALL_CMDS
>  	cp -a $(@D)/* $(HOST_DIR)/share/rcw
>  endef
>  
> +else
> +# Generate rcw using the specified source files from within the build directory.
> +# Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
> +# could use a SDK to rebuild/install PBL files.
> +define HOST_RCW_INSTALL_CMDS
> +	mkdir -p $(@D)/custom_board/rcw
> +	cp -f $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)) $(@D)/custom_board/rcw
> +	for rcwi in $(filter %.rcwi,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)))); do \
> +		cd $(@D)/custom_board; ln -sf rcw/$${rcwi} $${rcwi} ; \
> +	done

I don't really understand this dance of symlinks. Why do you have this ?

Please use a make $(foreach ...) loop.

> +	$(HOST_PYTHON) $(@D)/rcw.py -i $(@D)/custom_board/rcw/${RCW_PROJECT} -I $(@D)/custom_board/ -o $(@D)/$(RCW_DELIVERY_FILE)

Please use $(...) when referring to make variables.

> +	$(INSTALL) -D -m 0644 $(@D)/$(RCW_DELIVERY_FILE) $(BINARIES_DIR)/$(RCW_DELIVERY_FILE)
> +	mkdir -p  $(HOST_DIR)/share/rcw
> +	cp -a $(@D)/* $(HOST_DIR)/share/rcw
> +	find $(HOST_DIR)/share/rcw -name "*.bin" -delete
> +endef
> +
> +endif

I'd prefer to see it implementing like this:

ifneq ($(RCW_PROJECT),)
define HOST_RCW_ADD_CUSTOM_RCW_FILES
	... copying of .rcw files ...
endef
HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES

define HOST_RCW_BUILD_CMDS
	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board/ -o $(@D)/$(RCW_DELIVERY_FILE)
endef

define HOST_RCW_INSTALL_DELIVERY_FILE
	$(INSTALL) -D -m 0644 $(@D)/$(RCW_DELIVERY_FILE) $(BINARIES_DIR)/$(RCW_DELIVERY_FILE)
endef
endif

define HOST_RCW_INSTALL_CMDS
        mkdir -p  $(HOST_DIR)/share/rcw
        cp -a $(@D)/* $(HOST_DIR)/share/rcw
	$(HOST_RCW_INSTALL_DELIVERY_FILE)
	find $(HOST_DIR)/share/rcw -name "*.bin" -delete
endef

or something along those lines.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
