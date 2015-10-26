From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 26 Oct 2015 15:07:14 -0500
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
 for network interfaces to appear
In-Reply-To: <20151016111136.50FA381F8A@busybox.osuosl.org>
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
Message-ID: <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Yann, All,

On Fri, Oct 16, 2015 at 2:16 AM, Peter Korsgaard <peter@korsgaard.com> wrote:

[...]

>
> diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
> index 7b11d8b..a8d7c5d 100755
> --- a/package/initscripts/init.d/S40network
> +++ b/package/initscripts/init.d/S40network
> @@ -6,8 +6,37 @@
>  # Debian ifupdown needs the /run/network lock directory
>  mkdir -p /run/network
>
> +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
> +# and we need to configure it, wait until it appears, but not too
> +# long either. WAIT_DELAY is in seconds.
> +WAIT_DELAY=15
> +
> +wait_for_interfaces() {
> +       IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)

This new way to handle bringing up interfaces doesn't work well if you
have defined virtual interfaces in your /etc/network/interfaces.
Having virtual interfaces in your /etc/network/interfaces file I
believe is a valid use case that I think buildroot's default
S40network should handle. The specific use case that will fail is
outlined below:

In the actual use case demonstrated below, the network interfaces file
contains 2 virtual interfaces on eth3.  Virtual interfaces do not get
a unique entry in /sys/class/net.  The function "wait_for_interfaces"
added to /package/initscripts/init.d/S40network makes an assumption
that all interfaces that may be "auto" will have a /sys/class/net
entry.  In the case of a virtual interface, the function will always
timeout, and "ifup -a" is never called.

# awk '/^auto/ { print $2 }' /etc/network/interfaces
lo
eth3
eth3:1
eth3:2

# ls /sys/class/net/
eth0   eth1   eth2   eth3 lo

I'm not an awk expert so I'm not exactly sure how to fix this issue
but I think this is a valid use case that should be addressed.

Thanks,
-Ryan

> +       [ -n "$IFACES" ] || return
> +
> +       printf "Waiting for network interfaces to appear"
> +
> +       for i in $(seq $WAIT_DELAY); do
> +           for IFACE in $IFACES; do
> +               if [ ! -e "/sys/class/net/$IFACE" ]; then
> +                   printf "."
> +                   sleep 1
> +                   continue 2
> +               fi
> +           done
> +
> +           printf " ok\n"; return
> +       done
> +
> +       printf " timeout\n"
> +       exit 1
> +}
> +
>  case "$1" in
>    start)
> +       wait_for_interfaces
> +
>         echo "Starting network..."
>         /sbin/ifup -a
>         ;;


-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
