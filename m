From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:44:59 +0100
Subject: [Buildroot] [git commit] package/qemu: remove broken/unneeded
 PYTHONPATH
Message-ID: <20181228104052.2814783A22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9000889da79b554e50c87fd5aad3aed11cf60bb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu uses the host-python when building, but the .mk file is pointing the
host-python interpreter to the target python site-packages, which is both
incorrect and also unneeded.

Qemu doesn't need any extra packages [1], so there's no need to provide
this path.  And indeed qemu builds fine when setting the path to a
non-existent directory.

Since target qemu neither depends on nor selects target python, it's
quite possible to build qemu without a target python, in which case the
supplied PYTHONPATH is a non-existent directory.

But even if qemu did want a python package, pointing the host-python to
the target site-packages will not work.  The package could contain a
compiled shared library for the target architecture that the host python
can not load.  This can be tested by adding "import numpy" to one of
qemu's python scripts and observing target python-numpy failing to load
when the script is run at build time.

[1] https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg01758.html
  "Avoid third-party package dependencies - QEMU currently has none!"

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a1bd7e5d6e..3f51e88e1c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -26,8 +26,7 @@ QEMU_OPTS =
 
 QEMU_VARS = \
 	LIBTOOL=$(HOST_DIR)/bin/libtool \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+	PYTHON=$(HOST_DIR)/bin/python2
 
 # If we want to specify only a subset of targets, we must still enable all
 # of them, so that QEMU properly builds its list of default targets, from
