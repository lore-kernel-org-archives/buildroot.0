From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 23:12:23 +0200
Subject: [Buildroot] [PATCH] package/libcap: fix build of host variant
 on systems without static libc
In-Reply-To: <20200904210137.GO14354@scaer>
References: <20200904151503.991741-1-thomas.petazzoni@bootlin.com>
 <20200904210137.GO14354@scaer>
Message-ID: <20200909231223.56548dc3@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Sep 2020 23:01:37 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2020-09-04 17:15 +0200, Thomas Petazzoni spake thusly:
> > Since the bump to 2.42 in 241e3bdea8b68b3ce78b1b76db29019fdcbb7b05,
> > the host variant of libcap fails to build on systems that don't have
> > the static variant of the C library installed. Indeed, libcap tries to
> > build test programs statically, which fails with:
> > 
> > /usr/bin/ld: cannot find -lc
> > collect2: error: ld returned 1 exit status
> > 
> > This commit fixes that by:
> > 
> >  (1) Adding a patch, submitted upstream, which makes the
> >      tests/Makefile obey the same DYNAMIC variable as the one used by
> >      progs/Makefile.  
> 
> But then it means that tests will run with a system-wide version of
> libcap if that exists, or would fail to run at all if libcap is not
> installed in the system, both really not being what is expected of
> the tests, I would think. So upstream will probably not be that thrilled
> about that patch, I'm afraid...
> 
> But seeing how some tests are run udner sudo, we can't use
> LD_LIBRARY_PATH.
> 
> Instead, I think we should womething like -Wl,-rpath,'$$ORIGN/../libcap'
> 
> Unless I missed something?

I have sent a new version of the patch, which uses fixes from upstream,
and for the tests, they use LD_LIBRARY_PATH to use the locally
available shared library.

See https://patchwork.ozlabs.org/project/buildroot/patch/20200909210250.1093461-1-thomas.petazzoni at bootlin.com/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
