From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 12:59:49 +0200
Subject: [Buildroot] [PATCH] cutelyst: new package
In-Reply-To: <20180717204613.22028-1-dantti12@gmail.com>
References: <20180717204613.22028-1-dantti12@gmail.com>
Message-ID: <20180718125949.04f926f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Tue, 17 Jul 2018 17:46:13 -0300, Daniel Nicoletti wrote:
> A C++ Web Framework built on top of Qt, using
> the simple approach of Catalyst (Perl) framework.
> 
> Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>

Thanks for this new iteration. I applied it after doing some changes,
which I'll describe below.

However, first of all, when you send a new iteration of a patch, it is
recommended to adjust the patch subject prefix to be [PATCH v2], and to
include a changelog...

> ---

... here, i.e below the "---" sign.

This way, it is clear that it is a new iteration, and we know what has
changed since the previous iteration.

See http://patchwork.ozlabs.org/patch/944700/ for an example of that.

To generate a patch with such a prefix, you can use:

	git format-patch -v2

or:

	git format-patch --subject-prefix="PATCH v2"

>  package/Config.in              |  1 +
>  package/cutelyst/Config.in     |  9 +++++++++
>  package/cutelyst/cutelyst.hash |  3 +++
>  package/cutelyst/cutelyst.mk   | 36 ++++++++++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)

You forgot to add an entry to the DEVELOPERS file, so I've added that.

> diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
> new file mode 100644
> index 0000000000..6b78e48cea
> --- /dev/null
> +++ b/package/cutelyst/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_CUTELYST
> +	bool "cutelyst"
> +	depends on BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	help
> +	  A C++ Web Framework built on top of Qt, using
> +	  the simple approach of Catalyst (Perl) framework.
> +
> +	  https://cutelyst.org

With this set of dependencies, cutelyst didn't build for me, with a
minimal configuration. It failed to build with:

/home/thomas/projets/buildroot/output/build/cutelyst-2.5.1/wsgi/tcpsslserver.h:44:36: error: ?QSslConfiguration? does not name a type
     void setSslConfiguration(const QSslConfiguration &conf);

This is because it needs SSL support in Qt. So I've added a "select
BR2_PACKAGE_OPENSSL" to make sure SSL support is present in Qt.

> index 0000000000..6653675352
> --- /dev/null
> +++ b/package/cutelyst/cutelyst.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# cutelyst
> +#
> +################################################################################
> +
> +CUTELYST_VERSION = 2.5.1
> +CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
> +CUTELYST_INSTALL_STAGING = YES
> +CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
> +CUTELYST_LICENSE = LGPL-2.1+
> +CUTELYST_LICENSE_FILES = COPYING
> +CUTELYST_DEPENDENCIES = qt5base
> +
> +CUTELYST_CONF_OPTS += \
> +	-DPLUGIN_CSRFPROTECTION=ON
> +
> +$(eval $(cmake-package))

This line should always go at the end of the .mk file, i.e...

> +
> +ifeq ($(BR2_PACKAGE_GRANTLEE),y)
> +CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
> +else
> +CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
> +CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
> +else
> +CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JEMALLOC),y)
> +CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=ON
> +else
> +CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=OFF
> +endif

... here.

I've fixed those three issues, and applied your patch. Once again,
thanks for your contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
