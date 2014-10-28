From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 22:06:53 +0100
Subject: [Buildroot] [PATCH] Makefile: improve detection of make "-s"
 flag
In-Reply-To: <1414422891-7269-1-git-send-email-fabio.porcedda@gmail.com>
References: <1414422891-7269-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5450056D.4010601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/10/14 16:14, Fabio Porcedda wrote:
> Because it's just checked the presence of the "s" character even a
>   make --warn-undefined-variables
> is detected as a silent build so fix this by filtering out long options.
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 907a0fc..4fd6b64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  TARGETS :=
>  
>  # silent mode requested?
> -QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
> +QUIET := $(if $(findstring s, $(filter-out --%, $(MAKEFLAGS))), -q)

 This add a spurious space to the QUIET variable. Not really important, but we
normally avoid that.

 Also, maybe an easier solution is:

# Search for s only in the short options
QUIET := $(if $(findstring s,$(firstword $(MAKEFLAGS))),-q)

(Note that GNU make converts something like --silent into an s in MAKEFLAGS, and
that all the short options are collected to the beginning of MAKEFLAGS.)


 Regards,
 Arnout

>  
>  # Strip off the annoying quoting
>  ARCH := $(call qstrip,$(BR2_ARCH))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
