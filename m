From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 9 Sep 2015 13:22:14 +0200
Subject: [Buildroot] [PATCHv2] gdb: prevent building the documentation
In-Reply-To: <1441796566-12110-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441796566-12110-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55F01666.2000402@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 09/09/2015 13:02, Vicente Olivert Riera a ?crit :
> Force gdb to not build the documentation. This way we avoid depending on
> host-texinfo. This is a temporary fix until upstream accepts a proposed
> --disable-docs configure option.
> 
> Since the documentation will not be build at all, we can remove the
> parts related to host-texinfo and MAKEINFO in the gdb.mk file.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Ok, I'll mark my patches as superseded.

> ---
> Changes v1 -> v2:
>   - Indent the sed command
>   - Use a post-patch-hook instead of pre-configure-hook
>   - Remove the parts related to host-texinfo and MAKEINFO
>   - Ammend the commit log to be more appropriate
> 
>  package/gdb/gdb.mk |   15 ++++++---------
>  1 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 338de20..01b35b0 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -53,6 +53,12 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
>  HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
>  endif
>  
> +# Prevent gdb to build the documentation
> +define GDB_DISABLE_DOC
> +	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
> +endef
> +GDB_POST_PATCH_HOOKS += GDB_DISABLE_DOC
> +
>  # When gdb sources are fetched from the binutils-gdb repository, they
>  # also contain the binutils sources, but binutils shouldn't be built,
>  # so we disable it.
> @@ -165,15 +171,6 @@ else
>  HOST_GDB_CONF_OPTS += --without-python
>  endif
>  
> -ifeq ($(GDB_FROM_GIT),y)

Since you remove GDB_FROM_GIT test here, you can also remove "GDB_FROM_GIT = y"
for arc and microblaze.

> -GDB_DEPENDENCIES += host-texinfo
> -HOST_GDB_DEPENDENCIES += host-texinfo
> -else
> -# don't generate documentation
> -GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> -HOST_GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> -endif
> -
>  # legacy $arch-linux-gdb symlink
>  define HOST_GDB_ADD_SYMLINK
>  	cd $(HOST_DIR)/usr/bin && \
> 
