From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 21:17:08 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/Makefile.in: add a way to
 don't force jobs in sub-make
In-Reply-To: <1374138746-23279-2-git-send-email-fabio.porcedda@gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52151234.2040605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/07/13 11:12, Fabio Porcedda wrote:
> When the "BR2_JLEVEL" variable is empty use "make"
> without the "-j" option.
> To be able to use top-level parallel make we must don't force
> the number of jobs in sub-make.
>
> Example:
> 	make BR2_JLEVEL= -j8
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  If only because it's a bad idea to start a linux build with 
-j<nothing>. I did that while testing the baseline for this patch and was 
caught in a swap storm...


  Regards,
  Arnout

> ---
>   package/Makefile.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a597290..c36ee4c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -18,7 +18,7 @@ PARALLEL_JOBS:=$(BR2_JLEVEL)
>   endif
>
>   MAKE1:=$(HOSTMAKE) -j1
> -MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
> +MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>
>   # Compute GNU_TARGET_NAME
>   GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
