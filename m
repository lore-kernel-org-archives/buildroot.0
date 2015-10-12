From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 22:54:52 +0200
Subject: [Buildroot] [PATCH v2] pyqtgraph: new package
In-Reply-To: <1444260188-9571-1-git-send-email-guillaume.bressaix@gmail.com>
References: <Re: [Buildroot] [PATCH 2/2] Add new package PyQtGraph>
 <1444260188-9571-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20151012225452.007b3f11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume William Bres,

Thanks for this new version. Though I believe it still has some issues
(see below).

On Wed, 7 Oct 2015 17:23:08 -0600, Guillaume William Bres wrote:

> diff --git a/package/python-pyqtgraph/Config.in b/package/python-pyqtgraph/Config.in
> new file mode 100644
> index 0000000..f1c3a42
> --- /dev/null
> +++ b/package/python-pyqtgraph/Config.in
> @@ -0,0 +1,22 @@
> +comment "python-pyqtgraph requires a (e)glibc toolchain w/ wchar and C++"

So the comment says that you need eglibc with wchar and C++.

> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

But the dependencies have absolutely nothing to do with the comment.
Can you explain?

What you need is:

comment "python-pyqtgraph requires a toolchain w/ C++, threads"
	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
	depends on BR2_USE_MMU
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

> +
> +config BR2_PACKAGE_PYTHON_PYQTGRAPH
> +	bool "python-pyqtgraph"
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
> +	depends on BR2_USE_MMU # pyqt -> qt
> +	depends on BR2_INSTALL_LIBSTDCPP # pyqt -> qt
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pyqt -> qt
> +	select BR2_PACKAGE_PYTHON_PYQT
> +	select BR2_PACKAGE_PYTHON_NUMPY # runtime dependency
> +	select BR2_PACKAGE_PYTHON_PYEXPAT # runtime dependency

python-pyqt supports both Python 2 and Python 3. By doing this select
here, you break things if Python 3 is used. So you have two options:

 * If python-pyqtgraph only works with Python 2, add a "depends on
   BR2_PACKAGE_PYTHON"

 * If python-pyqtgraph works with both Python 2 and Python 3, you
   should:

	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3

(and of course do a build + run test with Python 3)

> +	select BR2_PACKAGE_QT_SVG # runtime dependency
> +	select BR2_PACKAGE_QT_GUI_MODULE
> +	help
> +	  Pyqtgraph is a pure Python graphics and GUI library built on PyQt4, 
> +	  PySide and Numpy. 
> +	  
> +	  Official website:
> +	  http://www.pyqtgraph.org/
> diff --git a/package/python-pyqtgraph/python-pyqtgraph.hash b/package/python-pyqtgraph/python-pyqtgraph.hash
> new file mode 100644
> index 0000000..c20eea2
> --- /dev/null
> +++ b/package/python-pyqtgraph/python-pyqtgraph.hash
> @@ -0,0 +1,5 @@
> +# From http://www.pyqtgraph.org/downloads
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

There is no file named COPYING in the source. It's named LICENSE.txt.

Could you fix those issues and post an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
