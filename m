From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Dec 2020 20:51:14 +0100
Subject: [Buildroot] [PATCH v4 1/4] package/pkg-qmake: adding
 FOO_SYNC_HEADERS
In-Reply-To: <20201124065917.1567055-1-angelo@amarulasolutions.com>
References: <20201124065917.1567055-1-angelo@amarulasolutions.com>
Message-ID: <20201206205114.4fbd7f32@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Nov 2020 07:59:14 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Some qmake based packages need to call the syncqt.pl script before
> building to have a properly populated "include" directory inside
> the package build tree.
> This script is automatically executed by qmake when a source tree
> is from a git clone: buildroot purges the .git directory hence the
> script never runs.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks! I have applied this, but after doing some changes. First, I
renamed the variable to <pkg>_SYNC_QT_HEADERS.

> +ifdef $(2)_SYNC_HEADERS

Changed to ifeq (..., YES). Indeed, with an ifdef, even setting
SYNC_HEADERS = NO would have triggered the thing, which would have not
been expected.

> +$(2)_DEPENDENCIES 		+= host-perl
> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file.
> @@ -52,6 +56,7 @@ ifndef $(2)_CONFIGURE_CMDS
>  define $(2)_CONFIGURE_CMDS
>  	$$(QT5_QT_CONF_FIXUP)
>  	cd $$($(2)_BUILDDIR) && \
> +	$$(if $$($(2)_SYNC_HEADERS), $(HOST_DIR)/bin/syncqt.pl -version $(QT5_VERSION) &&) \

I moved this out into a pre-configure hook, following the model that we
use for running autoreconf on autotools packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
