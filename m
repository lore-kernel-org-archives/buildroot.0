From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 21:24:00 +0100
Subject: [Buildroot] [PATCH 06/51] package/perl: include perl-cross in
 the legal-info output
In-Reply-To: <f360919da5180e26ce4f96eefed14c29b526b428.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <f360919da5180e26ce4f96eefed14c29b526b428.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <20151123212400.1ae778c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Luca,

On Mon, 23 Nov 2015 15:47:36 +0100, Yann E. MORIN wrote:
> The perl-cross sources are combined with the perl sources, so they must
> be redistributed for proper compliance.
> 
> Add a post-legal-info hook that also installs them in the legal-info
> output.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Francois Perrad <fperrad@gmail.com>
> ---
>  package/perl/perl.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index f3b7b2b..25294e6 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -32,6 +32,13 @@ define PERL_CROSS_EXTRACT
>  endef
>  PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
>  
> +# ... and as such should be part of the legal-info redistribution
> +define PERL_CROSS_LEGAL_INFO
> +	$(Q)$(call hardlink-copy,$(DL_DIR)/$(PERL_CROSS_SOURCE),\
> +				 $(PERL_REDIST_SOURCES_DIR))
> +endef
> +PERL_POST_LEGAL_INFO_HOOKS += PERL_CROSS_LEGAL_INFO
> +
>  define PERL_CROSS_SET_POD
>  	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
>  endef

I think this is not the proper way of solving the problem. perl-cross
is downloaded through <pkg>_EXTRA_DOWNLOADS, and <pkg>_EXTRA_DOWNLOADS
files should be saved in legal-info, without requiring some special
handling from each package using <pkg>_EXTRA_DOWNLOADS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
