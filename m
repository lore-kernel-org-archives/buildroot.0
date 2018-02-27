From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Feb 2018 22:31:34 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: Make systemd link correctly
In-Reply-To: <20180227212131.3142-1-tpiepho@impinj.com>
References: <20180227212131.3142-1-tpiepho@impinj.com>
Message-ID: <20180227213134.GD11186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-02-27 13:21 -0800, Trent Piepho spake thusly:
> The link in /etc/systemd/system/, named dbus-org.bluez.service, pointing to
> ../../../../usr/lib/systemd/system/bluetooth.service has one too many ".." in
> it.  Likely the target was copied from the other link in
> /etc/systemd/system/bluetooth.target.wants/, which is one level deeper.
> 
> Adjust link to be correct.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, this should not have any real problem on the target: this
succession of '..' will eventually reach / which has its own '..'
pointing back to itself; that is /.. points to / and so everything
should just work as expected. Only on the build machine does that have
an impact.

So, can you confirm that this is not fixing any runtime issue, but just
making the symlink "less incorrect"?

Regards,
Yann E. MORIN.

> ---
>  package/bluez5_utils/bluez5_utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index 0634ec9f6f..395340a3e6 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -116,7 +116,7 @@ define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants
>  	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
>  		$(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants/bluetooth.service
> -	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
> +	ln -fs ../../../usr/lib/systemd/system/bluetooth.service \
>  		$(TARGET_DIR)/etc/systemd/system/dbus-org.bluez.service
>  endef
>  
> -- 
> 2.14.3
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
