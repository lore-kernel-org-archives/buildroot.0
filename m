From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 6 Nov 2014 13:00:51 -0500
Subject: [Buildroot] [PATCH 7/7] ifupdown: new package
In-Reply-To: <1415281013-1077-8-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <1415281013-1077-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CANxTyt70pdEdK30LwV47SDLOqsmR7xiGQPBa+z8gr4izwaZVwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo

On Thu, Nov 6, 2014 at 8:36 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in              |  3 +++
>  package/ifupdown/Config.in     | 11 +++++++++++
>  package/ifupdown/ifupdown.hash |  2 ++
>  package/ifupdown/ifupdown.mk   | 28 ++++++++++++++++++++++++++++
>  4 files changed, 44 insertions(+)
>  create mode 100644 package/ifupdown/Config.in
>  create mode 100644 package/ifupdown/ifupdown.hash
>  create mode 100644 package/ifupdown/ifupdown.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 278134d..8f3cc3c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1014,6 +1014,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/ifplugd/Config.in"
>  endif
>         source "package/iftop/Config.in"
> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +       source "package/ifupdown/Config.in"
> +endif
>         source "package/igh-ethercat/Config.in"
>         source "package/igmpproxy/Config.in"
>         source "package/inadyn/Config.in"
> diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
> new file mode 100644
> index 0000000..ab552e0
> --- /dev/null
> +++ b/package/ifupdown/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_IFUPDOWN
> +       bool "ifupdown"
> +       depends on BR2_USE_MMU # fork()
> +       # runtime for ip binary
> +       select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
> +       # runtime for run-parts
> +       select BR2_PACKAGE_DEBIANUTILS if !BR2_PACKAGE_BUSYBOX
> +       help
> +         High level tools to configure network interfaces.
> +
> +         https://tracker.debian.org/pkg/ifupdown
> diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
> new file mode 100644
> index 0000000..f0c314b
> --- /dev/null
> +++ b/package/ifupdown/ifupdown.hash
> @@ -0,0 +1,2 @@
> +# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.7.49.dsc
> +sha256 5d07c73610ff90393c7273e2af9003eeb1825fc88144ae5ed11a5517547d0f58        ifupdown_0.7.49.tar.xz
> diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
> new file mode 100644
> index 0000000..3b50d67
> --- /dev/null
> +++ b/package/ifupdown/ifupdown.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# ifupdown
> +#
> +################################################################################
> +
> +IFUPDOWN_VERSION = 0.7.49
> +IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
> +IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20140923T221921Z/pool/main/i/ifupdown
> +IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +IFUPDOWN_LICENSE = GPLv2+
> +IFUPDOWN_LICENSE_FILES = COPYING
> +
> +define IFUPDOWN_BUILD_CMDS
> +       $(MAKE) CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
> +               CFLAGS="$(TARGET_CFLAGS) -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
> +               -C $(@D)
> +endef
> +
> +define IFUPDOWN_INSTALL_TARGET_CMDS
> +       $(INSTALL) -m 0755 $(@D)/ifup $(TARGET_DIR)/sbin/ifup

No -D?

> +       $(INSTALL) -m 0755 -D $(@D)/settle-dad.sh \
> +               $(TARGET_DIR)/lib/ifupdown/settle-dad.sh
> +       ln -sf ifup $(TARGET_DIR)/sbin/ifdown
> +       ln -sf ifup $(TARGET_DIR)/sbin/ifquery
> +endef

If you patched Makefile's "ln: commands to have -f, then this would be
equivalent to:

define IFUPDOWN_INSTALL_TARGET_CMDS
$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) BASEDIR=$(TARGET_DIR) install
endef

Which might be more immune to changes in created files?

Just as an FYI .... I made an ifupdown.mk myself about six months ago,
but ended up not needing it.  Compared to what you have here, I had
done some extra stuff for compatibility with BusyBox ifupdown:

- In CFLAGS in BUILD_CMDS, I added:  -D'RUN_DIR="\"/var/run/\""'
- In inet.defn, I replaced all the "/run" with "/var/run"
- In main.c, I added "-f" option - ifupdown currently only accepts "--force"
- in execute.c, I dropped the "--verbose" from run-parts

But perhaps BusyBox compatibility is not a goal here ...

Danomi -


> +
> +$(eval $(generic-package))
> --
> 2.0.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
