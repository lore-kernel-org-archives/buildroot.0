From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:30:07 +0200
Subject: [Buildroot] [git commit] python2: remove full path from .pyc
Message-ID: <20170401163704.661DE8261A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b014560f6fff100e89600f42f6882da0dcfe5b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

.pyc files include path to source .py file. This patch changes the way
`pycompile.py' is launched in order to only keep the part relative to
$TARGET_DIR.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index e430d74..22d9141 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -254,9 +254,10 @@ endif
 define PYTHON_CREATE_PYC_FILES
 	$(PYTHON_FIX_TIME)
 	PYTHONPATH="$(PYTHON_PATH)" \
-	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
-		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
+		$(TOPDIR)/support/scripts/pycompile.py \
+		$(if $(BR2_REPRODUCIBLE),--force) \
+		usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
