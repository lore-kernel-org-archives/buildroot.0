From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 22:32:55 +0200
Subject: [Buildroot] [git commit] python-setuptools: Add missing
	$(TARGET_DIR) to PYTHONPATH
Message-ID: <20130827210259.BB1A89B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b363ba5f389b3744937658f40f1e796e5447db3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The $(TARGET_DIR) variable is required when building
python-setuptools for the target otherwise the build system detects
the host installation which leads to permission error problems
like these:

Setuptools installation detected at /usr/lib64/python2.7/site-packages
Renaming /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
/usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
OSError: [Errno 13] Permission denied

Moreover, remove the PYTHONPATH variable for host variant since it's
not needed.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-setuptools/python-setuptools.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index cd5ee4d..73c819f 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -20,19 +20,18 @@ endef
 
 define PYTHON_SETUPTOOLS_BUILD_CMDS
 	(cd $(@D); \
-	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	$(HOST_DIR)/usr/bin/python setup.py build)
 endef
 
 define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
 	(cd $(@D); \
-	PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
 endef
 
 define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	$(HOST_DIR)/usr/bin/python setup.py install --executable=/usr/bin/python \
 	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
 endef
