From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Oct 2019 13:38:18 -0600
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with python 3.8
Message-ID: <20191020193818.85518-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/71bf937339705a520e047d12c146229ec42a76f2

Details:
 - https://bugs.python.org/issue36721

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/kmod/kmod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index a5bcf2f2d6..a63fe99d91 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -45,6 +45,10 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
 KMOD_CONF_OPTS += --enable-python
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+KMOD_CONF_ENV += \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
-- 
2.20.1
