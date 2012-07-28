From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jul 2012 09:37:29 +0200
Subject: [Buildroot] Help adding a prerequisite to GCC
In-Reply-To: <501315CB.2080809@sri.com>
References: <501315CB.2080809@sri.com>
Message-ID: <20120728093729.45429122@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Scott,

Le Fri, 27 Jul 2012 15:27:23 -0700,
Scott Moore <scott.moore@sri.com> a ?crit :

> I'm trying to compile a toolchain with LTO support in gcc.
> I tried to do this by adding the additional gcc flag "--enable-lto", but 
> the build fails (unsurprisingly) because building gcc with lto support 
> requires libelf, which is not currently a prerequisite for gcc in buildroot.
> 
> To fix this, I tried adding libelf to gcc-uclibc-4.x.mk by adding:
> GCC_HOST_PREREQ += host-libelf
> GCC_TARGET_PREREQ += libelf

This sounds good.

> The resulting build fails because their is "no make target host-libelf, 
> required for gcc_initial". Can anyone help me figure out where I went 
> wrong? I realize just hacking it in to the .mk like that probably isn't 
> ideal. I was planning to add it as a menuconfig option once I get it 
> building at all.

If you look at package/libelf/libelf.mk, you'll see that there is only
a target variant of this package, and no host variant.

So you should add a line:

$(eval $(host-autotools-package))

at the bottom of the file, and try again. You may need to define some
addition HOST_* variables to adjust the configuration options and
others, if the build fails or if the resulting host libelf doesn't work
properly for what you're trying to do.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
