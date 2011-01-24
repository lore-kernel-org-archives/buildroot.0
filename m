From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:36 +0100
Subject: [Buildroot] [PATCH 08/10] Remove .py or .pyc depending on Python
	configuration
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ae3e42bc699cefc69cc523fb3969c94c32ca3a9d.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do this at a global level since several packages can install
Python modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 7e08cf3..1f37a1f 100644
--- a/Makefile
+++ b/Makefile
@@ -438,6 +438,14 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 endif
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
+	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
+endif
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
+endif
+endif
 	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-- 
1.7.0.4
