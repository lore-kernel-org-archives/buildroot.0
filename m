From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Mon, 27 Oct 2008 07:59:27 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/libogg
	audio/libvorbis docker edit etc...
In-Reply-To: <87r663f91t.fsf@macbook.be.48ers.dk>
References: <20081026061944.0F6DE3C2B3@busybox.net>
	<200810261437.05446.markus.heidelberg@web.de>
	<87r663f91t.fsf@macbook.be.48ers.dk>
Message-ID: <200810270759.28374.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 26.10.2008:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
> Hi,
> 
>  >> -					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
>  >> -					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
>  >> -					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>  >> +					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
> 
>  Markus> I think this will break docker, because MAKE_OPT is affected,
>  Markus> not CONF_OPT.  And I just noticed that docker doesn't use
>  Markus> autotools at all.
> 
> Yes, I re-added PKG_CONFIG=.. in r23796 - With that, it works for me.

After looking into it again, the package seems a bit broken. `$(PKG_CONFIG)
--cflags glib-2.0` evaluates to "-I/usr/include/glib-2.0
-I/usr/lib/glib-2.0/include", not the ones in staging_dir, so it uses the
system include files. PKG_CONFIG_PATH has to be defined and
PKG_CONFIG_SYSROOT_DIR, too. But it also uses the staging files hardcoded in
the Makefile. Then have a look at XLIBPATH in the Makefile, which points to
the system files. And LDFLAGS is never used.

Markus
