From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 23:10:10 +0100
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming
 functionality to barebox image copy
In-Reply-To: <2748BB04F99E7E45A3203C831E8B20FE34D35B88@SERBE4I2.intra.erbe-med.de>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35B88@SERBE4I2.intra.erbe-med.de>
Message-ID: <20190218231010.00e29a8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Mon, 18 Feb 2019 13:59:42 +0000
"Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:

> Until now barebox images are copied to the output/images directory
> with their default name. This is a problem if the barebox and
> barebox-aux images have the same name.

Could you describe a specific case/situation where this would happen ?
The main reason we have barebox vs. barebox-aux is because you
sometimes need to build a full-blown Barebox, and a smaller Barebox
that serves a first stage bootloader. From what I remember the
generated images had different names, don't they ?

> Also, you need to rename the images in a post-build script if you need
> certain file names.

That is a pretty normal thing in Buildroot. We just install things as
they are installed by the upstream build system, and leave it up to
custom post-build script to further rename/move/adjust to match the
specific requirements of the project/user.

> +config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE_TARGETS
> +       string "Image file copy target names"
> +       help
> +         Space-separated list of target file names used when copying
> +         the image files from BR2_TARGET_BAREBOX_IMAGE_FILE to the
> +         images directory.
> +
> +         The target names are applied in their order in the list. So the
> +         first file in BR2_TARGET_BAREBOX_IMAGE_FILE is named after the
> +         first entry in this list and so on.

I don't think there is any other option in Buildroot where we have two
space-separated lists where there is a mapping between each item in one
list with the corresponding item in the other list. It's a pretty weird
semantic.

Perhaps a less weird semantic (which would also simplify the
implementation I believe) would be to have:

	name1:target-name1 name2:target-name2

in the existing BR2_TARGET_BAREBOX_IMAGE_FILE option.

Then you can do:

	$(foreach f,$(BR2_TARGET_BAREBOX_IMAGE_FILE),
		$(if $(findstring,:,$(f),
			cp $(@D)/$(word 0,$(subst :,$(space),$(f)) $(BINARIES_DIR)/$(word 1,$(subst :,$(space),$(f),
			cp $(@D)/$(f) $(BINARIES_DIR)/$(f)
		)
	)

Well, it's not that simple and of course completely untested :) And
perhaps it doesn't fit well with the existing shell code in barebox.mk.

>  define $(1)_INSTALL_IMAGES_CMDS
> +       image_files_array=($$($(1)_IMAGE_FILES)); \
> +       image_targets_array=($$($(1)_IMAGE_FILES_TARGETS)); \

We don't use bash arrays anywhere else in the make code in Buildroot,
so this would also be a precedent.

Best regardsn

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
