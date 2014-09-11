From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 11:26:14 +0200
Subject: [Buildroot] [PATCH 1/1] ipmitool: new package
In-Reply-To: <1410421465-9788-1-git-send-email-david.bachelart@bbright.com>
References: <1410421465-9788-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140911112614.0996937a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Thu, 11 Sep 2014 09:44:25 +0200, David Bachelart wrote:

> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> new file mode 100644
> index 0000000..c456a61
> --- /dev/null
> +++ b/package/ipmitool/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_IPMITOOL
> +  bool "ipmitool"
> +  help

Indentation should be one tab here.

> +    IPMItool provides a simple command-line interface to IPMI-enabled devices
> +    through an IPMIv1.5 or IPMIv2.0 LAN interface or Linux/Solaris kernel 
> +    driver.
> +
> +    http://ipmitool.sourceforge.net/

And one tab + two spaces for the help text. See
http://buildroot.org/downloads/manual/manual.html#writing-rules-config-in.


> +IPMITOOL_VERSION = 1.8.14
> +IPMITOOL_SITE = http://sourceforge.net/projects/ipmitool/files/ipmitool/$(IPMITOOL_VERSION)
> +IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
> +
> +IPMITOOL_LICENSE = GPL2+

Did you look into the COPYING file? It's clearly not a GPL license. It
looks more like a MIT license, but not sure.

> +IPMITOOL_LICENSE_FILES = COPYING
> +
> +IPMITOOL_CONF_OPTS = --enable-ipmishell
> +
> +$(eval $(autotools-package))

Also, could you quickly check if your package builds fine with the
following toolchain configurations:

 * http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
 * http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config
 * http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config 
 * http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config

The first will check a basic uClibc configuration, to ensure your
package does not depend on features like wide-char, RPC, locales, etc.

The second will check if your package can build on noMMU platforms.

The third will check if your package can build on platforms that don't
support shared libraries.

The fourth will check if your package can build on platforms built
without thread support.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
