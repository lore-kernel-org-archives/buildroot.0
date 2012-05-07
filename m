From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 May 2012 14:00:13 +0300
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
Message-ID: <20120507110012.GB8916@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

Please squash this patch into the previous one, and send a single fixed patch.

A couple more comments below.

On Mon, May 07, 2012 at 06:28:58AM -0400, Dmitry wrote:
>  * git source URL -> http source URL
>  * AUTOTARGETS -> GENTARGETS
> 
> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---
>  package/v86d/v86d.mk |   23 +++++++++++------------
>  1 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/package/v86d/v86d.mk b/package/v86d/v86d.mk
> index 035797e..5147a2d 100644
> --- a/package/v86d/v86d.mk
> +++ b/package/v86d/v86d.mk
> @@ -4,23 +4,22 @@
>  # 
>  ############################################
>  
> -V86D_VERSION = v86d-0.1.10
> -V86D_SITE = git://repo.or.cz/v86d.git
> -
> -# It is necessary to define __i386__ explicitly for successful compilation.
> -
> -define V86D_BUILD_CMDS
> -	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
> -endef
> -
> -V86D_POST_CONFIGURE_HOOKS += V86D_REALLY_RUN_CONFIGURE
> +V86D_VERSION = 0.1.10
> +V86D_SOURCE = v86d-$(V86D_VERSION).tar.bz2
> +V86D_SITE = http://dev.gentoo.org/~spock/projects/uvesafb/archive
>  
>  # v86d's configure script is not autoconf-based: parameters
>  # supplied by Buildroot cause it to produce no result; explicit
>  # invocation is needed.

Since you don't use Buildroot's autoconf support, this comment is no longer 
relevant.

>  
> -define V86D_REALLY_RUN_CONFIGURE
> +define V86D_CONFIGURE_CMDS
>  	(cd $(@D) ; ./configure --default)
>  endef
>  
> -$(eval $(call AUTOTARGETS))
> +# It is necessary to define __i386__ explicitly for successful compilation.
> +
> +define V86D_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all

You can used $(TARGET_CONFIGURE_OPTS) here as well.

baruch

> +endef
> +
> +$(eval $(call GENTARGETS))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
