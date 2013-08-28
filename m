From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 03:47:19 +0200
Subject: [Buildroot] [PATCHv3 1/1] civetweb: new package
In-Reply-To: <1377645963-1953-2-git-send-email-sunsetbrew@sunsetbrew.com>
References: <1377645963-1953-1-git-send-email-sunsetbrew@sunsetbrew.com>
 <1377645963-1953-2-git-send-email-sunsetbrew@sunsetbrew.com>
Message-ID: <CAAXf6LU1z7YLRaAjXEvfYVa0QXNkia5=cL-zjDKWb80SWK_1mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Op 28-aug.-2013 01:34 schreef "Thomas Davis" <sunsetbrew@sunsetbrew.com>
het volgende:
>
>
> Signed-off-by: Thomas Davis <sunsetbrew@sunsetbrew.com>
> ---
>  package/Config.in            |    1 +
>  package/civetweb/Config.in   |   26 ++++++++++++++++++++
>  package/civetweb/civetweb.mk |   53
++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+), 0 deletions(-)
>  create mode 100644 package/civetweb/Config.in
>  create mode 100644 package/civetweb/civetweb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7069d77..25433b6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -719,6 +719,7 @@ source "package/bridge-utils/Config.in"
>  source "package/bwm-ng/Config.in"
>  source "package/can-utils/Config.in"
>  source "package/chrony/Config.in"
> +source "package/civetweb/Config.in"
>  source "package/connman/Config.in"
>  source "package/crda/Config.in"
>  source "package/ctorrent/Config.in"
> diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
> new file mode 100644
> index 0000000..8ca587b
> --- /dev/null
> +++ b/package/civetweb/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_CIVETWEB
> +       bool "civetweb"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         Full featured embedded web server with LUA support.

Sorry that I didn't spot this earlier. The Lua website explicitly asks not
to write LUA but rather Lua.
http://www.lua.org/about.html

> +
> +         https://sourceforge.net/projects/civetweb
> +
> +if BR2_PACKAGE_CIVETWEB
> +
> +config BR2_CIVETWEB_WITH_LUA
> +       bool "enable LUA support"

Same here.

> +       # required by the bundled sqlite and lua code
> +       depends on BR2_LARGEFILE
> +       help
> +         Enable Lua support in Civetweb. Note that this will use a
> +         version of Lua and Sqlite bundled within the Civetweb
> +         sources, and not the packages from Buildroot.
> +
> +comment "lua support requires largefile support in toolchain"

I would tend to also write Lua here, although we sometimes wrote such
comments in all-lowercase.

> +       depends on !BR2_LARGEFILE
> +
> +endif
> +
> +comment "civetweb requires a toolchain with PTHREAD support"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> new file mode 100644
> index 0000000..17b02fb
> --- /dev/null
> +++ b/package/civetweb/civetweb.mk
> @@ -0,0 +1,53 @@
>
+################################################################################
> +#
> +# civetweb
> +#
>
+################################################################################
> +
> +CIVETWEB_VERSION = 1.3
> +CIVETWEB_SOURCE = civetweb-$(CIVETWEB_VERSION).tar.gz

This is the default for FOO_SOURCE, so you can remove this line.

> +CIVETWEB_SITE =
http://github.com/sunsetbrew/civetweb/tarball/v$(CIVETWEB_VERSION)
> +CIVETWEB_LICENSE = MIT
> +CIVETWEB_LICENSE_FILES = LICENSE.md
> +
> +CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
> +CIVETWEB_CONF_OPT = TARGET_OS=LINUX
> +CIVETWEB_LDFLAGS = $(TARGET_LDFLAGS)
> +CIVETWEB_HTMLDIR = /var/www
> +
> +ifneq ($(BR2_LARGEFILE),y)
> +       CIVETWEB_COPT += -DSQLITE_DISABLE_LFS
> +endif
> +
> +ifeq ($(BR2_INET_IPV6),y)
> +       CIVETWEB_CONF_OPT += WITH_IPV6=1
> +endif
> +
> +ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
> +       CIVETWEB_CONF_OPT += WITH_LUA=1
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +       CIVETWEB_COPT += -DNO_SSL_DL -lcrypt -lssl
> +       CIVETWEB_DEPENDENCIES += openssl
> +else
> +       CIVETWEB_COPT += -DNO_SSL
> +endif
> +
> +define CIVETWEB_BUILD_CMDS
> +       $(MAKE) CC="$(TARGET_CC)" -C $(@D) build \
> +               $(CIVETWEB_CONF_OPT) \
> +               COPT="$(CIVETWEB_COPT)"
> +endef
> +
> +define CIVETWEB_INSTALL_TARGET_CMDS
> +       $(MAKE) CC="$(TARGET_CC)" -C $(@D) install \
> +               DOCUMENT_ROOT="$(CIVETWEB_HTMLDIR)" \
> +               HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
> +               PREFIX="$(TARGET_DIR)/usr/local" \

The prefix should be usr/ instead of usr/local/.

> +               $(CIVETWEB_CONF_OPT) \
> +               COPT='$(CIVETWEB_COPT)'
> +endef
> +
> +$(eval $(generic-package))
> +
> --

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130828/0f99969d/attachment.html>
