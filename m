From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 13:59:39 +0100
Subject: [Buildroot] [PATCH v2 7/9] package/linuxptp adapt to preset-all
In-Reply-To: <20191111172443.6874-8-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-8-jeremy.rosen@smile.fr>
Message-ID: <20191205125939.GH2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> linuxptp has two services
> * linuxptp.service : the actual daemon
> * linuxptp-system-clock.service : sync the linux clock to the phc clock
> 
> The first was enabled, the second was not, we now enable both
> 
> The second has an incorrect (though harmless) WantedBy : there is an
> explicit Wants= in linuxptp.service

Misisng SoB line... ;-)

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/linuxptp/linuxptp-system-clock.service | 1 -
>  package/linuxptp/linuxptp.mk                   | 3 ---
>  2 files changed, 4 deletions(-)
> 
> diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
> index a4436a34a7..57beec4579 100644
> --- a/package/linuxptp/linuxptp-system-clock.service
> +++ b/package/linuxptp/linuxptp-system-clock.service
> @@ -8,4 +8,3 @@ Restart=always
>  
>  [Install]
>  WantedBy=multi-user.target
> -WantedBy=linuxptp.service
> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
> index c304ff6d6e..97e4af7be7 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -42,9 +42,6 @@ define LINUXPTP_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp.service
>  	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp-system-clock.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp-system-clock.service
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -	ln -sf ../../../../usr/lib/systemd/system/linuxptp.service \
> -		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/linuxptp.service
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.24.0.rc1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
