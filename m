From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 10:19:11 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libfuse3: allow building as
 a host package
In-Reply-To: <20210516010521.1375959-1-christian@paral.in>
References: <20210516010521.1375959-1-christian@paral.in>
Message-ID: <20210518081911.GL2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-05-15 18:05 -0700, Christian Stewart spake thusly:
> Adds 1 patch to fix an install error when building as a host package.
> 
> Patch was submitted upstream:
> https://github.com/libfuse/libfuse/pull/598

Sigh, that's sick...

> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> v1 -> v2:
>  - adjusted patch to completely remove init.d script install

Although I understand the reasoning for the host variant, that means the
target variant will no longer install that init script either.

That init script does two things:

  - load the fuse module if not already done: that's not a problem for
    Buildroot, because lbfuse3.mk enfirces FUSE to be built-in to the
    kernel,

  - mount the fusectl mountpoint: this is not strictly required for most
    usage of FUSE, but will be missing for some.

But this init script is very tailored for classical distros, and does
not fit nicely in our case. Also, there is no corresponding systemd or
openrc unit, so that means the fusectl is not automatically mounted with
BR2_INIT_SYSTEMD=y or BR2_INIT_OPENRC=y already...

So, I think we should just carry this patch. Having an init script, an
openrc, and a systemd unit, that do the fusectl mount, would be nice.

Could you please rework this patch to at least provide the init script,
so that there is no regression (openrc and systemd units can come
separately since they do not currently exist)?

Regards,
Yann E. MORIN.

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...remove-installation-of-init.d-script.patch | 48 +++++++++++++++++++
>  package/libfuse3/libfuse3.mk                  |  7 +++
>  2 files changed, 55 insertions(+)
>  create mode 100644 package/libfuse3/0001-install_helper-remove-installation-of-init.d-script.patch
> 
> diff --git a/package/libfuse3/0001-install_helper-remove-installation-of-init.d-script.patch b/package/libfuse3/0001-install_helper-remove-installation-of-init.d-script.patch
> new file mode 100644
> index 0000000000..5df6f3690c
> --- /dev/null
> +++ b/package/libfuse3/0001-install_helper-remove-installation-of-init.d-script.patch
> @@ -0,0 +1,48 @@
> +From b3d28b5aa5887162847a85738450e8c719ee8523 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Sun, 2 May 2021 19:04:50 -0700
> +Subject: [PATCH] install_helper: remove installation of init.d script
> +
> +Fixes the following build error in Buildroot as a host package:
> +
> +Running custom install script 'install_helper.sh /host/etc /host/bin /host/lib/udev/rules.d false
> ++ sysconfdir=/host/etc
> ++ bindir=/host/bin
> ++ udevrulesdir=/host/lib/udev/rules.d
> ++ useroot=false
> ++ '[' -z '' ']'
> ++ DESTDIR=
> ++ install -D -m 644 /build/host-libfuse3-3.10.3/util/fuse.conf /host/etc/fuse.conf
> ++ false
> ++ install -D -m 644 /build/host-libfuse3-3.10.3/util/udev.rules /host/lib/udev/rules.d/99-fuse3.rules
> ++ install -D -m 755 /build/host-libfuse3-3.10.3/util/init_script /etc/init.d/fuse3
> +install: cannot create regular file '/etc/init.d/fuse3': Permission denied
> +FAILED: install script 'install_helper.sh /host/etc /host/bin /host/lib/udev/rules.d false' exit code 1, stopped
> +FAILED: meson-install
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +
> +diff --git a/util/install_helper.sh b/util/install_helper.sh
> +index cb649a7..f2fa146 100755
> +--- a/util/install_helper.sh
> ++++ b/util/install_helper.sh
> +@@ -38,16 +38,3 @@ fi
> + 
> + install -D -m 644 "${MESON_SOURCE_ROOT}/util/udev.rules" \
> +         "${DESTDIR}${udevrulesdir}/99-fuse3.rules"
> +-
> +-install -D -m 755 "${MESON_SOURCE_ROOT}/util/init_script" \
> +-        "${DESTDIR}/etc/init.d/fuse3"
> +-
> +-
> +-if test -x /usr/sbin/update-rc.d && test -z "${DESTDIR}"; then
> +-    /usr/sbin/update-rc.d fuse3 start 34 S . start 41 0 6 . || /bin/true
> +-else
> +-    echo "== FURTHER ACTION REQUIRED =="
> +-    echo "Make sure that your init system will start the ${DESTDIR}/etc/init.d/fuse3 init script"
> +-fi
> +-
> +-
> +-- 
> +2.31.1
> +
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index d61e313391..b29780dc09 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -10,11 +10,17 @@ LIBFUSE3_LICENSE = LGPL-2.1
>  LIBFUSE3_LICENSE_FILES = LICENSE
>  LIBFUSE3_INSTALL_STAGING = YES
>  LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +
>  LIBFUSE3_CONF_OPTS = \
>  	-Dexamples=false \
>  	-Dudevrulesdir=/lib/udev/rules.d \
>  	-Duseroot=false
>  
> +HOST_LIBFUSE3_CONF_OPTS = \
> +	-Dexamples=false \
> +	-Dudevrulesdir=$(HOST_DIR)/lib/udev/rules.d \
> +	-Duseroot=false
> +
>  define LIBFUSE3_DEVICES
>  	/dev/fuse  c  666  0  0  10  229  0  0  -
>  endef
> @@ -28,3 +34,4 @@ define LIBFUSE3_LINUX_CONFIG_FIXUPS
>  endef
>  
>  $(eval $(meson-package))
> +$(eval $(host-meson-package))
> -- 
> 2.31.1
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
