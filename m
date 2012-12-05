From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Dec 2012 22:39:27 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <1354741542-6079-2-git-send-email-zinosat@tiscali.it>
References: <1354741542-6079-1-git-send-email-zinosat@tiscali.it>
 <1354741542-6079-2-git-send-email-zinosat@tiscali.it>
Message-ID: <201212052239.28147.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Davide, All,

On Wednesday 05 December 2012 Davide Viti wrote:
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
>  package/Config.in        |    5 +++++
>  package/tcllib/Config.in |   12 ++++++++++++
>  package/tcllib/tcllib.mk |   23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 0 deletions(-)
>  create mode 100644 package/tcllib/Config.in
>  create mode 100644 package/tcllib/tcllib.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e759620..6d3f4fb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -311,6 +311,11 @@ endmenu
>  endif
>  source "package/ruby/Config.in"
>  source "package/tcl/Config.in"
> +if BR2_PACKAGE_TCL
> +menu "tcl libraries/modules"
> +source "package/tcllib/Config.in"
> +endmenu
> +endif
>  endmenu
>  
>  menu "Libraries"
> diff --git a/package/tcllib/Config.in b/package/tcllib/Config.in
> new file mode 100644
> index 0000000..cf65a9e
> --- /dev/null
> +++ b/package/tcllib/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_TCLLIB
> +	bool "tcllib"
> +	depends on BR2_PACKAGE_TCL

Technically, this is not needed, because you already have a 'if TCL'
in package/Config.in  (see above)

> +	help
> +	  Tcllib is a collection of utility modules for Tcl. These
> +	  modules provide a wide variety of functionality, from
> +	  implementations of standard data structures to
> +	  implementations of common networking protocols. The intent
> +	  is to collect commonly used function into a single library,
> +	  which users can rely on to be available and stable
> +
> +	  http://tcl.activestate.com/software/tcllib/
> diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
> new file mode 100644
> index 0000000..2e85dc2
> --- /dev/null
> +++ b/package/tcllib/tcllib.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# tcllib
> +#
> +#############################################################
> +TCLLIB_VERSION       = 1.13
> +TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.gz
> +TCLLIB_SITE          = http://sourceforge.net/projects/tcllib/files/tcllib/$(TCLLIB_VERSION)/

Should be:
    http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)/

Also, there is a .tar.bz2, which is ~25% smaller than the .tar.gz, it will
be (a bit) faster to download.

> +TCLLIB_LICENSE       = BSD-2c
> +TCLLIB_LICENSE_FILES = license.terms

This does not really look like the BSD-2c I know of, and that are
listed there: https://spdx.org/licenses/

> +TCLLIB_DEPENDENCIES  = tcl
> +
> +define TCLLIB_INSTALL_TARGET_CMDS
> +	(cd $(@D); \
> +	    tclsh installer.tcl \
> +	    -no-examples -no-html -no-pkgs -no-wait \
> +	    -no-gui -no-apps -no-nroff \
> +	    -pkg-path $(TARGET_DIR)/usr/lib/tcl8.4 \
> +	)
> +endef
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Why the host one? Is it used by any other package at build-time?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
