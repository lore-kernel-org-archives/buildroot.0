From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 3 Nov 2019 07:55:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: add systemd dependency
In-Reply-To: <20191103060743.107052-1-james.hilliard1@gmail.com>
References: <20191103060743.107052-1-james.hilliard1@gmail.com>
Message-ID: <20191103065533.GA31542@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

> This is needed to ensure systemd services are installed.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/iputils/iputils.mk | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 57e90a973a..daceb192f2 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -49,6 +49,10 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
>  IPUTILS_NINFOD = n
>  endif

> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +IPUTILS_DEPENDENCIES += systemd
> +endif
I'm trying to debug it with ./utils/test-pkg and it still does not install it.

It looks to me that other packages which defines dependency on systemd are doing
it to pass some sort of --enable-systemd like flags.
But maybe I (again) miss something.

I tried to fix it in [1] (part of [2]), but adding prefix to
systemd.get_pkgconfig_variable('systemdsystemunitdir') is probably wrong:
NetworkManager does not need that and I guess it's cross compilation works
under buildroot. On the other hand running both builds locally with
prefix /tmp/network-manager shows prefix used for systemdunitdir in autotools,
but not in systemdunitdir.
I need to check meson sources, it looks to me as a bug (it should use prefix as
it does for other directories).

AUTOTOOLS
System paths:
  prefix: /tmp/network-manager
  exec_prefix: ${prefix}
  sysconfdir: ${prefix}/etc
  localstatedir: ${prefix}/var
  runstatedir: ${localstatedir}/run
  datadir: ${datarootdir}
  systemdunitdir: $(prefix)/lib/systemd/system
  nmbinary: ${sbindir}/NetworkManager
  nmconfdir: ${sysconfdir}/NetworkManager
  nmlibdir: ${prefix}/lib/NetworkManager
  nmdatadir: ${datadir}/NetworkManager
  nmstatedir: ${localstatedir}/lib/NetworkManager
  nmrundir: ${runstatedir}/NetworkManager

MESON
System paths:
  prefix: /tmp/network-manager
  exec_prefix: /tmp/network-manager
  systemdunitdir: /lib/systemd/system
  nmbinary: /tmp/network-manager/sbin/NetworkManager
  nmconfdir: /tmp/network-manager/etc/NetworkManager
  nmlibdir: /tmp/network-manager/lib/NetworkManager
  nmdatadir: /tmp/network-manager/share/NetworkManager
  nmstatedir: /tmp/network-manager/var/lib/NetworkManager
  nmrundir: /tmp/network-manager/var/run/NetworkManager
  nmvpndir: /tmp/network-manager/lib/x86_64-linux-gnu/NetworkManager
  nmplugindir: /tmp/network-manager/lib/x86_64-linux-gnu/NetworkManager/1.21.1

Kind regards,
Petr

[1] https://github.com/iputils/iputils/pull/226/commits/6a585f96d638ae855ecd74180b4503e2ea45572d
[2] https://github.com/iputils/iputils/pull/226
> +
>  # ninfod requires <pthread.h>
>  ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  IPUTILS_NINFOD = n
