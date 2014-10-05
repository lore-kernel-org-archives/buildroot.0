From: Maarten ter Huurne <maarten@treewalker.org>
Date: Mon, 06 Oct 2014 01:29:15 +0200
Subject: [Buildroot] [PATCH] libxml2: Add patch to remove weak symbol
	trickery
In-Reply-To: <20141005193557.25145932@free-electrons.com>
References: <1410410325-23801-1-git-send-email-maarten@treewalker.org>
 <20141005193557.25145932@free-electrons.com>
Message-ID: <1744839.Qfi6dWdBgg@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 05 October 2014 19:35:57 Thomas Petazzoni wrote:
> Dear Maarten ter Huurne,
> 
> On Thu, 11 Sep 2014 06:38:45 +0200, Maarten ter Huurne wrote:
> > This avoids runtime problems when linking libpthread statically and it
> > fixes compilation with musl libc.
> > 
> > The patch is based on this one:
> >   https://github.com/sabotage-linux/sabotage/blob/master/KEEP/libxml2-pt
> >   hread.patch> 
> > I added the configure modification to ensure that libxml-2.0.pc will
> > list libpthread as a private dependency.
> 
> Missing SoB line.

Is there a policy for including 3rd party patches? In this case the fragment 
I took from Sabotage Linux only removes code, so I don't think there could 
be any copyright issues there (no creativity involved), but in general would 
my SoB line be sufficient or would I need one from the 3rd party author as 
well?

> I'm a bit worried about upstream reaction: they say that they won't
> support static linking anymore. So this means that this patch will
> never be upstreamed, while we generally try to not carry patches that
> really have zero chance to go upstream, unless they are
> cross-compilation fixes.

There are more failure modes than just static linking. For example, if 
libpthread is loaded after libxml2 initializes, for example as a result of a 
dlopen(), libxml2 will have already concluded that it runs in a single 
threaded environment while that is no longer true.

So the code is unsafe, but I assume the scenarios in which it breaks are 
relatively rare, otherwise it would have been fixed already. On the other 
hand, threading issues are hard to diagnose, so maybe there are applications 
out there misbehaving in ways no-one has figured out yet.

An alternative safe solution would be to build two versions of libxml2: one 
for applications that use threads and one for applications that don't and 
have the application developer pick the right one to link with. However, 
until upstream acknowledges that there is a problem, no solution will have 
any chance of getting accepted.

> > ---
> > 
> >  ...bxml2-pthread-remove-weak-symbol-trickery.patch | 82
> >  ++++++++++++++++++++++
> Patch should follow the patch naming convention:
> 
> 	<pkg>-<seqnumber>-<description>.patch

OK.

> >  1 file changed, 82 insertions(+)
> >  create mode 100644
> >  package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch> 
> > diff --git
> > a/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
> > b/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch new
> > file mode 100644
> > index 0000000..8e9a139
> > --- /dev/null
> > +++ b/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
> > @@ -0,0 +1,82 @@
> > +libxml2 contains some trickery to avoid linking to libpthread.
> > +However, this is unsafe in several ways:
> > +
> > +Bug 704904 - Incorrect and unsafe use of weak references to pthread
> > functions +https://bugzilla.gnome.org/show_bug.cgi?id=704904
> > +
> > +As a side effect, the following compilation error with musl libc is
> > also
> > +fixed by this patch:
> > +
> > +Bug 704908 - Failure to suppress macros when re-declaring pthread
> > functions +https://bugzilla.gnome.org/show_bug.cgi?id=704908
> > +

Note that fixing the musl compilation error was my motivation to look into 
this problem. At first I was working on a patch to deal with some of the 
pthread calls being macros rather than functions in musl, but after a 
discussion on the musl IRC channel, I decided that it would be better to 
remove the unsafe feature rather than making it compile.

I could make a patch that only fixes bug 704908 and leaves 704904 unfixed; 
that might have a better chance at getting accepted upstream. But personally 
I think Buildroot users would be better off if 704904 is fixed too and 
fixing that bug automatically fixes 704908 as well.

> Missing SoB line.
> 
> Also, our libxml2 package does not depends on threads right now. What
> happens once we apply your patch?

All the changed code is within a #ifdef HAVE_PTHREAD_H. Assuming that 
libxml2's configure script does its job, it will leave HAVE_PTHREAD_H 
undefined when building for a system without pthread support.

Bye,
		Maarten
