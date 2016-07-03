From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 20:26:13 +0200
Subject: [Buildroot] [PATCH] fs/common: add option to execute custom
	scripts under fakeroot
In-Reply-To: <1467558499-16415-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 3 Jul 2016 17:08:19 +0200")
References: <1467558499-16415-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8760smpohm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some users have the need to be able to tweak the content of the target
 > rootfs with root-like rights, that is, from inside the fakeroot script.

 > Add a new system option to allow those users to provide a list of
 > scripts, like the post-build and post-image scripts, that will be run
 > from our fakeroot script.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Cam Hutchison <camh@xdna.net>
 > ---
 >  fs/common.mk     |  3 +++
 >  system/Config.in | 37 +++++++++++++++++++++++++++++++++++--
 >  2 files changed, 38 insertions(+), 2 deletions(-)

 > diff --git a/fs/common.mk b/fs/common.mk
 > index b7202c3..d5adf40 100644
 > --- a/fs/common.mk
 > +++ b/fs/common.mk
 > @@ -92,6 +92,9 @@ endif
 >  	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
 >  	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 >  endif
 > +	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 > +		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >>$$(FAKEROOT_SCRIPT); \
 > +		echo $$(s) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >>$$(FAKEROOT_SCRIPT))
 >  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 >  	chmod a+x $$(FAKEROOT_SCRIPT)
 >  	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 > diff --git a/system/Config.in b/system/Config.in
 > index 15d5b55..6219b83 100644
 > --- a/system/Config.in
 > +++ b/system/Config.in
 > @@ -454,6 +454,37 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 >  	  argument. Make sure the exit code of those scripts are 0, otherwise
 >  	  make will stop after calling them.
 
 > +config BR2_ROOTFS_POST_FAKEROOT_SCRIPT
 > +	string "Custom scripts to run at the end of the fakeroot environment"

I've changed it to s/at the end of/inside/ to make it clear this is run
INSIDE the fakeroot environment.

> +	default ""
 > +	help
 > +	  Specify a space-separated list of scripts to be run at the end
 > +	  of the fakeroot script right before the image is actually

As you can enable multiple filesystems and it imho is important to
understand that the script(s) will be executed for each filesystem I
changed 's/image is/image(s) are/'


> +	  generated.
 > +
 > +	  This gives users the opportunity to do customisations of the
 > +	  content of the rootfs, which would otherwise require root
 > +	  rigths.
 > +
 > +	  These scripts are called with the target directory name as
 > +	  first argument. The build will fail on the first scripts that
 > +	  exits with a non-zero exit code.
 > +
 > +	  Note that Buildroot already provides mechanisms to customise
 > +	  the content of the rootfs:
 > +	    - BR2_ROOTFS_STATIC_DEVICE_TABLE
 > +	        to create arbitrary entries static in /dev

s/static/statically/

> +
 > +	    - BR2_ROOTFS_DEVICE_TABLE
 > +	        to set arbitrary permissions as well as extended attributes
 > +	        (such as capabilities)on files and directories,

missing space before 'on'.

Committed with these fixes, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
