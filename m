From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 21:07:16 +0200
Subject: [Buildroot] [PATCH v2,1/1] i2pd: new package
In-Reply-To: <20180327212401.5173-1-fontaine.fabrice@gmail.com>
References: <20180327212401.5173-1-fontaine.fabrice@gmail.com>
Message-ID: <20180401210716.6170808e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Mar 2018 23:24:01 +0200, Fabrice Fontaine wrote:
> i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
> client.
> 
> I2P (Invisible Internet Protocol) is a universal anonymous
> network layer.
> All communications over I2P are anonymous and end-to-end
> encrypted, participants don't reveal their real IP addresses.
> 
> http://i2pd.website
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied, after fixing a few things.

> +comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
> +
> +comment "i2pd needs exception_ptr"

I've propagated the BR2_USE_MMU and BR2_TOOLCHAIN_HAS_ATOMIC
dependencies here so that this comment doesn't show up in situation
where anyway the package cannot be enabled.

> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/i2pd/S99i2pd b/package/i2pd/S99i2pd
> new file mode 100644
> index 0000000000..32775cdb97
> --- /dev/null
> +++ b/package/i2pd/S99i2pd
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +NAME=i2pd
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON=/usr/bin/$NAME
> +DAEMON_ARGS="--conf=/etc/i2pd/i2pd.conf --tunconf=/etc/i2pd/tunnels.conf --pidfile=/var/run/i2pd.pid --logfile=/var/log/i2pd.log --daemon --service"

I haven't implemented that, but it would be nice to make this
configurable through a file in /etc/default that would be sourced here.
See other init scripts in Buildroot for examples.

> +# The following CMake variable disables a TRY_RUN call in the -pthread
> +# test which is not allowed when cross-compiling.
> +I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

As Romain reported, this causes a warning with recent versions of
CMake. This is only needed folder older (< 3.10) version of CMake. I've
added a comment that explains this, so that we are not surprised in the
future by this assignment.

> +define I2PD_REMOVE_SOURCE_FILES
> +	rm -f $(TARGET_DIR)/usr/LICENSE
> +	rm -rf $(TARGET_DIR)/usr/src
> +endef
> +
> +I2PD_POST_INSTALL_TARGET_HOOKS += \
> +	I2PD_INSTALL_CONFIGURATION_FILES \
> +	I2PD_REMOVE_SOURCE_FILES

As Romain pointed out it's a bit not nice to remove /usr/src entirely
here. So instead, I've added a patch that drops the logic in
CMakeLists.txt that was installing the LICENSE file and the source code.

Applied with those changes. Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
