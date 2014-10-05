From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:32:41 +0200
Subject: [Buildroot] [git commit] python3: remove unneeded __pycache__
	directories
Message-ID: <20141005123249.992EFB0934@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce0f19e5f64364125448e91590e4843bb2f79570
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The __pycache__ directories are only needed on PEP3147-enabled
installations, which is not the choice Buildroot has made. However,
during the build process of the target Python, the separation between
the target and host Python is not entirely complete, and starting the
host Python to byte-compile the target Python modules triggers the
compilation of a bunch of __pycache__ directories by the host Python,
which uses a PEP 3147 installation.

For now, simply get rid of those useless directories after the
installation of Python is completed. In the long term, it would be
good to achieve a better isolation between the host and target build
to avoid this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 812b0a7..3b01550 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -142,6 +142,10 @@ define PYTHON3_REMOVE_USELESS_FILES
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/__pycache__/
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/lib-dynload/sysconfigdata/__pycache__
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/collections/__pycache__
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/importlib/__pycache__
 endef
 
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
