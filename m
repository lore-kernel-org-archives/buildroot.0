From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:27:55 +0200
Subject: [Buildroot] [PATCH 2/8] python-pyro: switch to setuptools instead
	of distutils
In-Reply-To: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170712162801.31131-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-pyro can use setuptools instead of distutils, and using
setuptools is generally preferred.

In addition, using setuptools allows to make sure the package will
continue to build when we will adjust the PYTHONPATH variable to no
longer point to target Python modules. Without such a change to
setuptools, the build would fail with:

=====================================================================
running install
Checking .pth file support in /home/test/buildroot/output/target/usr/lib/python2.7/site-packages/
/home/test/buildroot/output/host/bin/python -E -c pass
TEST FAILED: /home/test/buildroot/output/target/usr/lib/python2.7/site-packages/ does NOT support .pth files
error: bad install directory or PYTHONPATH

You are attempting to install a package to a directory that is not
on PYTHONPATH and which Python does not read ".pth" files from.  The
installation directory you specified (via --install-dir, --prefix, or
the distutils default setting) was:

    /home/test/buildroot/output/target/usr/lib/python2.7/site-packages/

and your PYTHONPATH environment variable currently contains:

    '/home/test/buildroot/output/target/usr/lib/python2.7/sysconfigdata/'

Here are some of your options for correcting the problem:

* You can choose a different installation directory, i.e., one that is
  on PYTHONPATH or supports .pth files

* You can add the installation directory to the PYTHONPATH environment
  variable.  (It must then also be on PYTHONPATH whenever you run
  Python and want to use the package(s) you are installing.)

* You can set up the installation directory to support ".pth" files by
  using one of the approaches described here:

  https://setuptools.readthedocs.io/en/latest/easy_install.html#custom-installation-locations
=====================================================================

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyro/python-pyro.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index bf916ba..06b4f45 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -9,6 +9,6 @@ PYTHON_PYRO_SOURCE = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
 PYTHON_PYRO_SITE = https://pypi.python.org/packages/61/68/0978adae315261b87acd216517c2c7f00780396e4d1426c5412458c6a28f
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
-PYTHON_PYRO_SETUP_TYPE = distutils
+PYTHON_PYRO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.9.4
