From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:31:19 +0200
Subject: [Buildroot] [git commit] python3: remove full path from .pyc
Message-ID: <20170401163704.8E596805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95ba0bb7e8d9d18b70e0216b931f64878bf41a2e
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
 package/python3/python3.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6189aa8..74f8116 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -247,9 +247,10 @@ endif
 define PYTHON3_CREATE_PYC_FILES
 	$(PYTHON3_FIX_TIME)
 	PYTHONPATH="$(PYTHON3_PATH)" \
-	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
-		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
+	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
+		$(TOPDIR)/support/scripts/pycompile.py \
+		$(if $(BR2_REPRODUCIBLE),--force) \
+		usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
