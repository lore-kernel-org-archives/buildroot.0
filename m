From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 22:58:33 +0200
Subject: [Buildroot] [git commit] gnuradio: add missing dependency to
	python-numpy for python support
Message-ID: <20151009205932.E3D3F7FC51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4202f92e6d58c06934d39596e91be6f98d12d7ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some gnuradio python blocks need python-numpy to be present. Without
python-numpy, gnuradio-python based apps fails, on runtime, with
traceback like:

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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index e264a21..78ea5b7 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -45,13 +45,16 @@ config BR2_PACKAGE_GNURADIO_FEC
 
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	help
 	  Enable python component
 
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Misc python utilities
