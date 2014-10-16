From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 18:56:11 +0200
Subject: [Buildroot] [PATCH v2 1/2] pps-tools: new package
In-Reply-To: <1413477888-58099-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413477888-58099-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20141016185611.07a3d880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 16 Oct 2014 11:44:47 -0500, Matt Weber wrote:

> diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
> new file mode 100644
> index 0000000..a77869a
> --- /dev/null
> +++ b/package/pps-tools/pps-tools.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# pps-tools
> +#
> +################################################################################
> +
> +PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
> +PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
> +PPS_TOOLS_INSTALL_STAGING = YES
> +PPS_TOOLS_LICENSE = GPLv2+
> +PPS_TOOLS_LICENSE_FILES = COPYING
> +
> +define PPS_TOOLS_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all

We more commonly pass $(TARGET_CONFIGURE_OPTS) on the right hand side
of $(MAKE), and pass $(TARGET_MAKE_ENV) in the environment, i.e on the
left hand-side of $(MAKE).

> +endef
> +
> +define PPS_TOOLS_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/sys $(STAGING_DIR)/usr/bin
> +	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install

Not using $(TARGET_CONFIGURE_OPTS) here but you're using it in the
target installation command. Either it's needed or not, but it should
be the same for both cases.

Using $(TARGET_MAKE_ENV) is also recommended. Sorry I forgot to spot
this in my earlier review.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
