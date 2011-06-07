From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Tue, 07 Jun 2011 16:09:58 +0200
Subject: [Buildroot] [PATCH] Added Live555 RTSP Server package.
In-Reply-To: <1304972048-21092-2-git-send-email-mike@mikebwilliams.com>
References: <1304972048-21092-1-git-send-email-mike@mikebwilliams.com>
	<1304972048-21092-2-git-send-email-mike@mikebwilliams.com>
Message-ID: <4DEE3136.20701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on a leopard board DM368 with a codesourcery toolchain (2009q1) and it is working fine.

Guillaume


Le 09/05/2011 22:14, Mike Williams a ?crit :
> From: Mike Williams<mwilli60@harris.com>
>
>
> Signed-off-by: Mike Williams<mike@mikebwilliams.com>
> ---
>   package/multimedia/Config.in          |    1 +
>   package/multimedia/live555/Config.in  |   30 ++++++++++++++++++++++
>   package/multimedia/live555/live555.mk |   44 +++++++++++++++++++++++++++++++++
>   3 files changed, 75 insertions(+), 0 deletions(-)
>   create mode 100644 package/multimedia/live555/Config.in
>   create mode 100644 package/multimedia/live555/live555.mk
>
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index b8a0f21..3ae9d5b 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -31,6 +31,7 @@ source "package/multimedia/libsamplerate/Config.in"
>   source "package/multimedia/libsndfile/Config.in"
>   source "package/multimedia/libtheora/Config.in"
>   source "package/multimedia/libvorbis/Config.in"
> +source "package/multimedia/live555/Config.in"
>   source "package/multimedia/madplay/Config.in"
>   source "package/multimedia/mpd/Config.in"
>   source "package/multimedia/mpg123/Config.in"
> diff --git a/package/multimedia/live555/Config.in b/package/multimedia/live555/Config.in
> new file mode 100644
> index 0000000..e77c875
> --- /dev/null
> +++ b/package/multimedia/live555/Config.in
> @@ -0,0 +1,30 @@
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
> diff --git a/package/multimedia/live555/live555.mk b/package/multimedia/live555/live555.mk
> new file mode 100644
> index 0000000..ce119d0
> --- /dev/null
> +++ b/package/multimedia/live555/live555.mk
> @@ -0,0 +1,44 @@
> +#############################################################
> +#
> +# live555 streaming media
> +#
> +#############################################################
> +
> +LIVE555_VERSION = latest
> +LIVE555_SOURCE = live555-$(LIVE555_VERSION).tar.gz
> +LIVE555_SITE = http://www.live555.com/liveMedia/public/
> +LIVE555_INSTALL_TARGET = YES
> +
> +define LIVE555_CONFIGURE_CMDS
> +	(cd $(@D); ./genMakefiles linux)
> +endef
> +
> +define LIVE555_BUILD_CMDS
> +	$(MAKE) C_COMPILER="$(TARGET_CC)" CPLUSPLUS_COMPILER="$(TARGET_CXX)" LINK="$(TARGET_CXX) -o" -C $(@D) all
> +endef
> +
> +ifeq (${BR2_PACKAGE_LIVE555_OPENRTSP},y)
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
> +
> +$(eval $(call GENTARGETS,package/multimedia,live555))
