From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:01:01 +0200
Subject: [Buildroot] [PATCH v2] package/haveged: set
 write_wakeup_threshold to 2048
In-Reply-To: <20210412164733.17098-1-matthew.weber@rockwellcollins.com>
References: <20210412164733.17098-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210424090101.GR298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2021-04-12 11:47 -0500, Matt Weber spake thusly:
> Adjust the low water mark to wake-up the haveged daemon at the
> same time that rngd would wake-up when a hardware RNG is present.

2048 is indeed the default for rngd, but then don't we want to enforce
that the two have the same setting in Buildroot, and let the user
override that even for haveged (it's already possible for rng-tools),
e.g.:

    diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
    index 4b6e6ced4e..1dce16aa73 100644
    --- a/package/haveged/S21haveged
    +++ b/package/haveged/S21haveged
    @@ -1,9 +1,18 @@
     #!/bin/sh
     
    +NAME="haveged"
    +DAEMON="/usr/sbin/${NAME}"
    +DAEMON_ARGS=""
    +CFG_FILE="/etc/default/${NAME}"
    +PID_FILE="/var/run/${NAME}.pid"
    +
    +# Read configuration variable file if it is present
    +[ -r "${CFG_FILE}" ] && . "${CFG_FILE}"
    +
     case "$1" in
     	start)
     		printf "Starting haveged: "
    -		start-stop-daemon -S -x /usr/sbin/haveged -- -w 1024 -r 0
    +		start-stop-daemon -S -x /usr/sbin/haveged -- -w 2048 -r 0 ${DAEMON_ARGS}
     		[ $? = 0 ] && echo "OK" || echo "FAIL"
     		;;
     	stop)
    diff --git a/package/rng-tools/S21rngd b/package/rng-tools/S21rngd
    index b38be5a507..77cccc790f 100644
    --- a/package/rng-tools/S21rngd
    +++ b/package/rng-tools/S21rngd
    @@ -12,7 +12,7 @@ PID_FILE="/var/run/${NAME}.pid"
     start()
     {
     	printf "Starting ${NAME}: "
    -	start-stop-daemon -S -q -x "${DAEMON}" -- ${DAEMON_ARGS}
    +	start-stop-daemon -S -q -x "${DAEMON}" -- -W 2048 ${DAEMON_ARGS}
     	[ $? = 0 ] && echo "OK" || echo "FAIL"
     }
     

Otherwise, we woud depend on the fact that the default does not change
eveytime we update the rng-tools version.

> This supports the theory that rngd then can't dominate the entropy
> pool. Instead haveged and rngd would complete to fill the pool.

*compete

> https://tails.boum.org/contribute/design/random/#index5h2
> 
> If rngd isn't enabled or there isn't a hardware RNG, this change
> should not impact the behavior of the entropy pool other then

*other than

Regards,
Yann E. MORIN.

> the pool should be less likely to deplete and cause an entropy
> starve with haveged filling it earlier.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
>  - Rebased on master
>  - verified no CPE ids match
> ---
>  package/haveged/S21haveged | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
> index 4b6e6ced4e..22b84e4f27 100644
> --- a/package/haveged/S21haveged
> +++ b/package/haveged/S21haveged
> @@ -3,7 +3,7 @@
>  case "$1" in
>  	start)
>  		printf "Starting haveged: "
> -		start-stop-daemon -S -x /usr/sbin/haveged -- -w 1024 -r 0
> +		start-stop-daemon -S -x /usr/sbin/haveged -- -w 2048 -r 0
>  		[ $? = 0 ] && echo "OK" || echo "FAIL"
>  		;;
>  	stop)
> -- 
> 2.17.1
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
