From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 14:23:29 +0200
Subject: [Buildroot] [PATCH v8 04/11] perl: add DB_File
In-Reply-To: <1348593508-14254-4-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <507022C1.9030909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/09/12 19:18, Francois Perrad wrote:
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
> ---
>   package/perl/Config.in |   10 ++++++++++
>   package/perl/perl.mk   |    4 ++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/package/perl/Config.in b/package/perl/Config.in
> index 3e11574..e0dbbdf 100644
> --- a/package/perl/Config.in
> +++ b/package/perl/Config.in
> @@ -17,3 +17,13 @@ config BR2_PACKAGE_PERL_ONLY_MINIPERL
>   	  Usually used to bootstrap a full Perl (@INC contains only .).
>
>   endif
> +
> +if BR2_PACKAGE_PERL&&  !BR2_PACKAGE_PERL_ONLY_MINIPERL

  You can reuse the preceding if BR2_PACKAGE_PERL, so all the perl options
will be wrapped into two condition levels.

> +
> +config BR2_PACKAGE_PERL_DB_FILE
> +	bool "DB_File"
> +	select BR2_PACKAGE_BERKELEYDB
> +	help
> +	  Build the DB_File module.
> +
> +endif
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 8f7ba15..0c69e0b 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -11,7 +11,11 @@ PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
>   PERL_LICENSE = Artistic
>   PERL_LICENSE_FILES = Artistic
>   PERL_INSTALL_STAGING = YES
> +
>   PERL_DEPENDENCIES = host-qemu
> +ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
> +    PERL_DEPENDENCIES += berkeleydb
> +endif

  We want reproducible builds, so whether DB_File is built shouldn't depend
on whether berkeleydb happens to have been built before.  If you don't select
the PERL_DB_FILE option, DB_File still might be built depending on the order
of compilation. There are two options to resolve this.

- Add something to PERL_CONF_OPT to explicitly disable and enable DB_FILE.

- Remove the configure option, and instead write
ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
	PERL_DEPENDENCIES += berkeleydb
endif


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
