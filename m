From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 28 Oct 2011 12:14:21 +0800
Subject: [Buildroot] [PATCH 2/3] live555: install to staging
In-Reply-To: <1316509288-31106-2-git-send-email-keguang.zhang@gmail.com>
References: <1316509288-31106-1-git-send-email-keguang.zhang@gmail.com>
 <1316509288-31106-2-git-send-email-keguang.zhang@gmail.com>
Message-ID: <CAJhJPsXHn8dqRBtheWLU=LTSUd8uNK+ZJ6R4ZpQzJqbi5i-QTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bump

2011/9/20, keguang.zhang at gmail.com <keguang.zhang@gmail.com>:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> Install live555 library to staging for mplayer.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
>  package/multimedia/live555/live555.mk |   28 ++++++++++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>
> diff --git a/package/multimedia/live555/live555.mk
> b/package/multimedia/live555/live555.mk
> index 45a0375..47d6085 100644
> --- a/package/multimedia/live555/live555.mk
> +++ b/package/multimedia/live555/live555.mk
> @@ -7,6 +7,7 @@
>  LIVE555_VERSION = 2011.06.16
>  LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
>  LIVE555_SITE = http://www.live555.com/liveMedia/public/
> +LIVE555_INSTALL_STAGING=YES
>  LIVE555_INSTALL_TARGET = YES
>
>  define LIVE555_CONFIGURE_CMDS
> @@ -26,6 +27,16 @@ define LIVE555_CLEAN_CMDS
>  	$(MAKE) -C $(@D) clean
>  endef
>
> +LIVE555_HEADERS_TO_INSTALL += liveMedia/include
> +LIVE555_HEADERS_TO_INSTALL += groupsock/include
> +LIVE555_HEADERS_TO_INSTALL += UsageEnvironment/include
> +LIVE555_HEADERS_TO_INSTALL += BasicUsageEnvironment/include
> +
> +LIVE555_LIBS_TO_INSTALL += liveMedia/libliveMedia.a
> +LIVE555_LIBS_TO_INSTALL += groupsock/libgroupsock.a
> +LIVE555_LIBS_TO_INSTALL += UsageEnvironment/libUsageEnvironment.a
> +LIVE555_LIBS_TO_INSTALL += BasicUsageEnvironment/libBasicUsageEnvironment.a
> +
>  LIVE555_FILES_TO_INSTALL- =
>  LIVE555_FILES_TO_INSTALL-y =
>  LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) +=
> testProgs/openRTSP
> @@ -33,12 +44,29 @@
> LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) +=
> mediaServer/live5
>  LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) +=
> testProgs/MPEG2TransportStreamIndexer
>  LIVE555_FILES_TO_INSTALL- += $(LIVE555_FILES_TO_INSTALL-y)
>
> +define LIVE555_INSTALL_STAGING_CMDS
> +	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
> +		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
> +		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
> +	done; \
> +	for i in $(LIVE555_LIBS_TO_INSTALL); do \
> +		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i`; \
> +	done
> +endef
> +
>  define LIVE555_INSTALL_TARGET_CMDS
>  	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
>  		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
>  	done
>  endef
>
> +define LIVE555_UNINSTALL_STAGING_CMDS
> +	[ -d $(STAGING_DIR)/usr/include/live ] && rm -rf
> $(STAGING_DIR)/usr/include/live; \
> +	for i in $(LIVE555_LIBS_TO_INSTALL); do \
> +		rm -f $(addprefix $(STAGING_DIR)/usr/lib/, `basename $$i`); \
> +	done
> +endef
> +
>  define LIVE555_UNINSTALL_TARGET_CMDS
>  	for i in $(LIVE555_FILES_TO_INSTALL-); do \
>  		rm -f $(addprefix $(TARGET_DIR)/usr/bin/, `basename $$i`); \
> --
> 1.7.1
>
>


-- 
Best Regards!
Kelvin
