From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:36:11 +0100
Subject: [Buildroot] [PATCH 4/7 v3] etc: add SysV-init startup script
 and sample config file
In-Reply-To: <9243b48a5bc32c35039519eabf4b6946f36f3260.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <9243b48a5bc32c35039519eabf4b6946f36f3260.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128153611.26a6f491@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:11 +0100, Yann E. MORIN wrote:

> diff --git a/etc/default/buildroot-autobuild b/etc/default/buildroot-autobuild
> new file mode 100644
> index 0000000..93b7365
> --- /dev/null
> +++ b/etc/default/buildroot-autobuild
> @@ -0,0 +1,23 @@
> +# The absolute path, outside the chroot, where the
> +# buildroot-test tree is cloned, optional
> +AUTOBUILD_DIR="/home/johndoe/buildroot-test"

What if my buildroot-test tree is just inside the chroot ?

> +# The absolute path, outside the chroot, where to
> +# share downloads (not yet implemented)

"not yet implemented" -> why do we have some code about it in the
script below ?

> +#AUTOBUILD_DL_DIR="/home/johndoe/dl"
> +
> +# The absolute path to chroot into to rn the autobuild script

rn -> run

> +AUTOBUILD_CHROOT="/var/chroot-autobuild"
> +
> +# User (in the chroot) that runs the autobuild script)

last closing parenthesis unneeded

> +AUTOBUILD_USER="buildroot"
> +
> +# The absolute path, in the chroot, that is the base of the
> +# autobuild work dir. In there, you'll have:

What does it mean "you'll have" ? Does it mean that the init script
will set up everything this way, or that it expect things to be already
set up that way ?

> +# - AUTOBUILD_CHROOT_DIR/buildroot-test
> +#       the buildroot-test tree (bind-mounted from AUTOBUILD_DIR if set)
> +# - AUTOBUILD_CHROOT_DIR/buildroot-autobuild.conf
> +#       the run-time configuration of the autobuild script
> +# - AUTOBUILD_CHROOT_DIR/run/
> +#       the parent directory for all build instances
> +AUTOBUILD_CHROOT_DIR="/home/buildroot/autobuild/"
> diff --git a/etc/init.d/buildroot-autobuild b/etc/init.d/buildroot-autobuild
> new file mode 100755
> index 0000000..8605533
> --- /dev/null
> +++ b/etc/init.d/buildroot-autobuild
> @@ -0,0 +1,148 @@
> +#!/bin/sh
> +# vim: ft=sh
> +
> +### BEGIN INIT INFO
> +# Provides:          buildroot-autobuild
> +# Required-Start:    $network
> +# Required-Stop:     $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      1
> +# Short-Description: Buildroot autobuilds
> +### END INIT INFO
> +
> +# Expected configuration in the configuration file;
> +#   AUTOBUILD_DIR           the absolute path to the shared the autobuild
> +#                           git tree; optional
> +#   AUTOBUILD_DL_DIR        the absolute path to the shared DL dir; optional
> +#   AUTOBUILD_CHROOT        the absolute path to the chroot to run in
> +#   AUTOBUILD_USER          the username to run as
> +#
> +# The following variable is to be interpreted inside the chroot:
> +#   AUTOBUILD_CHROOT_DIR    the absolute path to the directory builds run in
> +
> +CFG_FILE="/etc/default/buildroot-autobuild"
> +
> +if [ ! -e "${CFG_FILE}" ]; then
> +    printf "ERROR: no autobuilder configuration file\n" >&2
> +    exit 1
> +fi
> +. "${CFG_FILE}"
> +if [ -z "${AUTOBUILD_USER}" ]; then
> +    printf "ERROR: no autobuild user\n" >&2
> +    exit 1
> +fi
> +if [ -z "${AUTOBUILD_DIR}" ]; then
> +    printf "ERROR: no autobuild dir\n" >&2
> +    exit 1
> +fi
> +if [ -z "${AUTOBUILD_CHROOT}" ]; then
> +    printf "ERROR: no autobuild chroot\n" >&2
> +    exit 1
> +fi
> +if [ -z "${AUTOBUILD_CHROOT_DIR}" ]; then
> +    printf "ERROR: no autobuild chroot dir\n" >&2
> +    exit 1
> +fi
> +
> +# Derived configuration:
> +#   AUTOBUILD_RUN_DIR   instances will be created in there
> +#   AUTOBUILD_CMD       the autobuild script to run
> +#   AUTOBUILD_CFG       the autobuild runtime configuration
> +AUTOBUILD_RUN_DIR="${AUTOBUILD_CHROOT_DIR}/run"
> +AUTOBUILD_CMD="${AUTOBUILD_CHROOT_DIR}/buildroot-test/scripts/autobuild-run"
> +AUTOBUILD_CFG="${AUTOBUILD_CHROOT_DIR}/buildroot-autobuild.conf"
> +AUTOBUILD_CHROOT_PID_FILE="${AUTOBUILD_CHROOT_DIR}/buildroot-autobuild.pid"
> +AUTOBUILD_PID_FILE="${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_DIR}/buildroot-autobuild.pid"
> +
> +autobuild_start() {
> +    echo "Starting buildroot-autobuild"
> +
> +    CMD="cd '${AUTOBUILD_RUN_DIR}'"
> +    CMD="${CMD}; '${AUTOBUILD_CMD}' -c '${AUTOBUILD_CFG}' --pid-file '${AUTOBUILD_CHROOT_PID_FILE}' &"
> +
> +    do_chroot "rm -rf '${AUTOBUILD_RUN_DIR}'"

Why ? Not only this is unnecessary because the autobuild-run script
automatically removes instance-X/output. But it is actively harmful
because it completely removes the download cache of each instance.

> +    do_chroot "mkdir -p '${AUTOBUILD_RUN_DIR}'"
> +    do_chroot "${CMD}"
> +}
> +
> +autobuild_stop() {
> +    echo "Stopping buildroot-autobuild"
> +    if [ -f "${AUTOBUILD_PID_FILE}" ]; then
> +        kill $(cat "${AUTOBUILD_PID_FILE}")
> +    fi
> +    rm -f "${AUTOBUILD_PID_FILE}"

The rm -f could possibly be within the if, no ?

Other than that, it generally looks good, but maybe
the /etc/default/buildroot-autobuild file needs a few more comments to
explain the expected directory layout and preparations to be done by
the user in order to be able to use this script.

Also, maybe you should make the use of the chroot optional: both of us
are running autobuild-run in a chroot, but not everyone is doing this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
