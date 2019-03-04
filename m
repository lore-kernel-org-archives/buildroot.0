From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Mar 2019 22:09:44 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/systemd: fix "Timed out
 waiting for device /dev/console."
In-Reply-To: <20190304192547.23954-1-xruppen@gmail.com>
References: <20190304192547.23954-1-xruppen@gmail.com>
Message-ID: <20190304210944.GN2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xavier, All,

On 2019-03-04 20:25 +0100, Xavier Ruppen spake thusly:
> Buildroot built with systemd fails to open a login prompt on the
> serial port when /dev/console is specified as BR2_TARGET_GENERIC_GETTY_PORT
> (which is its default value):
> 
> systemd[1]: dev-console.device: Job dev-console.device/start timed out.
> systemd[1]: Timed out waiting for device /dev/console.
> systemd[1]: Dependency failed for Serial Getty on console.
> systemd[1]: serial-getty at console.service: Job serial-getty at console.service/start failed with result 'dependency'.
> systemd[1]: dev-console.device: Job dev-console.device/start failed with result 'timeout'.
> systemd[1]: Reached target Login Prompts.
> systemd[1]: Reached target Multi-User System.
> 
> According to this issue on Github [1], serial-getty at .service should
> not be instantiated on /dev/console, console-getty at .service should
> be used instead. This stems from the fact that there should be no
> dependency on /dev/console.
> 
> [1] https://github.com/systemd/systemd/issues/10914
> 
> Signed-off-by: Xavier Ruppen <xruppen@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, a slight improvement that can be done when applying, see
below...

[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 7a46a50ed3..1d0141f20b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -397,19 +397,29 @@ endef
>  
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd needs getty.service for VTs and serial-getty.service for serial ttys
> +# note that console-getty.service should be used on /dev/console as it should not have dependencies
>  # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
>  define SYSTEMD_INSTALL_SERVICE_TTY
> -	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
> +	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
> +	then \
> +		SERVICE="console-getty"; \
> +		TARGET=$${SERVICE}.service; \
> +		LINK_NAME=$${SERVICE}.service; \

There is now no real need for the SERVICE variable anymore, since we can
simply write:

    TARGET='console-getty.service'; \
    LINK_NAME='console-getty.service'

or:

    TARGET='getty at .service'; \
    LINK_NAME='getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service'

Note also that $(BR2_TARGET_GENERIC_GETTY_PORT) whould probably be
qstrip-ed now.

Peter, can you handle that when applying?

Regards,
Yann E. MORIN.

> +	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
>  	then \
>  		SERVICE="getty"; \
> +		TARGET=$${SERVICE}@.service; \
> +		LINK_NAME=$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
>  	else \
>  		SERVICE="serial-getty"; \
> +		TARGET=$${SERVICE}@.service; \
> +		LINK_NAME=$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
>  	fi; \
> -	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
> -		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
> +	ln -fs ../../../../lib/systemd/system/$${TARGET} \
> +		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
>  	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
>  	then \
> -		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
> +		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \
>  	fi
>  endef
>  endif
> -- 
> 2.21.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
