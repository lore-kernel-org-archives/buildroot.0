From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 00:41:15 +0200
Subject: [Buildroot] [PATCH] br2-external support existing package
 customization
In-Reply-To: <1445617505-16026-1-git-send-email-sv99@inbox.ru>
References: <1445617505-16026-1-git-send-email-sv99@inbox.ru>
Message-ID: <20151023224115.GD3674@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Volkov, All,

Thanks you for your submission. :-)

I have some concerns with it, please read on...

On 2015-10-23 19:25 +0300, Volkov Viacheslav spake thusly:
> Tested on the pkg-generic.
> 
> BR2_PACKAGE_OVERLAY_DIR may be set as $(BR2_EXTERNAL)/package_overlay
>   pkgname1
>     pkgname1.mk
>   pkgname2
>     pkgname2.mk

Even though I understand your reason for wanting this feature (but see
below for suggestion to solve it differently), I have to admit that I am
not sure we ultimately want that in Buildroot.

It allows for too many opportunities to actually break things.

For example, suppose that a package has a version in Buldroot:

    FOO_VERSION = 1.2.3

and an overlay overrides that to another version:

    FOO_VERSION = 4.5.6

which is totally different from the one known to Buildroot, like uses a
different build system (cmake instead of autotools).

Surely, this will break horribly.

And there are even worse sceanrios I can't even think of (well, I can, I
have a wicked mind ;-) ).

Anyway, see below forsome comments nonetheless, about the implemenation...

> Tested on the nginx package
> 
> nginx.mk
> # Test overlay package
> $(waning start overlay)
> define NGINX_POST_PATCH_FIXUP
> 	git clone https:/github.com/arut/nginx-rtmp-module.git $(@D)/rtmp
> endef
> NGINX_CONF_OPT += --add-module=$(@D)/rtmp
> $(warning NGINX_CONF_OPTS)

There are a few issues with how you are doing this.

First, the macro NGINX_POST_PATCH_FIXUP is never used; but I get that's
an omission in the commit log and you assigned it to a post-patch hook
in your tree.

Second, it looks like it is a post-patch hook (looking at the name of
the macro). This is purely wrong, because we are not guaranteed to have
network access at that time. Only download commands and their pre and
post hooks are guaranteed to have network access. It's used by people
that do not have a continuous internet connection, so they can connect,
run 'make source' to get everything they need, and then disconnect.

Third, this does not provide a reproducible build, since you always end
up using the lastest commit at the time of the clone, hence between two
builds, there is no guarantee you'd get the same result.

Fourth, the licensing information is not updated to account for that new
body of code being dropped (but fortunately, both are BSD-2c). Still,
that code will not be part of the legal-info output.


However, the most obvious solution is to try and get something upstream
in Buildroot. I would suggest that you update the existing nginx
package, like so:

  - in package/nginx/Config.in:

    comment "external modules"

    config BR2_PACKAGE_NGINX_RTMP_MODULE
        bool "rtmp"

  - in package/nginx/nginx.mk:

    NGINX_RTMP_MODULE_VERSION = v1.1.7
    NGINX_RTMP_MODULE_SOURCE = nginx-rtmp-module-$(NGINX_RTMP_MODULE_VERSION).tar.gz
    NGINX_RTMP_MODULE_SITE = $(call github,arut,nginx-rtmp-module,$(NGINX_RTMP_MODULE_VERSION))

    NGINX_EXTRA_DOWNLOADS = $(NGINX_RTMP_MODULE_SITE)/$(NGINX_RTMP_MODULE_SOURCE)

    ifeq ($(BR2_PACKAGE_NGINX_RTMP_MODULE),y)
    define NGINX_RTMP_MODULE_EXTRACT
        mkdir -p $(@D)/rtmp
        $(call suitable-extractor,$(NGINX_RTMP_MODULE_SOURCE)) \
            $(DL_DIR)/$(NGINX_RTMP_MODULE_SOURCE) |\
            $(TAR) --strip-components=1 -C $(@D)/rtmp $(TAR_OPTIONS) -
    endef
    NGINX_POST_EXTRACT_HOOKS += NGINX_RTMP_MODULE_EXTRACT
    NGINX_CONF_OPTS += --add-module=$(@D)/rtmp
    endif # BR2_PACKAGE_NGINX_RTMP_MODULE


Alternatively, I guess the same can be achieved by putting that code
directly in a br2-external tree and including the files as-is. Since the
variables are expanded only at the moment they are needed, you can well
complement existing variables from a br2-external tree (even though that
is really ugly).


> # -= analog
> # _CONF_OPTS := $(filter-out option.$(_CONF_OPTS))
>  
> Signed-off-by: sv99 <sv99@inbox.ru>

You must use your real name here.

[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ffef4d3..0617f78 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -341,6 +342,8 @@ endef
>  
>  define inner-generic-package
>  
> +$(eval $(call package-overlay,$(call qstrip,$(BR2_PACKAGE_OVERLAY_DIR)),$(1)/$(1).mk))

Why not simply something like:

    ifneq ($$(BR2_PACKAGE_OVERLAY_DIR),)
    -include $$(BR2_PACKAGE_OVERLAY_DIR)/$(1)/$(1).mk
    endif

Notes:
  - the include directive starts with a dash '-', so that make will not
    complain if the included file does not exist;
  - the variable is double-dollared, because we're inside the -inner
    macro; read the text above it for explanations.

This should be just enough, and would not need the weird macro with the
weird and convoluted perl stuff below.

An alternative would be:

    ifneq ($$(BR2_PACKAGE_OVERLAY_DIR),)
    ifneq ($$(wildcard $$(BR2_PACKAGE_OVERLAY_DIR)/$(1)/$(1).mk),)
    $$(warning Applying overlay for package $(1))
    include $$(BR2_PACKAGE_OVERLAY_DIR)/$(1)/$(1).mk
    endif
    endif

Which still does not require the weird package-overlay macro and, as an
added bonus, warns the user about which package is being overlaid.

>  # Define default values for various package-related variables, if not
>  # already defined. For some variables (version, source, site and
>  # subdir), if they are undefined, we try to see if a variable without
> @@ -895,6 +898,7 @@ endif
>  endif # $(2)_KCONFIG_VAR
>  endef # inner-generic-package
>  
> +

Please avoid spurious empty lines like this (second occurence).

>  ################################################################################
>  # generic-package -- the target generator macro for generic packages
>  ################################################################################
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 44bd2c9..310a8a7 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -150,3 +150,21 @@ define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
>  	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
>  	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
>  endef
> +
> +define newline
> +
> +
> +endef

We already have $(newline); it called $(sep).

> +newline-stub = __NEWLINE_STUB__
> +
> +# package-overlay -- load and eval makefile in place
> +# example:
> +#   $(eval $(call  package-overlay,$(call qstrip,$(BR2_PACKAGE_OVERLAY_DIR)),RELATIVE_PATH_TO_THE_FILE))
> +define package-overlay
> +ifneq ("$(1)","")
> +ifneq ($$(wildcard $(1)/$(2)),)
> +$$(eval $$(subst $$(newline-stub),$$(newline),$$(shell perl -p -e 's/\n/$$(newline-stub)/' $(1)/$(2))))

Eeek! :-(
Seriously? :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
