From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2011 23:22:28 +0200
Subject: [Buildroot] [PATCH] new package: ngrep
In-Reply-To: <20110906190842.GA29907@berrier.lan>
References: <20110906190842.GA29907@berrier.lan>
Message-ID: <20110906232228.09821bf0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

Le Tue, 6 Sep 2011 13:08:46 -0600,
Wade Berrier <wberrier@gmail.com> a ?crit :

> Here's a nice lightweight alternative to tcpdump (not as feature full, but smaller)
> 
> Wade

This part of your message will be kept in the commit log. So it
shouldn't be formulated this way. Just keep the subject "[PATCH] new
package: ngrep" and just be your Signed-off-by line below.

> diff --git a/package/ngrep/ngrep-1.45-make-objs.patch b/package/ngrep/ngrep-1.45-make-objs.patch
> new file mode 100644
> index 0000000..cf316d5
> --- /dev/null
> +++ b/package/ngrep/ngrep-1.45-make-objs.patch
> @@ -0,0 +1,19 @@

Each patch must start with a description of what it does, and a
Signed-off-by line.

> +++ b/package/ngrep/ngrep-1.45-pcre-header.patch
> @@ -0,0 +1,12 @@

Same here.

> +++ b/package/ngrep/ngrep.mk

This must come from a very old version of Buildroot. Can you check the
current Buildroot documentation?

See comments below.

> @@ -0,0 +1,29 @@
> +#############################################################
> +#
> +# ngrep
> +#
> +#############################################################
> +
> +NGREP_VERSION:=1.45

Please use '=' instead of ':='.

> +NGREP_SOURCE:=ngrep-$(NGREP_VERSION).tar.bz2
> +NGREP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ngrep/ngrep/$(NGREP_VERSION)
> +# no install-strip/install-exec
> +NGREP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" install

Not needed anymore, the 'install' target is always used.

> +NGREP_DEPENDENCIES:=libpcap pcre
> +
> +$(eval $(call AUTOTARGETS,package,ngrep))
> +
> +$(NGREP_HOOK_POST_INSTALL): $(NGREP_TARGET_INSTALL_TARGET)
> +	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/ngrep
> +	touch $@

Please remove this post install hook:
 1) it is no longer the right way of writing post install hooks
 2) stripping in each package is no longer needed, it is done globally
    by the Buildroot infrastructure

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
