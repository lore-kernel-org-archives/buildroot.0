From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 11:24:21 +0200
Subject: [Buildroot] [PATCH 1/2] pps-tools: new package
In-Reply-To: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20141016112421.09891a19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed, 15 Oct 2014 15:37:54 -0500, Matt Weber wrote:

> diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
> new file mode 100644
> index 0000000..4ebfb1e
> --- /dev/null
> +++ b/package/pps-tools/pps-tools.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# pps-tools
> +#
> +################################################################################

One empty new line needed here.

> +PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
> +PPS_TOOLS_SITE = https://github.com/ago/pps-tools.git
> +PPS_TOOLS_SITE_METHOD = git
> +PPS_TOOLS_INSTALL_STAGING = YES
> +PPS_TOOLS_LICENSE = GPLv2

License is GPLv2+.

> +PPS_TOOLS_LICENSE_FILES = COPYING
> +
> +define PPS_TOOLS_BUILD_CMDS
> +	$(MAKE) CC=$(TARGET_CC) -C $(@D) all

Use $(TARGET_CONFIGURE_OPTS) instead of CC=$(TARGET_CC), so that CFLAGS
and al. are also passed.

> +endef
> +
> +define PPS_TOOLS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/timepps.h $(STAGING_DIR)/usr/include/timepps.h
> +endef
> +
> +define PPS_TOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/ppsctl $(TARGET_DIR)/usr/bin/ppsctl
> +	$(INSTALL) -D -m 0755 $(@D)/ppsfind $(TARGET_DIR)/usr/bin/ppsfind
> +	$(INSTALL) -D -m 0755 $(@D)/ppstest $(TARGET_DIR)/usr/bin/ppstest
> +	$(INSTALL) -D -m 0755 $(@D)/ppswatch $(TARGET_DIR)/usr/bin/ppswatch
> +endef

Use the "make install" target of the pps-tools Makefile instead. There
is just one issue with it in that it doesn't create the destination
directories where it copies the header file and the executable. Fix
this either by adding a patch (which should be submitted upstream),
or doing something like:

	mkdir -p $(TARGET_DIR)/usr/include/sys $(TARGET_DIR)/usr/bin

before doing the make install. And ditto for the staging installation,
of course.

We prefer to use the package built-in "make install" logic so that if
we bump the package version later, we won't forget to install other new
things that the package should now install.

Other than that, I've built-tested your patch with a minimal ARM
configuration, and it worked fine.

Can you fix those issues and resubmit?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
