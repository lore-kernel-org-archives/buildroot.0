From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:54:08 +0200
Subject: [Buildroot] [PATCH] package/eudev: tweak initscript
In-Reply-To: <1413827120-11083-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413827120-11083-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141020175408.GJ3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-20 14:45 -0300, Gustavo Zacarias spake thusly:
> Make the udev initscript trigger in a coherent way, i.e. first set
> subsystems, then device and then let the whole thing settle.
> Otherwise for usb_modeswitch udev rules they never kick in since the
> storage aspect (device) gets claimed first and the switch ignored.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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

Hmmm... This exit won't do much: it exits a sub-shell, so the initscript
will still continue...

> -        udevadm trigger --action=add
> -        udevadm settle
> +        udevadm trigger --type=subsystems --action=add
> +        udevadm trigger --type=devices --action=add
> +        udevadm settle --timeout=10

Why did you add a timeout, and not explain it?

Also, are 10 seconds really enough? What happens if a device takes
longer than 10s to initialise (and it is needed to boot, like a slow
USB mass-storage) ?

Regards,
Yann E. MORIN.

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
