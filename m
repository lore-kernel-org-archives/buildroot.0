From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 18:26:16 +0200
Subject: [Buildroot] [V2 1/2] pkg-perl: fix for Perl XS packages
 configured by Makefile.PL
In-Reply-To: <1398356762-12486-1-git-send-email-francois.perrad@gadz.org>
References: <1398356762-12486-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <535E8128.7020105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/14 18:26, Francois Perrad wrote:
> ExtUtils::MakeMaker adds all the header files used by the perl as
> dependencies to the generated Makefile. This means that the generated
> Makefile will depend on the system's header files.
> 
> Usually this is not a problem, because when building the target package,
> these header files will indeed be found in $(STAGING_DIR). However, some
> distro's add an extra header file to the system's perl. This header is
> also included in the generated Makefile, which makes the build fail
> because it doesn't exist in $(STAGING_DIR).
> 
> As a work-around, explicitly create this header file in $(STAGING_DIR).
> It doesn't hurt to create it even if the system perl doesn't need it.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(as usual, not tested, but I don't even see the error that this patch
fixes, for lack of target perl packages).


 Regards,
 Arnout

> ---
>  package/perl/perl.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 51aeb14..64ad7d3 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -94,4 +94,25 @@ define PERL_INSTALL_TARGET_CMDS
>  	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
>  endef
>  
> +# perl infra: fix for Perl XS packages configured by Makefile.PL
> +#
> +# ExtUtils::MakeMaker adds all the header files used by the perl as
> +# dependencies to the generated Makefile. This means that the generated
> +# Makefile will depend on the system's header files.
> +#
> +# Usually this is not a problem, because when building the target package,
> +# these header files will indeed be found in $(STAGING_DIR). However, some
> +# distro's add an extra header file to the system's perl. This header is
> +# also included in the generated Makefile, which makes the build fail
> +# because it doesn't exist in $(STAGING_DIR).
> +#
> +# As a work-around, explicitly create this header file in $(STAGING_DIR).
> +# It doesn't hurt to create it even if the system perl doesn't need it.
> +#
> +define PERL_ADD_PATCHLEVEL_DEBIAN_H
> +	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h
> +endef
> +
> +PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_PATCHLEVEL_DEBIAN_H
> +
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
