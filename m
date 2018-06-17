From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 23:01:20 +0200
Subject: [Buildroot] [PATCH 1/1] tor: link with libatomic when needed
In-Reply-To: <20180614182319.19543-1-fontaine.fabrice@gmail.com>
References: <20180614182319.19543-1-fontaine.fabrice@gmail.com>
Message-ID: <20180617230120.1b826654@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jun 2018 20:23:19 +0200, Fabrice Fontaine wrote:
> Following errors might occur on architectures required to use gcc
> libatomics:

"Might occur" is a bit imprecise. Some architectures have atomic
builtins implemented in libatomic, on such architectures, linking with
libatomic is mandatory.

> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index f7af718b9b..fb02741d3a 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -47,6 +47,10 @@ endif
>  # uses gnu extensions
>  TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +TOR_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"

  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
              nonstandard directory <lib dir>
  LIBS        libraries to pass to the linker, e.g. -l<library>

So, using LIBS is more correct than LDFLAGS.

I've adjusted the commit log, and changed LDFLAGS to LIBS, and applied.
Thanks!

However, it would be nicer to have a solution in the upstream configure
script for this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
