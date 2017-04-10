From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 14:45:05 +0200
Subject: [Buildroot] [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts
 with busybox and util-linux
In-Reply-To: <1491824995-19670-1-git-send-email-casantos@datacom.ind.br>
References: <3eeb7e24-fcc2-8d75-e0e8-141eeaceab70@mind.be>
 <1491824995-19670-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <2282fd1a-5a83-0b42-4417-3aedf252d28b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hm, I had half-finished a review of v5 when this came in :-) And some of the
typos I was going to say are already fixed, so that's good.


On 10-04-17 13:49, Carlos Santos wrote:
> So far we attempted to solve the conflicts between busybox and e2fsprogs
> by removing busybox programs from /bin and /sbin, leaving the e2fsprogs
> ones at /usr/bin and /usr/sbin. This fails with BR2_ROOTFS_MERGED_USR=y,
> leading to situations like the one described in bug 9436.
> 
> We could provide a better solution by means of a fine-grained selection
> of programs, like util-linux does, but this would require big changes in
> e2fsprogs. So instead of resorting to dirty tricks we switch to a more
> pragmatic approach:
> 
> 1. Drop all configs to select/deselect utilities without corresponding
>    --enable/disable options to the configure script. In other words, we
>    always install the basic set of utilities.
> 2. Do not try to build UUID utilities, since they are disabled along
>    with libuuid (the util-linux ones must be used instead).
> 3. Install e2fsprogs utilities at /bin and /sbin, overriding the ones
>    eventually installed by busybox.
> 
> Notice that these changes do exactly the opposite of what is requested
> in bug 9436. On the other hand the policy for e2fsprogs becomes coherent
> with the one for util-linux: busybox never wins.
> 
> Since e2fsprogs depends on util-linux, it's built later. So in order to
> have e2fsck from e2fsprogs and the fsck wrapper from util-linux (which
> is better maintained and compatible with systemd) we disable e2fsprogs'
> fsck if the one from util-linux is selected.
> 
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=9436 (no fix, in fact)
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

 This has changed so much that I doubt the Sob of Maxime is still correct...
Just turn it into a Cc. Cc makes sure that:

- Maxime is kept in Cc, obviously, but also
- the git log shows that Maxime was involved in this series.

 Regards,
 Arnout


> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> Changes v1->v2
>   - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
>     BR2_PACKAGE_E2FSPROGS_FSCK
>   - Add comment telling that the fsck from util-linux has preference.
>   - Pass "--enable-fsck" conditionally to configure
>   - Remove the guard around the removal of /usr/sbin/fsck, since the
>     fsck from busybox and util-linux are installed at /sbin
>   - Improve comments and commit message
> Changes v2->v3
>   - Pass "--disable-fsck" conditionaly to configure too, since enable
>     is the default.
>   - Do not attempt to remove $(TARGET_DIR)/usr/sbin/fsck, just the
>     $(TARGET_DIR)/sbin/fsck from busybox.
> Changes v3->v4
>    - Improve commit message
> Changes v4->v5
>    - Extreme overhauling, deeply simplifying the recipe and following
>      the suggestion from Arnout Vandecappelle to install e2fsprogs
>      utilities on /bin and /sbin.
> Changes v5->v6
>    - Fix typos and make small changes in commit message
> ---
>  package/e2fsprogs/Config.in      |  84 +++++++---------------
>  package/e2fsprogs/Config.in.host |   1 +
>  package/e2fsprogs/e2fsprogs.mk   | 149 +++++++++++----------------------------
>  3 files changed, 68 insertions(+), 166 deletions(-)
> 
> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
> index d1914a9..776645f 100644
> --- a/package/e2fsprogs/Config.in
> +++ b/package/e2fsprogs/Config.in
> @@ -1,101 +1,69 @@
> -config BR2_PACKAGE_E2FSPROGS
> +menuconfig BR2_PACKAGE_E2FSPROGS

  Wow, you're changing way too much here in a single patch... Changing the
config into a menuconfig may be a good idea (we more or less decided that
starting from 5 suboptions it should be a menuconfig), but it certainly should
be a separate patch.

 I propose that you split up into:

- config -> menuconfig

