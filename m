From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 May 2013 19:29:16 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130511123144.1d18b9e5@skate>
References: <20130510175133.13d3fc6f@skate> <20130510165356.GA19822@free.fr>
 <20130510225844.4f750b00@skate> <20130510222739.GB19822@free.fr>
 <20130511123144.1d18b9e5@skate>
Message-ID: <20130512172916.GC2976@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-05-11 12:31 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 May 2013 00:27:39 +0200, Yann E. MORIN wrote:
> > Yep, I like my filesystems to be tidy, too! :-)
> Me too. I also noticed some variations on the permissions of
> executables. Most of them have the write permissions, but some do not.

I'm not sure whether we should "clean up" this situation. Although I
agree this is not "clean", it's the same problem as with +x/-x shared
libs.

At the last DevDay, we discussed about having target generated from
staging just before the filesystem images are created. When we come to
implement this, then maybe we can clean that situation a bit. And at the
same time, also take care of the shared lib SONAME "issue"...

> Interesting, those libdvb*.so libraries don't have a SONAME:
> 
> $ readelf -d libdvb*.so | grep SONAME
> $
> 
> Seems like they might be dlopen()ed plugins and not directly shared
> libraries per se.

Yep, most probably dlopn()ed plugins.

> However, some of those non-executables libraries do have a SONAME:
> 
> target/usr/lib$ ls -l libproxychains4.so 
> -rw-r--r-- 1 thomas thomas 85619 May  9 17:18 libproxychains4.so
> target/usr/lib$ readelf -d libproxychains4.so | grep SONAME
>  0x0000000e (SONAME)                     Library soname: [libproxychains4.so]
> 
> I'm not sure I like the renaming of libraries to their SONAME, but it's
> really a matter of perception. Technically speaking, I agree that it
> works.

I see at least one reason to rename to the SONAME: get rid of the
symlinks to reduce the number of inodes required on the filesystem.

Granted, we do not gain much, but it is still interesting on a small FS.

> > I've done a preliminary build with that and no /usr/var symlink, and it
[--SNIP--]
> Ok. Beware that having /var/run, /var/spool and /var/cache point
> to /tmp is a feature that allows the root filesystem to be mounted
> read-only, and still have the services working. That's something we
> should try to keep working, I believe.

Yes, I know. But currently, those packages are already broken, since
they point to /usr/var which might be read-only.

So I wonder what the best situation would be to fully solve the issue. I
can see at least two options:
  - package provides an init script (or systemd unit) that creates the
    required dirs/files at startup;
  - infra creates a tarball of everyting in /tmp and install a startup
    script that extracts that tarball at startup.

Needless to say that I prefer the first solution, although it will
require a bit more work (eg. currently, cups bundles and installs its
startup script (which BTW is largely more complex than it needs to be),
so we'd have to replace that startup script with our own, which is not
really trivial).

OTOH, the second solution is relatively easy to do, and is systematic,
although it may entice developpers to lazyness.

Regards,
Yann E. MORIN.

PS. I again have some mail delivery issues this WE, and although it seems
    to settle down, I'm not sure I'm receiving mails on-time (this one
    arrived about an hour ago... :-( ). Looks like time for me to roll
    out my own server... :-(
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
