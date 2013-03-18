From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 10:43:10 +0100
Subject: [Buildroot] [PATCH 4/5] flite: new package
In-Reply-To: <87vc8p3dfs.fsf@dell.be.48ers.dk>
References: <cover.1363063832.git.s.martin49@gmail.com>
 <cover.1363063832.git.s.martin49@gmail.com>
 <359a800fb351cc1d10532e184d9dc7d30c5cd991.1363063832.git.s.martin49@gmail.com>
 <87vc8p3dfs.fsf@dell.be.48ers.dk>
Message-ID: <20130318104310.718e14d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 17 Mar 2013 22:48:39 +0100, Peter Korsgaard wrote:

>  Samuel> +FLITE_CONF_OPT = \
>  Samuel> +	$(if $(BR2_PREFER_STATIC_LIB),,--enable-shared)
> 
> We're already pass --enable-shared in the autotools infrastructure, so
> why is this needed?

I've tested without this part, and the package builds fine, so I'm
also not sure why it's needed.

>  Samuel> +
>  Samuel> +FLITE_INSTALL_STAGING_OPT = \
>  Samuel> +	INSTALLBINDIR=$(STAGING_DIR)/usr/bin \
>  Samuel> +	INSTALLLIBDIR=$(STAGING_DIR)/usr/lib \
>  Samuel> +	INSTALLINCDIR=$(STAGING_DIR)/usr/include/flite \
>  Samuel> +	install
>  Samuel> +
>  Samuel> +FLITE_INSTALL_TARGET_OPT = \
>  Samuel> +	INSTALLBINDIR=$(TARGET_DIR)/usr/bin \
>  Samuel> +	INSTALLLIBDIR=$(TARGET_DIR)/usr/lib \
>  Samuel> +	INSTALLINCDIR=$(TARGET_DIR)/usr/include/flite \
>  Samuel> +	install
> 
> It could be good with a note about why this is needed (E.G. flite
> used a handwritten a Makefile which doesn't handle DESTDIR even
> though it uses autoconf).

Another option is to add a patch like:

Index: b/config/config.in
===================================================================
--- a/config/config.in
+++ b/config/config.in
@@ -49,6 +49,6 @@
 prefix        = @prefix@
 exec_prefix   = @exec_prefix@
 EXEEXT	      = @EXEEXT@
-INSTALLBINDIR = @bindir@
-INSTALLLIBDIR = @libdir@
-INSTALLINCDIR = @includedir@/flite
+INSTALLBINDIR = $(DESTDIR)@bindir@
+INSTALLLIBDIR = $(DESTDIR)@libdir@
+INSTALLINCDIR = $(DESTDIR)@includedir@/flite

That said, the project hasn't done any release since 2009, so the
chances of getting this upstream are pretty small...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
