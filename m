From: Herve Codina <herve.codina@bootlin.com>
Date: Thu, 24 Jun 2021 17:03:33 +0200
Subject: [Buildroot] [PATCH 03/15] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210622201818.GI44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-4-herve.codina@bootlin.com>
 <20210621225120.536cd758@windsurf>
 <20210622104343.0c5ea063@bootlin.com>
 <20210622113406.11234e26@windsurf> <20210622201818.GI44262@scaer>
Message-ID: <20210624170333.44765dee@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 22:18:18 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I think a list+macro would be a better solution.
> 
> Alternatively, we could append to post-install hooks, like we do for
> pre-configure hooks in the autotools infra for autoreconf et al., for
> example...
> 
>     # Outside generic-package-inner:
> 
>     # $1: base directory (target, staging, host)
>     define remove-conflicting-useless-files
>         $(Q)$(RM) -rf $(patsubst %, $(1)/%, $($(PKG)_DROP_FILES_OR_DIRS))
>     endef
>     define REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
>         $(call remove-conflicting-useless-files,$(HOST_DIR))
>     endef
>     define REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
>         $(call remove-conflicting-useless-files,$(STAGING_DIR))
>     endef
>     define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
>         $(call remove-conflicting-useless-files,$(TARGET_DIR))
>     endef
> 
> 
>     # In generic-package-inner:
> 
>     $(2)_DROP_FILES_OR_DIRS += /share/info/dir
> 
>     # For host packages:
>     $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
> 
>     # For target packages:
>     $(2)_POST_INSTALL_STAGING_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
>     $(2)_POST_INSTALL_TARGET_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
> 
> This way, it also paves the way to add other hooks to actually fix some
> files instead of removing them...
> 
> For example, assume that packages (e.g. 'wonders') can register
> themselves against another package (e.g. 'manager') by appending a
> line to a text file, like so (over-simplified, of course):
> 
>     echo "name=wonders path=/usr/lib/wonders/v42" >>/usr/share/manager/registry
> 
> Then we could have a hook that detects that, extracts the delta
> installed by the package, stash that somewhere in staging, and have a
> target-finalise hook that aggregates all the packages in the end.
> 

I like this solution.

If it is okay for everyone, I will rework my patch accordingly.

Thomas, your opinion ?


Regards,
Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