- update upstream URL (with as commit log: "e2fsprogs.sf.net redirects to
e2fsprogs.sourceforge.net, so use that URL directly")

- don't build uuid tools

- remove options for basic set

- add help text for remaining options

- move from /usr/{bin,sbin} to /{bin,sbin}

- whatever you're doing with host-e2fsprogs and for which no explanation is
given in the commit message

 I may have missed something that also needs to be split off, but this patch is
too complicated to detect even that :-)


 I'll give a few other comments below still, but I'm afraid there will be more
in v7...


>  	bool "e2fsprogs"
>  	depends on BR2_USE_MMU # util-linux/libblkid
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	help
>  	  The EXT2 file system utilities.
>  
> -	  http://e2fsprogs.sf.net
> +	  badblocks chattr debugfs dumpe2fs e2freefrag e2fsck e2image
> +	  e2undo e4crypt e4defrag filefrag fsck fuse2fs logsave lsattr
> +	  mke2fs mklost+found resize2fs tune2fs

 This could be a little more explicit:

	  The following programs are always built and installed:
	  badblocks ...

	  Other programs can be selected below.

>  
> -if BR2_PACKAGE_E2FSPROGS
>  
> -config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
> -	bool "badblocks"
> -	default y
> +	  http://e2fsprogs.sourceforge.net/
>  
> -config BR2_PACKAGE_E2FSPROGS_CHATTR
> -	bool "chattr"
> -	default y
> +if BR2_PACKAGE_E2FSPROGS
> +
> +comment "Basic set: badblocks chattr dumpe2fs e2freefrag e2fsck e2undo"
> +comment "e4crypt e4defrag filefrag logsave lsattr mke2fs mklost+found"
> +comment "tune2fs"

 This comment is not needed. It's already said in the help text.

>  
>  config BR2_PACKAGE_E2FSPROGS_DEBUGFS
>  	bool "debugfs"
> -
> -config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
> -	bool "dumpe2fs"
> -	default y
> -
> -config BR2_PACKAGE_E2FSPROGS_E2FREEFRAG
> -	bool "e2freefrag"
> -	default y
> -
> -config BR2_PACKAGE_E2FSPROGS_E2FSCK
> -	bool "e2fsck"
> -	default y
> +	help
> +	  ext2/ext3/ext4 file system debugger
>  
>  config BR2_PACKAGE_E2FSPROGS_E2IMAGE
>  	bool "e2image"
> -
> -config BR2_PACKAGE_E2FSPROGS_E2LABEL
> -	bool "e2label"
> -	default y
> -
> -config BR2_PACKAGE_E2FSPROGS_E2UNDO
> -	bool "e2undo"
> -	default y
> +	help
> +	  Save critical ext2/ext3/ext4 filesystem metadata to a file
>  
>  config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
>  	bool "e4defrag"
>  	depends on !BR2_nios2 # fallocate not implemented
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
> +	help
> +	  Online defragmenter for ext4 filesystem
>  
>  comment "e4defrag needs a glibc or musl toolchain"
>  	depends on BR2_TOOLCHAIN_USES_UCLIBC

 Hm, looks like there is a
	depends on !BR2_nios2
missing here...

>  
> -config BR2_PACKAGE_E2FSPROGS_FILEFRAG
> -	bool "filefrag"
> -	default y
> -
>  config BR2_PACKAGE_E2FSPROGS_FSCK
>  	bool "fsck"
> +	depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
>  	default y
> +	help
> +	  Check and repair a Linux file system

 This sounds as if fsck does the actual filesystem check, which it doesn't. How
about:

	  Check and repair Linux file systems. This is a wrapper around
	  the filesystem-specific fsck tools.

 Yes, I do realize that makes it differ from the help text in util-linux, which
is not ideal. But when you add something, it's better to do the right thing :-)

