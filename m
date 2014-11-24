From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Nov 2014 07:25:36 +0200
Subject: [Buildroot] [PATCH 46/51] live555: add error handling to for
	loop
In-Reply-To: <1416775163-20215-47-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416775163-20215-47-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141124052536.GC2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 23, 2014 at 09:39:18PM +0100, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/live555/live555.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/live555/live555.mk b/package/live555/live555.mk
> index e933faa..a15aca8 100644
> --- a/package/live555/live555.mk
> +++ b/package/live555/live555.mk
> @@ -49,17 +49,17 @@ LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2
>  
>  define LIVE555_INSTALL_STAGING_CMDS
>  	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
> -		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
> -		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
> +		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i` && \
> +		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i` || exit 1 \
>  	done; \
>  	for i in $(LIVE555_LIBS_TO_INSTALL); do \
> -		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i`; \
> +		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i` || exit 1 \
>  	done
>  endef

Both 'for' loop in LIVE555_INSTALL_STAGING_CMDS were removed in next.

>  
>  define LIVE555_INSTALL_TARGET_CMDS
>  	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
> -		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
> +		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1 \
>  	done
>  endef

This one is still there in next.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
