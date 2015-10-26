From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Oct 2015 22:12:19 +0100
Subject: [Buildroot] [PATCH 06/21 v2] docs/manual: do not override
	BR2_EXTERNAL
In-Reply-To: <4ffb76bcc38fd984ddd6b91f6a0228456b418f1d.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <4ffb76bcc38fd984ddd6b91f6a0228456b418f1d.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <562E9733.3070709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 22:34, Yann E. MORIN wrote:
> Currently, we forcibly override BR2_EXTERNAL when building the manual,
> so as to avoid referring to packages therein from the manual.
> 
> However, when generating the lists of packages, we limit ourselves to
> scanning for packages in (Buildroot's) TOPDIR and never search in
> BR2_EXTERNAL. So, we do not really need to override BR2_EXTERNAL when
> generating the manual to achieve the same result.
> 
> Furthermore, we're only looking for packages that are defined in the
> sub-menu "Target packages", and never anywhere else, and especially not
> in the sub-menu "User-provided options".
> 
> Finally, we're soon to completely eliminate use of BR2_EXTERNAL in
> Kconfig altogether, so that would no longer have any impact anyway.
> 
> So, just leave BR2_EXTERNAL alone when generating the manual.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Again, can be applied independently of the rest of the series.

 Regards,
 Arnout

> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/manual.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index ad9bd90..caf080a 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -8,13 +8,10 @@ MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
>  MANUAL_RESOURCES = $(TOPDIR)/docs/images
>  
>  # Our manual needs to generate lists
> -# Packages included in BR2_EXTERNAL are not part of buildroot, so they
> -# should not be included in the manual.
>  define MANUAL_GEN_LISTS
>  	$(Q)$(call MESSAGE,"Updating the manual lists...")
>  	$(Q)$(COMMON_CONFIG_ENV) \
>  		BR2_DEFCONFIG="" \
> -		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
>  		TOPDIR=$(TOPDIR) \
>  		O=$(@D) \
>  		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
