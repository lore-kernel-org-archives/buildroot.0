From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:55:14 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/libfuse: common files from
 libfuse3 are prefered
In-Reply-To: <20190315133033.5275-5-norbert.lange@andritz.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-5-norbert.lange@andritz.com>
Message-ID: <d521258a-7802-ef6f-961b-3dc52717bf43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/03/2019 14:30, Norbert Lange wrote:
> if both libfuse and libfuse3 are co-installed,
> make sure libfuse3 will be build first and

 Why does libfuse3 have to be installed first? Are there any files that are
installed by both after this patch? If so, please list them here. But then the
sentence below is not true :-)

> only install the files unique to libfuse.
> 
> The fusermount tool is a simlink to fusermount3,

 symlink

> mimicing debians approach. fuse device and udev rule
> is identicall between packages and only one definition

 identical

> is needed

 Missing . at the end of the sentence.

> 
> see the libfuse3 Changelog for 3.0.0 for details.

 See

 However, this patch should also be squashed with the one adding libfuse3. Or,
if you want to separate things a little (possibly a good idea), then originally
libfuse3 should depend on !libfuse, and this patch would lift the dependency again.

> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  package/libfuse/libfuse.mk | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
> index 84027ebedb..a0a00a6532 100644
> --- a/package/libfuse/libfuse.mk
> +++ b/package/libfuse/libfuse.mk
> @@ -10,20 +10,44 @@ LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFU
>  LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
>  LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
>  LIBFUSE_INSTALL_STAGING = YES
> -LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(if $(BR2_PACKAGE_LIBFUSE3),libfuse3)
>  LIBFUSE_CONF_OPTS = \
>  	--disable-example \
>  	--enable-lib \
>  	--enable-util \
>  	UDEV_RULES_PATH=/lib/udev/rules.d

 Why does this have to be set explicitly? Isn't it the default?

>  
> -define LIBFUSE_INSTALL_TARGET_CMDS
> -	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
> -	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> +# From libfuse3 README:
> +# libfuse 3 is designed to be co-installable with libfuse 2. However, some
> +# files will be installed by both libfuse 2 and libfuse 3
> +# (e.g. /etc/fuse.conf, the udev and init scripts, and the mount.fuse(8) manpage).
> +# These files should be taken from libfuse 3. The format/content is guaranteed
> +# to remain backwards compatible with libfuse 2.
> +#
> +# The way we handle this is to let libfuse3 install as usual,
> +# but libfuse has to be carefull to not overwrite any common files.
> +# Also some files are named diferently (udev-rules),
> +# but only the newer is needed.
> +# To ensure this, we install in a temporary directory and
> +# hand-pick the few unique files
> +
> +LIBFUSE_INSTALL_TARGET_OPTS = install DESTDIR=$(@D)/tmpinstall
> +
> +define LIBFUSE_INSTALL_TARGET_POST
> +	cp -dpf $(@D)/tmpinstall/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> +endef

 This is way too complicated.

 Since we anyway have custom commands for target install, you can do it like this:

ifeq ($(BR2_PACKAGE_LIBFUSE3),)
define LIBFUSE_INSTALL_SUPPORT_FILES
        cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
        mkdir -p $(TARGET_DIR)/lib/udev/rules.d
        cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules \
		$(TARGET_DIR)/lib/udev/rules.d
endef
endif

define LIBFUSE_INSTALL_TARGET_CMDS
        cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
	$(LIBFUSE_INSTALL_SUPPORT_FILES)
endef

 Regards,
 Arnout

> +
> +LIBFUSE_POST_INSTALL_TARGET_HOOKS += LIBFUSE_INSTALL_TARGET_POST
> +
> +ifeq ($(BR2_PACKAGE_LIBFUSE3),)
> +define LIBFUSE_INSTALL_TARGET_POST_COMMON
> +	$(INSTALL) -D -m 0755 $(@D)/tmpinstall/usr/bin/fusermount $(TARGET_DIR)/usr/bin/fusermount
>  	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
> -	cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d
> +	cp $(@D)/tmpinstall/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d
>  endef
>  
> +LIBFUSE_POST_INSTALL_TARGET_HOOKS += LIBFUSE_INSTALL_TARGET_POST_COMMON
> +
>  define LIBFUSE_DEVICES
>  	/dev/fuse  c  666  0  0  10  229  0  0  -
>  endef
> @@ -31,5 +55,6 @@ endef
>  define LIBFUSE_PERMISSIONS
>  	/usr/bin/fusermount f 4755 0 0 - - - - -
>  endef
> +endif
>  
>  $(eval $(autotools-package))
> 
