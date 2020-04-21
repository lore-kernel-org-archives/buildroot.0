From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 21 Apr 2020 10:27:48 -0500
Subject: [Buildroot] [PATCH v2 1/5] package/kmod: add modules-load init
 script
In-Reply-To: <20200418221411.1549783-2-unixmania@gmail.com>
References: <20200418221411.1549783-1-unixmania@gmail.com>
 <20200418221411.1549783-2-unixmania@gmail.com>
Message-ID: <CANQCQpbgKX9sG+E==EUEY9Q3A4aqaP73jUMH9+xsc96La_dRrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,


On Sat, Apr 18, 2020 at 5:16 PM <unixmania@gmail.com> wrote:
>
> From: Carlos Santos <unixmania@gmail.com>
>
> Use some scripting to mimic the systemd "modules-load" and the OpenRC
> "modules" services (load kernel modules based on static configuration).
>

Thanks for sending this.  I know I carry a lot of kmod loading scripts
that all look the same and should have been upstreamed :-)

Just a note, I noticed this debian example script for sysv and it can
also handle options.  Usually having the ability to provide module
options is one of the reasons to break out to use modules in some of
our use cases.
https://github.com/SebKuzminsky/kmod/blob/master/debian/kmod.init


> The configuration files should simply contain a list of kernel module
> names to load, separated by newlines. Empty lines and lines whose first
> non-whitespace character is # or ; are ignored.
>
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
> ---
> CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Changes v1->v2:
> - Redirect output to syslog only if /usr/bin/logger exists, as made in
>   package/procps-ng/S02sysctl.
> - Use the MODULES_LOAD_ARGS variable, optionally set in
>   /etc/default/modules-load.
> - Rename S02modules-load to S11modules-load to ensure that it runs after
>   S10mdev and S10udev, which both are going to trigger cold-plug events
>   that may in turn trigger module loading, as observed by Yann E. MORIN.
> - Prevent the installation of S11modules-load with openrc, which already
>   provides the /etc/init.d/modules script.
> - Reorganize the comments in S11modules-load.
> ---
>  package/kmod/S11modules-load | 115 +++++++++++++++++++++++++++++++++++
>  package/kmod/kmod.mk         |  10 +++
>  2 files changed, 125 insertions(+)
>  create mode 100644 package/kmod/S11modules-load
>
> diff --git a/package/kmod/S11modules-load b/package/kmod/S11modules-load
> new file mode 100644
> index 0000000000..9010230e23
> --- /dev/null
> +++ b/package/kmod/S11modules-load
> @@ -0,0 +1,115 @@
> +#!/bin/sh
> +#
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
> +
> +PROGRAM="modules-load"
> +
> +MODULES_LOAD_ARGS=""
> +
> +# Add "-q" to MODULES_LOAD_ARGS to disable error messages.
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
> +
> +# Files are read from directories in the MODULES_SOURCES list, in the given
> +# order. A file may be used more than once, since there can be multiple
> +# symlinks to it. No attempt is made to prevent this.
> +MODULES_SOURCES="/etc/modules-load.d/ /run/modules-load.d/ /usr/lib/modules-load.d/"
> +
> +# If the logger utility is available all messages are sent to syslog, except
> +# for the final status. The file redirections do the following:
> +#
> +# - stdout is redirected to syslog with facility.level "kern.info"
> +# - stderr is redirected to syslog with facility.level "kern.err"
> +# - file dscriptor 4 is used to pass the result to the "start" function.
> +#
> +run_logger() {
> +       # shellcheck disable=SC2086 # we need the word splitting
> +       find $MODULES_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
> +       xargs -0 -r -n 1 readlink -f | {
> +               prog_status="OK"
> +               while :; do
> +                       read -r file || {
> +                               echo "$prog_status" >&4
> +                               break
> +                       }
> +                       echo "* Applying $file ..."
> +                       while :; do
> +                               read -r mod || break
> +                               case "$mod" in
> +                                       ''|'#'*|';'*) ;;
> +                                       *) /sbin/modprobe $MODULES_LOAD_ARGS "$mod" || prog_status="FAIL"
> +                               esac
> +                       done < "$file"
> +               done 2>&1 >&3 | /usr/bin/logger -t "$PROGRAM" -p kern.err
> +       } 3>&1 | /usr/bin/logger -t "$PROGRAM" -p kern.info
> +}
> +
> +# If logger is not available all messages are sent to stdout/stderr.
> +run_std() {
> +       # shellcheck disable=SC2086 # we need the word splitting
> +       find $MODULES_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
> +       xargs -0 -r -n 1 readlink -f | {
> +               prog_status="OK"
> +               while :; do
> +                       read -r file || {
> +                               echo "$prog_status" >&4
> +                               break
> +                       }
> +                       echo "* Applying $file ..."
> +                       while :; do
> +                               read -r mod || break
> +                               case "$mod" in
> +                                       ''|'#'*|';'*) ;;
> +                                       *) /sbin/modprobe $MODULES_LOAD_ARGS "$mod" || prog_status="FAIL"
> +                               esac
> +                       done < "$file"
> +               done
> +       }
> +}
> +
> +if [ -x /usr/bin/logger ]; then
> +       run_program="run_logger"
> +else
> +       run_program="run_std"
> +fi
> +
> +start() {
> +       printf '%s %s: ' "$1" "$PROGRAM"
> +       status=$("$run_program" 4>&1)
> +       echo "$status"
> +       if [ "$status" = "OK" ]; then
> +               return 0
> +       fi
> +       return 1
> +}
> +
> +case "$1" in
> +       start)
> +               start "Running";;
> +       restart|reload)
> +               start "Rerunning";;
> +       stop)
> +               :;;
> +       *)
> +               echo "Usage: $0 {start|stop|restart|reload}"
> +               exit 1
> +esac
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index e2dfea5c7b..9b6735e2d0 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -60,6 +60,16 @@ else
>  KMOD_BIN_PATH = ../usr/bin/kmod
>  endif
>
> +# Avoid installing S11modules-load, since openrc provides /etc/init.d/modules.
> +define KMOD_INSTALL_INIT_OPENRC
> +       @:
> +endef
> +
> +define KMOD_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 0755 -D package/kmod/S11modules-load \
> +               $(TARGET_DIR)/etc/init.d/S11modules-load
> +endef
> +
>  define KMOD_INSTALL_TOOLS
>         for i in depmod insmod lsmod modinfo modprobe rmmod; do \
>                 ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/sbin/$$i; \
> --
> 2.18.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.


ALPHA BRAVO COLLINS | Aerospace Redefined

         __ l __

 \- - - -o-(_)-o- - - -/
