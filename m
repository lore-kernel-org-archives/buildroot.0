From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 6 Mar 2014 09:05:38 -0600
Subject: [Buildroot] [PATCH] scons: force host-python dependency to be
	python2
Message-ID: <1394118338-32284-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Scons build-system needs python2 as interpreter (it does not support
python3 yet).

So, we need to force the host dependency to get the python2 interperter
built and available in the host tree to be able to build host-scons
itself and to build scons-based packages, whatever is the python
interpreter for the target.

This patch also makes sure scons will in be called using the right
python interpreter when invoked via $(SCONS).

Fixes:
  http://autobuild.buildroot.net/results/11e6c8c8d79d56ed43daf52e6d6dc80847709926/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/scons/scons.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index e3fad1b..88396d4 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,10 +10,12 @@ SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
+HOST_SCONS_FORCE_HOST_PYTHON = python2
+
 HOST_SCONS_INSTALL_OPT = \
 	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/scons
+SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons
-- 
1.7.1
