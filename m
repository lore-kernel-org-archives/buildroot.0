From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 16 Jun 2016 21:45:22 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616153710.12ef9233@free-electrons.com>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com>
Message-ID: <20160616214522.70ca9152@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 16 Jun 2016 15:37:10 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> > Since commit 9c40723, handling of ldconfig in the main Makefile as
> > been dropped, and if /etc/ld.so.conf is found in the target root
> > filesystem, the build fails.
> > 
> > Not being able to run ldconfig and generate the ld.so cache has two
> > drawbacks:
> > 
> >  - it prevents the user from installing some libraries in other
> > locations than /lib and /usr/lib (e.g. /opt/foo/lib). This can be
> > solved with symlinks, though.  
> 
> Does the dynamic linker uses /etc/ld.so.conf at runtime to find other
> libraries, even if there is no /etc/ld.so.cache? If that's the case,
> then our check for ld.so.conf being absent is somewhat wrong, as it
> would be valid to have, independently of whether ldconfig has created
> ld.so.cache or not.

Inspecting the glibc source code shows that:

 - /etc/ld.so.conf is only read by ldconfig (see elf/ldconfig.c). 
 - /etc/ld.so.cache is only read by the dynamic loader (see elf/dl-cache.c).

This is confirmed when using strace. So, IMHO, this sanity check is of
no use.

> However, in order to merge something like this, I'd like to have a
> solution that covers glibc, uClibc and musl, or at least takes those
> different cases into account by making it available only for the C
> libraries that support it (but that mean investigating how uClibc and
> musl support ld.so.conf/ld.so.cache).

From the INSTALL file in musl source code, we learn that if dynamic
linking is enabled, the dynamic linker will be
/lib/ld-musl-$ARCH.so.1. It will look for libraries in the paths
listed in /etc/ld-musl-$ARCH.path.

Debian provides ld-musl-config, which aggregates the contents of the
files found in /etc/ld-musl-$ARCH.d/ to create /etc/ld-musl-$ARCH.path.

However musl is traditionally used for static linking.

uclibc-ng also provides ldconfig, which behaves like the glibc version
(see ldso/man/ldconfig.8 in the source tree).

> Another thing that bothers me is why it is not possible to have a
> cross-compilation aware ldconfig. This would really be much, much
> nicer than running ldconfig under qemu.

Yocto provides a recipe named ldconfig-native_2.12.1.bb [1], which
contains a verbatim copy of the ldconfig source code from glibc, and a
truck load of patches. It looks a bit hairy...

[1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb

Regards,

-- 
ELB
