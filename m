From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 29 Jan 2018 07:36:03 +0200
Subject: [Buildroot] [PATCH] eudev: generate /etc/udev/hwdb.bin at
 system startup
In-Reply-To: <20180129041931.28192-1-casantos@datacom.ind.br>
References: <20180129041931.28192-1-casantos@datacom.ind.br>
Message-ID: <20180129053603.pqmufwqeo3cv5p6q@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Mon, Jan 29, 2018 at 02:19:31AM -0200, Carlos Santos wrote:
> Programs that use libudev (e.g. lsusb, from usbutils) need the hwdb.bin
> file to work properly.
> 
> If BR2_PACKAGE_EUDEV_ENABLE_HWDB is selected then the eudev installation
> populates /etc/udev/hwdb.d/ but does not genarete /etc/udev/hwdb.bin. It
> must be created running "udevadm hwdb --update" on the target device.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/eudev/S10udev | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eudev/S10udev b/package/eudev/S10udev
> index 8382bec2bb..5c25e51317 100755
> --- a/package/eudev/S10udev
> +++ b/package/eudev/S10udev
> @@ -25,14 +25,22 @@ UDEV_CONFIG=/etc/udev/udev.conf
>  test -r $UDEV_CONFIG || exit 6
>  . $UDEV_CONFIG
>  
> +UDEV_HWDB_BIN=/etc/udev/hwdb.bin
> +UDEV_HWDB_D=/etc/udev/hwdb.d
> +
>  case "$1" in
>      start)
>          printf "Populating ${udev_root:-/dev} using udev: "
>          printf '\000\000\000\000' > /proc/sys/kernel/hotplug
> -        $UDEV_BIN -d || (echo "FAIL" && exit 1)
> +        $UDEV_BIN -d || { echo "FAIL" && exit 1; }

How is this change related to hwdb.bin generation?

>          udevadm trigger --type=subsystems --action=add
>          udevadm trigger --type=devices --action=add
> -        udevadm settle --timeout=30 || echo "udevadm settle failed"
> +        udevadm settle --timeout=30 || { echo "udevadm settle failed" && exit 1; }
> +        [ -d "$UDEV_HWDB_D" ] && {
> +            echo "done"
> +            printf "Compiling hardware database information $UDEV_HWDB_BIN: "
> +            udevadm hwdb --update || { echo "FAIL" && exit 1; }

Wouldn't that break read-only /etc?

> +        }
>          echo "done"
>          ;;
>      stop)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
