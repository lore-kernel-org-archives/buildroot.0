From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Tue, 24 Oct 2017 11:22:52 +0200
Subject: [Buildroot] [PATCH v1] samba4: Make python2 dependency for waf
	explicit
In-Reply-To: <20171018173732.368ed195@windsurf.home>
References: <20171018173732.368ed195@windsurf.home>
Message-ID: <20171024092252.21506-1-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch the build environment will pick up host-python3
binaries if host-python3 is a dependency for other packages. Currently
waf does not support python3.

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>

---

Changelog: v0 -> v1
  - Patch samba Makefile to explicitly use python2 instead of patching
     samba4.mk
---
 ...ake-python-2.7-dependency-in-waf-explicit.patch | 27 +++++++++++++++++++++
 .../samba4/0003-Force-python2-in-Makefile.patch    | 28 ++++++++++++++++++++++
 package/samba4/samba4.mk                           |  3 ++-
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 package/samba4/0002-Make-python-2.7-dependency-in-waf-explicit.patch
 create mode 100644 package/samba4/0003-Force-python2-in-Makefile.patch

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
diff --git a/package/samba4/0003-Force-python2-in-Makefile.patch b/package/samba4/0003-Force-python2-in-Makefile.patch
new file mode 100644
index 0000000000..e68da98adb
--- /dev/null
+++ b/package/samba4/0003-Force-python2-in-Makefile.patch
@@ -0,0 +1,28 @@
+From 716d7a780ba2403f84c6ea4220305d698c6a14f4 Mon Sep 17 00:00:00 2001
+From: Christian Kellermann <christian.kellermann@solectrix.de>
+Date: Tue, 24 Oct 2017 10:19:01 +0200
+Subject: [PATCH] Force python2 in Makefile
+
+waf does not work with python3-host packages, so make it use python2
+explicitly.
+
+Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 5cc90771000..1496918b6de 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ # simple makefile wrapper to run waf
+ 
+-PYTHON?=python
++PYTHON?=python2
+ WAF_BINARY=$(PYTHON) ./buildtools/bin/waf
+ WAF=WAF_MAKE=1 $(WAF_BINARY)
+ 
+-- 
+2.12.1
+
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f8001bbe7f..4b9cc64b4c 100644
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
-- 
2.12.1
