From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 May 2013 00:27:39 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130510225844.4f750b00@skate>
References: <20130510175133.13d3fc6f@skate> <20130510165356.GA19822@free.fr>
 <20130510225844.4f750b00@skate>
Message-ID: <20130510222739.GB19822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-05-10 22:58 +0200, Thomas Petazzoni spake thusly:
> On Fri, 10 May 2013 18:53:56 +0200, Yann E. MORIN wrote:
> > [--SNIP--]
> > >  * There a bunch of libraries that don't have the executable bit set in
> > >    usr/lib. I don't think it's a big problem, but it makes them
> > >    different from the others.
> > 
> > Shared libraries do not need to be executable, except the dynamic linker
> > ld.so which is both a progrm and a library.
> > 
> > Also, libc.so from {,e}glibc is also executable, but not he libc.so from
> > uClibc.
> > 
> > I think it is not a problem per-se, and I think shared libraries should
> > not be executable at all.
> 
> I agree, it's not a problem per se, it's just that 99% of the other
> packages install their shared libraries with executable permissions, so
> not having them for a few libraries is a bit strange.

Yep, I like my filesystems to be tidy, too! :-)

> Also, to be noted that we keep the .so symbolic link, even though it's
> generally unneeded at runtime. However, unfortunately, simply removing
> *.so isn't going to work: some of the .so files are directly the shared
> libraries.
> 
> Examples:
> 
> $ ls -l libdvb*
> -rw-r--r-- 1 thomas thomas 20469 May  9 13:21 libdvbapi.so
> -rw-r--r-- 1 thomas thomas 13415 May  9 13:21 libdvbcfg.so
> -rw-r--r-- 1 thomas thomas 52375 May  9 13:21 libdvben50221.so
> -rw-r--r-- 1 thomas thomas 25523 May  9 13:21 libdvbsec.so

What we could do is scan the rootfs for shared libs, remove the
symlinks, and rename the libraries to their SONAME.

Then, until we get rid of "devel stuff on target", we can recreate the
simple .so symlinks (if it's not the SONAME).

Also, keep in mind that symlinks each use an inode, which can become a
bit cumbersome on size-constrained file systems. (hardlinks do not use
an inode, however). So, getting rid of the useless symlinks is a net
win overall.

> > >  * Some packages seem to confuse /var with /usr/var: cups, netatalk,
> > >    squid, polkit-1, vtund, stunnel. Here's what I have in usr/var/ :
> > [--SNIP--]
> > 
> > Two options here:
> >   - ./configure --localstatedir=/var
> >     Some packages do set it in their .mk, eg. (=/var unless specified):
> >         avahi, sed, directfb, NM, lighttpd, dhcp (=/var/lib/dhcp),
> >         php, oprofile, xserver_xorg-server, samba, dbus, collectd,
> >         proftpd (=/var/run), sqlite, bind, dbus-glib, ndisc6, sql_net,
> >         sqlcipher, connman, pulseaudio
> >     Probably usefull to set it in the pkg-infra?
> 
> Seems like yes.

I've done a preliminary build with that and no /usr/var symlink, and it
is not satisfactory to me: for example, cups will install some stuff in
/tmp :
    before                          after
    ----------------------------------------------------------
    /usr/var/run/cups/certs/        /tmp/cups/certs/
    /usr/var/cache/cups/rss/        /tmp/cups/rss/
    /usr/var/spool/cups/tmp/        /tmp/cups/tmp/

So, because /var/run, /var/spool. and /var/cache are symlinks to /tmp,
all gets install into /tmp/cups.

I'm not sure this is good, as /tmp is not guaranteed to survive a
shutdown, especially since /tmp is a tmpfs in the default skeleton.
Which causes even further grievance since the mountpoint will hide
the previous content of /tmp anyway.

I'll see how to "fix" that.

Other than that, all the packages you mentionned installing things in
/usr/var did install in /var, and /usr/var was not created. Which is
otherwise good news.

Anyway, that still requires a bit more investigations before I can
submit that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
