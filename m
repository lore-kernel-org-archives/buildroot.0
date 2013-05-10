From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 22:58:44 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130510165356.GA19822@free.fr>
References: <20130510175133.13d3fc6f@skate>
	<20130510165356.GA19822@free.fr>
Message-ID: <20130510225844.4f750b00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 10 May 2013 18:53:56 +0200, Yann E. MORIN wrote:

> >  * There is a usr/arm-buildroot-linux-gnueabi directory, which contains
> >    just a 'bin' subdirectory, which contains ar, as, ld, nm, etc.
> > 
> >    $ ls usr/arm-buildroot-linux-gnueabi/bin/
> >    ar  as  ld  ld.bfd  nm  objcopy  objdump  ranlib  strip
> > 
> >    That's a strange installation location for binutils.
> 
> These should be hard-links to their fully-qualified counterparts in
> /usr/bin:
>     arm-buildroot-linux-gnueabi-{ar,as,ld,ld,bfd,nm,objcopy,ranlib,strip}
> 
> That's typical of a binutils installation.

They are indeed hardlinks.

> [--SNIP--]
> >  * There a bunch of libraries that don't have the executable bit set in
> >    usr/lib. I don't think it's a big problem, but it makes them
> >    different from the others.
> 
> Shared libraries do not need to be executable, except the dynamic linker
> ld.so which is both a progrm and a library.
> 
> Also, libc.so from {,e}glibc is also executable, but not he libc.so from
> uClibc.
> 
> I think it is not a problem per-se, and I think shared libraries should
> not be executable at all.

I agree, it's not a problem per se, it's just that 99% of the other
packages install their shared libraries with executable permissions, so
not having them for a few libraries is a bit strange.

Also, to be noted that we keep the .so symbolic link, even though it's
generally unneeded at runtime. However, unfortunately, simply removing
*.so isn't going to work: some of the .so files are directly the shared
libraries.

Examples:

$ ls -l libdvb*
-rw-r--r-- 1 thomas thomas 20469 May  9 13:21 libdvbapi.so
-rw-r--r-- 1 thomas thomas 13415 May  9 13:21 libdvbcfg.so
-rw-r--r-- 1 thomas thomas 52375 May  9 13:21 libdvben50221.so
-rw-r--r-- 1 thomas thomas 25523 May  9 13:21 libdvbsec.so

> >  * Some packages seem to confuse /var with /usr/var: cups, netatalk,
> >    squid, polkit-1, vtund, stunnel. Here's what I have in usr/var/ :
> [--SNIP--]
> 
> Two options here:
>   - ./configure --localstatedir=/var
>     Some packages do set it in their .mk, eg. (=/var unless specified):
>         avahi, sed, directfb, NM, lighttpd, dhcp (=/var/lib/dhcp),
>         php, oprofile, xserver_xorg-server, samba, dbus, collectd,
>         proftpd (=/var/run), sqlite, bind, dbus-glib, ndisc6, sql_net,
>         sqlcipher, connman, pulseaudio
>     Probably usefull to set it in the pkg-infra?

Seems like yes.

> [--SNIP--]
> >  * usr/share represents 428 MB, which includes 121 MB of locales (I
> >    didn't select the removal of locales in my configuration)
> 
> Not a problem if locales where not /disabled/ in your config.

Sure, I was just giving a rough idea of the size of usr/share: it
represents almost half of the size of the filesystem. usr/share is 428
MB over the 1.1 GB of the filesystem. This line was mostly giving
numbers, not really raising any particular problem.

> > If people are interested in fixing some of those issues, reply to this
> > e-mail saying which issue you're going to have a look at.
> 
> I'll look at the /var issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
