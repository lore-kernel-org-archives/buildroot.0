From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 9 Jan 2018 01:47:42 +0000
Subject: [Buildroot] [PATCH 3/8] python-setuptools: check host-python
 version
In-Reply-To: <20180105212908.7a048009@windsurf>
References: <20180102163337.6334-1-aduskett@gmail.com>
 <20180102163337.6334-4-aduskett@gmail.com>
 <1514931195.26695.184.camel@impinj.com> <20180105212908.7a048009@windsurf>
Message-ID: <1515462462.25398.31.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2018-01-05 at 21:29 +0100, Thomas Petazzoni wrote:
> n Tue, 2 Jan 2018 22:13:15 +0000, Trent Piepho wrote:
> > On Tue, 2018-01-02 at 11:33 -0500, Adam Duskett wrote:
> > > 
> > > +ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
> > > +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python3
> > > +HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
> > > +else
> > > +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python
> > > +HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
> > > +endif  
> > 
> > From why I see in pkg-python, the default behavior for host packages is
> > to depend on the default interpreter, which is python3 if enabled
> > otherwise python2.  Isn't the above block basically doing the same
> > thing?  Other than using HOST_PYTHON3 rather than PYTHON3.
> > 
> > But shouldn't this be changed in pkg-python?
> > 
> > Then setting <PKG>_NEEDS_HOST_PYTHON based on why python version is in
> > use could be eliminated, unless the package needs a specific version,
> > which appear to be how it's supposed to work.
> 
> See my reply to this patch, which explains why it is (IMO) broken.
> 

If I understand correctly, the fundamental problem is that Adam's patch
allows for simultaneously enabling both host python2 and host python3
and building host python packages using both python versions or a
version different than the target python version.

But I think Adam pointed out a real flaw that can be fixed.  It's
caused problems for me as well.

The issue is that the host python version is linked to the target
python version.  Which is fine, if there is a target python.  But the
logic fails if there is no target python.

Right now, one gets this:
Target Python 2 -> Host Python 2
Target Python 3 -> Host Python 3
No Target Python -> Host Python 2

I'd like to build host python 3 utilities and don't have python on the
target.  Can't see a way to configure buildroot to do that.  I can add
a build dep on host-python3 and get the interpreter built, but I can't
make a host-python-package using python3.

I think this could be fixed by making host python config options, which
are forced by the target python configs, so that host python can only
be selected manually if no target python is enabled.

Packages that want to depend on host python should use the host python
config to select which python to depends on, rather than the target
python config as they do now.  If target python is enabled, then host
python == target python so there is no change.  But without target
python it will be possible to build select either host-python3 or host-
python as the python version to be used by host-python-setuptools.
