From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 10:13:32 -0300
Subject: [Buildroot] [PATCH] python-netifaces: use single version externally
	managed
Message-ID: <1367846012-26041-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want --single-version-externally-managed (and --root=/) to make
python packages uncompressed (python eggs are zip files) since
compression should be a target filesystem responsibility.
And we don't need/want multiple versions of the same package in the
target since packages should be handled by buildroot on any sane
embedded system.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-netifaces/python-netifaces.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 906f83d..d742cbd 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -18,8 +18,10 @@ define PYTHON_NETIFACES_BUILD_CMDS
 endef
 
 define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
-	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+	(cd $(@D); \
+	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install \
+	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.5
