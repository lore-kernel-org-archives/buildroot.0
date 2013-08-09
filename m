From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 9 Aug 2013 13:23:03 +0300
Subject: [Buildroot] [PATCH 1/3] ltrace: Explicit enable/disable of
 libunwind
In-Reply-To: <1376041019-26688-2-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
 <1376041019-26688-2-git-send-email-jezz@sysmic.org>
Message-ID: <20130809102303.GC3703@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Fri, Aug 09, 2013 at 11:36:57AM +0200, J?r?me Pouiller wrote:
> ltrace automaticaly use libunwind if detected. So depending if libunwind was
> already compiled or not, ltrcae compile differently. This patch add explicit
> dependency to libunwind if detected.
> 
> In add, due to limitation of luclibc, ltrace cannot use libunwind with uclib. this patch explicitly compile without libunwind in this case.

s/luclibc/uclibc/

Also, please warp log message lines at about 80 characters.

baruch

> Resolve issues detected here:
>     http://autobuild.buildroot.net/results/79dae85647526cdeddae5050db0339fbc38c9ae6
>     http://autobuild.buildroot.net/results/808569f6bfac059b57eb4f1e692fbc9909e791cf
>     http://autobuild.buildroot.net/results/83d0cd13d64053869708c666e2aa533202af67f7
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/ltrace/ltrace.mk |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
> index 7b8d859..4d81121 100644
> --- a/package/ltrace/ltrace.mk
> +++ b/package/ltrace/ltrace.mk
> @@ -13,4 +13,13 @@ LTRACE_CONF_OPT = --disable-werror
>  LTRACE_LICENSE = GPLv2
>  LTRACE_LICENSE_FILES = COPYING
>  
> +LTRACE_LIBUNWIDFLAG = --without-libunwind
> +ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
> +  ifneq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +    LTRACE_DEPENDENCIES = libunwind
> +    LTRACE_LIBUNWIDFLAG = --with-libunwind
> +  endif
> +endif
> +LTRACE_CONF_OPT = $(LTRACE_LIBUNWIDFLAG)
> +
>  $(eval $(autotools-package))
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
