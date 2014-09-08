From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 8 Sep 2014 11:10:08 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
Message-ID: <CABbD_XDpAEMR5X6nL7iF0SPeLrDHe5PRCTzeJiWnnzpVJ1tK-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Thomas, List,

could you please verify the latest version of openvmtools package?
I think I was able to fit your comments.
Also, if you like the format of the S10vmtoolsd script, I will review the
other initscripts as proposed by you before.

Kind regards,
Karoly

On Tue, Sep 2, 2014 at 6:13 PM, Karoly Kasza <kaszak@gmail.com> wrote:

> New package: openvmtools
>
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>
> Changes v6 -> v7:
>   - PAM support now depends on BR2_PREFER_STATIC_LIB
>   - LDFLAGS="-L$(TARGET_DIR)/usr/lib" removed from procps section
>   - Reference to $(STAGING_DIR) removed from DNET section
>   - Additional comments added
>
>  package/Config.in                                  |    1 +
>  package/openvmtools/Config.in                      |   61 +++++++++++++++
>  package/openvmtools/S10vmtoolsd                    |   33 ++++++++
>  .../openvmtools-01-has_bsd_printf.patch            |   26 +++++++
>  .../openvmtools-02-network_script.patch            |   21 ++++++
>  package/openvmtools/openvmtools.mk                 |   79
> ++++++++++++++++++++
>  package/openvmtools/shutdown                       |    7 ++
>  package/openvmtools/vmtoolsd.service               |   14 ++++
>  8 files changed, 242 insertions(+)
>  create mode 100644 package/openvmtools/Config.in
>  create mode 100644 package/openvmtools/S10vmtoolsd
>  create mode 100644 package/openvmtools/openvmtools-01-has_bsd_printf.patch
>  create mode 100644 package/openvmtools/openvmtools-02-network_script.patch
>  create mode 100644 package/openvmtools/openvmtools.mk
>  create mode 100644 package/openvmtools/shutdown
>  create mode 100644 package/openvmtools/vmtoolsd.service
>
> diff --git a/package/Config.in b/package/Config.in
> index 883dd66..374694b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1171,6 +1171,7 @@ endif
>         source "package/ncdu/Config.in"
>         source "package/numactl/Config.in"
>         source "package/nut/Config.in"
> +       source "package/openvmtools/Config.in"
>         source "package/powerpc-utils/Config.in"
>         source "package/polkit/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
> new file mode 100644
> index 0000000..319b653
> --- /dev/null
> +++ b/package/openvmtools/Config.in
> @@ -0,0 +1,61 @@
> +config BR2_PACKAGE_OPENVMTOOLS
> +       bool "openvmtools"
> +       depends on BR2_i386 || BR2_x86_64
> +       depends on BR2_USE_MMU # libglib2
> +       depends on BR2_USE_WCHAR # libglib2
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +       depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +       depends on BR2_LARGEFILE
> +       depends on BR2_ENABLE_LOCALE
> +       select BR2_PACKAGE_LIBGLIB2
> +       help
> +         Open Virtual Machine Tools for VMware guest OS
> +
> +         http://open-vm-tools.sourceforge.net/
> +
> +         ICU locales and X11 tools are currently not supported.
> +
> +         NOTE: Support for vmblock-fuse will be enabled in openvmtools if
> the
> +               libfuse package is selected.
> +
> +if BR2_PACKAGE_OPENVMTOOLS
> +
> +config BR2_PACKAGE_OPENVMTOOLS_PROCPS
> +       bool "procps support"
> +       depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +       select BR2_PACKAGE_PROCPS_NG
> +       help
> +         Enable support for procps / meminfo
> +
> +comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
> +       depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +
> +config BR2_PACKAGE_OPENVMTOOLS_DNET
> +       bool "dnet support"
> +       depends on BR2_INET_IPV6
> +       select BR2_PACKAGE_LIBDNET
> +       help
> +         Enable support for libdnet / nicinfo
> +
> +comment "dnet support needs a toolchain w/ IPv6"
> +       depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_OPENVMTOOLS_PAM
> +       bool "PAM support"
> +       select BR2_PACKAGE_LINUX_PAM
> +       # linux-pam needs locale and wchar, but we already have this
> +       # dependency on the main symbol, above.
> +       depends on !BR2_PREFER_STATIC_LIB
> +       help
> +         Support for PAM in openvmtools
> +
> +comment "PAM support needs a toolchain w/ dynamic library"
> +       depends on BR2_PREFER_STATIC_LIB
> +
> +endif
> +
> +comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile,
> locale"
> +       depends on BR2_i386 || BR2_x86_64
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR ||!BR2_TOOLCHAIN_HAS_THREADS || \
> +       !BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE ||
> !BR2_ENABLE_LOCALE
> diff --git a/package/openvmtools/S10vmtoolsd
> b/package/openvmtools/S10vmtoolsd
> new file mode 100644
> index 0000000..969ba93
> --- /dev/null
> +++ b/package/openvmtools/S10vmtoolsd
> @@ -0,0 +1,33 @@
> +#!/bin/sh
> +#
> +# Starts vmtoolsd for openvmtools
> +#
> +
> +EXEC="/usr/bin/vmtoolsd"
> +ARGS="-b"
> +PID="/var/run/vmtoolsd.pid"
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting vmtoolsd: "
> +    start-stop-daemon -S -q -x $EXEC -- $ARGS $PID
> +    if [ $? != 0 ]; then
> +      echo "FAILED"
> +      exit 1
> +    else
> +      echo "OK"
> +    fi
> +  ;;
> +  stop)
> +    echo -n "Stopping vmtoolsd: "
> +    start-stop-daemon -K -q -p $PID
> +    echo "OK"
> +  ;;
> +  restart|reload)
> +    $0 stop
> +    $0 start
> +  ;;
> +  *)
> +    echo "Usage: $0 {start|stop|restart}"
> +    exit 1
> +esac
> diff --git a/package/openvmtools/openvmtools-01-has_bsd_printf.patch
> b/package/openvmtools/openvmtools-01-has_bsd_printf.patch
> new file mode 100644
> index 0000000..889f7d1
> --- /dev/null
> +++ b/package/openvmtools/openvmtools-01-has_bsd_printf.patch
> @@ -0,0 +1,26 @@
> +lib/misc/msgList.c: missing #ifdef
> +
> +This macro checks for BSD style printf(), which is not present
> +when compiling for uClibc. The linked functions are unnecessary in
> +this case, and they break compilation.
> +
> +Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> +
> +--- open-vm-tools-9.4.6-1770165.orig/lib/misc/msgList.c        2014-07-02
> 00:21:14.000000000 +0200
> ++++ open-vm-tools-9.4.6-1770165/lib/misc/msgList.c     2014-07-29
> 13:40:40.000000000 +0200
> +@@ -487,6 +487,7 @@
> +    return messages->id;
> + }
> +
> ++#ifdef HAS_BSD_PRINTF
> +
> + /*
> +  *----------------------------------------------------------------------
> +@@ -566,6 +567,7 @@
> +    }
> + }
> +
> ++#endif
> +
> + /*
> +  *----------------------------------------------------------------------
> diff --git a/package/openvmtools/openvmtools-02-network_script.patch
> b/package/openvmtools/openvmtools-02-network_script.patch
> new file mode 100644
> index 0000000..67705cc
> --- /dev/null
> +++ b/package/openvmtools/openvmtools-02-network_script.patch
> @@ -0,0 +1,21 @@
> +scripts/linux/network: exit normally if no network control script
> +
> +When using suspend/resume from the hypervisor, openvmtools checks for the
> +networking script, and exists with an error if not found, making the
> hypervisor
> +raise a warning message. This workaround silences that error message.
> +
> +Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> +
> +--- open-vm-tools-9.4.6-1770165.orig/scripts/linux/network     2014-07-02
> 00:21:14.000000000 +0200
> ++++ open-vm-tools-9.4.6-1770165/scripts/linux/network  2014-08-07
> 16:34:21.963514273 +0200
> +@@ -88,7 +88,9 @@
> + run_network_script()
> + {
> +    script=`find_networking_script`
> +-   [ "$script" != "error" ] || Panic "Cannot find system networking
> script."
> ++#   [ "$script" != "error" ] || Panic "Cannot find system networking
> script."
> ++# Modified for buildroot
> ++   [ "$script" != "error" ] || exit 0
> +
> +    # Using SysV "service" if it exists, otherwise fall back to run the
> script directly
> +    service=`which service 2>/dev/null`
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/
> openvmtools.mk
> new file mode 100644
> index 0000000..6361d6b
> --- /dev/null
> +++ b/package/openvmtools/openvmtools.mk
> @@ -0,0 +1,79 @@
>
> +################################################################################
> +#
> +# openvmtools
> +#
>
> +################################################################################
> +
> +OPENVMTOOLS_VERSION = 9.4.6-1770165
> +OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
> +OPENVMTOOLS_SITE =
> http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
> +OPENVMTOOLS_LICENSE = LGPLv2.1
> +OPENVMTOOLS_LICENSE_FILES = COPYING
> +# Autoreconf needed because package is distributed without a configure
> script
> +# See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
> +OPENVMTOOLS_AUTORECONF = YES
> +OPENVMTOOLS_CONF_OPT = --without-icu --without-x --without-gtk2
> --without-gtkmm --without-kernel-modules
> +# -Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
> +# See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
> +OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)
> -Wno-deprecated-declarations"
> +
> +OPENVMTOOLS_DEPENDENCIES = libglib2
> +
> +# When libfuse is available, openvmtools can build vmblock-fuse, so
> +# make sure that libfuse gets built first
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +OPENVMTOOLS_DEPENDENCIES += libfuse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
> +OPENVMTOOLS_CONF_OPT += --with-procps
> +OPENVMTOOLS_DEPENDENCIES += procps-ng
> +else
> +OPENVMTOOLS_CONF_OPT += --without-procps
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> +# Needed because if it is defined configure will
> +# use a different method to check for dnet
> +OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
> +OPENVMTOOLS_CONF_OPT += --with-dnet
> +OPENVMTOOLS_DEPENDENCIES += libdnet
> +else
> +OPENVMTOOLS_CONF_OPT += --without-dnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
> +OPENVMTOOLS_CONF_OPT += --with-pam
> +OPENVMTOOLS_MAKE_OPT += CFLAGS+="-Wno-unused-local-typedefs"
> +OPENVMTOOLS_DEPENDENCIES += linux-pam
> +else
> +OPENVMTOOLS_CONF_OPT += --without-pam
> +endif
> +
> +# symlink needed by lib/system/systemLinux.c (or will cry in
> /var/log/messages)
> +# /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
> +define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
> +       ln -fs os-release $(TARGET_DIR)/etc/lfs-release
> +       if [ ! -e $(TARGET_DIR)/sbin/shutdown ]; then \
> +               $(INSTALL) -D -m 755 package/openvmtools/shutdown \
> +                       $(TARGET_DIR)/sbin/shutdown; \
> +       fi
> +endef
> +
> +OPENVMTOOLS_POST_INSTALL_TARGET_HOOKS +=
> OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
> +
> +define OPENVMTOOLS_INSTALL_INIT_SYSV
> +       $(INSTALL) -D -m 755 package/openvmtools/S10vmtoolsd \
> +               $(TARGET_DIR)/etc/init.d/S10vmtoolsd
> +endef
> +
> +define OPENVMTOOLS_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/openvmtools/vmtoolsd.service \
> +               $(TARGET_DIR)/etc/systemd/system/vmtoolsd.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -fs ../vmtoolsd.service \
> +
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vmtoolsd.service
> +endef
> +
> +$(eval $(autotools-package))
> diff --git a/package/openvmtools/shutdown b/package/openvmtools/shutdown
> new file mode 100644
> index 0000000..bca9765
> --- /dev/null
> +++ b/package/openvmtools/shutdown
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +#compatibility script for openvmtools
> +if [ "$1" == "-r" ]; then
> +/sbin/reboot
> +else
> +/sbin/poweroff
> +fi
> diff --git a/package/openvmtools/vmtoolsd.service
> b/package/openvmtools/vmtoolsd.service
> new file mode 100644
> index 0000000..17a4df4
> --- /dev/null
> +++ b/package/openvmtools/vmtoolsd.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=vmtoolsd for openvmtools
> +After=syslog.target network.target
> +
> +[Service]
> +Type=forking
> +PIDFile=/var/run/vmtoolsd.pid
> +ExecStart=/usr/bin/vmtoolsd -b /var/run/vmtoolsd.pid
> +Restart=on-failure
> +KillMode=process
> +KillSignal=SIGKILL
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 1.7.10.4
>
>


-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140908/21d7f367/attachment.html>
