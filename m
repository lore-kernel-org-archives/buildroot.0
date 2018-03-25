From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 21:20:33 +0200
Subject: [Buildroot] [PATCH] eudev: prevent udev init script nonexistent
 directory error
In-Reply-To: <1521735601-29879-1-git-send-email-joshua.henderson@microchip.com>
References: <1521735601-29879-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180325192033.GN2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2018-03-22 09:20 -0700, Joshua Henderson spake thusly:
> The following error occures in the udev init script because the kernel config
> may optionally not include uevent_helper.
> 
> /etc/init.d/S10udev: line 47: can't create /proc/sys/kernel/hotplug: nonexistent directory
> 
> Work around this by not trying to access the destination if it's not available.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/eudev/S10udev | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/eudev/S10udev b/package/eudev/S10udev
> index 640fec6..47c715c 100755
> --- a/package/eudev/S10udev
> +++ b/package/eudev/S10udev
> @@ -28,7 +28,7 @@ test -r $UDEV_CONFIG || exit 6
>  case "$1" in
>      start)
>          printf "Populating %s using udev: " "${udev_root:-/dev}"
> -        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
> +        [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
>          $UDEV_BIN -d || { echo "FAIL"; exit 1; }
>          udevadm trigger --type=subsystems --action=add
>          udevadm trigger --type=devices --action=add
> -- 
> 2.7.4
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
