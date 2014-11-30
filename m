From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:38:15 +0100
Subject: [Buildroot] [PATCHv3 19/74] gpsd: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417357142-14307-20-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130153815.GX4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Also makes the installation of the init script unconditional.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gpsd/gpsd.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 7dc27e8..5092b38 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -206,10 +206,11 @@ define GPSD_INSTALL_TARGET_CMDS
>  		$(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
>  		install)
> -	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
> -		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
> -		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
> -	fi
> +endef
> +
> +define GPSD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
> +	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd

Unrelated to your patch, but since the variable is a plural DEVICES, I
would expect to be able to set more than one device. In this case, what
is the format of this devices list? Is it comma-separated? If so, the
sed expression above would break, no?

(Cc-ing Simon and Gustavo, since they have contributed significantly to
that package.)

Anyway, since this is not a problem your patch is introducing, and it is
just cleaning up the exisiting code:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endef
>  
>  define GPSD_INSTALL_STAGING_CMDS
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
