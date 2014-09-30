From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 23:38:57 +0200
Subject: [Buildroot] [PATCH 2/6] python3: remove unneeded __pycache__
	directories
In-Reply-To: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412113141-17650-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 package/python3/python3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4941316..72c3bb1 100644
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
-- 
2.0.0
