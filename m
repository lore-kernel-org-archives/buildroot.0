From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 4 Jan 2015 21:02:04 +0200
Subject: [Buildroot] [PATCH] dmalloc: fix parallel builds
In-Reply-To: <20150104183513.0cdff028@free-electrons.com>
References: <20150103110503.GA11955@vostro>
 <20150104183513.0cdff028@free-electrons.com>
Message-ID: <20150104190204.GA4224@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sun, Jan 04, 2015 at 06:35:13PM +0100, Thomas Petazzoni wrote:

> On Sat, 3 Jan 2015 13:05:03 +0200, Alex Suykov wrote:
> > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> > ---
> >  This patch should fix
> >  http://autobuild.buildroot.net/results/2cc40ae3fc8b7a287c43528b3e4ffdbcd5033c09/
> > 
> >  package/dmalloc/dmalloc-deps.patch | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 package/dmalloc/dmalloc-deps.patch
> 
> While it indeed looks like a parallel build issue, I haven't been able
> to reproduce it: I've started a loop building dmalloc over and over
> again on my build server (on which the issue was reproduced by the
> autobuilders), and never managed to see it after an entire night
> looping on dmalloc builds. So I'm a bit confused on this one.

The following sequence seems to trigger it more or less reliably for me:

    ./configure --disable-static --enable-shared --enable-cxx --enable-threads
    sed -i -e "s at cat \$(srcdir)/dmalloc.h.1.*@&; sleep 1@" Makefile
    make clean
    make -j4

What happens is a race condition between "cat ...; mv ... dmalloc.h"
and "g++ -c dmallocc.cc". As long as cat-mv pair is faster, it works well.
But if there's a delay, it breaks.

This should be rare, I can only reproduce it with an artificial delay,
and only with --disable-static. But on the other hand, it did happen
on autobuild somehow.
