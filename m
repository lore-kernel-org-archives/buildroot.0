From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:51:19 +0100
Subject: [Buildroot] [git commit] core: remove .py/.pyc for Python
Message-ID: <20140228133413.760DB9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88b638223baf85b14d141d289ca41286c6a9e7e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main Buildroot Makefile was removing *.py or *.pyc if Python 2 was
enabled, but for Python 3, this action was taken care of by a post
install target hook of python3.mk, which means it wouldn't work with
external modules (the .py/.pyc removal would be done before external
Python modules are installed).

We fix this by making the global *.py/*.pyc removal in the main
Makefile work for both Python 2 and Python 3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ddb1f6a..20aabd6 100644
--- a/Makefile
+++ b/Makefile
@@ -522,10 +522,10 @@ endif
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
-ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
+ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY)$(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
 endif
-ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
