From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 22:30:25 +0200
Subject: [Buildroot] [PATCH] perl: handles BR2_PREFER_STATIC_LIB
In-Reply-To: <1406478877-9705-1-git-send-email-francois.perrad@gadz.org>
References: <1406478877-9705-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140728223025.45339660@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

I've fixed the commit log: s/handles/handle/.

On Sun, 27 Jul 2014 18:34:37 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Makefile             | 1 +
>  package/perl/perl.mk | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 6bd18e3..a0f37db 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -579,6 +579,7 @@ endif
>  	rm -rf $(TARGET_DIR)/usr/lib/luarocks
>  	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
>  	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
> +	find $(TARGET_DIR)/usr/lib/perl5/ -name 'extralibs.ld' -print0 | xargs -0 rm -f
>  	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
>  	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f

Could you prepare a patch that moves the Lua specific and Perl specific
target-finalize stuff to the relevant packages, using the new
TARGET_FINALIZE_HOOKS mechanism?

> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +    PERL_CONF_OPT += --all-static
> +    PERL_CONF_OPT += --no-dynaloader

I've changed to use one PERL_CONF_OPT += line only.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
