From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:26:58 +0200
Subject: [Buildroot] [PATCH v3] package/coreutils: allow building
 individual binaries
In-Reply-To: <20190607021534.4657-1-mmayer@broadcom.com>
References: <20190607021534.4657-1-mmayer@broadcom.com>
Message-ID: <20190620212658.2d528ba9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Thu,  6 Jun 2019 19:15:34 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> so that coreutils can be built and installed as individual binaries.
> It can be used if the target file system doesn't support symlinks or
> symlinks are undesirable.
> 
> The approach is modelled after Busybox's similarly named configuration
> option.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

I have applied your patch, but after some changes.

First I did some preparation commits:

  https://git.buildroot.org/buildroot/commit/?id=14644a66b60a4115f20f101f08966414852e446c
  https://git.buildroot.org/buildroot/commit/?id=840cda91152dd8f702de8e77af34cddfbe4c98c8

And then some changes (see below).

> diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
> index 11a6019e820f..a0a84c220a48 100644
> --- a/package/coreutils/Config.in
> +++ b/package/coreutils/Config.in
> @@ -19,3 +19,21 @@ comment "coreutils needs a toolchain w/ wchar"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

This comment should have been at the end of the Config.in file. Indeed
having the comment between the main option and the sub-options prevent
the sub-options from being indented "under" the main option in
"menuconfig".

> -COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
> +COREUTILS_CONF_OPTS = --disable-rpath \
>  	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
> +
> +ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
> +COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
> +endif

I changed this to:

+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
+COREUTILS_CONF_OPTS += --disable-single-binary
+else
+COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
+endif

To be fully explicit.

>  COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
>  	ac_cv_func_chown_works=yes \
>  	ac_cv_func_euidaccess=no \
> @@ -59,6 +64,13 @@ COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false
>  	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
>  	vdir sleep stty sync touch true uname join
>  
> +# This is where our '[' symlink will point to.
> +ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
> +TEST_BINARY = coreutils
> +else
> +TEST_BINARY = test
> +endif

The namespace of variables in Buildroot is global, so using the name
TEST_BINARY is a *very* bad idea. It should have been
COREUTILS_TEST_BINARY. But in fact, I did this differently, and simply
added two definitions of COREUTILS_CREATE_TEST_SYMLINK.

>  ifeq ($(BR2_PACKAGE_ACL),y)
>  COREUTILS_DEPENDENCIES += acl
>  else
> @@ -96,13 +108,24 @@ COREUTILS_DEPENDENCIES += openssl
>  endif
>  
>  ifeq ($(BR2_ROOTFS_MERGED_USR),)
> +# We want to move a few binaries from /usr/bin to /bin. In the case
> of +# coreutils being built as multi-call binary, we do so by
> re-creating the +# corresponding symlinks. If coreutils is built with
> individual binaries, we +# actually move the binaries.
> +ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)

I swapped the two cases to have the INDIVIDUAL_BINARIES=y case first
(so that all conditions use INDIVIDUAL_BINARIES=y).

>  define COREUTILS_CLEANUP_BIN
> -	# some things go in /bin rather than /usr/bin
>  	$(foreach f,$(COREUTILS_BIN_PROGS), \
>  		rm -f $(TARGET_DIR)/usr/bin/$(f) && \
>  		ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
>  	)
>  endef
> +else
> +define COREUTILS_CLEANUP_BIN
> +	$(foreach f,$(COREUTILS_BIN_PROGS), \
> +                mv $(TARGET_DIR)/usr/bin/$(f) $(TARGET_DIR)/bin
> +        )
> +endef
> +endif
>  COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
>  endif
>  
> @@ -110,14 +133,24 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
>  endif
>  
> -define COREUTILS_CLEANUP
> +define COREUTILS_TEST_SYMLINK
>  	# link for archaic shells
> -	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
> -	# gnu thinks chroot is in bin, debian thinks it's in sbin
> +	ln -fs $(TEST_BINARY) $(TARGET_DIR)/usr/bin/[

And I said above, I did two separate definitions of
COREUTILS_CREATE_TEST_SYMLINK instead.

See the final commit at
https://git.buildroot.org/buildroot/commit/?id=7989818466f8a963c4b6cc8b5014b04703535d3a.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
