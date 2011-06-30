From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jun 2011 09:18:16 +0200
Subject: [Buildroot] [PATCH] new package: ngrep
In-Reply-To: <20110630011839.GA9732@berrier.lan>
References: <20110630011839.GA9732@berrier.lan>
Message-ID: <20110630091816.28dc97a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Wade,

Thanks for this patch. A few comments below.

Le Wed, 29 Jun 2011 19:18:42 -0600,
Wade Berrier <wberrier@gmail.com> a ?crit :

> diff --git a/package/ngrep/ngrep-1.45-make-objs.patch b/package/ngrep/ngrep-1.45-make-objs.patch
> new file mode 100644
> index 0000000..cf316d5
> --- /dev/null
> +++ b/package/ngrep/ngrep-1.45-make-objs.patch

All patches applied to packages should have a header with a description
detailing what the patch is doing/fixing + a Signed-off-by line.

> diff --git a/package/ngrep/ngrep-1.45-pcre-header.patch b/package/ngrep/ngrep-1.45-pcre-header.patch
> new file mode 100644
> index 0000000..3c878fb
> --- /dev/null
> +++ b/package/ngrep/ngrep-1.45-pcre-header.patch

Same here.

> +NGREP_VERSION:=1.45
> +NGREP_SOURCE:=ngrep-$(NGREP_VERSION).tar.bz2
> +NGREP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ngrep/ngrep/$(NGREP_VERSION)

We mostly don't use := but simply = for variable definitions in
packages.

> +# no install-strip/install-exec
> +NGREP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" install

Not needed, this is now the default in current versions of Buildroot.

> +NGREP_CONF_ENV:=LDFLAGS="-lpcre"

This will override the initial value LDFLAGS="$(TARGET_LDFLAGS)". Is it
really needed ? If the configure script detects pcre, then it should
already append -lpcre.

> +$(NGREP_HOOK_POST_INSTALL): $(NGREP_TARGET_INSTALL_TARGET)
> +	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/ngrep
> +	touch $@

This is no longer a valid way of writing post install hooks, and
moreover, stripping the binaries is no longer needed, as this is
already done globally. You can simply remove those three lines.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
