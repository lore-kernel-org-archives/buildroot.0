From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Oct 2018 11:02:40 +0200
Subject: [Buildroot] [PATCH v2] dbus-python: add host package
In-Reply-To: <20181017214225.22415-1-bgenerous@impinj.com>
References: <20181017214225.22415-1-bgenerous@impinj.com>
Message-ID: <20181018110240.6cca2742@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Brent,

Thanks for this contribution.

On Wed, 17 Oct 2018 21:42:41 +0000, Brent Generous wrote:
> This can be useful for Python scripts running on a host machine that
> need to connect to a bus on a remote device, e.g. test scripts.
> 
> The target dbus-python depends on dbus instead of selecting it because
> dbus has dependencies that check that it is supported. Using 'select'
> would override those dependencies. For host-dbus, there are no such
> checks -- it's assumed the host has the features neeeded to run dbus, so
> it is okay to just depend on host-dbus.

Correct.

> The pyexpat dependency is not needed, as it is forced on for
> host-python.
> 
> Signed-off-by: Brent Generous <bgenerous@impinj.com>

One thing that I'd like to see is this package added to
package/Config.in.host, and a package/dbus-python/Config.in.host.
Indeed, I continue to dislike "orphan" host packages, i.e host packages
that are neither a build dependency of some package in Buildroot, and
neither available through the menuconfig Host packages menu.

> diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
> index da04b7404f..6021b63060 100644
> --- a/package/dbus-python/dbus-python.mk
> +++ b/package/dbus-python/dbus-python.mk
> @@ -12,6 +12,10 @@ DBUS_PYTHON_LICENSE_FILES = COPYING
>  DBUS_PYTHON_DEPENDENCIES = dbus-glib
>  DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
>  
> +HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-dbus-glib \

Why do you need host-dbus here? We don't have a dependency on "dbus"
for the target dbus-python package, so there's no reason to have a
dependency on host-dbus in the host-dbus-python package.

Just like dbus-glib has a dependency on dbus, host-dbus-glib has a
dependency on host-dbus. So it's not great to list host-dbus in
host-dbus-python dependencies, as it makes the dependencies not very
consistent between host and target.

> +				$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

Nit: just one tab for the indentation, don't try to align

> +HOST_DBUS_PYTHON_CONF_OPTS = $(DBUS_PYTHON_CONF_OPTS)

Please repeat --disable-html-docs --disable-api-docs here. It's pretty
dangerous to set host config options equal to target config options. We
can easily add more things to the target config options, without
realizing it's going to affect the host build as well.

>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  DBUS_PYTHON_DEPENDENCIES += python host-python
>  
> @@ -19,6 +23,11 @@ DBUS_PYTHON_CONF_ENV += \
>  	PYTHON=$(HOST_DIR)/bin/python2 \
>  	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
>  	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
> +
> +HOST_DBUS_PYTHON_CONF_ENV += \
> +	PYTHON=$(HOST_DIR)/bin/python2 \
> +	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python2-config --includes`" \
> +	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python2-config --ldflags`"
>  else
>  DBUS_PYTHON_DEPENDENCIES += python3 host-python3
>  
> @@ -26,6 +35,12 @@ DBUS_PYTHON_CONF_ENV += \
>  	PYTHON=$(HOST_DIR)/bin/python3 \
>  	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
>  	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
> +
> +HOST_DBUS_PYTHON_CONF_ENV += \
> +	PYTHON=$(HOST_DIR)/bin/python3 \
> +	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
> +	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`"
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

I think there is an issue here. If you have neither
BR2_PACKAGE_PYTHON=y nor BR2_PACKAGE_PYTHON3=y, then:

	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

will make you use host-python to build dbus-python.

But then the

ifeq ($(BR2_PACKAGE_PYTHON),y)
... use host python 2.x
else
... use host python 3.x
endif

will make you use python 3.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
