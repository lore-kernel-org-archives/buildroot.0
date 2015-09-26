From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 26 Sep 2015 23:35:17 +1200
Subject: [Buildroot] [RFC PATCH 2/2] syslog-ng: New package
In-Reply-To: <1443266743-20775-3-git-send-email-judge.packham@gmail.com>
References: <1443266743-20775-1-git-send-email-judge.packham@gmail.com>
 <1443266743-20775-3-git-send-email-judge.packham@gmail.com>
Message-ID: <CAFOYHZCCkQWHCmmfjxQ5zPwK6VF743oOB1uGm_g+eE7hsC2FrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Sep 26, 2015 at 11:25 PM, Chris Packham <judge.packham@gmail.com> wrote:
> syslog-ng is an enhanced log daemon, supporting a wide range of input
> and output methods: syslog, unstructured text, queueing, SQL & NoSQL.
>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/Config.in              |  3 +++
>  package/syslog-ng/Config.in    | 18 +++++++++++++
>  package/syslog-ng/S01logging   | 36 ++++++++++++++++++++++++++
>  package/syslog-ng/syslog-ng.mk | 58 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 115 insertions(+)
>  create mode 100644 package/syslog-ng/Config.in
>  create mode 100644 package/syslog-ng/S01logging
>  create mode 100644 package/syslog-ng/syslog-ng.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2c033ba..00fdc09 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1514,6 +1514,9 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/sysklogd/Config.in"
>  endif
> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +       source "package/syslog-ng/Config.in"
> +endif
>         source "package/systemd/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/sysvinit/Config.in"
> diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
> new file mode 100644
> index 0000000..185a8e2
> --- /dev/null
> +++ b/package/syslog-ng/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_SYSLOG_NG
> +       bool "syslog-ng"
> +       select BR2_PACKAGE_EVENTLOG
> +       select BR2_PACKAGE_LIBGLIB2
> +       select BR2_PACKAGE_PCRE
> +       select BR2_PACKAGE_OPENSSL
> +       depends on BR2_USE_WCHAR # glib2
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         syslog-ng is an enhanced log daemon, supporting a wide range of input
> +         and output methods: syslog, unstructured text, queueing, SQL & NoSQL
> +
> +         https://syslog-ng.org/
> +
> +comment "syslog-ng needs a toolchain w/ wchar, threads"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
> new file mode 100644
> index 0000000..3fa7107
> --- /dev/null
> +++ b/package/syslog-ng/S01logging
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +start() {
> +  echo -n "Starting syslog-ng daemon: "
> +  start-stop-daemon -S -q -p /var/run/syslog-ng.pid --exec /usr/sbin/syslog-ng
> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +stop() {
> +  echo -n "Stopping syslog-ng daemon: "
> +  start-stop-daemon -K -q -p /var/run/syslog-ng.pid
> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +restart() {
> +  stop
> +  sleep 1
> +  start
> +}
> +
> +case "$1" in
> +  start)
> +    start
> +    ;;
> +  stop)
> +    stop
> +    ;;
> +  restart|reload)
> +    restart
> +    ;;
> +  *)
> +    echo "Usage: $0 {start|stop|restart}"
> +    exit 1
> +esac
> +
> +exit $?
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> new file mode 100644
> index 0000000..475d1b6
> --- /dev/null
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -0,0 +1,58 @@
> +################################################################################
> +#
> +# syslog-ng
> +#
> +################################################################################
> +
> +SYSLOG_NG_VERSION = 3.7.1
> +SYSLOG_NG_SOURCE = syslog-ng-$(SYSLOG_NG_VERSION).tar.gz
> +SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
> +SYSLOG_NG_LICENSE = LGPL (syslog-ng core), GPL (modules)
> +SYSLOG_NG_LICENSE_FILES = COPYING
> +SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
> +       eventlog libglib2 openssl pcre \
> +       $(if $(BR2_PACKAGE_PYTHON),python) \
> +       $(if $(BR2_PACKAGE_PYTHON3),python3) \
> +       $(if $(BR2_PACKAGE_LIBESMTP),libesmtp) \
> +       $(if $(BR2_PACKAGE_JSON_C),json-c)
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +SYSLOG_NG_CONF_OPTS += \
> +       --enable-systemd \
> +       --with-systemdsystemunitdir=/usr/lib/systemd/system
> +SYSLOG_NG_DEPENDENCIES += systemd

I wasn't sure about this. I copied it from another package but
technically there is no reason for this to be dependent on systemd.
There's nothing about _building_ this package that cares if systemd
has been built. All the systemd related options do is make it install
the syslog-ng.service file.

> +else
> +SYSLOG_NG_CONF_OPTS += --disable-systemd
> +endif
> +
> +define SYSLOG_NG_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 0755 -D package/syslog-ng/S01logging \
> +               $(TARGET_DIR)/etc/init.d/S01logging
> +endef
> +
> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
> +SYSLOG_NG_CONF_OPTS += --disable-python --without-python
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBESMTP),)
> +SYSLOG_NG_CONF_OPTS += --disable-smtp
> +endif
> +
> +define SYSLOG_NG_REMOVE_JSONFORMAT
> +        rm -f $(TARGET_DIR)/usr/share/include/scl/cim/template.conf
> +endef
> +
> +ifeq ($(BR2_PACKAGE_JSON_C),)
> +SYSLOG_NG_CONF_OPTS += --disable-json
> +# Remove config files that use format-json
> +SYSLOG_NG_POST_INSTALL_TARGET_HOOKS += SYSLOG_NG_REMOVE_JSONFORMAT
> +endif
> +
> +define SYSLOG_NG_KERNEL_LOG
> +       $(SED) '/internal();/a \\tfile("/proc/kmsg" program_override("kernel"));' \
> +               $(TARGET_DIR)/etc/syslog-ng.conf
> +endef

There's a bug here. Every time this is built a new configuration line
is inserted.

Because syslog-ng is so configurable the default configuration shipped
tries to show off some of the features. I'm actually wondering if a
simplified "buildroot" syslog-ng.conf would be better. It would also
eliminate the need for the SYSLOG_NG_REMOVE_JSONFORMAT hook.

> +
> +SYSLOG_NG_POST_INSTALL_TARGET_HOOKS += SYSLOG_NG_KERNEL_LOG
> +
> +$(eval $(autotools-package))
> --
> 2.5.0
>
