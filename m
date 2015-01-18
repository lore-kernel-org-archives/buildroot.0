From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 15:59:37 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpm: use external xz library
In-Reply-To: <1421580900-15186-2-git-send-email-romain.naour@openwide.fr>
References: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
 <1421580900-15186-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150118145937.GH4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-01-18 12:34 +0100, Romain Naour spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/2c6/2c61562008418ff58fa3085a3342b0e304923073/

Weird, this build error is about being unable to link with libintl.so
(indeed while building the xz backend, but still about libintl).

Igues I could use that autobuild failure to test your patch 1/3,
though...

Otherwise, I have some comments, see below...

> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/rpm/Config.in | 1 +
>  package/rpm/rpm.mk    | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 5ec4167..fe7a38a 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -31,6 +31,7 @@ config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
>  config BR2_PACKAGE_RPM_XZ_PAYLOADS
>  	bool "support for xz payloads"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_XZ

I know you are fixing existing code, but we usually do not have such
sub-options, and we instead rely entirely on the dependant package in
the .mk, without adding such sub-options...

>  	help
>  	  Support for xz payloads in RPM.
>  
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index 74f5b88..ce7189e 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -45,7 +45,10 @@ RPM_CONF_OPTS += --with-file=no
>  endif
>  
>  ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
> -RPM_CONF_OPTS += --with-xz
> +RPM_CONF_OPTS += --with-xz=external
> +RPM_DEPENDENCIES += xz
> +else
> +RPM_CONF_OPTS += --with-xz=none

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endif
>  
>  ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
> -- 
> 1.9.3
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
