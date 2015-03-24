From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Mar 2015 23:20:44 +0200
Subject: [Buildroot] [PATCH v4] lirc-tools: new package
In-Reply-To: <1427229288-13440-1-git-send-email-github@wilberforce.co.nz>
References: <1427229288-13440-1-git-send-email-github@wilberforce.co.nz>
Message-ID: <20150324212044.GS2825@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rhys,

On Wed, Mar 25, 2015 at 09:34:48AM +1300, Rhys Williams wrote:
> This package adds the userspace tools and daemons LIRC -
> Linux remote control
> 
> Signed-off-by: Rhys Williams <github@wilberforce.co.nz>

Looks good now. I only have a few comments below. Other than that,

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

[...]

> diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
> new file mode 100644
> index 0000000..f29724b
> --- /dev/null
> +++ b/package/lirc-tools/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_LIRC_TOOLS
> +	bool "lirc-tools"
> +	help
> +	  Linux Infrared Remote Control IR receiver/transmitter Daemon and tools
> +	  LIRC is a package that supports receiving and sending IR
> +	  signals of the most common IR remote controls. It contains a
> +	  daemon that decodes and sends IR signals, a mouse daemon
> +	  that translates IR signals to mouse movements and a couple
> +	  of user programs that allow to control your computer with a
> +	  remote control.
> +          
> +	  lircd, irw, irrecord, mode2 etc
> +	  
> +	  http://www.lirc.org/
> +	 
> +	  Requires the kernel LIRC interface driver , add modules to support
> +	  your hardware.

The homepage link should appear last in the help text.

[...]

> diff --git a/package/lirc-tools/lirc-tools.hash 
> b/package/lirc-tools/lirc-tools.hash
> new file mode 100644
> index 0000000..3986767
> --- /dev/null
> +++ b/package/lirc-tools/lirc-tools.hash
> @@ -0,0 +1,2 @@
> +#hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.2/
> +sha1 585daed1eaa169b9683a507e26b1331a947a4dcd lirc-0.9.2.tar.bz2
> diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
> new file mode 100644
> index 0000000..44e1848
> --- /dev/null
> +++ b/package/lirc-tools/lirc-tools.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# lirc-tools
> +#
> +################################################################################
> +
> +LIRC_TOOLS_VERSION = 0.9.2
> +LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
> +LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
> +LIRC_TOOLS_LICENSE = GPLv2

Source files carrying the copyright notice include the "or any later version" 
language. So this should be GPLv2+.

> +LIRC_TOOLS_LICENSE_FILES = COPYING
> +
> +LIRC_TOOLS_CONF_OPTS = --without-x --enable-sandboxed --with-driver=userspace
> +
> +define LIRC_TOOLS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd $(TARGET_DIR)/etc/init.d/
> +endef
> +
> +$(eval $(autotools-package))

Thanks for your persistence.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
