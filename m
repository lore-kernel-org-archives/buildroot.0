From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:46:15 +0200
Subject: [Buildroot] [PATCH 10/10] busybox: add support for SELinux
In-Reply-To: <1378429464-12546-11-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-11-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908184615.541943eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:24 -0500, Ryan Barnett wrote:

> diff --git a/package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch b/package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch
> new file mode 100644
> index 0000000..79b8681
> --- /dev/null
> +++ b/package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch
> @@ -0,0 +1,13 @@
> +# Need to have the pkg-config only spit out the libs and not the lib path
> +# also when checking for the SELinux libraries.

Please follow the style at
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
to format a patch description and Signed-off-by.

However, it is unclear to me why this change is needed. Which library
paths returned by pkg-config are causing problems?

Also, host-pkgconf is not part of the Busybox dependencies, so it looks
wrong for Busybox to use it without declaring it as a dependency. That
said, for the normal Busybox build, I don't think we want Busybox to
depend on host-pkgconf. After reading the Busybox source code, it is
apparently only used when SELinux support is requested, so just add
host-pkgconf to the busybox dependencies when SELinux support is
enabled.

> +# For SELinux, enable the SELinux flag CONFIG_SELINUX
> +# in the busybox config
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +BUSYBOX_DEPENDENCIES += libselinux

i.e here.

> +endif

Also, shouldn't you be enabling SELinux support in Busybox here, i.e
setting CONFIG_SELINUX=y in the Busybox configuration? See the usage of
the KCONFIG_ENABLE_OPT and KCONFIG_DISABLE_OPT in busybox.mk.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