> +
> +comment "the fsck from util-linux has preference over this one"
> +	depends on BR2_PACKAGE_UTIL_LINUX_FSCK
>  
>  config BR2_PACKAGE_E2FSPROGS_FUSE2FS
>  	bool "fuse2fs"
>  	depends on !BR2_STATIC_LIBS # libfuse
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
>  	select BR2_PACKAGE_LIBFUSE
> +	help
> +	  FUSE file system client for ext2/ext3/ext4 file systems
>  
>  comment "fuse2fs needs a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  
> -config BR2_PACKAGE_E2FSPROGS_LOGSAVE
> -	bool "logsave"
> -	default y
> -
> -config BR2_PACKAGE_E2FSPROGS_LSATTR
> -	bool "lsattr"
> -	default y
> -
> -config BR2_PACKAGE_E2FSPROGS_MKE2FS
> -	bool "mke2fs"
> -	default y
> -
> -config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
> -	bool "mklost+found"
> -	default y
> -
>  config BR2_PACKAGE_E2FSPROGS_RESIZE2FS
>  	bool "resize2fs"
> -
> -config BR2_PACKAGE_E2FSPROGS_TUNE2FS
> -	bool "tune2fs"
> -	default y
> -	select BR2_PACKAGE_E2FSPROGS_E2LABEL
> -
> -config BR2_PACKAGE_E2FSPROGS_UUIDGEN
> -	bool "uuidgen"
>  	default y
> +	help
> +	  ext2/ext3/ext4 file system resizer
>  
>  endif
> diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
> index de9148e..7591bbc 100644
> --- a/package/e2fsprogs/Config.in.host
> +++ b/package/e2fsprogs/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_E2FSPROGS
>  	bool "host e2fsprogs"
> +	select BR2_PACKAGE_HOST_UTIL_LINUX
>  	help
>  	  The EXT2/3/4 file system utilities.
>  
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 3f235c5..e172914 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -10,36 +10,58 @@ E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2F
>  E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising clause (libss and libet)
>  E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
>  E2FSPROGS_INSTALL_STAGING = YES
> +
>  E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
> -# we don't have a host-util-linux
> -HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
> +
> +HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux

 Actually I'm not sure if we really want to depend on host-util-linux... Why
should we?

> +
> +# If both e2fsprogs and busybox are selected, make certain e2fsprogs
> +# wins the fight over who gets to have their utils actually installed
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +E2FSPROGS_DEPENDENCIES += busybox
> +endif
> +
> +ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
> +E2FSPROGS_DEPENDENCIES += libfuse
> +endif
>  
>  # e4defrag doesn't build on older systems like RHEL5.x, and we don't
>  # need it on the host anyway.
>  # Disable fuse2fs as well to avoid carrying over deps, and it's unused
> -HOST_E2FSPROGS_CONF_OPTS += --disable-defrag --disable-fuse2fs
> +# Set the binary directories to "$(HOST_DIR)/bin" and "$(HOST_DIR)/sbin"
> +# to match the target paths (the $(HOST_DIR) prefix is required because
> +# passing DESTDIR=$(HOST_DIR) in the install command does not work).
> +HOST_E2FSPROGS_CONF_OPTS = \
> +	--disable-defrag \
> +	--disable-fuse2fs \
> +	--bindir=$(HOST_DIR)/bin \
> +	--sbindir=$(HOST_DIR)/sbin \
> +	--enable-symlink-install \
> +	--disable-libblkid \
> +	--disable-libuuid \
> +	--disable-e2initrd-helper \
> +	--disable-testio-debug \
> +	--disable-rpath
>  
> +# Set the binary directories to "/bin" and "/sbin" to override programs
> +# installed by busybox.
>  E2FSPROGS_CONF_OPTS = \
> -	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
> -	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
> -	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
> -	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
> -	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
> -	--disable-uuidd \
> +	$(if $(BR2_STATIC_LIBS),--disable-elf-shlibs,--enable-elf-shlibs) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),--enable-debugfs,--disable-debugfs) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),--enable-imager,--disable-imager) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),--enable-defrag,--disable-defrag) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_FUSE2FS),--enable-fuse2fs,--disable-fuse2fs) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),--enable-resizer,--disable-resizer) \
> +	--bindir=/bin \
> +	--sbindir=/sbin \
> +	--enable-symlink-install \
>  	--disable-libblkid \
>  	--disable-libuuid \
> -	--enable-fsck \
>  	--disable-e2initrd-helper \
>  	--disable-testio-debug \
>  	--disable-rpath
>  
> -ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
> -E2FSPROGS_CONF_OPTS += --enable-fuse2fs
> -E2FSPROGS_DEPENDENCIES += libfuse
> -else
> -E2FSPROGS_CONF_OPTS += --disable-fuse2fs
> -endif

 Don't change this, it was better like that.

