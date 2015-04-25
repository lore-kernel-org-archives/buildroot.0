From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 20:58:05 +0200
Subject: [Buildroot] [PATCHv3 15/18] Makefile: remove unneeded variables
In-Reply-To: <1429972982-25495-16-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425185805.GR4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> Now that all the external-deps, source-check and source targets are
> properly implemented based on the package infrastructure, the
> PACKAGES_SOURCE, TARGET_HOST_DEPS, HOST_DEPS and HOST_SOURCE variables
> are no longer needed. This is a good thing since they were anyway
> incorrect, as they were only doing a two level recursion in the
> dependencies of host packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested with a randpackageconfig]

Regards,
Yann E. MORIN.

> ---
>  Makefile | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e8a694b..0ba341b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -389,27 +389,6 @@ include fs/common.mk
>  
>  include $(BR2_EXTERNAL)/external.mk
>  
> -PACKAGES_SOURCE := $(patsubst %,%-source,$(PACKAGES))
> -
> -# host-* dependencies have to be handled specially, as those aren't
> -# visible in Kconfig and hence not added to a variable like PACKAGES.
> -# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
> -# variable for each enabled target.
> -# Notice: this only works for newstyle gentargets/autotargets packages
> -TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
> -		$(addsuffix _DEPENDENCIES,\
> -			$(call UPPERCASE,$(PACKAGES) $(TARGETS_ROOTFS))),\
> -		$($(dep)))))
> -# Host packages can in turn have their own dependencies. Likewise find
> -# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
> -# host package found above. Ideally this should be done recursively until
> -# no more packages are found, but that's hard to do in make, so limit to
> -# 1 level for now.
> -HOST_DEPS = $(sort $(foreach dep,\
> -		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
> -		$($(dep))))
> -HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
> -
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(BINARIES_DIR)
>  
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
