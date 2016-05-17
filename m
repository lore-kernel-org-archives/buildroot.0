From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:47:33 +0200
Subject: [Buildroot] [git commit branch/next] python: remove *.pyo files
Message-ID: <20160517204800.6FCC581EE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59972daa39fe90de7c353eaa79834571efb4cd08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Even though we disable the build of .pyo files in the interpreter,
nothing prevents other packages to install them. Since we only want to
keep either .py or .pyc or both, let's add a target finalize hooks
that removes all .pyo files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: add --no-run-if-empty option to xargs, as suggested by Samuel.]
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python/python.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 819d32b..c96d218 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -230,3 +230,11 @@ define PYTHON_REMOVE_PYC_FILES
 endef
 TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
 endif
+
+# In all cases, we don't want to keep the optimized .pyo files
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+define PYTHON_REMOVE_PYO_FILES
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | xargs -0 --no-run-if-empty rm -f
+endef
+TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYO_FILES
+endif
