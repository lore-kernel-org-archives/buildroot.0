From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Nov 2020 23:23:58 +0100
Subject: [Buildroot] [PATCH v3 1/4] package/pkg-qmake: adding
 FOO_INCLUDE_FIXUP
In-Reply-To: <20201123214233.1465433-1-angelo@amarulasolutions.com>
References: <20201123214233.1465433-1-angelo@amarulasolutions.com>
Message-ID: <20201123232358.2bdfe26c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Mon, 23 Nov 2020 22:42:30 +0100, Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Some qmake based packages need to call the syncqt.pl script before
> building to have a properly populated "include" directory inside
> the package build tree.
> This script is automatically executed by qmake when a source tree
> is from a git clone: buildroot purges the .git directory hence the
> script never runs.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changelog
> v1 -> v2:
> * Fixed hash file (suggested by Peter)
> v2 -> v3:
> * Moved to use FOO_INCLUDE_FIXUP
>
>  docs/manual/adding-packages-qmake.txt | 4 ++++
>  package/pkg-qmake.mk                  | 5 +++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
> index e1621e914e..de508dbea4 100644
> --- a/docs/manual/adding-packages-qmake.txt
> +++ b/docs/manual/adding-packages-qmake.txt
> @@ -79,3 +79,7 @@ also be defined.
>  * +LIBFOO_INSTALL_TARGET_OPTS+, to specify additional targets to pass
>    to the +make+ command during the target installation step. By default,
>    +install+.
> +
> +* +LIBFOO_INCLUDE_FIXUP+, to run syncqt.pl before qmake. Some packages
> +  need this to have a properly populated include directory before
> +  running the build.

Nice refactoring of the common code..., minor nitpick, 'INCLUDE_FIXUP' is
not very specific, maybe 'RUN_SYNCQT' is better?

Regards,
Peter


> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
> index 27727119d7..9d2a036ac3 100644
> --- a/package/pkg-qmake.mk
> +++ b/package/pkg-qmake.mk
> @@ -44,6 +44,10 @@ ifneq ($(1),qt5base)
>  $(2)_DEPENDENCIES 		+= qt5base
>  endif
>
> +ifdef $(2)_INCLUDE_FIXUP
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
> +	$$(if $$($(2)_INCLUDE_FIXUP), $(HOST_DIR)/bin/syncqt.pl -version $(QT5_VERSION) &&) \
>  	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
>  endef
>  endif
