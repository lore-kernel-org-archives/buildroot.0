From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:52:08 +0200
Subject: [Buildroot] [PATCH 1/2] package: acpica: Add host buildling
 support
In-Reply-To: <20170524203030.8187-2-alistair.francis@xilinx.com>
References: <20170524203030.8187-1-alistair.francis@xilinx.com>
 <20170524203030.8187-2-alistair.francis@xilinx.com>
Message-ID: <20170529235208.7e6fef31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Commit titles should have prefixes that look like:

	acpica:

or:

	package/acpica:

and not:

	package: acpica:

Yes, that's a silly convention, but conventions are always silly :)

On Wed, 24 May 2017 13:30:29 -0700, Alistair Francis wrote:
> Add support to build the ACPICA package for the host. This is useful for
> the iasl command which is required to build some packaged, including Xen
> tools

This should have reference the autobuilder issue that it helps fixing
(even if it's only part of the fix).

> +define HOST_ACPICA_BUILD_CMDS
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		all
> +endef

Weird that you put the host build command before the target build
command, and then the host install command *after* the target install
command. So I've reordered this.

> +
>  define ACPICA_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>  		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \
> @@ -23,4 +28,11 @@ define ACPICA_INSTALL_TARGET_CMDS
>  		INSTALLFLAGS=-m755 install
>  endef
>  
> +define HOST_ACPICA_INSTALL_CMDS
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR="$(HOST_DIR)" \

DESTDIR="$(HOST_DIR)" is wrong, so I've replaced with
PREFIX="$(HOST_DIR)/usr". See
https://stackoverflow.com/questions/11307465/destdir-and-prefix-of-make
for a quick explanation about the difference.

Applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
