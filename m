From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  9 Apr 2019 22:46:30 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: add missing sublibrary
 license
Message-ID: <20190409204630.52594-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release 1.16.2 tarball doesn't contain all sublibraries license files
listed in the base LICENSE.txt file.
This makes python-numpy-legal-info incomplete.

- Add patch to add missing sublibrary license file:
  numpy/linalg/lapack_lite/LICENSE.txt
- its sha256 into hash file.
- update PYTHON_NUMPY_LICENSE adding:
  BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...03-Add-sublibraries-missing-licenses.patch | 61 +++++++++++++++++++
 package/python-numpy/python-numpy.hash        |  5 ++
 package/python-numpy/python-numpy.mk          |  8 ++-
 3 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 package/python-numpy/0003-Add-sublibraries-missing-licenses.patch

diff --git a/package/python-numpy/0003-Add-sublibraries-missing-licenses.patch b/package/python-numpy/0003-Add-sublibraries-missing-licenses.patch
new file mode 100644
index 0000000000..5b0bafe5b5
--- /dev/null
+++ b/package/python-numpy/0003-Add-sublibraries-missing-licenses.patch
@@ -0,0 +1,61 @@
+Add sublibraries license files
+
+On Release 1.16.2 tarball one license files is missing:
+- numpy/linalg/lapack_lite/LICENSE.txt
+
+Add it to sources to keep licensing information complete.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+
+diff -urpN numpy-1.15.2.orig/numpy/linalg/lapack_lite/LICENSE.txt numpy-1.16.2/numpy/linalg/lapack_lite/LICENSE.txt
+--- numpy-1.16.2.orig/numpy/linalg/lapack_lite/LICENSE.txt	1970-01-01 01:00:00.000000000 +0100
++++ numpy-1.16.2/numpy/linalg/lapack_lite/LICENSE.txt	2018-09-11 00:00:41.239919567 +0200
+@@ -0,0 +1,48 @@
++Copyright (c) 1992-2013 The University of Tennessee and The University
++                        of Tennessee Research Foundation.  All rights
++                        reserved.
++Copyright (c) 2000-2013 The University of California Berkeley. All
++                        rights reserved.
++Copyright (c) 2006-2013 The University of Colorado Denver.  All rights
++                        reserved.
++
++$COPYRIGHT$
++
++Additional copyrights may follow
++
++$HEADER$
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are
++met:
++
++- Redistributions of source code must retain the above copyright
++  notice, this list of conditions and the following disclaimer.
++
++- Redistributions in binary form must reproduce the above copyright
++  notice, this list of conditions and the following disclaimer listed
++  in this license in the documentation and/or other materials
++  provided with the distribution.
++
++- Neither the name of the copyright holders nor the names of its
++  contributors may be used to endorse or promote products derived from
++  this software without specific prior written permission.
++
++The copyright holders provide no reassurances that the source code
++provided does not infringe any patent, copyright, or any other
++intellectual property rights of third parties.  The copyright holders
++disclaim any liability to any recipient for claims brought against
++recipient by any third party for infringement of that parties
++intellectual property rights.
++
++THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
++A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
++OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index ef2aa7f16d..c2b0cd9c79 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -2,3 +2,8 @@
 sha256	8088221e6e27da8d5907729f0bfe798f526836f22cc59ae83a0f867e67416a3e	numpy-1.16.2.tar.gz
 # License files, locally calculated
 sha256	6b5086f61fe0c71564a79304ecbaa60f11fa3f3debf82f73d16a611cab102adc	LICENSE.txt
+sha256	426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
+sha256	154a8706fa0fdeff1073bf6239c4ecf51f562ab107066eef839dade1a45c824c	doc/scipy-sphinx-theme/LICENSE.txt
+sha256	a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
+sha256	badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
+sha256	d37526b4a34c0aa859afe6f9b7e64ca7c306b7430df8113dd5ac6fcb246bd2d4	numpy/core/src/multiarray/dragon4.c
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 20f42eab69..0da803b9f5 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -7,8 +7,12 @@
 PYTHON_NUMPY_VERSION = 1.16.2
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
-PYTHON_NUMPY_LICENSE = BSD-3-Clause
-PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
+PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
+PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
+			doc/scipy-sphinx-theme/LICENSE.txt \
+			numpy/linalg/lapack_lite/LICENSE.txt \
+			tools/npy_tempita/license.txt \
+			numpy/core/src/multiarray/dragon4.c
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
-- 
2.17.1
