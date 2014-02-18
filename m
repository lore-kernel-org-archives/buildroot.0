From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:39:59 +0100
Subject: [Buildroot] [PATCH v2 06/20] python3: add config directory symbolic
	link
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "kpa_info@yahoo.fr" <kpa_info@yahoo.fr>

When using host python to install an external module, the setup tool
look for some files in python3.3/config/. The python3 package config
directory is called config-3.3m. This is why we need to alias config
to config-3.3m.

[Thomas: use PYTHON3_VERSION_MAJOR instead of hardcoding 3.3, update
commit title.]

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ba72e75..d98ca38 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -163,7 +163,16 @@ define HOST_PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(HOST_DIR)/usr/bin/python
 endef
 
-HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
+# Alias the python<version>/config-<version>m to python<version>/config
+# This is needed when installing an external python module, because
+# the setup is looking for files in python<version>/config/
+define HOST_PYTHON3_INSTALL_CONFIG_SYMLINK
+	ln -fs config-$(PYTHON3_VERSION_MAJOR)m $(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOE)config
+endef
+
+HOST_PYTHON3_POST_INSTALL_HOOKS += \
+	HOST_PYTHON3_INSTALL_SYMLINK \
+	HOST_PYTHON3_INSTALL_CONFIG_SYMLINK
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
