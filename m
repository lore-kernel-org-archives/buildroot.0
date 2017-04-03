From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 3 Apr 2017 19:48:25 +0200
Subject: [Buildroot] [PATCH v2] uhttpd: fix TCP_FASTOPEN related compile
 error
In-Reply-To: <20170403173646.oprtrwldn5rkk7wp@tarshish>
References: <20170403172908.10642-1-ps.report@gmx.net>
 <20170403173646.oprtrwldn5rkk7wp@tarshish>
Message-ID: <20170403194825.06b6aa2c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Mon, 3 Apr 2017 20:36:46 +0300, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
> 
> On Mon, Apr 03, 2017 at 07:29:08PM +0200, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c: In function 'uh_setup_listeners':
> >   .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c:120:30: error: 'TCP_FASTOPEN' undeclared (first use in this function)
> > 
> > [1] http://autobuild.buildroot.net/results/56e/56e0727ccd1255b05e03d1b79dc238bd88701230
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - use conditional define for TCP_FASTOPEN (Baruch Siach, Thomas Petazzoni)
> >   - fix subject typo (Thomas Petazzoni)
> > ---
> >  ...02-Fix-TCP_FASTOPEN-related-compile-error.patch | 30 ++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch
> > 
> > diff --git a/package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch b/package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch
> > new file mode 100644
> > index 000000000..fb3ff54ae
> > --- /dev/null
> > +++ b/package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch
> > @@ -0,0 +1,30 @@
> > +From adbab70d3602d77736781be344cfdc5508cb0600 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Mon, 3 Apr 2017 19:22:30 +0200
> > +Subject: [PATCH] Fix TCP_FASTOPEN related compile error.
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + listen.c | 6 ++++++
> > + 1 file changed, 6 insertions(+)
> > +
> > +diff --git a/listen.c b/listen.c
> > +index 2a54888..4dabe34 100644
> > +--- a/listen.c
> > ++++ b/listen.c
> > +@@ -96,6 +96,12 @@ static void listener_cb(struct uloop_fd *fd, unsigned int events)
> > + 		uh_block_listener(l);
> > + }
> > + 
> > ++#ifdef linux
> 
> Why limit it to Linux? TCP_FASTOPEN does not conflict with anything else, as 
> far as I can see.

Because the setsockopt() call is limited by '#ifdef linux', see some lines below in
the original listen.c file...

Regards,
Peter


> 
> > ++#ifndef TCP_FASTOPEN
> > ++#define TCP_FASTOPEN 23
> > ++#endif
> > ++#endif
> 
> baruch
> 
