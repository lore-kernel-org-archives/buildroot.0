From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 May 2013 12:31:44 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130510222739.GB19822@free.fr>
References: <20130510175133.13d3fc6f@skate> <20130510165356.GA19822@free.fr>
 <20130510225844.4f750b00@skate> <20130510222739.GB19822@free.fr>
Message-ID: <20130511123144.1d18b9e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 11 May 2013 00:27:39 +0200, Yann E. MORIN wrote:

> > I agree, it's not a problem per se, it's just that 99% of the other
> > packages install their shared libraries with executable permissions, so
> > not having them for a few libraries is a bit strange.
> 
> Yep, I like my filesystems to be tidy, too! :-)

Me too. I also noticed some variations on the permissions of
executables. Most of them have the write permissions, but some do not.


> > Also, to be noted that we keep the .so symbolic link, even though it's
> > generally unneeded at runtime. However, unfortunately, simply removing
> > *.so isn't going to work: some of the .so files are directly the shared
> > libraries.
> > 
> > Examples:
> > 
> > $ ls -l libdvb*
> > -rw-r--r-- 1 thomas thomas 20469 May  9 13:21 libdvbapi.so
> > -rw-r--r-- 1 thomas thomas 13415 May  9 13:21 libdvbcfg.so
> > -rw-r--r-- 1 thomas thomas 52375 May  9 13:21 libdvben50221.so
> > -rw-r--r-- 1 thomas thomas 25523 May  9 13:21 libdvbsec.so
> 
> What we could do is scan the rootfs for shared libs, remove the
> symlinks, and rename the libraries to their SONAME.
> 
> Then, until we get rid of "devel stuff on target", we can recreate the
> simple .so symlinks (if it's not the SONAME).
> 
> Also, keep in mind that symlinks each use an inode, which can become a
> bit cumbersome on size-constrained file systems. (hardlinks do not use
> an inode, however). So, getting rid of the useless symlinks is a net
> win overall.

Interesting, those libdvb*.so libraries don't have a SONAME:

$ readelf -d libdvb*.so | grep SONAME
$

Seems like they might be dlopen()ed plugins and not directly shared
libraries per se.

However, some of those non-executables libraries do have a SONAME:

target/usr/lib$ ls -l libproxychains4.so 
-rw-r--r-- 1 thomas thomas 85619 May  9 17:18 libproxychains4.so
target/usr/lib$ readelf -d libproxychains4.so | grep SONAME
 0x0000000e (SONAME)                     Library soname: [libproxychains4.so]

I'm not sure I like the renaming of libraries to their SONAME, but it's
really a matter of perception. Technically speaking, I agree that it
works.

> I've done a preliminary build with that and no /usr/var symlink, and it
> is not satisfactory to me: for example, cups will install some stuff in
> /tmp :
>     before                          after
>     ----------------------------------------------------------
>     /usr/var/run/cups/certs/        /tmp/cups/certs/
>     /usr/var/cache/cups/rss/        /tmp/cups/rss/
>     /usr/var/spool/cups/tmp/        /tmp/cups/tmp/
> 
> So, because /var/run, /var/spool. and /var/cache are symlinks to /tmp,
> all gets install into /tmp/cups.
> 
> I'm not sure this is good, as /tmp is not guaranteed to survive a
> shutdown, especially since /tmp is a tmpfs in the default skeleton.
> Which causes even further grievance since the mountpoint will hide
> the previous content of /tmp anyway.
> 
> I'll see how to "fix" that.
> 
> Other than that, all the packages you mentionned installing things in
> /usr/var did install in /var, and /usr/var was not created. Which is
> otherwise good news.
> 
> Anyway, that still requires a bit more investigations before I can
> submit that.

Ok. Beware that having /var/run, /var/spool and /var/cache point
to /tmp is a feature that allows the root filesystem to be mounted
read-only, and still have the services working. That's something we
should try to keep working, I believe.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
