From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 19:28:53 +0100
Subject: [Buildroot] [PATCH] e2tools: new package
In-Reply-To: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20131128192853.0f712476@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Nystr?m,

Thanks for this contribution!

On Thu, 28 Nov 2013 19:02:44 +0100, Daniel Nystr?m wrote:
> diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
> new file mode 100644
> index 0000000..14f25ab
> --- /dev/null
> +++ b/package/e2tools/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_E2TOOLS
> +	bool "e2tools"
> +	select BR2_PACKAGE_E2FSPROGS

You need to propagate the e2fsprogs dependency here.

> +	help
> +	  E2tools is a simple set of GPL'ed utilities to read, write,
> +	  and manipulate files in an ext2/ext3 filesystem.  These
> +	  utilities access a filesystem directly using the ext2fs
> +	  library.
> +
> +	  https://github.com/ndim/e2tools

and add a comment here.

> diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
> new file mode 100644
> index 0000000..56797bb
> --- /dev/null
> +++ b/package/e2tools/e2tools.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# e2tools
> +#
> +################################################################################
> +
> +E2TOOLS_VERSION = 3158ef18
> +E2TOOLS_SITE = http://github.com/ndim/e2tools/tarball/$(E2TOOLS_VERSION)
> +E2TOOLS_AUTORECONF = YES
> +E2TOOLS_LICENSE = GPLv2

The code isn't really clear as to whether it is GPLv2 or GPLv2+. The
COPYING file is the text of GPLv2, but the comment headers in the code
don't explicit whether it's GPLv2 only, or GPLv2+. I guess in a case
like this, we should assume it's GPLv2, as you did.

> +E2TOOLS_LICENSE_FILES = COPYING
> +E2TOOLS_DEPENDENCIES = e2fsprogs
> +E2TOOLS_CONF_ENV = LIBS="-lpthread"

So you need a dependency on BR2_TOOLCHAIN_HAS_THREADS as well.

> +E2TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec

I know (from IRC discussion) you used this instead of the default "make
install" to not install man pages. But that's not needed: provided
BR2_HAVE_DOCUMENTATION is disabled (which is almost always the case
since this option is deprecated), then Buildroot automatically removes
man pages. So unless using "make install" causes a problem, we'd prefer
to not use a specific <pkg>_INSTALL_TARGET_OPT, and let Buildroot
remove the man pages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
