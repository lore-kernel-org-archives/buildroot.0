From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 18 Jan 2013 15:06:12 +0100
Subject: [Buildroot] [PATCH 1/3] python3: Point /usr/bin/python to python3
	if python is not selected
Message-ID: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes #5702

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/python3/python3.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index bcd83ea..0d54162 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -148,5 +148,12 @@ PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
 
 PYTHON3_AUTORECONF = YES
 
+define PYTHON3_INSTALL_SYMLINK
+	ln -fs python3 $(TARGET_DIR)/usr/bin/python
+endef
+
+ifneq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
+endif
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
