From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Dec 2011 07:52:20 +0100
Subject: [Buildroot] [PATCH] Rework of shutdown policy in inittab
In-Reply-To: <1314966310-4360-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1314966310-4360-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <CAAXf6LU1QuFL=pOD09e0dzA1ntsauaFSD2qUr-OPEbmXB74fyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Sep 2, 2011 at 2:25 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> This commit follows commit ad501b66. Start up of the busybox logging
> daemons were moved to an init script but the shutdown were still
> performed in inittab. This commit moves the shutdown policy to an
> rcK script that calls the stop function of all the init scripts in
> a reversed order.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> ?fs/skeleton/etc/init.d/rcK | ? 27 +++++++++++++++++++++++++++
> ?fs/skeleton/etc/inittab ? ?| ? ?3 +--
> ?2 files changed, 28 insertions(+), 2 deletions(-)
> ?create mode 100755 fs/skeleton/etc/init.d/rcK
>
> diff --git a/fs/skeleton/etc/init.d/rcK b/fs/skeleton/etc/init.d/rcK
> new file mode 100755
> index 0000000..59e9c54
> --- /dev/null
> +++ b/fs/skeleton/etc/init.d/rcK
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +
> +
> +# Stop all init scripts in /etc/init.d
> +# executing them in reversed numerical order.
> +#
> +for i in $(ls -r /etc/init.d/S??*) ;do
> +
> + ? ? # Ignore dangling symlinks (if any).
> + ? ? [ ! -f "$i" ] && continue
> +
> + ? ? case "$i" in
> + ? ? ? *.sh)
> + ? ? ? ? ? # Source shell script for speed.
> + ? ? ? ? ? (
> + ? ? ? ? ? ? ? trap - INT QUIT TSTP
> + ? ? ? ? ? ? ? set stop
> + ? ? ? ? ? ? ? . $i
> + ? ? ? ? ? )
> + ? ? ? ? ? ;;
> + ? ? ? *)
> + ? ? ? ? ? # No sh extension, so fork subprocess.
> + ? ? ? ? ? $i stop
> + ? ? ? ? ? ;;
> + ? ?esac
> +done
> +
> diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
> index ac410d6..85881f4 100644
> --- a/fs/skeleton/etc/inittab
> +++ b/fs/skeleton/etc/inittab
> @@ -30,8 +30,7 @@ null::sysinit:/bin/hostname -F /etc/hostname
> ?::ctrlaltdel:/sbin/reboot
>
> ?# Stuff to do before rebooting
> -null::shutdown:/usr/bin/killall klogd
> -null::shutdown:/usr/bin/killall syslogd
> +null::shutdown:/etc/init.d/rcK
> ?null::shutdown:/bin/umount -a -r
> ?null::shutdown:/sbin/swapoff -a

This is a different behavior now. Before only the logging daemons were
killed, now all init scripts are run.

For this to work properly, all init scripts that users have in
/etc/init.d should actually have a stop() function. Since this
behavior was not required previously, I expect several users not to
have this.
For such users, a reboot would suddenly trigger several
initializations that are unexpected.

I think there are at least two solutions:
1. Keep the new behavior created with this patch, but make sure that
the release notes clearly state this behavior change and update the
documentation.

2. Adapt the new behavior: currently you are following
/etc/init.d/Sxxxx files/links, while I think that the default policy
on many distributions is to use /etc/init.d/Kxxxx for shutdown (and
Sxxxx only for startup). In this scenario, users who have custom Sxxx
init scripts will not be impacted. Only if they choose to, can they
create appropriate Kxxxx links and provide stop functions.
For scripts present in the buildroot distribution, we can provide
appropriate S and K links immediately.

Best regards,
Thomas
