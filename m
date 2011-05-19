From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 May 2011 10:22:41 -0400
Subject: [Buildroot] [PATCH] live555: Added Live555 RTSP Server package.
In-Reply-To: <1305145196-20815-1-git-send-email-mike@mikebwilliams.com>
References: <1305145196-20815-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <BANLkTi=4XV7j357dCfr_TzYykGkpX3kOng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump. I noticed the -rc was out, has anyone had time to look at this patch?

On Wed, May 11, 2011 at 4:19 PM, Mike Williams <mike@mikebwilliams.com> wrote:
> From: Mike Williams <mwilli60@harris.com>
>
> ---
> ?package/multimedia/Config.in ? ? ? ? ?| ? ?1 +
> ?package/multimedia/live555/Config.in ?| ? 34 ++++++++++++++++++++++++++
> ?package/multimedia/live555/live555.mk | ? 43 +++++++++++++++++++++++++++++++++
> ?3 files changed, 78 insertions(+), 0 deletions(-)
> ?create mode 100644 package/multimedia/live555/Config.in
> ?create mode 100644 package/multimedia/live555/live555.mk
>
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index b8a0f21..3ae9d5b 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -31,6 +31,7 @@ source "package/multimedia/libsamplerate/Config.in"
> ?source "package/multimedia/libsndfile/Config.in"
> ?source "package/multimedia/libtheora/Config.in"
> ?source "package/multimedia/libvorbis/Config.in"
> +source "package/multimedia/live555/Config.in"
> ?source "package/multimedia/madplay/Config.in"
> ?source "package/multimedia/mpd/Config.in"
> ?source "package/multimedia/mpg123/Config.in"
> diff --git a/package/multimedia/live555/Config.in b/package/multimedia/live555/Config.in
> new file mode 100644
> index 0000000..a6aebd3
> --- /dev/null
> +++ b/package/multimedia/live555/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_LIVE555
> + ? ? ? bool "Live555"
> + ? ? ? depends on BR2_INSTALL_LIBSTDCPP
> + ? ? ? help
> + ? ? ? ? LIVE555 Streaming Media forms a set of C++ libraries for multimedia
> + ? ? ? ? streaming, using open standard protocols (RTP/RTCP, RTSP, SIP).
> +
> + ? ? ? ? http://www.live555.com/liveMedia/
> +
> +config BR2_PACKAGE_LIVE555_OPENRTSP
> + ? ? ? bool "OpenRRTSP"
> + ? ? ? depends on BR2_PACKAGE_LIVE555
> + ? ? ? default y
> + ? ? ? help
> + ? ? ? ? ? ? ? Live555 RTSP Client.
> +
> +config BR2_PACKAGE_LIVE555_MEDIASERVER
> + ? ? ? bool "live555MediaServer"
> + ? ? ? depends on BR2_PACKAGE_LIVE555
> + ? ? ? default y
> + ? ? ? help
> + ? ? ? ? ? ? ? RTSP Server. Supports numerous media formats such as H.264 and MPEG2.
> +
> +config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
> + ? ? ? bool "MPEG2TransportStreamIndexer"
> + ? ? ? depends on BR2_PACKAGE_LIVE555
> + ? ? ? default y
> + ? ? ? help
> + ? ? ? ? ? ? ? MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
> + ? ? ? ? ? ? ? operation in the Live555MediaServer.
> +
> +comment "Live555 needs C++ compiler"
> + ? ? ? depends on !BR2_INSTALL_LIBSTDCPP
> +
> diff --git a/package/multimedia/live555/live555.mk b/package/multimedia/live555/live555.mk
> new file mode 100644
> index 0000000..dff0e3c
> --- /dev/null
> +++ b/package/multimedia/live555/live555.mk
> @@ -0,0 +1,43 @@
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
> + ? ? ? (cd $(@D); ./genMakefiles linux)
> +endef
> +
> +define LIVE555_BUILD_CMDS
> + ? ? ? $(MAKE) C_COMPILER="$(TARGET_CC)" CPLUSPLUS_COMPILER="$(TARGET_CXX)" LINK="$(TARGET_CXX) -o" -C $(@D) all
> +endef
> +
> +define LIVE555_CLEAN_CMDS
> + ? ? ? $(MAKE) -C $(@D) clean
> +endef
> +
> +LIVE555_FILES_TO_INSTALL- =
> +LIVE555_FILES_TO_INSTALL-y =
> +LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
> +LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live555MediaServer
> +LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer
> +LIVE555_FILES_TO_INSTALL- += $(LIVE555_FILES_TO_INSTALL-y)
> +
> +define LIVE555_INSTALL_TARGET_CMDS
> + ? ? ? for i in $(LIVE555_FILES_TO_INSTALL-y); do \
> + ? ? ? ? ? ? ? $(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
> + ? ? ? done
> +endef
> +
> +define LIVE555_UNINSTALL_TARGET_CMDS
> + ? ? ? for i in $(LIVE555_FILES_TO_INSTALL-); do \
> + ? ? ? ? ? ? ? rm -f $(addprefix $(TARGET_DIR)/usr/bin/, `basename $$i`); \
> + ? ? ? done
> +endef
> +
> +$(eval $(call GENTARGETS,package/multimedia,live555))
> --
> 1.7.3.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
