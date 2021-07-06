From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:50 +0200
Subject: [Buildroot] [PATCH v2 07/18] package/pkg-python: remove
 _sysconfigdata*.pyc files when _sysconfigdata*.py are changed
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-8-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to avoid _sysconfigdata*.pyc overwrites when they are generated based on
_sysconfigdata*.py changes, this commit simply removes _sysconfigdata*.pyc
whenever _sysconfigdata*.py are changed.

As they are removed, overwrite detection will no longer trig and coherency between
the two files (.py and .pyc) is ensured.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes from v1 to v2:
 - Used separate shells for the two 'find' commands.
 - Used '-deleted' to remove files

 package/pkg-python.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 59a48e5a87..1e4fd5ba33 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -97,6 +97,8 @@ define PKG_PYTHON_FIXUP_SYSCONFIGDATA
 	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
 		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
 		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
+	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
+		-name "_sysconfigdata*.pyc" -delete
 endef
 endif
 
-- 
2.31.1
