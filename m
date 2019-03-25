From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 22:27:33 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/paho-mqtt-cpp: add
 paho-mqtt-cpp
In-Reply-To: <1553253044-29318-1-git-send-email-refik.tuzakli@savronik.com.tr>
References: <1553253044-29318-1-git-send-email-refik.tuzakli@savronik.com.tr>
Message-ID: <20190325222733.458e094b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Mar 2019 11:10:44 +0000
Refik TUZAKLI <refik.tuzakli@savronik.com.tr> wrote:

> Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>

I have applied your patch, with a few changes.

First, the traditional commit title for new packages is:

	package/<pkg>: new package

> diff --git a/package/paho-mqtt-cpp/Config.in b/package/paho-mqtt-cpp/Config.in
> new file mode 100644
> index 0000000..c7675e1
> --- /dev/null
> +++ b/package/paho-mqtt-cpp/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PAHO_MQTT_CPP
> +	bool "paho-mqtt-cpp"
> +	depends on !BR2_STATIC_LIBS  # dlopen()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

You forgot:

	depends on BR2_INSTALL_LIBSTDCPP

since obviously, paho-mqtt-cpp uses C++.

But also another dependency was needed (a more tricky one):

	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735

this is needed because paho-mqtt-cpp uses std::future.

> +PAHO_MQTT_CPP_VERSION = v1.0.0
> +PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,$(PAHO_MQTT_CPP_VERSION))
> +PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
> +PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
> +PAHO_MQTT_CPP_INSTALL_STAGING = YES
> +PAHO_MQTT_CPP_DEPENDENCIES = paho-mqtt-c
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +PAHO_MQTT_CPP_DEPENDENCIES += openssl
> +PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
> +else
> +PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=FALSE
> +endif
> +PAHO_MQTT_CPP_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

I moved this line earlier in the .mk file, used = instead of += since
it's unconditional, and added a comment above it to explain why we are
using this option.

Patch applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
