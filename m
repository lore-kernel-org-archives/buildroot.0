From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:55:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-matplotlib: new package
In-Reply-To: <1557417530-25084-3-git-send-email-jugurtha.belkalem@smile.fr>
 (Jugurtha BELKALEM's message of "Thu, 9 May 2019 17:58:50 +0200")
References: <1557417530-25084-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557417530-25084-3-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <871s0twiv3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jugurtha" == Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> writes:

 > Matplotlib is a Python 2D plotting library
 > which produces publication quality figures
 > in a variety of hardcopy formats and interactive
 > environments across platforms.

 > More information is available at:
 > https://matplotlib.org/.

 > Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > ---
 >  DEVELOPERS                                         |  1 +
 >  package/Config.in                                  |  1 +
 >  .../0001-Fix-invalid-inclusion-headers.patch       | 29 ++++++++++++++++++++++
 >  package/python-matplotlib/Config.in                | 22 ++++++++++++++++
 >  package/python-matplotlib/python-matplotlib.hash   |  4 +++
 >  package/python-matplotlib/python-matplotlib.mk     | 16 ++++++++++++
 >  6 files changed, 73 insertions(+)
 >  create mode 100644 package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
 >  create mode 100644 package/python-matplotlib/Config.in
 >  create mode 100644 package/python-matplotlib/python-matplotlib.hash
 >  create mode 100644 package/python-matplotlib/python-matplotlib.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 4bb18fb..b7f27f6 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1229,6 +1229,7 @@ F:	package/qt5/qt5wayland/
 
 >  N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 >  F:	package/python-cycler/
 > +F:	package/python-matplotlib/
 
 >  N:	Juha Rantanen <juha@codercoded.com>
 >  F:	package/acsccid/
 > diff --git a/package/Config.in b/package/Config.in
 > index 80622b5..002feb9 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -932,6 +932,7 @@ menu "External python modules"
 >  	source "package/python-markdown/Config.in"
 >  	source "package/python-markdown2/Config.in"
 >  	source "package/python-markupsafe/Config.in"
 > +	source "package/python-matplotlib/Config.in"
 >  	source "package/python-mbstrdecoder/Config.in"
 >  	source "package/python-meld3/Config.in"
 >  	source "package/python-mimeparse/Config.in"
 > diff --git a/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch b/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
 > new file mode 100644
 > index 0000000..b10bfb3
 > --- /dev/null
 > +++ b/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
 > @@ -0,0 +1,29 @@
 > +From b0232c3cf1051749dd1e2bd0ec7c5c0a3a008d2f Mon Sep 17 00:00:00 2001
 > +From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > +Date: Thu, 9 May 2019 15:06:36 +0200
 > +Subject: [PATCH] Fix invalid inclusion headers
 > +
 > +By default, matplotlib includes headers from host
 > +machine which breaks the build process.
 > +
 > +Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > +---
 > + python-matplotlib-3.0.3/setupext.py | 2 +-
 > + 1 file changed, 1 insertion(+), 1 deletion(-)
 > +
 > +diff --git a/setupext.py b/setupext.py
 > +index fc82d5d..eb978d2 100644
 > +--- a/setupext.py
 > ++++ b/setupext.py
 > +@@ -267,7 +267,7 @@ def get_base_dirs():
 > +         'gnu0': ['/usr'],
 > +         'aix5': ['/usr/local'],
 > +         }
 > +-    return basedir_map.get(sys.platform, ['/usr/local', '/usr'])
 > ++    return basedir_map.get(sys.platform, [])
 > + 
 > + 
 > + def get_include_dirs():
 > +-- 
 > +2.7.4
 > +
 > diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
 > new file mode 100644
 > index 0000000..7f775ea
 > --- /dev/null
 > +++ b/package/python-matplotlib/Config.in
 > @@ -0,0 +1,22 @@
 > +config BR2_PACKAGE_PYTHON_MATPLOTLIB
 > +	bool "python-matplotlib"
 > +	depends on !BR2_PACKAGE_PYTHON
 > +	depends on BR2_PACKAGE_PYTHON3
 > +	select BR2_PACKAGE_FREETYPE # runtime
 > +	select BR2_PACKAGE_LIBPNG # runtime
 > +	select BR2_PACKAGE_PYTHON_CYCLER
 > +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 > +	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 > +	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 > +	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 > +	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 > +	select BR2_PACKAGE_ZLIB # runtime
 > +	help
 > +	  Matplotlib strives to produce publication
 > +	  quality 2D graphics for interactive graphing,
 > +	  scientific publishing, user interface
 > +	  development and web application servers targeting
 > +	  multiple user interfaces and hardcopy output
 > +	  formats.
 > +
 > +	  https://matplotlib.org/
 > diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
 > new file mode 100644
 > index 0000000..ccb22ee
 > --- /dev/null
 > +++ b/package/python-matplotlib/python-matplotlib.hash
 > @@ -0,0 +1,4 @@
 > +# sha256 from https://pypi.org/project/matplotlib/#files
 > +sha256	e1d33589e32f482d0a7d1957bf473d43341115d40d33f578dad44432e47df7b7  matplotlib-3.0.3.tar.gz
 > +# Locally computed sha256 checksums
 > +sha256	5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
 > diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
 > new file mode 100644
 > index 0000000..bfa42fa
 > --- /dev/null
 > +++ b/package/python-matplotlib/python-matplotlib.mk
 > @@ -0,0 +1,16 @@
 > +################################################################################
 > +#
 > +# python-matplotlib
 > +#
 > +################################################################################
 > +
 > +PYTHON_MATPLOTLIB_VERSION = 3.0.3
 > +PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
 > +PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/26/04/8b381d5b166508cc258632b225adbafec49bbe69aa9a4fa1f1b461428313
 > +PYTHON_MATPLOTLIB_LICENSE = PSF

In python3, we call the python license Python-2.0, so I've used that
here as well.

 > +PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE

The actual license file (and the reference in the .hash file) is for
LICENSE/LICENSE, so I've used that instead.


> +PYTHON_MATPLOTLIB_DEPENDENCIES = freetype host-python-numpy \
 > +	libpng python-cycler

Quoting https://matplotlib.org/users/installing.html:

Matplotlib depends on non-Python libraries.

On Linux and OSX, pkg-config can be used to find required non-Python
libraries and thus make the install go more smoothly if the libraries
and headers are not in the expected locations.

So I've added host-pkgconfig to _DEPENDENCIES and applied to next,
thanks.

-- 
Bye, Peter Korsgaard
