From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 22:41:11 +0200
Subject: [Buildroot] [PATCH 2/2] dvblast: new package
In-Reply-To: <1445003680-26003-2-git-send-email-julian@jusst.de>
References: <1445003680-26003-1-git-send-email-julian@jusst.de>
 <1445003680-26003-2-git-send-email-julian@jusst.de>
Message-ID: <20151017204111.GC32247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julain, All,

On 2015-10-16 15:54 +0200, Julian Scheel spake thusly:
> DVBlast is a simple and powerful MPEG-2/TS demux and streaming application.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>

See below for a few comments...

[--SNIP--]
> diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
> new file mode 100644
> index 0000000..769d86f
> --- /dev/null
> +++ b/package/dvblast/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_DVBLAST
> +	bool "dvblast"
> +	select BR2_PACKAGE_BITSTREAM
> +	select BR2_PACKAGE_LIBEV

libev us not available for the Blackfin architecture, so you need to
propagate its dependencies to dvblast, like so:

    depends on !BR2_bfin  # libev

The comment helps understand that the dependency is inherited from libev
(so we find it more easily if we one day update to a libev without that
dependency).

> +	help
> +	  DVBlast is a simple and powerful MPEG-2/TS demux and streaming
> +	  application.
> +
> +	  http://www.videolan.org/projects/dvblast.html
> diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
> new file mode 100644
> index 0000000..bcf3c69
> --- /dev/null
> +++ b/package/dvblast/dvblast.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# dvblast
> +#
> +################################################################################
> +
> +DVBLAST_VERSION = 3.0
> +DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
> +DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
> +DVBLAST_LICENSE = GPLv2

It's actually a bit more complex than that:

  - most of the code is "GPLv2 or later", so you need to indicate that
    as: GPLv2+;

  - parts of the code is under the WTFPL, so you also need to indicate
    it;

  - you must also define the license files.

    DVBLAST_LICENSE = GPLv2+, WTFPL
    DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL

> +DVBLAST_DEPENDENCIES = bitstream libev
> +
> +DVBLAST_INSTALL_STAGING = NO

INSTALL_STAGING = NO is the default, so you do not need to specify it.

> +DVBLAST_INSTALL_TARGET = YES
> +
> +define DVBLAST_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

You may want to use TARGET_CONFIGURE_OPTS instead; 'all' is the first
rule, so is the default rule, so you need not specify it either:

    $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)

> +endef
> +
> +define DVBLAST_INSTALL_TARGET_CMDS
> +	(cd $(@D); $(MAKE) PREFIX=$(TARGET_DIR)/usr install)

Same as for bitstream, you should use DESTDIR and PREFIX.

Care to fix and resend, please?  Thanks! ;-)

In the meantime, I've marked both patches as "changes requested" on our
patch tracking system.

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.6.0
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
