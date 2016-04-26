From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 26 Apr 2016 21:38:48 +0200
Subject: [Buildroot] [PATCH v2] domoticz: new package
In-Reply-To: <24932_1461670192_571F5130_24932_1368_6_b2fc1042-68bd-4543-a95f-43a1dd14d8ad@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
References: <24932_1461670192_571F5130_24932_1368_6_b2fc1042-68bd-4543-a95f-43a1dd14d8ad@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
Message-ID: <CAHXCMMKMe5=nfs23mHosBOWgeOLaDozzDfjuiDyCraMErJv7jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Tue, Apr 26, 2016 at 1:29 PM,  <fabrice.fontaine@orange.com> wrote:
> Domoticz is a Home Automation System that lets you monitor andi
s/andi/and/

> configure various devices like: Lights, Switches, various
> sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
> and much more. Notifications/Alerts can be sent to any mobile device.
>
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v1 -> v2 (after review of Samuel Martin):
>  - Add a hash file
>  - Replace the dependency on BR2_PACKAGE_LUA_5_2 by a dependency on
>    BR2_PACKAGE_LUA_5_2 or BR2_PACKAGE_LUA_5_3
>  - Add dependencies on BR2_USE_MMU and !BR2_STATIC_LIBS (from mosquitto)
>  - Add dependency on BR2_PACKAGE_BOOST_ARCH_SUPPORTS (from boost)
>  - Automatically add zwave support in domoticz if the user has selected
>    the openzwave package
>  - Set USE_STATIC_BOOST and USE_STATIC_OPENZWAVE to the correct values
>    in domoticz.mk depending on BR2_STATIC_LIBS value to avoid breaking
>    static-only build
>
>  package/Config.in              |  1 +
>  package/domoticz/Config.in     | 32 +++++++++++++++++++++++++++++
>  package/domoticz/domoticz.hash |  2 ++
>  package/domoticz/domoticz.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 81 insertions(+)
>  create mode 100644 package/domoticz/Config.in
>  create mode 100644 package/domoticz/domoticz.hash
>  create mode 100644 package/domoticz/domoticz.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f242181..2156d5b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1320,6 +1320,7 @@ menu "Miscellaneous"
>         source "package/bc/Config.in"
>         source "package/clamav/Config.in"
>         source "package/collectd/Config.in"
> +       source "package/domoticz/Config.in"
>         source "package/empty/Config.in"
>         source "package/gnuradio/Config.in"
>         source "package/googlefontdirectory/Config.in"
> diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
> new file mode 100644
> index 0000000..c7c2878
> --- /dev/null
> +++ b/package/domoticz/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_DOMOTICZ
> +       bool "domoticz"
> +       depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
> +       depends on BR2_USE_MMU # mosquitto
> +       depends on !BR2_STATIC_LIBS # mosquitto
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_DATE_TIME
> +       select BR2_PACKAGE_BOOST_SYSTEM
> +       select BR2_PACKAGE_BOOST_THREAD
> +       select BR2_PACKAGE_LIBCURL
> +       select BR2_PACKAGE_MOSQUITTO
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_SQLITE
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         Domoticz is a Home Automation System that lets you monitor andi
> +         configure various devices like: Lights, Switches, various
> +         sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
> +         and much more. Notifications/Alerts can be sent to any mobile device.
> +
> +         http://domoticz.com
> +
> +comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
> +       depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +       depends on BR2_USE_MMU
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +               !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> +               !(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
> diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
> new file mode 100644
> index 0000000..9180a9b
> --- /dev/null
> +++ b/package/domoticz/domoticz.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 02b4cdde8e376258aeae3d5621edf8bb6b3563c34282e50194db343fcec9c0f5        domoticz-3.4834.tar.gz
> diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
> new file mode 100644
> index 0000000..1ca0a24
> --- /dev/null
> +++ b/package/domoticz/domoticz.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# domoticz
> +#
> +################################################################################
> +
> +DOMOTICZ_VERSION = 3.4834
> +DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
> +DOMOTICZ_LICENSE = GPLv3
> +DOMOTICZ_LICENSE_FILES = License.txt
> +DOMOTICZ_DEPENDENCIES = boost host-pkgconf libcurl lua mosquitto openssl \
> +        sqlite zlib
> +
> +# USE_STATIC_BOOST has to be set manually otherwise domoticz will not found the
> +# boost libraries
> +# By default, domoticz sets USE_STATIC_BOOST to no
> +ifeq ($(BR2_STATIC_LIBS),y)
This is always false because domoticz depends on !BR2_STATIC_LIBS in
its Config.in file, so...

> +DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=yes
> +else
> +DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=no
> +endif
... you can simplify all this stuff. ;-)

> +
> +# Do not use any built-in libraries which are enabled by default for lua,
> +# sqlite and mqtt
s/mqtt/mosquitto/

> +DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_LUA=no
> +DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_SQLITE=no
> +DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_MQTT=no
Please use uppercase value (for consistency with other cmake package).
Note that, most packages use ON/OFF boolean values; iif you prefer
YES/NO, it's ok. :)

> +
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +DOMOTICZ_DEPENDENCIES += libusb
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
> +DOMOTICZ_DEPENDENCIES += openzwave
> +
> +# USE_STATIC_OPENZWAVE has to be set manually otherwise domoticz will not found
> +# the openzwave library
> +# By default, domoticz sets USE_STATIC_OPENZWAVE to yes
> +ifeq ($(BR2_STATIC_LIBS),y)
Always false, so... (you know what to do ;-])

> +DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=yes
> +else
> +DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=no
> +endif
> +endif
> +
> +$(eval $(cmake-package))
> --
> 1.9.1

Regards,

-- 
Samuel
