From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:59:56 +0100
Subject: [Buildroot] [PATCH 7/7] perl: use <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1425147313-17380-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EE6FC.4020601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> Instead of manually using the DOWNLOAD macro (which should remain an
> internal macro), this commit converts the Perl package to use
> <pkg>_EXTRA_DOWNLOADS, now that it has been extended to allow full
> URLs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/perl/perl.mk | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 0636aba..cb99a98 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -12,6 +12,11 @@ PERL_LICENSE = Artistic or GPLv1+
>  PERL_LICENSE_FILES = Artistic Copying README
>  PERL_INSTALL_STAGING = YES
>  
> +# We use the perlcross hack to cross-compile perl. It should
> +# be extracted over the perl sources, so we don't define that
> +# as a separate package. Instead, it is downloaded and extracted
> +# together with perl
> +
>  PERL_CROSS_VERSION = 0.9.4
>  PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
>  # DO NOT refactor with the github helper (the result is not the same)
> @@ -20,15 +25,7 @@ PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).
>  PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
>  PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
>  
> -# We use the perlcross hack to cross-compile perl. It should
> -# be extracted over the perl sources, so we don't define that
> -# as a separate package. Instead, it is downloaded and extracted
> -# together with perl
> -
> -define PERL_CROSS_DOWNLOAD
> -	$(call DOWNLOAD,$(PERL_CROSS_SITE:/=)/$(PERL_CROSS_SOURCE))
> -endef
> -PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
> +PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)

 It makes more sense to me to put this just below the definition of
PERL_CROSS_SOURCE, so before the _POD definitions.

 Otherwise, looks good to me.

 Regards,
 Arnout

>  
>  define PERL_CROSS_EXTRACT
>  	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
