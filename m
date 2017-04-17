From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Apr 2017 13:33:57 +0200
Subject: [Buildroot] [PATCH 1/2 v2] new package: rasqal
In-Reply-To: <1489044989-4047-1-git-send-email-erwan.gautron@yahoo.fr>
References: <1489044989-4047-1-git-send-email-erwan.gautron@yahoo.fr>
Message-ID: <a1c9332c-78b7-1dc3-45af-d1f870ad2a9a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erwan,

Thanks for this contribution!

Le 09/03/2017 ? 08:36, Erwan Gautron a ?crit :
> Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
> 
> 	  A free C library that handles
> 	  Resource Description Framework (RDF)
> 	  query syntaxes, query construction and
> 	  query execution returning result bindings

No need to add twice your SoB line, keep the one below.
Also no need to indent. (it seems a copy paste from Config.in)

> 
> Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
> ---
>  DEVELOPERS               |  3 +++
>  package/Config.in        |  1 +
>  package/rasqal/Config.in | 10 ++++++++++
>  package/rasqal/rasqal.mk | 15 +++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100755 package/rasqal/Config.in
>  create mode 100755 package/rasqal/rasqal.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6c74cac..afcf983 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -463,6 +463,9 @@ F:	package/mxsldr/
>  N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
>  F:	package/szip/
>  
> +N:	Erwan Gautron <erwan.gautron@yahoo.fr>
> +F:	package/rasqal/
> +
>  N:	Evan Zelkowitz <evan.zelkowitz@gmail.com>
>  F:	package/sdl_gfx/
>  
> diff --git a/package/Config.in b/package/Config.in
> index 9eb6a22..d46758d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1160,6 +1160,7 @@ menu "JSON/XML"
>  	source "package/rapidjson/Config.in"
>  	source "package/rapidxml/Config.in"
>  	source "package/raptor/Config.in"
> +	source "package/rasqal/Config.in"
>  	source "package/tinyxml/Config.in"
>  	source "package/tinyxml2/Config.in"
>  	source "package/valijson/Config.in"
> diff --git a/package/rasqal/Config.in b/package/rasqal/Config.in
> new file mode 100755
> index 0000000..40a3adb
> --- /dev/null
> +++ b/package/rasqal/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_RASQAL
> +	bool "rasqal"
> +	select BR2_PACKAGE_RAPTOR
> +	help
> +	  A free C library that handles 
> +	  Resource Description Framework (RDF) 
> +	  query syntaxes, query construction and 
> +	  query execution returning result bindings
> +
> +	  http://librdf.org/rasqal/
> diff --git a/package/rasqal/rasqal.mk b/package/rasqal/rasqal.mk
> new file mode 100755
> index 0000000..8fb1e70
> --- /dev/null
> +++ b/package/rasqal/rasqal.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# rasqal
> +#
> +################################################################################

Add a new line here.

> +RASQAL_VERSION = 0.9.33
> +RASQAL_SITE = http://download.librdf.org/source
> +RASQAL_DEPENDENCIES = raptor

You need to add host-pkgconf since the configure script use PKG_CHECK_MODULES macro.

Also, pcre dependency is auto detected and seems to be optional.

Can you try to add something like:
ifeq ($(BR2_PACKAGE_PCRE),y)
RASQAL_DEPENDENCIES += pcre
RASQAL_CONF_OPTS += --enable-pcre
else
RASQAL_CONF_OPTS += --disable-pcre
endif

Otherwise the build can fail with:
rasqal_regex.c:41:18: fatal error: pcre.h: No such file or directory
 #include <pcre.h>

> +RASQAL_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+

We recently switched to SPDX license format:
https://spdx.org/licenses/

It should be:
GPL-2.0 or LGPL-2.1+ or Apache-2.0

> +RASQAL_LICENSE_FILES = LICENSE.txt

Also add LICENSE-2.0.txt

> +
> +RASQAL_AUTORECONF = YES

Usually we add a comment to explain why autoreconf is needed.

I'll mark your patch "Changes Requested" in patchwork, can you resend it after
taking into account all comments ?

Also I suggest to use test-pkg script in order to detect most of the obvious
build issues [1] and use the new check-package script [2] for the coding style.

Note, you have to work against master branch to get all these new features.

[1] http://nightly.buildroot.org/manual.html#_tips_and_tricks
[2] ./support/scripts/check-package package/rasqal

PS: ignore the issue with br-arm-cortex-m4-full toolchain:
elf2flt terminated with signal 11

Best regards,
Romain

> +RASQAL_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> 
