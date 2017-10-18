From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Wed, 18 Oct 2017 16:03:04 +0200
Subject: [Buildroot] [PATCH 1/1] samba4: Make python2 dependency for waf
	explicit
In-Reply-To: <20171018140304.19737-1-christian.kellermann@solectrix.de>
References: <20171018140304.19737-1-christian.kellermann@solectrix.de>
Message-ID: <20171018140304.19737-2-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch the build environment will pick up python3 if it is a
dependency for other packages. Currently waf does not support
python3.

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
---
 ...ake-python-2.7-dependency-in-waf-explicit.patch | 27 ++++++++++++++++++++++
 package/samba4/samba4.mk                           |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 package/samba4/0002-Make-python-2.7-dependency-in-waf-explicit.patch

diff --git a/package/samba4/0002-Make-python-2.7-dependency-in-waf-explicit.patch b/package/samba4/0002-Make-python-2.7-dependency-in-waf-explicit.patch
new file mode 100644
index 0000000000..2a0d3696cd
--- /dev/null
+++ b/package/samba4/0002-Make-python-2.7-dependency-in-waf-explicit.patch
@@ -0,0 +1,27 @@
+From f7295def3f04d8d8c2d62d9525c0f741ef2f964b Mon Sep 17 00:00:00 2001
+From: Christian Kellermann <christian.kellermann@solectrix.de>
+Date: Wed, 18 Oct 2017 14:00:36 +0200
+Subject: [PATCH] Make python 2.7 dependency in waf explicit
+
+This prevents picking the wrong python during build as a Python3
+dependency will clobber the python symlink. Python3 is not
+supported (yet) in the samba4 build system.
+
+Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
+---
+ buildtools/bin/waf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildtools/bin/waf b/buildtools/bin/waf
+index 1b0f4662a56..f66b992e78c 100755
+--- a/buildtools/bin/waf
++++ b/buildtools/bin/waf
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ # encoding: ISO-8859-1
+ # Thomas Nagy, 2005-2010
+ 
+-- 
+2.12.1
+
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f8001bbe7f..76d3e58e77 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -89,11 +89,12 @@ define SAMBA4_CONFIGURE_CMDS
 	cp package/samba4/samba4-cache.txt $(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
-		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
+		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python2-config" \
 		python_LDFLAGS="" \
 		python_LIBDIR="" \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(SAMBA4_CONF_ENV) \
+		PYTHON=python2 \
 		./buildtools/bin/waf configure \
 			--prefix=/usr \
 			--sysconfdir=/etc \
@@ -115,6 +116,8 @@ define SAMBA4_CONFIGURE_CMDS
 	)
 endef
 
+TARGET_MAKE_ENV += PYTHON=python2 \
+
 define SAMBA4_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
-- 
2.12.1
