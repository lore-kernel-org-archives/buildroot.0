From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 15:59:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeopcua : new package
In-Reply-To: <20200909074346.13037-1-jugurtha.belkalem@smile.fr>
References: <20200909074346.13037-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200909155954.0c41a787@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new contribution!

On Wed,  9 Sep 2020 09:43:46 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> diff --git a/package/freeopcua/Config.in b/package/freeopcua/Config.in
> new file mode 100644
> index 0000000000..f210efe1b5
> --- /dev/null
> +++ b/package/freeopcua/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_FREEOPCUA
> +	bool "freeopcua"
> +	depends on BR2_PACKAGE_BOOST

Please select the boost package, as it's not an obvious dependency.

> +	depends on BR2_PACKAGE_PYTHON3

Are you sure python on the target is necessary? This OPC-UA
implementation is written in C++. It has Python bindings, but I suppose
they are optional.

Perhaps there is some confusion about the fact that some code is
auto-generated from XML specification using Python... but that is at
build time, i.e Python would only be needed on the build machine.

Could you investigate this?

> +FREEOPCUA_DEPENDENCIES = boost mbedtls python3
> +
> +# Copy generated binaries and libraries to target
> +# as this is not done by freeopcua buildsystem.
> +define FREEOPCUA_INSTALL_BINARY_LIB
> +	cp $(BUILD_DIR)/freeopcua-$(FREEOPCUA_VERSION)/bin/* \
> +	$(TARGET_DIR)/usr/bin/
> +
> +	cp $(BUILD_DIR)/freeopcua-$(FREEOPCUA_VERSION)/lib/* \
> +	$(TARGET_DIR)/usr/lib/
> +endef
> +FREEOPCUA_POST_INSTALL_TARGET_HOOKS += FREEOPCUA_INSTALL_BINARY_LIB

The regular "make install" step doesn't install those
libraries/binaries ?

> +# Freeopcua uses some narrowing like int8 to char
> +# which results in compilation error.
> +FREEOPCUA_CONF_OPTS = \
> +	-DCMAKE_CXX_FLAGS="-Wno-narrowing" \

You need:

	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -Wno-narrowing"

> +	-DBUILD_EXAMPLE=OFF \
> +	-DBUILD_TESTING=OFF

These two options are already passed by the cmake-package
infrastructure, so they are not needed here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
