From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Nov 2010 14:38:39 +0100
Subject: [Buildroot] [PATCH 02/12] rsync: drop special case now managed
 in Makefile.package.in
In-Reply-To: <1288839031-24277-3-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <20101104143839.10843e5f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Nov 2010 03:50:21 +0100
llandwerlin at gmail.com wrote:

> -RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)

As far as I can see, passing --{enable,disable}-debug is not handled by
the autotools infrastructure. Maybe those are not needed, but this
change is not transparent.

> -ifeq ($(BR2_ENABLE_DEBUG),y)
> -RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
> -			  install
> -else
> -RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
> -			  STRIPPROG="$(TARGET_STRIP)" install-strip
> -endif
> +
> +RSYNC_MAKE_ENV = STRIPPROG="$(STRIPCMD)"

The autotools infrastructure no longer uses the "install-strip" target.
So is this still useful ?

Other question: the autotools infrastructure does not pass INSTALLCMD.
If it's really needed by this package, then this patch will break the
package.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
