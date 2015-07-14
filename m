From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 17:45:38 +0200
Subject: [Buildroot] [PATCH 1/7] package/perf: if slang is enabled,
 depend on it
In-Reply-To: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
Message-ID: <55A52EA2.4020000@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

Le 18/03/2015 22:42, Steven Noonan a ?crit :
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/perf/perf.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> index f6591a6..2b0702c 100644
> --- a/package/perf/perf.mk
> +++ b/package/perf/perf.mk
> @@ -34,6 +34,10 @@ ifeq ($(BR2_arc),y)
>  	PERF_MAKE_FLAGS += NO_BACKTRACE=1
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SLANG),y)
> +	PERF_DEPENDENCIES += slang
> +endif
> +

The slang support can't be enabled simply by adding the slang package
dependency, because newt support is disabled in PERF_MAKE_FLAGS:

PERF_MAKE_FLAGS = NO_NEWT=1

In tools/perl/config/Makefile, the slang support is disabled here (kernel 4.2-rc2):

ifdef NO_NEWT
  NO_SLANG=1
endif

So, you need to enable newt before.

Can you rework this patch and resubmit ?

Best regards,
Romain Naour

>  ifeq ($(BR2_PACKAGE_ELFUTILS),y)
>  	PERF_DEPENDENCIES += elfutils
>  else
> 
