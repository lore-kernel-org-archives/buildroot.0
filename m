From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 May 2019 00:22:37 +0200
Subject: [Buildroot] [PATCH] package/dosfstools: introduce sanitation
 step during install
In-Reply-To: <20190529182716.12080-1-mmayer@broadcom.com>
References: <20190529182716.12080-1-mmayer@broadcom.com>
Message-ID: <931fdea6-0e1b-0074-1b14-df0c6a29f899@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Markus,

On 29/05/2019 20:27, Markus Mayer wrote:
> We can't install dosfstools into the target directory directly, because
> it'll install *all* binaries, even the disabled ones.
> 
> Also, we can't just delete dosfstools binaries from the target
> directory after installing them, because some tools of the same name
> may be provided by other packages (specifically Busybox). When a tool
> is disabled in dosfstools, it only means that dosfstools shouldn't
> install its own copy, not that it is okay to remove a tool that might
> already be there.
> 
> To avoid any issues, we install dosfstools into a temporary location,
> remove the binaries that have been disabled in the Buildroot
> configuration, and only then copy the rest to the target location.

 Not a bad idea.


> We also extend sanitation to include man pages, so only man pages for
> enabled tools are copied to the target.

 Since man pages anyway get removed in target-finalize, there isn't much point
to doing this.

> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> We discovered the issue at hand because we are using Busybox for most
> of our tools, including FAT related tools. When we needed to add
> fsck.fat to our root file system, we had to enable DOSFSTOOLS, because
> Busybox doesn't provide it. And suddenly all our FAT related tools
> (except fsck.fat) had disappeared from the rootfs! That was not at all
> the idea.
> 
> The reason, as it turned out, was DOSFSTOOLS doing it sanitation
> directly inside the target directory, which indiscriminately removed
> binaries, even if they were enabled via a different package (BUSYBOX in
> our case).
> 
> Hence the approach using a temporary install location.
> 
>  package/dosfstools/dosfstools.mk | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
> index 6eb0851d0e23..30a35e3f9b8f 100644
> --- a/package/dosfstools/dosfstools.mk
> +++ b/package/dosfstools/dosfstools.mk
> @@ -10,6 +10,7 @@ DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(
>  DOSFSTOOLS_LICENSE = GPL-3.0+
>  DOSFSTOOLS_LICENSE_FILES = COPYING
>  DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
> +DOSFSTOOLS_TEMP=$(BASE_DIR)/build/dosfstools-install
>  HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> @@ -24,26 +25,48 @@ DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
>  DOSFSTOOLS_DEPENDENCIES += libiconv
>  endif
>  
> +# Install into temporary location
> +DOSFSTOOLS_INSTALL_TARGET_OPTS = \
> +	DESTDIR=$(DOSFSTOOLS_TEMP) \
> +	install
> +
> +# Clean out our temporary install location before installation
> +define DOSFSTOOLS_CLEAR_TEMP
> +	rm -rf $(DOSFSTOOLS_TEMP)
> +endef
> +DOSFSTOOLS_PRE_INSTALL_TARGET_HOOKS += DOSFSTOOLS_CLEAR_TEMP
> +
> +# Sanitize temporary install location after installation
>  ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
>  define DOSFSTOOLS_REMOVE_FATLABEL
> -	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
> +	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/sbin/,dosfslabel fatlabel)
> +	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/usr/share/man/man8/,dosfslabel.8 fatlabel.8)
>  endef
>  DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
>  define DOSFSTOOLS_REMOVE_FSCK_FAT
> -	rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
> +	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
> +	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/usr/share/man/man8/,fsck.fat.8 dosfsck.8 fsck.msdos.8 fsck.vfat.8)
>  endef
>  DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
>  define DOSFSTOOLS_REMOVE_MKFS_FAT
> -	rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
> +	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
> +	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/usr/share/man/man8/,mkfs.fat.8 mkdosfs.8 mkfs.msdos.8 mkfs.vfat.8)
>  endef
>  DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
>  endif
>  
> +# Install what's left into the actual target directory
> +define DOSFSTOOLS_TARGET_INSTALL
> +	tar -C $(DOSFSTOOLS_TEMP) -c -f - . | tar -C $(TARGET_DIR) -x -f -

 We generally use rsync to copy files, not the tar trick.

 However, I'm wondering... dosfstools only installs things in /sbin,
/usr/share/man and /usr/share/doc. The latter two get deleted in
target-finalize. Wouldn't it be a lot easier then to manually install the
programs we need to sbin, instead of installing everything and removing what is
not needed?


 Regards,
 Arnout

> +	rm -rf $(DOSFSTOOLS_TEMP)
> +endef
> +DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_TARGET_INSTALL
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
