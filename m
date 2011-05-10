From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 08:51:47 +0200
Subject: [Buildroot] [PATCH] Added Live555 RTSP Server package.
In-Reply-To: <1304972048-21092-2-git-send-email-mike@mikebwilliams.com>
References: <1304972048-21092-1-git-send-email-mike@mikebwilliams.com>
	<1304972048-21092-2-git-send-email-mike@mikebwilliams.com>
Message-ID: <20110510085147.07330bef@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

Great patch for a first post to the list!

On Mon,  9 May 2011 16:14:08 -0400
Mike Williams <mike@mikebwilliams.com> wrote:

> +config BR2_PACKAGE_LIVE555
> +	bool "Live555"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  LIVE555 Streaming Media forms a set of C++ libraries for multimedia
> +	  streaming, using open standard protocols (RTP/RTCP, RTSP, SIP).
> +
> +	  http://www.live555.com/liveMedia/
> +
> +config BR2_PACKAGE_LIVE555_OPENRTSP
> +	bool "OpenRRTSP"
> +	depends on BR2_PACKAGE_LIVE555
> +	default y
> +	help
> +		Live555 RTSP Client.
> +		
> +config BR2_PACKAGE_LIVE555_MEDIASERVER
> +	bool "live555MediaServer"
> +	depends on BR2_PACKAGE_LIVE555
> +	default y
> +	help
> +		RTSP Server. Supports numerous media formats such as H.264 and MPEG2.
> +
> +config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
> +	bool "MPEG2TransportStreamIndexer"
> +	depends on BR2_PACKAGE_LIVE555
> +	default y
> +	help
> +		MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
> +		operation in the Live555MediaServer.

Here, you should include something like:

comment "live555 needs C++ compiler"
	depends on !BR2_INSTALL_LIBSTDCPP

This allows the user to know that live555 is available, but not
selectable due to the lack of C++ support. We typically do that when a
package has a dependency on a toolchain option.

> +ifeq (${BR2_PACKAGE_LIVE555_OPENRTSP},y)

Our convention is to use $(BR2_PACKAGE_LIVE555_OPENRTSP), i.e
normal braces instead of curly braces.

> +define LIVE555_INSTALL_OPENRTSP
> +	$(INSTALL) -D -m 0755 $(@D)/testProgs/openRTSP $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +ifeq (${BR2_PACKAGE_LIVE555_MEDIASERVER},y)
> +define LIVE555_INSTALL_MEDIASERVER
> +	$(INSTALL) -D -m 0755 $(@D)/mediaServer/live555MediaServer $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +ifeq (${BR2_PACKAGE_LIVE555_MPEG2_INDEXER},y)
> +define LIVE555_INSTALL_MPEG2_INDEXER
> +	$(INSTALL) -D -m 0755 $(@D)/testProgs/MPEG2TransportStreamIndexer $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +define LIVE555_INSTALL_TARGET_CMDS
> +	$(LIVE555_INSTALL_OPENRTSP)
> +	$(LIVE555_INSTALL_MEDIASERVER)
> +	$(LIVE555_INSTALL_MPEG2_INDEXER)
> +endef

You could do it a little bit differently:

LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live555MediaServer
LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer

And then your LIVE555_INSTALL_TARGET_CMDS would iterate over the
LIVE555_FILES_TO_INSTALL-y list, and install the corresponding
binaries. Need to be careful about the case where
LIVE555_FILES_TO_INSTALL-y is empty because no binary has been selected
for installation.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
