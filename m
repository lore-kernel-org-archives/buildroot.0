From: Matthew Weber <matt@thewebers.ws>
Date: Sun, 12 Jul 2015 20:20:08 -0500
Subject: [Buildroot] [PATCH v2] busybox: udhcpc create leases file
In-Reply-To: <1432609857-26391-1-git-send-email-matt@thewebers.ws>
References: <1432609857-26391-1-git-send-email-matt@thewebers.ws>
Message-ID: <CAFt09wOaZVpkbkC+9_QVmO6gfeOzu8NiPiJ2GM3Gh6K1f_2b6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, May 25, 2015 at 10:10 PM, Matt Weber <matt@thewebers.ws> wrote:

> Capture the lease information for use by applications
> after a lease is aquired.
>
> Signed-off-by: Matt Weber <matthew.l.weber@gmail.com>
> ---
>
> Changes v1 -> v2
>  - Changed from appending to keeping just the last lease
>  - Adjusted format to pure shell variables instead of
>    dhclient format.
>  - Moved location to /var/run instead of /var/lib/misc
> ---
>  package/busybox/udhcpc.script | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
> index 50c52e6..e913111 100755
> --- a/package/busybox/udhcpc.script
> +++ b/package/busybox/udhcpc.script
> @@ -61,6 +61,27 @@ case "$1" in
>                         echo adding dns $i
>                         echo "nameserver $i # $interface" >> $RESOLV_CONF
>                 done
> +
> +               # Record last lease
> +               {
> +                   echo "IFACE=$interface"
> +                   echo "IP=$ip"
> +                   [ -n "$subnet" ]    && echo "MASK=$subnet"
> +                   [ -n "$router" ]    && echo "ROUTER=$router"
> +                   [ -n "$dns" ]       && echo "DNS=\"$dns\""
> +                   [ -n "$domain" ]    && echo "DOMAIN=$domain"
> +                   [ -n "$boot_file" ] && echo "BOOT_FILE=$boot_file"
> +                   echo "DHCP_LEASE_TIME=$lease"
> +                   echo "DHCP_MSG_TYPE=$dhcptype"
> +                   echo "DHCP_SERVER_ID=${siaddr:-$serverid}"
> +                   d=$(expr "$(date "+%Y.%m.%d-%H:%M:%S")" : "\(.*\):")
> +                   t=$(date -d "$d:$(expr $lease / 2)" "+%w %Y/%m/%d
> %H:%M:%S" 2>/dev/null)
> +                   [ -n "$t" ] && echo "DHCP_RENEW=\"$t\""
> +                   t=$(date -d "$d:$(expr 7 '*' $lease / 8)" "+%w
> %Y/%m/%d %H:%M:%S" 2>/dev/null)
> +                   [ -n "$t" ] && echo "DHCP_REBIND=\"$t\""
> +                   t=$(date -d "$d:$lease" "+%w %Y/%m/%d %H:%M:%S"
> 2>/dev/null)
> +                   [ -n "$t" ] && echo "DHCP_EXPIRE=\"$t\""
> +               } > /var/run/udhcpc.$interface.leases
>                 ;;
>  esac
>
> --
> 1.9.1
>
>
Since the hook scripts where added for the udhcpc.script, is the preference
to use a hook for something like a record of the last lease?


-- 
Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150712/132de537/attachment.html>