> -
>  ifeq ($(BR2_nios2),y)
>  E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
>  endif
> @@ -56,17 +78,13 @@ HOST_E2FSPROGS_CONF_ENV += \
>  	ac_cv_header_magic_h=no \
>  	ac_cv_lib_magic_magic_file=no
>  
> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> -# util-linux libuuid pulls in libintl if needed, so ensure we also
> -# link against it, otherwise static linking fails
> -E2FSPROGS_CONF_ENV += LIBS=-lintl
> -endif

 Why can this be removed? IIUC, e2fsprogs will now use the uuid from util-linux
if that is enabled, and will not use uuid at all if not. Correct? So if
util-linux libuuid is enabled, this is still needed, no?

> -
>  E2FSPROGS_MAKE_OPTS = LDCONFIG=true
> +
>  E2FSPROGS_INSTALL_STAGING_OPTS = \
>  	DESTDIR=$(STAGING_DIR) \
>  	LDCONFIG=true \
>  	install-libs
> +
>  E2FSPROGS_INSTALL_TARGET_OPTS = \
>  	DESTDIR=$(TARGET_DIR) \
>  	LDCONFIG=true \
> @@ -76,90 +94,5 @@ define HOST_E2FSPROGS_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
>  endef
>  
> -# binaries to keep or remove
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_CHATTR) += usr/bin/chattr
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_DUMPE2FS) += usr/sbin/dumpe2fs
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FREEFRAG) += usr/sbin/e2freefrag
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FSCK) += usr/sbin/e2fsck
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += usr/sbin/e2label
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2UNDO) += usr/sbin/e2undo
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E4DEFRAG) += usr/sbin/e4defrag
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += usr/sbin/filefrag
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FSCK) += usr/sbin/fsck
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
> -E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
> -
> -# files to remove
> -E2FSPROGS_TXTTARGETS_ = \
> -	usr/sbin/mkfs.ext[234] \
> -	usr/sbin/mkfs.ext4dev \
> -	usr/sbin/fsck.ext[234] \
> -	usr/sbin/fsck.ext4dev \
> -	usr/sbin/tune2fs
> -
> -define E2FSPROGS_TARGET_REMOVE_UNNEEDED
> -	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
> -	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_TXTTARGETS_))
> -endef
> -
> -E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_REMOVE_UNNEEDED
> -
> -define E2FSPROGS_TARGET_MKE2FS_SYMLINKS
> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext2
> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext3
> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4
> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4dev

 Can you explain why this is no longer needed? I don't see how any of your other
changes could obviate this one...

 If it actually wasn't needed to begin with, please also make it a separate
patch with a good explanation.


 Regards,
 Arnout

> -endef
> -
> -ifeq ($(BR2_PACKAGE_E2FSPROGS_MKE2FS),y)
> -E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_MKE2FS_SYMLINKS
> -endif
> -
> -define E2FSPROGS_TARGET_E2FSCK_SYMLINKS
> -	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext2
> -	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext3
> -	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext4
> -	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext4dev
> -endef
> -
> -ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
> -E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
> -endif
> -
> -# If BusyBox is included, its configuration may supply its own variant
> -# of ext2-related tools. Since Buildroot desires having full blown
> -# variants take precedence (in this case, e2fsprogs), we want to remove
> -# BusyBox's variant of e2fsprogs provided binaries. e2fsprogs targets
> -# /usr/{bin,sbin} where BusyBox targets /{bin,sbin}. We will attempt to
> -# remove BusyBox-generated ext2-related tools from /{bin,sbin}. We need
> -# to do this in the pre-install stage to ensure we do not accidentally
> -# remove e2fsprogs's binaries in usr-merged environments (ie. if they
> -# are removed, they would be re-installed in this package's install
> -# stage).
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -E2FSPROGS_DEPENDENCIES += busybox
> -
> -define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
> -	$(RM) -f $(TARGET_DIR)/bin/chattr
> -	$(RM) -f $(TARGET_DIR)/bin/lsattr
> -	$(RM) -f $(TARGET_DIR)/sbin/fsck
> -	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
> -	$(RM) -f $(TARGET_DIR)/sbin/e2label
> -endef
> -E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
> -endif
> -
> -define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
> -	ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
> -endef
> -
> -ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
> -E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_TUNE2FS_SYMLINK
> -endif
> -
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
