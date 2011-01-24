From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:32 +0100
Subject: [Buildroot] [PATCH 04/10] python: Fix make install (Workaround
	python's bug #1669349)
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4296ba102fef16511aabed8143a151af179a898a.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime.ripard@anandra.org>

Signed-off-by: Maxime Ripard <ripard@archos.com>
---
 package/python/python.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 5c85c59..3afc132 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -128,7 +128,15 @@ ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 endif
 	rm -rf $(PYTHON_DIR)/Lib/test
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
-	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) install \
+	# FIXME: The make -i just below is to work around python's bug
+	# #1669349 (http://bugs.python.org/issue1669349) which is introducing
+	# a failure at make install on a python-free system. Since none of
+	# the other the provided workaround work, the make -i is the only
+	# solution. The failing lib is install later in the process, so
+	# even if the compilation is failing without the patch, with it, the
+	# target python is fully functionnal.
+	# The "-i" will have to be removed when the bug will be solved.
+	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) -i install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
-- 
1.7.0.4
