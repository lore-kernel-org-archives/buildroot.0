From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:27:56 +0200
Subject: [Buildroot] [PATCH 3/8] python-u-msgpack: switch to setuptools
	instead of distutils
In-Reply-To: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170712162801.31131-4-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-u-msgpack can use setuptools instead of distutils, and
using setuptools is generally preferred.

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
 package/python-u-msgpack/python-u-msgpack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index a88beeb..89240c3 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -7,7 +7,7 @@
 PYTHON_U_MSGPACK_VERSION = 2.2
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
 PYTHON_U_MSGPACK_SITE = https://pypi.python.org/packages/66/5b/36fe0fcf290bd39f6ef6c1f5924cf0a9a76b0dc94575975ad7d318619cf9
-PYTHON_U_MSGPACK_SETUP_TYPE = distutils
+PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
 
-- 
2.9.4
