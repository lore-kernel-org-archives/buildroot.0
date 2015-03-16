From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:33:56 +0100
Subject: [Buildroot] [PATCH 1/1] dvdrw-tools: new package
In-Reply-To: <1426523511-32711-1-git-send-email-skenton@ou.edu>
References: <1426523511-32711-1-git-send-email-skenton@ou.edu>
Message-ID: <20150316193356.740e8a92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Mon, 16 Mar 2015 11:31:50 -0500, Steve Kenton wrote:
> The dvd+rw-tools are used to master Blu-ray Disc
> and DVD Disc media, both +RW/+R and -RW/-R. Note
> the +RW in the name is a historical artifact. This
> package contains the widely used growisofs program.
> 
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
> Thank you for all your kind feedback. I have made
> all the changes you suggested. I even understood
> most of them :-) so I guess I'm learning how to
> fish. I also removed the LARGEFILE references to
> mirror the changes going into tip. 

Why? Largefile support has not been changed so far. Don't confuse
patches that have been sent to the list with patches that have been
merged.

> However, the line:
> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> is still monkey see, monkey copy/paste so treat accordingly

Well, do a build for ARM, and make sure the executable files produced
by dvdrw-tools are properly built for ARM.

> diff --git a/package/dvdrw-tools/0001-limits.h.patch b/package/dvdrw-tools/0001-limits.h.patch
> new file mode 100644
> index 0000000..a5c7484
> --- /dev/null
> +++ b/package/dvdrw-tools/0001-limits.h.patch

This patch still needs a description + Signed-off-by line. See my
previous review.


> diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
> new file mode 100644
> index 0000000..dc69b96
> --- /dev/null
> +++ b/package/dvdrw-tools/dvdrw-tools.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# dvdrw-tools
> +#
> +################################################################################
> +
> +DVDRW_TOOLS_VERSION = 7.1
> +DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
> +DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
> +DVDRW_TOOLS_LICENSE = GPLv2
> +DVDRW_TOOLS_LICENSE_FILES = LICENSE
> +
> +define DVDRW_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
> +	DVDRW_TOOLS_BACKEND = genisoimage

Nitpick: don't indent.

> +else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
> +	DVDRW_TOOLS_BACKEND = xorrisofs

Ditto.

> +endif
> +
> +define DVDRW_TOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
> +	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
> +	ln -s -f /usr/bin/$(DVDRW_TOOLS_BACKEND) $(TARGET_DIR)/usr/bin/mkisofs
> +endef
> +
> +$(eval $(generic-package))

So besides the largefile stuff, and the missing patch description, I
think we're almost good to go.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
