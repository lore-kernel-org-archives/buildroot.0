From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon,  5 Oct 2015 10:48:52 +0200
Subject: [Buildroot] [PATCH v3 1/1] gnuradio: gnuradio-python: add missing
	dependency to python-numpy
Message-ID: <1444034932-6251-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Some gnuradio python blocks needs python-numpy present.

Without python-numpy, gnuradio-python based apps fails with traceback like:

Traceback (most recent call last):
  File "./top_block.py", line 18, in <module>
    from gnuradio import analog
  File "/usr/lib/python2.7/site-packages/gnuradio/analog/__init__.py", line 35, in <module>
    from am_demod import *
  File "/usr/lib/python2.7/site-packages/gnuradio/analog/am_demod.py", line 22, in <module>
    from gnuradio import gr
  File "/usr/lib/python2.7/site-packages/gnuradio/gr/__init__.py", line 44, in <module>
    from top_block import *
  File "/usr/lib/python2.7/site-packages/gnuradio/gr/top_block.py", line 30, in <module>
    from hier_block2 import hier_block2
  File "/usr/lib/python2.7/site-packages/gnuradio/gr/hier_block2.py", line 26, in <module>
    import pmt
  File "/usr/lib/python2.7/site-packages/pmt/__init__.py", line 58, in <module>
    from pmt_to_python import pmt_to_python as to_python
  File "/usr/lib/python2.7/site-packages/pmt/pmt_to_python.py", line 22, in <module>
    import numpy
ImportError: No module named numpy

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v3:
 * Since commit 826a2bc18bc0be0b08f2926c9fa1819fe909557c no special attentions
   is needed to select python-numpy. So BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
   is no more needed
Changes v1 -> v2:
 * Add dependy to BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS;
 * gnuradio-python select numpy;
 * gnuradio-utils select again gnuradio-python;
 * fix commit message
---
 package/gnuradio/Config.in   | 1 +
 package/gnuradio/gnuradio.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index e264a21..3b4463f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Enable python component
 
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index fc5cd1f..565c113 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -86,7 +86,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += python
+GNURADIO_DEPENDENCIES += python python-numpy
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
-- 
2.4.9
