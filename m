From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 16 Jun 2016 23:32:57 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616195310.GF3665@free.fr>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com>
 <20160616195310.GF3665@free.fr>
Message-ID: <20160616233257.7a47d276@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Thu, 16 Jun 2016 21:53:10 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> On 2016-06-16 15:37 +0200, Thomas Petazzoni spake thusly:
> > On Thu, 16 Jun 2016 15:12:06 +0200 (CEST), Eric Le Bihan wrote:
> >   
> > > Since commit 9c40723, handling of ldconfig in the main Makefile
> > > as been dropped, and if /etc/ld.so.conf is found in the target
> > > root filesystem, the build fails.
> > > 
> > > Not being able to run ldconfig and generate the ld.so cache has
> > > two drawbacks:
> > > 
> > >  - it prevents the user from installing some libraries in other
> > > locations than /lib and /usr/lib (e.g. /opt/foo/lib). This can be
> > > solved with symlinks, though.  
> > 
> > Does the dynamic linker uses /etc/ld.so.conf at runtime to find
> > other libraries, even if there is no /etc/ld.so.cache? If that's
> > the case, then our check for ld.so.conf being absent is somewhat
> > wrong, as it would be valid to have, independently of whether
> > ldconfig has created ld.so.cache or not.  
> 
> What I understand is that, to find a library, the linker will:
> 
>  1) if there is a cache, see if it knows about that library in the
> cache;
> 
>  2) if no cache, or if not known in the cache, look for ld.so.conf and
>     look for that library in all paths listed in there;
> 
>  3) if still not found, look in the "well-known" locations, usually
>     /usr/lib then /lib  (or their variants, depending on the
>     mutlilib/multiarch uglyness)

The MAN page for ld.so [1] only refers to /etc/ld.so.cache when ld.so
searches for a library.

> > >  - when running a program, ld.so has to explore all the library
> > > paths to find the correct location of the required libraries.
> > > This results in zillions of failed calls to open(), i.e. wasted
> > > time.  
> 
> Have you actually measured this overhaed?

No. I'll try to get some numbers. I only used strace.

[1] http://man7.org/linux/man-pages/man8/ld.so.8.html

Regards,

-- 
ELB
