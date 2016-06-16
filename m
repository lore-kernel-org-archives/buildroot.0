From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 22:28:54 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616214522.70ca9152@itchy>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com>
 <20160616214522.70ca9152@itchy>
Message-ID: <20160616222854.6b20890a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 21:45:22 +0200, Eric Le Bihan wrote:

> > > Not being able to run ldconfig and generate the ld.so cache has two
> > > drawbacks:
> > > 
> > >  - it prevents the user from installing some libraries in other
> > > locations than /lib and /usr/lib (e.g. /opt/foo/lib). This can be
> > > solved with symlinks, though.    
> > 
> > Does the dynamic linker uses /etc/ld.so.conf at runtime to find other
> > libraries, even if there is no /etc/ld.so.cache? If that's the case,
> > then our check for ld.so.conf being absent is somewhat wrong, as it
> > would be valid to have, independently of whether ldconfig has created
> > ld.so.cache or not.  
> 
> Inspecting the glibc source code shows that:
> 
>  - /etc/ld.so.conf is only read by ldconfig (see elf/ldconfig.c). 
>  - /etc/ld.so.cache is only read by the dynamic loader (see elf/dl-cache.c).

OK.

> This is confirmed when using strace. So, IMHO, this sanity check is of
> no use.

If what you say above is true, then your conclusion is completely
wrong: the sanity check is *absolutely* mandatory.

Since Buildroot does *NOT* generate ld.so.cache, and ld.so.conf is not
read by the dynamic loader, having a ld.so.conf in a Buildroot
filesystem is a mistake, as the user might thing that the dynamic
linker will search in the directories listed in ld.so.conf, but it is
not true: the dynamic linker only searches in the libraries referenced
in ld.so.cache, and ignores ld.so.conf.

> > However, in order to merge something like this, I'd like to have a
> > solution that covers glibc, uClibc and musl, or at least takes those
> > different cases into account by making it available only for the C
> > libraries that support it (but that mean investigating how uClibc and
> > musl support ld.so.conf/ld.so.cache).  
> 
> From the INSTALL file in musl source code, we learn that if dynamic
> linking is enabled, the dynamic linker will be
> /lib/ld-musl-$ARCH.so.1. It will look for libraries in the paths
> listed in /etc/ld-musl-$ARCH.path.
> 
> Debian provides ld-musl-config, which aggregates the contents of the
> files found in /etc/ld-musl-$ARCH.d/ to create /etc/ld-musl-$ARCH.path.

So it uses configuration files that are incompatible with the ones used
by glibc.

> However musl is traditionally used for static linking.

I don't think that's a good assumption, at least in the context of
Buildroot.

> uclibc-ng also provides ldconfig, which behaves like the glibc version
> (see ldso/man/ldconfig.8 in the source tree).

OK. But IIRC, the ld.so.cache functionality in uClibc-ng is optional,
and I'm not sure we have it enabled by default.

The uClibc-ng ld.so.cache format would be fully compatible with
the one used in glibc ?

> > Another thing that bothers me is why it is not possible to have a
> > cross-compilation aware ldconfig. This would really be much, much
> > nicer than running ldconfig under qemu.  
> 
> Yocto provides a recipe named ldconfig-native_2.12.1.bb [1], which
> contains a verbatim copy of the ldconfig source code from glibc, and a
> truck load of patches. It looks a bit hairy...
> 
> [1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb

Yes, I know they are doing this with a shitload of patches. Maybe we
should host a project on github for a cross-compilation capable
ldconfig, and then offer the Yocto people to use it?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
