From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 31 Dec 2018 19:29:47 +0100
Subject: [Buildroot] [PATCH 2/3] package/pkg-python: use
 host-python3-setuptools when needed
In-Reply-To: <CALFsTFU17PM5oHOmo7d4ntvF84H4cOvgOv+LL+LEapHMLia+3Q@mail.gmail.com>
References: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
 <20181228170132.13049-3-thomas.petazzoni@bootlin.com>
 <CALFsTFU17PM5oHOmo7d4ntvF84H4cOvgOv+LL+LEapHMLia+3Q@mail.gmail.com>
Message-ID: <CAGm1_ksSYLmRkfXqoNqfyGLxQqVATBKuqjWJH=2nFqE9g28yZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 29, 2018 at 4:15 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Hello,
>
> On Fri, Dec 28, 2018 at 7:01 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > When a package uses "setuptools" as its <pkg>_SETUP_TYPE, we currently
> > add a dependency on host-python-setuptools. This means that:
> >
> >  (1) When BR2_PACKAGE_PYTHON=y, the default host Python version is
> >      Python 2.x, and host-python-setuptools is installed for
> >      host-python.
> >
> >  (2) When BR2_PACKAGE_PYTHON3=y, the default host Python version is
> >      Python 3.x, and host-python-setuptools is installed for
> >      host-python3.
> >
> >  (3) When no target Python interpreter is selected, the default host
> >      Python version is Python 2.x, and host-python-setuptools is
> >      installed for host-python.
> >
> > Situations (1) and (3) are problematic for host Python packages that
> > need Python 3.x. Such packages use <pkg>_NEEDS_HOST_PYTHON = python3,
> > but if they use setuptools as their setup type, they will not find
> > setuptools installed for host-python3 in situations (1) and (3)
> > described above.
> >
> > We currently have a single package that sets <pkg>_NEEDS_HOST_PYTHON =
> > python3: host-meson. host-meson generally works because if setuptools
> > is not found, it falls back to distutils, which is part of the
> > standard Python library. However, if there is a setuptools version
> > installed system-wide, it may be picked up, but may not necessarily be
> > the same version as Buildroot setuptools, potentially causing
> > problems.
> >
> > This commit makes the necessary change to the python-package
> > infrastructure to fix this behavior, by identifying the following
> > cases:
> >
> >  - When a host Python package says <pkg>_NEEDS_HOST_PYTHON = python3,
> >    then we know it wants setuptools installed for host-python3, so we
> >    use host-python3-setuptools.
> >
> >  - When a host Python package says <pkg>_NEEDS_HOST_PYTHON = python2,
> >    then we known it wants setuptools installed for host-python, so we
> >    use host-python-setuptools.
> >
> >  - When BR2_PACKAGE_PYTHON3=y, and we have a target package, or a host
> >    package with no NEEDS_HOST_PYTHON option, then we want setuptools
> >    installed for host-python3, so we use host-python3-setuptools.
> >
> >  - When BR2_PACKAGE_PYTHON=y or no target interpreter is enabled at
> >    all, and we have a target package, or a host package with no
> >    NEEDS_HOST_PYTHON option, then we want setuptools for host-python,
> >    so we use host-python-setuptools.
> >
> > To make this happen, we use host-python3-setuptools introduced in a
> > previous commit, but we also change host-python-setuptools to force
> > its installation for host-python. The latter is needed if you build
> > with BR2_PACKAGE_PYTHON3=y but want to install a Python-based package
> > that has NEEDS_HOST_PYTHON=python2.
> >
> > There is one single package that needs be adjusted following this:
> > lirc-tools, because it is not using the python-package
> > infrastructure. It directly depends on host-python-setuptools, which
> > no longer works because host-python-setuptools now only installs for
> > Python 2.x, while lirc-tools Python binding only supports Python
> > 3.x. Switching to host-python3-setuptools solves this problem.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  package/lirc-tools/lirc-tools.mk              |  2 +-
> >  package/pkg-python.mk                         | 35 ++++++++++++++-----
> >  .../python-setuptools/python-setuptools.mk    |  1 +
> >  3 files changed, 29 insertions(+), 9 deletions(-)
> >
> > diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
> > index a5165ad438..e468f2a25d 100644
> > --- a/package/lirc-tools/lirc-tools.mk
> > +++ b/package/lirc-tools/lirc-tools.mk
> > @@ -46,7 +46,7 @@ LIRC_TOOLS_DEPENDENCIES += libftdi1
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > -LIRC_TOOLS_DEPENDENCIES += python3 host-python-setuptools
> > +LIRC_TOOLS_DEPENDENCIES += python3 host-python3-setuptools
> >  LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV="$(PKG_PYTHON_SETUPTOOLS_ENV)"
> >  endif
> >
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 3dc8a5d10f..b641e3f865 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -188,16 +188,35 @@ endif
> >  endif # ($$($(2)_NEEDS_HOST_PYTHON),)
> >  endif # ($(4),target)
> >
> > -# Setuptools based packages will need host-python-setuptools (both
> > -# host and target). We need to have a special exclusion for the
> > -# host-setuptools package itself: it is setuptools-based, but
> > -# shouldn't depend on host-setuptools (because it would otherwise
> > -# depend on itself!).
> > +# Setuptools based packages will need setuptools for the host Python
> > +# interpreter (both host and target).
> > +#
> > +# If we have a host package that says "I need Python 3", we install
> > +# setuptools for python3.
> > +#
> > +# If we have a host packge that says "I need Python 2", we install
> > +# setuptools for python2.
> > +#
> > +# If we have a target package, or a host package that doesn't have any
> > +# <pkg>_NEEDS_HOST_PYTHON, and BR2_PACKAGE_PYTHON3 is used, then
> > +# Python 3.x is the default Python interpreter, so we install
> > +# setuptools for python3.
> > +#
> > +# In all other cases, we install setuptools for python2. Those other
> > +# cases are: a target package or host package with
> > +# BR2_PACKAGE_PYTHON=y, or a host-package with neither
> > +# BR2_PACKAGE_PYTHON3=y or BR2_PACKAGE_PYTHON=y.
> >  ifeq ($$($(2)_SETUP_TYPE),setuptools)
> > -ifneq ($(2),HOST_PYTHON_SETUPTOOLS)
> > -$(2)_DEPENDENCIES += host-python-setuptools
> > -endif
> > +ifeq ($(4):$$($(2)_NEEDS_HOST_PYTHON),host:python3)
> > +$(2)_DEPENDENCIES += $$(if $$(filter host-python3-setuptools,$(1)),,host-python3-setuptools)
> > +else ifeq ($(4):$$($(2)_NEEDS_HOST_PYTHON),host:python2)
> > +$(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> > +else ifeq ($$(BR2_PACKAGE_PYTHON3),y)
> > +$(2)_DEPENDENCIES += $$(if $$(filter host-python3-setuptools,$(1)),,host-python3-setuptools)
> > +else
> > +$(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> >  endif
> > +endif # SETUP_TYPE
> >
> >  # Python interpreter to use for building the package.
> >  #
> > diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> > index cc6f991cdd..d915449c5d 100644
> > --- a/package/python-setuptools/python-setuptools.mk
> > +++ b/package/python-setuptools/python-setuptools.mk
> > @@ -10,6 +10,7 @@ PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861
> >  PYTHON_SETUPTOOLS_LICENSE = MIT
> >  PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
> >  PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
> > +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
> >
> >  define PYTHON_SETUPTOOLS_EXTRACT_CMDS
> >         $(UNZIP) -d $(@D) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
> > --
> > 2.20.1
> >
>
> Reviewed-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
