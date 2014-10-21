From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 19:04:59 +0200
Subject: [Buildroot] [PATCHv2] package/eudev: tweak initscript
In-Reply-To: <1413829612-12373-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413829612-12373-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021170459.GK3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-20 15:26 -0300, Gustavo Zacarias spake thusly:
> Make the udev initscript trigger in a coherent way, i.e. first set
> subsystems, then device and then let the whole thing settle.
> Otherwise for usb_modeswitch udev rules they never kick in since the
> storage aspect (device) gets claimed first and the switch ignored.
> Also set the settle timeout to a smaller value than the default
> 120 seconds to avoid stalling too much.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/eudev/S10udev | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eudev/S10udev b/package/eudev/S10udev
> index 107dfd5..c3eafce 100755
> --- a/package/eudev/S10udev
> +++ b/package/eudev/S10udev
> @@ -30,8 +30,9 @@ case "$1" in
>          printf "Populating ${udev_root:-/dev} using udev: "
>          printf '\000\000\000\000' > /proc/sys/kernel/hotplug
>          $UDEV_BIN -d || (echo "FAIL" && exit 1)
> -        udevadm trigger --action=add
> -        udevadm settle
> +        udevadm trigger --type=subsystems --action=add
> +        udevadm trigger --type=devices --action=add
> +        udevadm settle --timeout=30 || echo "udevadm settle failed"
>          echo "done"
>          ;;
>      stop)
> -- 
> 2.0.4
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
