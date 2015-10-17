From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 22:18:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/bitstream: new package
In-Reply-To: <1445003680-26003-1-git-send-email-julian@jusst.de>
References: <1445003680-26003-1-git-send-email-julian@jusst.de>
Message-ID: <20151017201841.GB32247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julain, All,

On 2015-10-16 15:54 +0200, Julian Scheel spake thusly:
> BiTStream is a set of headers to ease processing of mpeg ts streams. It is
> used by dvblast.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>

Thanks for this new package. :-)

It is pretty good, but there are a few minor hickups to fix, see
below...

[--SNIP--]
> diff --git a/package/bitstream/Config.in b/package/bitstream/Config.in
> new file mode 100644
> index 0000000..3a7ad43
> --- /dev/null
> +++ b/package/bitstream/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_BITSTREAM
> +	bool "biTStream"

We write package names only in lower-case, even in the prompts.

> +	help
> +	  biTStream is a set of C headers allowing a simpler access to
> +	  binary structures such as specified by MPEG, DVB, IETF, SMPTE,
> +	  IEEE, SCTE, etc.
> +
> +	  http://www.videolan.org/developers/bitstream.html
> diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
> new file mode 100644
> index 0000000..cdca80f
> --- /dev/null
> +++ b/package/bitstream/bitstream.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# biTStream
> +#
> +################################################################################
> +
> +BITSTREAM_VERSION = 1.1
> +BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
> +BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
> +BITSTREAM_LICENSE = MIT
> +
> +BITSTREAM_INSTALL_STAGING = YES
> +BITSTREAM_INSTALL_TARGET = NO

Even though it seems obvious from the help text, you should also state
here why it is only installed in staging and not intargetm, like so:

    # Only installs headers files:
    BITSTREAM_INSTALL_STAGING = YES
    BITSTREAM_INSTALL_TARGET = NO

> +define BITSTREAM_INSTALL_STAGING_CMDS
> +	(cd $(@D); $(MAKE) PREFIX=$(STAGING_DIR)/usr install)

Even if this is working, the proper solution is to pass DESTDIR and
PREFIX, like so:

    $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install

Also note the little trick to avoid 'cd' ;-)

Care to fix and resend, please? Thanks! :-)

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
