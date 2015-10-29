From: Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 29 Oct 2015 17:17:02 +1100
Subject: [Buildroot] [PATCH 2/2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
Message-ID: <20151029171702.0fa0b81c@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Oct 2015 17:11:42 +1100
Cyril Bur <cyrilbur@gmail.com> wrote:

> Currently systemd getty services ignore baudrates set in buildroot in
> favour of a hardcoded 115200. This patch SEDs out that hardcoded value with
> what is selected.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  package/systemd/systemd.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b62fc08..d8a25ed 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -183,6 +183,7 @@ endef
>  
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd needs getty.service for VTs and serial-getty.service for serial ttys
> +# also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
>  define SYSTEMD_INSTALL_SERVICE_TTY
>  	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
>  	then \
> @@ -190,8 +191,12 @@ define SYSTEMD_INSTALL_SERVICE_TTY
>  	else \
>  		SERVICE="serial-getty"; \
>  	fi; \
> -	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
> -		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> +	ln -fs $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service \
> +		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
> +	if [ $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) -gt 0 ] ; \
> +	then \
> +		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
> +	fi
>  endef
>  endif
>  
