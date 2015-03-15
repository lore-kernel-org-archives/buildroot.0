From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Mar 2015 17:46:02 +0100
Subject: [Buildroot] [PATCH 7/7] perl: use <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1425147313-17380-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5505B74A.1070606@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 28/02/2015 19:15, Thomas Petazzoni a ?crit :
> Instead of manually using the DOWNLOAD macro (which should remain an
> internal macro), this commit converts the Perl package to use
> <pkg>_EXTRA_DOWNLOADS, now that it has been extended to allow full
> URLs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

This patch needs to be rebased on master since the perl package has been
updated, but the aim of this patch is the same.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

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
>  
>  define PERL_CROSS_EXTRACT
>  	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
> 
