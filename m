From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 23:15:03 +0200
Subject: [Buildroot] [PATCH 07/35] perl: use <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1427650429-9293-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329211503.GH4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> Instead of manually using the DOWNLOAD macro (which should remain an
> internal macro), this commit converts the Perl package to use
> <pkg>_EXTRA_DOWNLOADS, now that it has been extended to allow full
> URLs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/perl/perl.mk | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 133e8aa..fb3ae6d 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -17,19 +17,11 @@ PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
>  # DO NOT refactor with the github helper (the result is not the same)
>  PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
>  PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
> +PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
> +
>  PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
>  PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
>  
> -# We use the perlcross hack to cross-compile perl. It should
> -# be extracted over the perl sources, so we don't define that
> -# as a separate package. Instead, it is downloaded and extracted
> -# together with perl

I would have kept part of the comment, which states that perl-cross
should be extracted over the perl sources. But I don;t much care either,
the code is pretty explicit.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> -define PERL_CROSS_DOWNLOAD
> -	$(call DOWNLOAD,$(PERL_CROSS_SITE:/=)/$(PERL_CROSS_SOURCE))
> -endef
> -PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
> -
>  define PERL_CROSS_EXTRACT
>  	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
>  	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
