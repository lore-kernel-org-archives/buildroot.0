From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 22:52:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rcw: Optional RCW Generation
In-Reply-To: <20190225161046.2345-1-jared.bents@rockwellcollins.com>
References: <20190225161046.2345-1-jared.bents@rockwellcollins.com>
Message-ID: <12c64738-e4b7-bc77-4940-6dffbff3a4b2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jared,

 I have quite a few proposed changes to this. A bit too much to apply right
away, so I'll resend it first. Please review and give your OK on it.

On 25/02/2019 17:10, jared.bents at rockwellcollins.com wrote:
> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Update to add an optional RCW generation using
> BR2_PACKAGE_HOST_RCW_CUSTOM_PATH with no modification
> to the RCW package source.
> 
> --
> [v1 -> v2]: * Removed host-python dependency
>             * Updated help for BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
>             * Added error for number of .rcw not equal to 1
>             * Removed symlinks
>             * Split large install command into different commands
>             * Resolved utils/check-package warnings
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

 Your Sob should be above the --- line, otherwise it gets stripped off.

> ---
>  package/rcw/Config.in.host | 16 ++++++++++++++++
>  package/rcw/rcw.mk         | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
> index ba40f76de9..34f211a8ff 100644
> --- a/package/rcw/Config.in.host
> +++ b/package/rcw/Config.in.host
> @@ -10,3 +10,19 @@ config BR2_PACKAGE_HOST_RCW
>  	  then use this toolset and examples.
>  
>  	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
> +
> +if BR2_PACKAGE_HOST_RCW
> +
> +config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
> +	string "RCW Source file paths"
> +	help
> +	  Space-separated list of .rcw and .rcwi files, that will be
> +	  used to generate a RCW binary. The entire list of .rcwi files
> +	  used by the .rcw file must be specified. There must be a
> +	  single .rcw file in the list.
> +
> +	  This is optional. If left empty, the RCW package will be
> +	  included for use in the SDK or with post scripts but the
> +	  binary will not be generated.

 I slightly rephrased this.

> +
> +endif
> diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
> index f4570b9bde..1b7a73f6e5 100644
> --- a/package/rcw/rcw.mk
> +++ b/package/rcw/rcw.mk
> @@ -10,11 +10,43 @@ RCW_SITE_METHOD = git
>  RCW_LICENSE = BSD-3-Clause
>  RCW_LICENSE_FILES = LICENSE
>  
> +# The name of the file to be deliveried in the BINARIES_DIR
> +RCW_DELIVERY_FILE = PBL.bin

 I removed this definition - IMO it serves no purpose.

> +
> +# Get the name of the custom rcw file from the custom list
> +RCW_PROJECT = $(filter %.rcw,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))))

 On the other hand, $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)) is quite
long, and used in several places. So I've added a variable for that.

 Also, I've enclosed this entire block in a

ifneq ($(RCW_FILES),)
...
endif

> +
> +# Error if there is more than one .rcw file
> +ifneq ($(RCW_PROJECT),)
> +ifneq ($(words $(RCW_PROJECT)),1)

 I've added an

ifeq ($(BR_BUILDING),y)

here. I don't remember why this is needed, but basically it avoids showing the
error in situations where it's not relevant.

> +$(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)

 I've added an actual error message here.

> +endif
> +endif
> +
> +ifneq ($(RCW_PROJECT),)
> +define HOST_RCW_ADD_CUSTOM_RCW_FILES
> +	mkdir -p $(@D)/custom_board/rcw

 I don't see why you should create the rcw subdirectory... I didn't change that
though.

> +	cp -f $(filter %.rcwi,$(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))) $(@D)/custom_board

 I've changed this into $(filter-out %.rcw ...) - there is really no reason to
constrain the files to be called *.rcwi.

> +	cp -f $(filter %.rcw,$(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))) $(@D)/custom_board/rcw
> +endef
> +HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
> +
> +define HOST_RCW_BUILD_CMDS
> +	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/$(RCW_DELIVERY_FILE)

 This one got me thinking (and is another reason why I haven't applied yet):
unlike similar options in Linux, U-Boot, ..., there really is no need to copy
the source files at all. So, I would change the entire concept into expecting
just a single filename. In other words, just call

 	python $(@D)/rcw.py -i $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)) -o
$(@D)PBL.bin

 This has the advantage that you can spread the rcwi files over directories. For
example, with the directory structure like the one inside the rcw package
itself, it wouldn't work because you have things like

#include "../../a004580.rcw"

which won't be correct any more after the copying.

> +endef
> +
> +define HOST_RCW_INSTALL_DELIVERY_FILE
> +	$(INSTALL) -D -m 0644 $(@D)/$(RCW_DELIVERY_FILE) $(BINARIES_DIR)/$(RCW_DELIVERY_FILE)
> +endef
> +endif
> +
>  # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
>  # could use a post image or SDK to build/install PBL files.
>  define HOST_RCW_INSTALL_CMDS
>  	mkdir -p  $(HOST_DIR)/share/rcw
>  	cp -a $(@D)/* $(HOST_DIR)/share/rcw
> +	$(HOST_RCW_INSTALL_DELIVERY_FILE)
> +	find $(HOST_DIR)/share/rcw -name "*.bin" -delete

 Why do you do this? The only bin file would be the just-generated PBL.bin. If
you don't want it, remove it in HOST_RCW_INSTALL_DELIVERY_FILE. So I've just
removed this line.

 Regards,
 Arnout

>  endef
>  
>  $(eval $(host-generic-package))
> 
