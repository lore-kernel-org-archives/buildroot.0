From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 22:03:24 +0100
Subject: [Buildroot] [[PATCH RFC] 1/6] package/kmod: add modules-load
 init script
In-Reply-To: <20200320233547.28586-2-unixmania@gmail.com>
References: <20200320233547.28586-1-unixmania@gmail.com>
 <20200320233547.28586-2-unixmania@gmail.com>
Message-ID: <20200321210324.GK4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-20 20:35 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> Use some scripting to mimic the systemd "modules-load" and the OpenRC
> "modules" services (load kernel modules based on static configuration).

So, the goal is laudable, but the implementation is overly complicated
and, imho, flawed.

> The configuration files should simply contain a list of kernel module
> names to load, separated by newlines. Empty lines and lines whose first
> non-whitespace character is # or ; are ignored.

This is avery simple format to parse:

    for d in ${MODULES_DIRS_LIST}; do
        for f in "${d}"/*; do
            # Skip empty or missing directories, and dangling symlinks
            [ -e "${f}" ] || continue

            for m in $(sed -r -e 's/#.+//' "${f}"); do
                printf 'Loading module %s: ' "${m}"
                mpdorobe -s "${m}" && printf 'OK\n' || printf 'FAIL\n'
            done
        done
    done

No need for anything more complex than that.

Also, logger is from busybox, and a system may entirely lack busybox.
Remeber that sysvinit scripts are also used when the init system is,
well, initsysv instead of busybox.

I've marked the entire series (except patch 3 that I already appiled) as
changes requested.

Also, you made that S02. But I believe this should come after S10mdev or
S10udev, which both are going to trigger cold-plug events that may in
turn trigger module loading.

Regards,
Yann E. MORIN.

> The configuration directory list and file format is the same as the one
> described in modules-load.d(5). Files are loaded in the following order:
> 
>   /etc/modules-load.d/*.conf
>   /run/modules-load.d/*.conf
>   /usr/lib/modules-load.d/*.conf
> 
> This roughly mimics the logic used by systemd but the files are not
> sorted by their filename in lexicographic order as systemd does.
> 
> Notice that OpenRC uses /etc/modules-load.d/*.conf, only, and does not
> ignore lines beginning with ';'.
> 
> The file redirections do the following:
> 
> - stdout is redirected to syslog with facility.level "kern.info"
> - stderr is redirected to syslog with facility.level "kern.err"
> - file dscriptor 4 is used to pass the result to the "start" function.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> 
> foo
> ---
>  package/kmod/S02modules-load | 85 ++++++++++++++++++++++++++++++++++++
>  package/kmod/kmod.mk         |  5 +++
>  2 files changed, 90 insertions(+)
>  create mode 100644 package/kmod/S02modules-load
> 
> diff --git a/package/kmod/S02modules-load b/package/kmod/S02modules-load
> new file mode 100644
> index 0000000000..099cc63023
> --- /dev/null
> +++ b/package/kmod/S02modules-load
> @@ -0,0 +1,85 @@
> +#!/bin/sh
> +
> +PROGRAM="modules-load"
> +
> +MODULES_LOAD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
> +
> +# Use some scripting to mimic the systemd "modules-load" and the OpenRC
> +# "modules" services (load kernel modules based on static configuration).
> +# 
> +# The configuration files should simply contain a list of kernel module
> +# names to load, separated by newlines. Empty lines and lines whose first
> +# non-whitespace character is # or ; are ignored.
> +# 
> +# The configuration directory list and file format is the same as the one
> +# described in modules-load.d(5). Files are loaded in the following order:
> +# 
> +#   /etc/modules-load.d/*.conf
> +#   /run/modules-load.d/*.conf
> +#   /usr/lib/modules-load.d/*.conf
> +# 
> +# This roughly mimics the logic used by systemd but the files are not sorted
> +# by their filename in lexicographic order as systemd does.
> +# 
> +# Notice that OpenRC uses /etc/modules-load.d/*.conf, only, and does not
> +# ignore lines beginning with ';'.
> +#
> +# The file redirections do the following:
> +#
> +# - stdout is redirected to syslog with facility.level "kern.info"
> +# - stderr is redirected to syslog with facility.level "kern.err"
> +# - file dscriptor 4 is used to pass the result to the "start" function.
> +
> +MODULES_LOAD_D="/etc/modules-load.d/ /run/modules-load.d/ /usr/lib/modules-load.d/"
> +
> +# Use some scripting to mimic the systemd-modules-load utility provided by
> +# systemd, reporting results to syslog. Uers not interested on messages can
> +# put "-q" in MODULES_LOAD_ARGS.
> +
> +run_program() {
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	find $MODULES_LOAD_D -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
> +	xargs -0 -r -n 1 readlink -f | {
> +		prog_status="OK"
> +		while :; do
> +			read -r file
> +			if [ -z "$file" ]; then
> +				echo "$prog_status" >&4
> +				break
> +			fi
> +			echo "* Applying $file ..."
> +			while :; do
> +				read -r mod || break
> +				case "$mod" in
> +					''|'#'*|';'*) ;;
> +					*) /sbin/modprobe -s "$mod" || prog_status="FAIL"
> +				esac
> +			done < "$file"
> +		done 2>&1 >&3 | /usr/bin/logger -t "$PROGRAM" -p kern.err
> +	} 3>&1 | /usr/bin/logger -t "$PROGRAM" -p kern.info
> +}
> +
> +start() {
> +	printf '%s %s: ' "$1" "$PROGRAM"
> +	status=$(run_program 4>&1)
> +	echo "$status"
> +	if [ "$status" = "OK" ]; then
> +		return 0
> +	fi
> +	return 1
> +}
> +
> +case "$1" in
> +	start)
> +		start "Running";;
> +	restart|reload)
> +		start "Rerunning";;
> +	stop)
> +		:;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index e2dfea5c7b..31bdac6d81 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -60,6 +60,11 @@ else
>  KMOD_BIN_PATH = ../usr/bin/kmod
>  endif
>  
> +define KMOD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/kmod/S02modules-load \
> +		$(TARGET_DIR)/etc/init.d/S02modules-load
> +endef
> +
>  define KMOD_INSTALL_TOOLS
>  	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
>  		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/sbin/$$i; \
> -- 
> 2.18.2
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
