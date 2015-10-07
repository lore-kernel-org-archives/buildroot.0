From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2015 23:00:56 +0100
Subject: [Buildroot] [PATCH 2/2] Add new package PyQtGraph
In-Reply-To: <1444240379-22896-3-git-send-email-guillaume.bressaix@gmail.com>
References: <1444240379-22896-1-git-send-email-guillaume.bressaix@gmail.com>
 <1444240379-22896-3-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <56159618.9040107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Guillaume,

 Thank you for your contribution. I have some comments below, could you adapt
your patch accordingly and resubmit?

 First of all, we require all commits to carry a Signed-off-by tag by which you
certify that you have the right to contribute this commit under the Buildroot
license (GPLv2). See [1].

 Second, the addition in the package/Config.in menu should be done in the same
commit, otherwise the commit is not stand-alone.

 Third, we typically use the following commit summary for new packages:

pyqtgraph: new package


 When you resubmit, please provide a patch changelog that indicates what you
have changed compared to this version.


On 07-10-15 18:52, Guillaume William Bres wrote:
> ---
>  package/python-pyqtgraph/Config.in             |   14 ++++++++++++++
>  package/python-pyqtgraph/python-pyqtgraph.hash |    5 +++++
>  package/python-pyqtgraph/python-pyqtgraph.mk   |   15 +++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 package/python-pyqtgraph/Config.in
>  create mode 100644 package/python-pyqtgraph/python-pyqtgraph.hash
>  create mode 100644 package/python-pyqtgraph/python-pyqtgraph.mk
> 
> diff --git a/package/python-pyqtgraph/Config.in b/package/python-pyqtgraph/Config.in
> new file mode 100644
> index 0000000..14619e3
> --- /dev/null
> +++ b/package/python-pyqtgraph/Config.in
> @@ -0,0 +1,14 @@
> +comment "PyQtGraph requires a GLibc Toolchain w/ WCHAR and C++."

 No need for all the capitalisation or punctuation, also we have a standard
formulation:

comment "python-pyqtgraph nees a (e)glibc toolchain w/ wchar and C++"

 But actually, you don't have this dependency below, so I'm not sure where you
get it from?

 That said, I think you should not depend on python-pyqt, but select it. And
then you have to propagate the pyqt dependencies. In addition, you have to
propagate the numpy dependencies. Gwenhael has just posted a patch to make that
easier, so it would become:

comment "python-pyqtgraph needs a toolchain w/ C++, threads"
	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
	depends on BR2_USE_MMU
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

config BR2_PACKAGE_PYTHON_PYQTGRAPH
	bool "python-pyqtgraph"
	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
	depends on BR2_USE_MMU # pyqt -> qt
	depends on BR2_INSTALL_LIBSTDCPP # pyqt -> qt
	depends on BR2_TOOLCHAIN_HAS_THREADS # pyqt -> qt

(if you cut & paste this, take care that it starts with tab, not spaces).

> +	depends on BR2_PACKAGE_PYTHON_PYQT
> +
> +config BR2_PACKAGE_PYTHON_PYQTGRAPH
> +	bool "python-pyqtgraph"
> +	depends on BR2_PACKAGE_PYTHON_PYQT
> +	select BR2_PACKAGE_PYTHON_PYEXPAT
> +	select BR2_PACKAGE_QT_SVG

 That depends on BR2_PACKAGE_QT_GUI_MODULE, so you have to select that as well.

> +	select BR2_PACKAGE_PYTHON_NUMPY
> +	help
> +	  PyQtGraph is a pure Python graphics and GUI library built on PyQt4, PySide and Numpy. 

 You should wrap lines at 72 columns (where tab counts as 8 spaces, so 62 real
characters).

> +	  Official website:
> +
> +	  http://www.pyqtgraph.org/
> diff --git a/package/python-pyqtgraph/python-pyqtgraph.hash b/package/python-pyqtgraph/python-pyqtgraph.hash
> new file mode 100644
> index 0000000..0a43fbc
> --- /dev/null
> +++ b/package/python-pyqtgraph/python-pyqtgraph.hash
> @@ -0,0 +1,5 @@
> +# From http://www.pyqtgraph.org/downloads/pyqtgraph-0.9.10.tar.gz 

 This should specify the place where you can find the MD5, not where you
downloaded it.

> +md5 6e2efa185b6b9227dfe16fefd921a8ec  pyqtgraph-0.9.10.tar.gz
> +
> +# Locally calculated:
> +sha256 4c0589774e3c8b0c374931397cf6356b9cc99a790215d1917bb7f015c6f0729a  pyqtgraph-0.9.10.tar.gz
> diff --git a/package/python-pyqtgraph/python-pyqtgraph.mk b/package/python-pyqtgraph/python-pyqtgraph.mk
> new file mode 100644
> index 0000000..dbc3598
> --- /dev/null
> +++ b/package/python-pyqtgraph/python-pyqtgraph.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pyqtgraph
> +#
> +################################################################################
> +
> +PYTHON_PYQTGRAPH_VERSION = 0.9.10
> +PYTHON_PYQTGRAPH_SOURCE = pyqtgraph-$(PYTHON_PYQTGRAPH_VERSION).tar.gz
> +PYTHON_PYQTGRAPH_SITE = http://www.pyqtgraph.org/downloads
> +PYTHON_PYQTGRAPH_LICENSE = MIT
> +PYTHON_PYQTGRAPH_LICENSE_FILES = COPYING
> +PYTHON_PYQTGRAPH_SETUP_TYPE = distutils
> +PYTHON_PYQTGRAPH_DEPENDENCIES = python-pyqt

 Are numpy and pyexpat runtime dependencies only? If so, you should add comments
to that effect in Config.in.


 I have marked your patches as Changes Requested in our patch tracking system
[2], so we will forget about your patches unless you send a new version.

 Thanks!

 Regards,
 Arnout


[1] http://buildroot.org/manual.html#submitting-patches
[2] http://patchwork.ozlabs.org/project/buildroot/list/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
