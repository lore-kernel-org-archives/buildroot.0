From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 22:34:34 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616195310.GF3665@free.fr>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com>
 <20160616195310.GF3665@free.fr>
Message-ID: <20160616223434.23ad8a4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 21:53:10 +0200, Yann E. MORIN wrote:

> > Does the dynamic linker uses /etc/ld.so.conf at runtime to find other
> > libraries, even if there is no /etc/ld.so.cache? If that's the case,
> > then our check for ld.so.conf being absent is somewhat wrong, as it
> > would be valid to have, independently of whether ldconfig has created
> > ld.so.cache or not.  
> 
> What I understand is that, to find a library, the linker will:
> 
>  1) if there is a cache, see if it knows about that library in the cache;
> 
>  2) if no cache, or if not known in the cache, look for ld.so.conf and
>     look for that library in all paths listed in there;
> 
>  3) if still not found, look in the "well-known" locations, usually
>     /usr/lib then /lib  (or their variants, depending on the
>     mutlilib/multiarch uglyness)

This quite different than what Eric said. If indeed ld.so.conf is
indeed read if there is no cache, or the library has not been found
through the cache, then we could potentially remove the check on
ld.so.conf in the main Makefile.

*However* there is still the problem that having a ld.so.conf may work
for glibc, but not necessarily for uClibc/musl. So if a package adds
some contents to ld.so.conf or ld.so.conf.d, thinking it will "just
work", it might be OK with glibc, but not with musl/uClibc. It's also
for this reason that I added this check in the first place.

> > With the proposal from Yann to have different skeletons for systemd and
> > traditional init, I am not sure having this logic in the skeleton
> > package is the most appropriate. Indeed, this logic is useful
> > regardless of the init system being used.  
> 
> And even without the one-skeleton-per-init-system, I doubt it belongs
> to the skeleton. The cache should be constructed after we have all the
> libraries, so it can only really be in target-finalize )or be a hook
> thereof).
> 
> Now, where to put the actual code? In its own location, no need to
> fatten the main Makefile. We can always add .mk fragments, e.g. in
> support/mk/ or somesuch.

Agreed. I'd prefer to avoid cluttering the main Makefile with more and
more stuff. We need to find some good places to move certain parts of
the main Makefile that don't belong to any package, but that also don't
really belong to the main Makefile.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
