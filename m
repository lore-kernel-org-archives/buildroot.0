From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Oct 2013 18:09:46 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
In-Reply-To: <525AF808.4000207@openwide.fr>
References: <20131006232954.71da4d75@skate>
 <420407879.8180852.1381219913546.JavaMail.root@openwide.fr>
 <20131008101327.5ee7cc9c@skate> <525AF808.4000207@openwide.fr>
Message-ID: <20131016180946.00a8b309@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 13 Oct 2013 21:44:08 +0200, Romain Naour wrote:

> You're right, the static lib isn?t built with -fPIC.
> But the libcap build system build the static and shared libraries,
> even if you don't want one of them.
> 
> The build failure [1] is caused by the missing -fPIC during the build of libcap.so.2.22
> 
> So, we may add -fPIC if BR2_PREFER_STATIC_LIB=y and the shared lib is build correctly
> (ok it's weird)
> Or add a patch for enable/disable separately the static/shared build.

If BR2_PREFER_STATIC_LIB=y, then not shared library should be built at
all. Even though the naming of the option doesn't make it clear for the
moment.

And therefore, when BR2_PREFER_STATIC_LIB=y, passing -fPIC should not
be needed, as we're building only static libraries.

I had a quick look at libcap, and we can easily build only the static
or shared library by doing the $(MAKE) only in $(@D)/libcap, and using
the libcap.a and libcap.so targets. But the install target is not really
adapted to that, so we would have to install things manually.

Maybe a little patch to the libcap/Makefile which understands
BUILD_STATIC and BUILD_SHARED variables would be good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
