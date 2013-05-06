From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 00:20:24 +0200
Subject: [Buildroot] [git commit] python-netifaces: use single version
	externally managed
Message-ID: <20130506222813.7F7F799C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=619146d145813b5040960b6008e68e63a8943832
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want --single-version-externally-managed (and --root=/) to make
python packages uncompressed (python eggs are zip files) since
compression should be a target filesystem responsibility.
And we don't need/want multiple versions of the same package in the
target since packages should be handled by buildroot on any sane
embedded system.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-netifaces/python-netifaces.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
