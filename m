From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 Apr 2015 21:09:22 +0200
Subject: [Buildroot] [PATCH] Makefile: fix HOSTFC definition
In-Reply-To: <1428454350-30186-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428454350-30186-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <55257CE2.9090206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 02:52, Masahiro Yamada wrote:
> "echo" always succeeds, "which g77 || type -p g77 || echo gfortran"
> is never run.

 + mention the correction HOSTLD -> HOSTFC

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 9db52a8..8f4f87c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -251,7 +251,7 @@ HOSTRANLIB := ranlib
>  endif
>  HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
>  HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
> -HOSTFC := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
                                 ^^
 Since it was incorrect anyway (it was defined as /usr/bin/ld on the
autobuilders) and there was never an issue with it, I guess it was not used
anyway. So I propose to completely remove it.

 Failing that:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +HOSTFC := $(shell which $(HOSTFC) || type -p $(HOSTFC) || which g77 || type -p g77 || echo gfortran)
>  HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
>  HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
>  HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
