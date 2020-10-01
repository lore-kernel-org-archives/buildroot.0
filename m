From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Oct 2020 08:46:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/keyutils: fix build without C++
Message-ID: <20201001064613.337112-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create cxx.stamp to disable the check that keyutils.h has a valid C++
syntax that has been added with
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/commit/?id=991c272062a4300bbd5fe22dce17ab2fb5126e3f

Fixes:
 - http://autobuild.buildroot.org/results/53ec9ca02798a88cd9ab773af10fc8f44ce9d1a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keyutils/keyutils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 46f06531ce..cba57cf199 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -22,6 +22,11 @@ ifeq ($(BR2_SHARED_LIBS),y)
 KEYUTILS_MAKE_PARAMS += NO_ARLIB=1
 endif
 
+# Touch cxx.stamp to avoid adding a C++ dependency
+define KEYUTILS_CONFIGURE_CMDS
+	touch $(@D)/cxx.stamp
+endef
+
 define KEYUTILS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D)
 endef
-- 
2.28.0
