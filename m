From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Mar 2021 15:02:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: use official tarball
Message-ID: <20210306140202.2251697-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use official tarball provided by pypi to avoid the following build
failures:

FileNotFoundError: [Errno 2] No such file or directory: 'cmake'

or

OSError: [Errno 2] No such file or directory: 'pybind11/include'

These failures are raised since version 2.60 and
https://github.com/pybind/pybind11/commit/fd61f5038eac57a96f0d2dbcf2a4f125bc91f1ca

Here is an extract of
https://github.com/pybind/pybind11/blob/master/.github/CONTRIBUTING.md:

"If you want to use the classic "direct" usage of python setup.py, you
will need CMake 3.15+ and either make or ninja preinstalled (possibly
via pip install cmake ninja), since directly running Python on setup.py
cannot pick up and install pyproject.toml requirements. As long as you
have those two things, though, everything works the way you would
expect:"

Fixes:
 - http://autobuild.buildroot.org/results/ee1ca23f082550a64dc3e169d95cda0f251c6fc1
 - http://autobuild.buildroot.org/results/07f4db8eaaae0e37edc8aa73635a4fa218bc1fa2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pybind/python-pybind.hash | 5 +++--
 package/python-pybind/python-pybind.mk   | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index a68ac846e2..4f3fc9a4a1 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,5 @@
-# Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pybind11/json
+md5  c87d54e1ca1d0982ad54af888c682d93  pybind11-2.6.1.tar.gz
+sha256  ab7e60a520fe6ae25eca939191bb2ac416cd58478ce754740238a8bf1af18934  pybind11-2.6.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index a6a1bdb976..97dd80ffc7 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYBIND_VERSION = 2.6.1
-PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
+PYTHON_PYBIND_SOURCE = pybind11-$(PYTHON_PYBIND_VERSION).tar.gz
+PYTHON_PYBIND_SITE = https://files.pythonhosted.org/packages/d8/47/2eb4be23fa8cc1a08c855c012c1aa4348d06ab1a5527f876515bbf689644
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
 PYTHON_PYBIND_SETUP_TYPE = setuptools
-- 
2.30.0
