From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:28:56 +0200
Subject: [Buildroot] [git commit] gnuradio: break dependency chain by using
	'depends on'
Message-ID: <20151009212955.C0BCE81E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef531c6ded27b62462c74b964fad8f5c337da3a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the following recursive dependency:

package/python/Config.in:5:error: recursive dependency detected!
package/python/Config.in:5:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_GNURADIO_PYTHON
package/gnuradio/Config.in:46:	symbol BR2_PACKAGE_GNURADIO_PYTHON is selected by BR2_PACKAGE_GNURADIO_UTILS
package/gnuradio/Config.in:55:	symbol BR2_PACKAGE_GNURADIO_UTILS depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
package/python-numpy/Config.in:1:	symbol BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS depends on BR2_PACKAGE_PYTHON

by replacing the "select BR2_PACKAGE_PYTHON" by a "depends on
BR2_PACKAGE_PYTHON", and ditto for the BR2_PACKAGE_GNURADIO_PYTHON
selection.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 78ea5b7..603532c 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -45,17 +45,16 @@ config BR2_PACKAGE_GNURADIO_FEC
 
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
+	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST_PYTHON
-	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	help
 	  Enable python component
 
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	select BR2_PACKAGE_GNURADIO_PYTHON
+	depends on BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Misc python utilities
 
