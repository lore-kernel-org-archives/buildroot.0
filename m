From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Oct 2014 10:19:49 -0300
Subject: [Buildroot] [PATCH 5/5] sysklogd: security bump to version 1.5.1
In-Reply-To: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412774389-11297-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-3634 - invalid priority values between 192 and 1023
(directly or arrived at via overflow wraparound) can propagate through
code causing out-of-bounds access to the f_pmask array within the
'filed' structure by up to 104 bytes past its end.

Switch to vanilla since Debian hasn't handled this yet and add hash
file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysklogd/Config.in     |  2 +-
 package/sysklogd/sysklogd.hash |  2 ++
 package/sysklogd/sysklogd.mk   | 14 ++------------
 3 files changed, 5 insertions(+), 13 deletions(-)
 create mode 100644 package/sysklogd/sysklogd.hash

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 6339d76..4a0ac13 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SYSKLOGD
 	help
 	  System log daemons syslogd and klogd.
 
-	  http://www.infodrom.org/products/sysklogd/
+	  http://www.infodrom.org/projects/sysklogd/
 
 comment "syslogd needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
new file mode 100644
index 0000000..dd5b89a
--- /dev/null
+++ b/package/sysklogd/sysklogd.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	5166c185ae23c92e8b9feee66a6e3d0bc944bf673112f53e3ecf62e08ce7c201	sysklogd-1.5.1.tar.gz
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 37293da..efc5a4d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 1.5
-SYSKLOGD_SOURCE = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
-SYSKLOGD_PATCH = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
-SYSKLOGD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+SYSKLOGD_VERSION = 1.5.1
+SYSKLOGD_SITE = http://www.infodrom.org/projects/sysklogd/download
 SYSKLOGD_LICENSE = GPLv2+
 SYSKLOGD_LICENSE_FILES = COPYING
 
@@ -16,14 +14,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSKLOGD_DEPENDENCIES = busybox
 endif
 
-define SYSKLOGD_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
-	fi
-endef
-
-SYSKLOGD_POST_PATCH_HOOKS = SYSKLOGD_DEBIAN_PATCHES
-
 define SYSKLOGD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
-- 
2.0.4
