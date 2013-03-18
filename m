From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 17:34:41 +0100
Subject: [Buildroot] [PATCH 1/2] Added package enscript
In-Reply-To: <1363535972-29959-1-git-send-email-olivier.schonken@gmail.com>
References: <1363535972-29959-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130318173441.0e7fe442@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 17 Mar 2013 17:59:31 +0200, Olivier Schonken wrote:

>  menu "Interpreter languages and scripting"
>  source "package/erlang/Config.in"
> +source "package/enscript/Config.in"
>  source "package/haserl/Config.in"
>  source "package/jamvm/Config.in"
>  source "package/lua/Config.in"

Even though strictly speaking, enscript is an interpreter, I don't
think I would put it under the "Interpreter languages and scripting"
section.

> +config BR2_PACKAGE_ENSCRIPT
> +	bool "enscript"
> +	select BR2_PACKAGE_GETTEXT

Why? You don't even have gettext as a dependency in the .mk file.
Moreover, gettext handling is generally more complicated than just a
simple select, see
http://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages.

> diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
> new file mode 100644
> index 0000000..29fd6d4
> --- /dev/null
> +++ b/package/enscript/enscript.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# enscript
> +#
> +#############################################################
> +ENSCRIPT_VERSION = 1.6.6

Nitpick: one empty line between header and first variable.

> +ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
> +ENSCRIPT_SOURCE = enscript-$(ENSCRIPT_VERSION).tar.gz

Line not needed.

> +ENSCRIPT_DEPENDENCIES = 

Line not needed.

> +ENSCRIPT_LICENSE = GPLv3

The license is really not GPLv3+ ?

> +ENSCRIPT_LICENSE_FILES = COPYING
> +
> +#Enable pthread threads if toolchain supports threads
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS), y)

No space before the "y".

> +	ENSCRIPT_CONF_OPT += --enable-threads=pth
> +else
> +	ENSCRIPT_CONF_OPT += --disable-threads
> +endif
> +
> +$(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
