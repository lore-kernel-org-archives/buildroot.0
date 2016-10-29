From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:57:09 +0200
Subject: [Buildroot] [PATCH 06/11] perl: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1477660709-5935-6-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1477660709-5935-6-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20161029155709.62a38067@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 10:18:24 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/perl/perl.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index a8768b2..b19fa78 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -81,20 +81,21 @@ PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
>  endif
>  
>  define PERL_CONFIGURE_CMDS
> -	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./configure $(PERL_CONF_OPTS))
> +	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' $(TARGET_MAKE_ENV) \

I think it makes more sense to have $(TARGET_MAKE_ENV) before HOSTCC=,
since HOSTCC= is package-specific, and should therefore appear after
the more "global" TARGET_MAKE_ENV variable.

I did the same change in patch 07/11 for the host variant of perl.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
