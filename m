From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:46:29 +0200
Subject: [Buildroot] [git commit branch/next] python: align the target
	finalize hooks with python3
Message-ID: <20160517204800.5F84A7FA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f76543601ff21af23e2828fcb9b3262378120d78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of python3 to 3.5.x, the target finalize hooks
registered by the python3 have been changed a little bit. For the sake
of consistency, this commit aligns the target finalize hooks
registered by the python package so that they look the same as the
ones used by python3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4ecd0d1..819d32b 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -218,15 +218,15 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
-define PYTHON_FINALIZE_TARGET
+define PYTHON_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
 endef
+TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
-define PYTHON_FINALIZE_TARGET
+define PYTHON_REMOVE_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
 endef
+TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
 endif
-
-TARGET_FINALIZE_HOOKS += PYTHON_FINALIZE_TARGET
