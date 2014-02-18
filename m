From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:39:58 +0100
Subject: [Buildroot] [PATCH v2 05/20] python3: add python -> python3 symlink
	for the host variant
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target python3 depends on host-python3, but most of the scripts
call "python", so we need to ensure that $(HOST_DIR)/usr/bin/python
exists. This patch achieves this by creating a python -> python3
symbolic link in $(HOST_DIR), just like we are already doing for the
target Python 3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d49fe48..ba72e75 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -159,5 +159,11 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
+define HOST_PYTHON3_INSTALL_SYMLINK
+	ln -fs python3 $(HOST_DIR)/usr/bin/python
+endef
+
+HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
