From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Oct 2018 09:17:46 +0200
Subject: [Buildroot] [PATCH] meson: bump version to 0.48.1
In-Reply-To: <20181019211039.GA14986@itchy>
References: <20181018204431.29117-1-eric.le.bihan.dev@free.fr>
 <20181019203050.5cdf56e0@gmx.net> <20181019203746.77ca985b@gmx.net>
 <20181019211039.GA14986@itchy>
Message-ID: <20181020091746.6f82c3e1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Fri, 19 Oct 2018 23:10:39 +0200, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> Hi!
> 
> On 2018-10-19 20:37, Peter Seiderer wrote:
> > On Fri, 19 Oct 2018 20:30:50 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> >  
> > > Hello Eric,
> > >
> > > On Thu, 18 Oct 2018 22:44:31 +0200, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> > >  
> > > > Bump version to 0.48.1 and re-add the RPATH patch.
> > > >
> > > > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > > > ---
> > > >  ...y-fix-RPATH-if-install_rpath-is-not-empty.patch | 31 ++++++++++++++++++++++
> > > >  package/meson/meson.hash                           |  4 +--
> > > >  package/meson/meson.mk                             |  2 +-
> > > >  3 files changed, 34 insertions(+), 3 deletions(-)
> > > >  create mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> > > >
> > > > diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> > > > new file mode 100644
> > > > index 0000000000..752042f7ec
> > > > --- /dev/null
> > > > +++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> > > > @@ -0,0 +1,31 @@
> > > > +From cb5af88b1102ea8379323f95b9588c0bef71f175 Mon Sep 17 00:00:00 2001
> > > > +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > > > +Date: Sat, 14 Jul 2018 11:18:45 +0200
> > > > +Subject: [PATCH] Only fix RPATH if install_rpath is not empty
> > > > +  
> > >
> > > Signed-off-by line missing here...
> > >  
> Good catch! Will fix.
> 
> > > With the patch applied I get the following error:
> > >  
> > > >>> host-meson 0.48.1 Building  
> > > (cd .../build/host-meson-0.48.1//; PATH=".../host/bin:.../host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/lib/mit/sbin" PYTHONNOUSERSITE=1  .../host/bin/python3 setup.py build  )
> > > Traceback (most recent call last):
> > >   File "setup.py", line 26, in <module>
> > >     from setuptools import setup
> > > ModuleNotFoundError: No module named 'setuptools'
> > >
> > > 	$ ls -d build/host-python*
> > > build/host-python-2.7.15
> > > build/host-python3-3.7.0
> > > build/host-python-setuptools-40.0.0  
> >
> > graph-depends.pdf shows the following host-meson dependencies:
> >
> > - host-meson --> host-python3
> > - host-meson --> host-python-setuptools --> host-python
> > - host-meson --> host-ninja --> host-python
> >
> > Maybe host-python-setuptools are build for the wrong python version (python2 instead of python3)?  
> 
> I got the same issue and thought that was related to using an old build
> environment and not a fresh one.
> 
> The package host-python-setuptools was using $(HOST_DIR)/bin/python,
> symlinked to $(HOST_DIR)/bin/python2.7. Symlinking to python3 and
> rebuilding host-python-setuptools solves host-meson build issue, but
> that is not a proper solution.

Maybe a host-python3-setuptools package needed?

> 
> I'm a bit puzzled... If for some reason host-meson had been built before
> a package requiring host-python2 and host-python-setuptools, would the build
> of this package fail due to host-python-setuptools having been built
> for host-python3?

And host-pyhton-setuptools changed to always build for python2?

Regards,
Peter

> 
> Thanks for the review.
> 
> Regards,
> 
> --
> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
