From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jun 2009 10:22:18 +0200
Subject: [Buildroot] Set LIBS variabile using new package format
In-Reply-To: <159a01660906040051k5dc43776ve49f305dc4841d0a@mail.gmail.com>
References: <159a01660906040051k5dc43776ve49f305dc4841d0a@mail.gmail.com>
Message-ID: <20090604102218.393a14a5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 4 Jun 2009 09:51:15 +0200,
Daniele Salvatore Albano <d.albano@gmail.com> a ?crit :

> However i've a problem: there is a little bug in the tinyproxy
> configure so libintl.h is being reknown but -lintl isin't added to
> libraries to link and it fails to link so i need to add it.

If it's really a bug in tinyproxy itself, then the best solution is to
write a patch, send it upstream, and while waiting for upstream to make
a new release, include the patch in Buildroot as well.

> I've tried setting up LIBS variable, PACKAGENAME_LIBS variable and
> more but nothing to do, it doesn't work. I looked for other packages
> too but nothing.

There's no such thing as PACKAGENAME_LIBS. All the PACKAGENAME_*
variables are documented at the top of package/Makefile.autotools.in.

In your case, PACKAGE_CONF_ENV would quite certainly be the solution, it
allows to set variables passed to the ./configure script.

For example, in bind/bind.mk :

BIND_CONF_ENV = BUILD_CC="$(TARGET_CC)" \
                BUILD_CFLAGS="$(TARGET_CFLAGS)"

> There is a way to set change LIBS or CFLAGS variables? Or is better to
> do a little patch to apply to configure.ac and use
> PACKAGENAME_AUTORECONF to force to rebuild autoconf?

As said previously, it depends. If it's a real bug in tinyproxy's
configure, fix it with a patch. If it's a tuning needed due to
Buildroot specific things, then do it with BIND_CONF_ENV.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
