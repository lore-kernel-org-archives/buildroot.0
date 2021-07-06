From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 21:25:01 +0200
Subject: [Buildroot] [PATCH v2 02/18] package/pkg-generic.mk: Remove
 Info documents dir entry
In-Reply-To: <20210706142501.951345-3-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-3-herve.codina@bootlin.com>
Message-ID: <20210706192501.GM2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-06 16:24 +0200, Herve Codina spake thusly:
> Some packages (autotools for instance) install documentation
> files using install-info. This program adds an entry in
> the Info directory file (share/info/dir) and this causes
> TARGET_DIR and/or HOST_DIR overwrite.
> 
> In order to avoid this overwrite this patch removes the Info
> directory file right after any installation.
> 
> In order to be as generic as possible, this patch introduces
> a new tooling to remove useless and conflicting files based
> on the file and/or directory list <PKG>_DROP_FILES_OR_DIRS.
> share/info/dir file is added for every packages in this list.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> Changes v1 to v2:
>  - Reworked adding <PKG>_DROP_FILES_OR_DIRS and associated tooling.
> 
>  package/pkg-generic.mk | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 45589bcbb4..05b2095664 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -135,6 +135,22 @@ define check_bin_arch
>  		-a $(BR2_READELF_ARCH_NAME)
>  endef
>  
> +# Functions to remove conflicting and useless files
> +
> +# $1: base directory (target, staging, host)
> +define remove-conflicting-useless-files
> +	$(Q)$(RM) -rf $(patsubst %, $(1)/%, $($(PKG)_DROP_FILES_OR_DIRS))

This is very ambiguous: in case $(PKG)_DROP_FILES_OR_DIRS ends up
being empty, this code wil lexpand to "rm -rf". This does nothing,
fortunately, but calling rm -rf always makes me nervous, especially
in conjunction with adding $(1)/ in front of it, because what happens
when the caller forgets to pass the argument? Meh, maybe I'm getting
too paranoid. Or too old... Or both...

Yes, this is the exact line I wrote in my previous review, but it was
mostly just to kickstart the idea...

But here, I don't think checking would be superfluous.

Also, $(PKG)_DROP_FILES_OR_DIRS is supposed to contain absolute path,
e.g. /share/info/dir, so there already is a '/', so no need to add one.

So, what about:

    $(if $($(PKG)_DROP_FILES_OR_DIRS), \
        $(Q)$(RM) -rf $(patsubst %, $(1)%, $($(PKG)_DROP_FILES_OR_DIRS)))

No need to respin, I can do that when applying...

And of course, the big question: do we want to expose that to packages,
so they can set it by themselves? In which case, that lacks an entry in
the manual... But I don't think we should expose it; packages that want
to remove files can do do with post-install hooks. Here we really are
speaking about files that by design Buildroot does not want to handle...

Regards,
Yann E. MORIN.

> +endef
> +define REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
> +	$(call remove-conflicting-useless-files,$(HOST_DIR))
> +endef
> +define REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
> +	$(call remove-conflicting-useless-files,$(STAGING_DIR))
> +endef
> +define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
> +	$(call remove-conflicting-useless-files,$(TARGET_DIR))
> +endef
> +
>  ################################################################################
>  # Implicit targets -- produce a stamp file for each step of a package build
>  ################################################################################
> @@ -823,6 +839,16 @@ $$(error "Package $(1) defines host variant before target variant!")
>  endif
>  endif
>  
> +# Globaly remove following conflicting and useless files
> +$(2)_DROP_FILES_OR_DIRS += /share/info/dir
> +
> +ifeq ($$($(2)_TYPE),host)
> +$(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
> +else
> +$(2)_POST_INSTALL_STAGING_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
> +$(2)_POST_INSTALL_TARGET_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
> +endif
> +
>  # human-friendly targets and target sequencing
>  $(1):			$(1)-install
>  $(1)-install:		$$($(2)_TARGET_INSTALL)
> -- 
> 2.31.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
