From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Mar 2017 11:39:40 -0500
Subject: [Buildroot] [PATCH 4/4] busybox: applets as individual binaries
In-Reply-To: <1490564623-26806-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490564623-26806-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CANQCQpZMWZQcpW7gQh1zMzcdGOUkSB_wFYK7FXUM0oC06HCWkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Mar 26, 2017 at 4:43 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>
> The individual binaries option of busybox allows for the applets that
> would usually be symlinks to be built as individual applications that
> link against a shared library.
>
> This feature is needed for SELinux to allow the applications to run
> under the correct SELinux context.
>
> The patch being added allows the individual applications to be installed
> and will be upstreamed to the busybox developers.
>
> The initial work for this change was done by Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>.
>
> The implementation of the BUSYBOX_PERMISSIONS_FILE generation has been
> provided by Yann E. Morin.
>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> [Thomas:
>  - add help text in Config.in option.
>  - remove change to BUSYBOX_PERMISSIONS, for now the permissions of the
>    individual binaries are not correct. A follow-up patch will fix
>    that. Therefore, the change to makedevs.c was removed.
>  - rename BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES to
>    BUSYBOX_SET_INDIVIDUAL_BINARIES to be consistent with other
>    variables.
>  - call BUSYBOX_INSTALL_INDIVIDUAL_BINARIES in
>    BUSYBOX_INSTALL_TARGET_CMDS, not in BUSYBOX_INSTALL_INIT_SYSV.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/busybox/Config.in  | 16 ++++++++++++++++
>  package/busybox/busybox.mk | 28 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 504cd8a..9a2f411 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -54,6 +54,22 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
>           crond, then individual binaries have to be enabled for the
>           SELinux type transitions to occur properly.
>
> +config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
> +       bool "Individual binaries"
> +       depends on !BR2_STATIC_LIBS
> +       depends on !BR2_bfin # libbusybox.so link issue
> +       help
> +         By default (i.e with this option disabled), Busybox is
> +         installed as a single binary in /bin/busybox and all applets
> +         are a symbolic link to /bin/busybox.
> +
> +         With this option enabled, each applet is a separate binary,
> +         which is needed for proper operation with SELinux.
> +
> +comment "Busybox individual binaries depends on dynamic libraries"
> +       depends on BR2_STATIC_LIBS
> +       depends on !BR2_bfin
> +
>  config BR2_PACKAGE_BUSYBOX_WATCHDOG
>         bool "Install the watchdog daemon startup script"
>         help
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 577f2f2..205b45a 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -60,9 +60,24 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call
> qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
>  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +BUSYBOX_PERMISSIONS_FILE = $(BUSYBOX_DIR)/busybox.permissions
> +define BUSYBOX_GEN_PERMISSIONS
> +       for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE"
> $(@D)/include/applets.h \
> +               | sed -e 's/,.*//' -e 's/.*(//'`; \
> +       do \
> +               temp=`grep -w $${app} $(@D)/busybox.links`; \
> +               if [ -n "$${temp}" ]; then \
> +                       echo "$${temp} f 4755 0  0 - - - - -"; \
> +               fi; \
> +       done >$(BUSYBOX_PERMISSIONS_FILE)
> +endef
> +BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_GEN_PERMISSIONS
> +else
>

I like the new approach vs the fixed table and the makedevs.c mod for a
optional file.

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>


>  define BUSYBOX_PERMISSIONS
>         /bin/busybox                     f 4755 0  0 - - - - -
>  endef
> +endif
>
>  # If mdev will be used for device creation enable it and copy S10mdev to
> /etc/init.d
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> @@ -171,6 +186,17 @@ define BUSYBOX_SET_SELINUX
>  endef
>  endif
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_SET_INDIVIDUAL_BINARIES
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$(BUSYBOX_
> BUILD_CONFIG))
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$(BUSYBOX_
> BUILD_CONFIG))
> +endef
> +
> +define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
> +       rm -f $(TARGET_DIR)/bin/busybox
> +endef
> +endif
> +
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
>         if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
>                 $(INSTALL) -m 0755 -D package/busybox/S01logging \
> @@ -228,6 +254,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>         $(BUSYBOX_SET_INIT)
>         $(BUSYBOX_SET_WATCHDOG)
>         $(BUSYBOX_SET_SELINUX)
> +       $(BUSYBOX_SET_INDIVIDUAL_BINARIES)
>         $(BUSYBOX_MUSL_TWEAKS)
>  endef
>
> @@ -244,6 +271,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>         $(BUSYBOX_INSTALL_INITTAB)
>         $(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>         $(BUSYBOX_INSTALL_MDEV_CONF)
> +       $(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
>  endef
>
>  define BUSYBOX_INSTALL_INIT_SYSV
> --
> 2.7.4
>
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170327/349bb423/attachment.html>
