From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 16:40:16 +0200
Subject: [Buildroot] [git commit] scons: force host-python dependency to be
	python2
Message-ID: <20140405153937.BF0E09BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68d8f4e69bdc5b4e09232f3c970963a1f660ad54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: take into account the rename of the new variable to
<pkg>_NEEDS_HOST_PYTHON.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/scons/scons.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index e3fad1b..42a703c 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,10 +10,12 @@ SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
+HOST_SCONS_NEEDS_HOST_PYTHON = python2
+
 HOST_SCONS_INSTALL_OPT = \
 	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/scons
+SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons
