From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 18:12:20 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: run autogen.sh as PRE_CONFIGURE
 step
In-Reply-To: <1393063090-831-1-git-send-email-romain.naour@openwide.fr>
References: <1393063090-831-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140222181220.134dc547@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 22 Feb 2014 10:58:10 +0100, Romain Naour wrote:
> For the same reason as for the gpm package:
> 
> "Move the GPM_RUN_AUTOGEN to be a PRE_CONFIGURE step because this step
> depends on the dependancies being built. If it is a POST_PATCH step
> the dependencies won't be built and the GPM_RUN_AUTOGEN step will fail
> (if the host doesn't have autotools)"
> -- Ryan Barnett
> 
> Fixes:
> http://autobuild.buildroot.net/results/543/543b4135c7996133f32e82d72d6f2969622f8617/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/sdl/sdl.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index ba5fbca..ad3e19d 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -12,15 +12,14 @@ SDL_LICENSE_FILES = COPYING
>  SDL_INSTALL_STAGING = YES
>  
>  # we're patching configure.in, but package cannot autoreconf with our version of
> -# autotools, so we have to do it manually instead of setting SD_AUTORECONF = YES
> +# autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
>  define SDL_RUN_AUTOGEN
>  	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
>  endef
>  
> -SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
> +SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
>  SDL_DEPENDENCIES += host-automake host-autoconf host-libtool

A similar change was made (but for a different reason) in the next
branch, in commit
http://git.buildroot.net/buildroot/commit/package/sdl?h=next&id=f75b5de9f6f473a257c607e97419a2338d57333c.

Peter, we should backport this patch into the master branch, I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
