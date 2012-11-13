From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 09:10:45 +0100
Subject: [Buildroot] [PATCH 2/2] cpanminus: fix paths
In-Reply-To: <1352558468-3643-2-git-send-email-francois.perrad@gadz.org>
References: <1352558468-3643-1-git-send-email-francois.perrad@gadz.org>
 <1352558468-3643-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <50A20085.8060209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/12 15:41, Francois Perrad wrote:
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
> ---
>   package/cpanminus/cpanminus.mk |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
> index af35e93..e07ef38 100644
> --- a/package/cpanminus/cpanminus.mk
> +++ b/package/cpanminus/cpanminus.mk
> @@ -11,8 +11,8 @@ CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NA
>
>   CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
>   CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
> -CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)
> -CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
> +CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl
> +CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl
>   CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)
>   CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME)
>   CPANMINUS_PERL5LIB = $(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
> @@ -27,8 +27,8 @@ define CPANMINUS_INSTALL_TARGET_CMDS
>   	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\"">>$(@D)/run_perl
>   	chmod +x $(@D)/run_perl
>   	PERL5LIB=$(CPANMINUS_PERL5LIB) \
> -	PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
> -	PERL_MB_OPT="--destdir $(TARGET_DIR)" \
> +	PERL_MM_OPT="DESTDIR=$(CPANMINUS_PERL_SITELIB) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
> +	PERL_MB_OPT="--destdir $(CPANMINUS_PERL_SITELIB)" \

  I merged this change as well in my own version of this patch.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
