From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Nov 2011 21:28:15 +0100
Subject: [Buildroot] [PATCH] mingetty: add package
In-Reply-To: <1322082860-12704-1-git-send-email-twoerner@gmail.com> (Trevor
 Woerner's message of "Wed, 23 Nov 2011 16:14:20 -0500")
References: <1322082860-12704-1-git-send-email-twoerner@gmail.com>
Message-ID: <87ipm6iq74.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:

 Trevor> ---
 Trevor>  package/Config.in            |    1 +
 Trevor>  package/mingetty/Config.in   |    7 +++++++
 Trevor>  package/mingetty/inittab     |   32 ++++++++++++++++++++++++++++++++
 Trevor>  package/mingetty/mingetty.mk |   28 ++++++++++++++++++++++++++++
 Trevor>  target/generic/Makefile.in   |    9 ++++++++-
 Trevor>  5 files changed, 76 insertions(+), 1 deletions(-)
 Trevor>  create mode 100644 package/mingetty/Config.in
 Trevor>  create mode 100644 package/mingetty/inittab
 Trevor>  create mode 100644 package/mingetty/mingetty.mk

 Trevor> +++ b/package/mingetty/mingetty.mk
 Trevor> @@ -0,0 +1,28 @@
 Trevor> +#############################################################
 Trevor> +#
 Trevor> +# mingetty
 Trevor> +#
 Trevor> +#############################################################
 Trevor> +MINGETTY_VERSION = 1.08
 Trevor> +MINGETTY_SOURCE  = mingetty-$(MINGETTY_VERSION).tar.gz
 Trevor> +MINGETTY_SITE    = http://downloads.sourceforge.net/project/mingetty/mingetty/$(MINGETTY_VERSION)

Use the mirror support we have, E.G.

http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mingetty

 Trevor> +
 Trevor> +# Override sysvinit's implementations if it is enabled.

sysvinit doesn't contain a getty implementation. What you mean is that
you want to run after sysvinit so it doesn't overwrite your inittab.

 Trevor> +ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 Trevor> +MINGETTY_DEPENDENCIES = sysvinit
 Trevor> +endif
 Trevor> +
 Trevor> +define MINGETTY_BUILD_CMDS
 Trevor> +	$(MAKE) CC=$(TARGET_CC) -C $(@D)
 Trevor> +endef
 Trevor> +
 Trevor> +define MINGETTY_INSTALL_TARGET_CMDS
 Trevor> +	$(INSTALL) -D -m 0755 $(@D)/mingetty $(TARGET_DIR)/sbin
 Trevor> +	$(INSTALL) -D -m 0644 package/mingetty/inittab $(TARGET_DIR)/etc/inittab

Please don't do that. People might have a custom inittab (I know
sysvinit does so as well, but as the syntax is different than busybox's
there isn't really much else it can do).

The nicest thing would be instead to replace /sbin/getty with
/sbin/mingetty in the existing inittab, but as mingetty doesn't handle
the same arguments as busybox getty, this gets quite tricky.

Perhaps the best would just do nothing and let people tweak their
inittab themselves if they want.

 Trevor> diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
 Trevor> index 4185202..5ce1447 100644
 Trevor> --- a/target/generic/Makefile.in
 Trevor> +++ b/target/generic/Makefile.in

And drop this.

-- 
Bye, Peter Korsgaard
