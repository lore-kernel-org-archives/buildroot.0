From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2011 22:36:12 +0200
Subject: [Buildroot] [PATCH] package: add socketcan package
In-Reply-To: <1303145560-11520-1-git-send-email-kevin.joly@armadeus.com>
References: <1303145560-11520-1-git-send-email-kevin.joly@armadeus.com>
Message-ID: <20110419223612.77112a72@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kevin,

Thanks for this submission. A couple of comments below.

On Mon, 18 Apr 2011 18:52:40 +0200
kevin.joly at armadeus.com wrote:

> diff --git a/package/socketcan/Config.in b/package/socketcan/Config.in
> new file mode 100644
> index 0000000..e8d7a39
> --- /dev/null
> +++ b/package/socketcan/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_SOCKETCAN
> +	bool "Socket CAN"
> +	help
> +	  The socketcan package is an implementation of CAN protocols
> +	  (Controller Area Network) for Linux. CAN is a networking technology
> +	  which has wide-spread use in automation, embedded devices, and
> +	  automotive fields.
> +
> +	  While there have been other CAN implementations for Linux based on
> +	  character devices, Socket CAN uses the Berkeley socket API,
> +	  the Linux network stack and implements the CAN device drivers as
> +	  network interfaces.  The CAN socket API has been designed as similar
> +	  as possible to the TCP/IP protocols to allow programmers, familiar
> +	  with network programming, to easily learn how to use CAN sockets.

Maybe this package should be called SOCKETCANUTILS or something like
that ? It isn't the Socket CAN implementation by itself, since that
thing is inside the kernel.

Moreover, we typically insert the project URL as a last line of the
help text.

> @@ -0,0 +1,33 @@
> +#############################################################
> +#
> +# Socket CAN
> +#
> +#############################################################
> +PROGRAMS_ISOTP = isotpdump,isotprecv,isotpsend,isotpsniffer,isotptun,isotpserver
> +PROGRAMS_CANGW = cangw
> +PROGRAMS_SLCAN = slcan_attach,slcand
> +PROGRAMS_CAN_UTILS = can-calc-bit-timing,candump,cansniffer,cansend,canplayer,cangen,canbusload,log2long,log2asc,asc2log,canlogserver,bcmserver,slcanpty,canfdtest
> +PROGRAMS = {$(PROGRAMS_ISOTP),$(PROGRAMS_CANGW),$(PROGRAMS_SLCAN),$(PROGRAMS_CAN_UTILS)}

This program list is only used for stripping and it's useless, see
below.

> +SOCKETCAN_VERSION = 1235
> +SOCKETCAN_SOURCE = socketcan-svn-rev$(SOCKETCAN_VERSION).tar.gz
> +SOCKETCAN_SITE = http://svn.berlios.de/svnroot/repos/socketcan/trunk/
> +SOCKETCAN_SITE_METHOD = svn
> +
> +define SOCKETCAN_BUILD_CMDS
> +	$(MAKE) -C $(SOCKETCAN_DIR)/can-utils CC="$(TARGET_CC)"
> +endef

Replace $(SOCKETCAN_DIR) with $(@D).

If you pass TARGET_CC, you also probably want to pass TARGET_CFLAGS
somehow, so that the code gets compiled for the proper sub-architecture.

> +define SOCKETCAN_INSTALL_TARGET_CMDS
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(SOCKETCAN_DIR)/can-utils install

SOCKETCAN_DIR -> @D

> +	$(TARGET_STRIP) $(TARGET_DIR)/usr/local/bin/$(PROGRAMS)

This is not needed, Buildroot will automagically strip all binaries
from the target filesystem. So just remove this line.

However, I see that things are installed into usr/local/bin in the
target filesystem, which is unusual. Could you tweak the think so that
it gets installed in usr/bin ?

> +define SOCKETCAN_CLEAN_CMDS
> +	$(MAKE) -C $(SOCKETCAN_DIR)/can-utils clean
> +endef
> +
> +define SOCKETCAN_UNINSTALL_TARGET_CMDS
> +	rm -rf $(SOCKETCAN_DIR)
> +endef

@D and @D here as well.

Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
