From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 22:07:14 +0100
Subject: [Buildroot] [git commit master 1/1] Remove .py or .pyc depending on
	Python configuration
Message-ID: <20110125211621.2D3E88D245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b0c86bcc57b1bd714dc0d1cc719ffdfd6f0663dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do this at a global level since several packages can install
Python modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index cf2a7dc..a5a37a1 100644
--- a/Makefile
+++ b/Makefile
@@ -438,6 +438,12 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 endif
+ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
+	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
+endif
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
+endif
 	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-- 
1.7.3.4
