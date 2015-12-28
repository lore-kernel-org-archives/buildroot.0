From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 14:25:14 +0100
Subject: [Buildroot] [PATCH 1/1] python-paho-mqtt: add new package
In-Reply-To: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
References: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20151228142514.58df0700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Davide,

On Mon, 28 Dec 2015 13:57:35 +0100, Davide Viti wrote:

> diff --git a/package/python-paho-mqtt/Config.in b/package/python-paho-mqtt/Config.in
> new file mode 100644
> index 0000000..1b20da9
> --- /dev/null
> +++ b/package/python-paho-mqtt/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PAHO_MQTT
> +	bool "python-paho-mqtt"
> +	help
> +	  The Paho Python Client provides a client class with support
> +	  for both MQTT v3.1 and v3.1.1 on Python 2.7 or 3.x. It also
> +	  provides some helper functions to make publishing one off
> +	  messages to an MQTT server very straightforward.

I know it was copy/pasted from the website, but this last sentence
doesn't make much sense to me. Maybe it's because I'm not a native
speaker, but "publishing one off messages" is not something that I can
parse. Did they mean "publishing on/off messages" ? Or something else ?

> +PYTHON_PAHO_MQTT_VERSION = 1.1
> +PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
> +PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/source/p/paho-mqtt
> +PYTHON_PAHO_MQTT_LICENSE = EPLv1.0 or EDLv1.0
> +PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
> +PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
> +
> +define PYTHON_PAHO_MQTT_INSTALL_TARGET_CMDS
> +	(cd $(@D); \
> +		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> +		$(HOST_DIR)/usr/bin/python2 setup.py install \
> +		--root=/)
> +endef

Why do you need to override <pkg>_INSTALL_TARGET_CMDS ?

Using $(HOST_PKG_PYTHON_SETUPTOOLS_ENV) for a target package looks
clearly wrong. Also, since you're not passing
--prefix=$(TARGET_DIR)/usr, I don't see how this overriden install
target commands can even install something in $(TARGET_DIR).

Could you clarify this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
