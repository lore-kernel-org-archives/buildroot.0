From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Mon, 1 Dec 2014 21:27:46 +0100
Subject: [Buildroot] [PATCH v4] set simple network setup via the system
 configuration submenu
In-Reply-To: <1414658196-4531-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1414658196-4531-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <CAGrucu1GahM=AS2rOm8_YX+spuZGRrvSVL0n+VVh1ywR4Mkbog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2014-10-30 9:36 GMT+01:00 J?r?my Rosen <jeremy.rosen@openwide.fr>:
> This patch allows the setup of simple /etc/network/interfaces (or
> /etc/systemd/network/80-buildroot.network if networkd is enabled) via the
> configuration menus instead of using an overlay
>
> * supports disabling the interface
> * supports manual ipv4 configuration
> * supports dhcp configuration
>
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
>
> This patch is here to avoid having to do an overlay for the most common
> cases (ipv4 with fixed IP or DHCP)
>
> This is reduced to the bare minimum to cover the most common case. Anything
> more complex can be done by using overlays instead.
>

I've tested none/manual/dhcp with systemd-networkd and it works as expected.

There's one shell compatibility issue in the cidr calculation code:

> +do_generate_network_service ()
> +{
> [...]
> +       elif [ $BR2_SIMPLE_NETWORK_IPV4_MANUAL ] && \
> +               [ "$BR2_SIMPLE_NETWORK_IPV4_ADDRESS" != "0.0.0.0" ] ; then
> +               nbits=0
> +               OLDIFS="$IFS"; IFS=.
> +               for dec in $BR2_SIMPLE_NETWORK_IPV4_NETMASK ; do
> +                       case $dec in
> +                               255) let nbits+=8;;
> +                               254) let nbits+=7;;
> +                               252) let nbits+=6;;
> +                               248) let nbits+=5;;
> +                               240) let nbits+=4;;
> +                               224) let nbits+=3;;
> +                               192) let nbits+=2;;
> +                               128) let nbits+=1;;
> +                               0);;
> +                       esac
> +               done
> +               IFS="$OLDIFS"

"let" is not available in dash (default shell for Debian). Can be
fixed with "$(( ))" constructs:

255) nbits=$(( nbits + 8 )) ;;

(a.s.o.)
The "0) ;;" statement can be dropped.

-- 
Andr?
