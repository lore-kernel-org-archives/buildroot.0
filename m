From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:17 -0500
Subject: [Buildroot] [PATCH 03/10] sysvinit: add patch for libcrypt
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-4-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a patch to sysvinit to correcctly add libcrypt as a build
dependancy of sysvinit.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 .../sysvinit-0001-libcrypt_check_fix.patch         |   13 +++++++++++++
 package/sysvinit/sysvinit.mk                       |    2 +-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 package/sysvinit/sysvinit-0001-libcrypt_check_fix.patch

diff --git a/package/sysvinit/sysvinit-0001-libcrypt_check_fix.patch b/package/sysvinit/sysvinit-0001-libcrypt_check_fix.patch
new file mode 100644
index 0000000..f6f54e5
--- /dev/null
+++ b/package/sysvinit/sysvinit-0001-libcrypt_check_fix.patch
@@ -0,0 +1,13 @@
+--- a/src/Makefile	2010-04-11 04:30:27.000000000 -0500
++++ b/src/Makefile	2012-09-05 12:44:45.000000000 -0500
+@@ -78,8 +78,8 @@
+ endif
+ 
+ # Additional libs for GNU libc.
+-ifneq ($(wildcard /usr/lib*/libcrypt.a),)
+-  SULOGINLIBS	+= -lcrypt
++ifneq ($(LCRYPT),)
++  SULOGINLIBS	+= $(LCRYPT)
+ endif
+ 
+ all:		$(BIN) $(SBIN) $(USRBIN)
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index c6b75a0..7678bce 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -31,7 +31,7 @@ SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
 define SYSVINIT_BUILD_CMDS
 	# Force sysvinit to link against libcrypt as it otherwise
 	# use an incorrect test to see if it's available
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) SULOGINLIBS="-lcrypt" -C $(@D)/src
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LCRYPT="-lcrypt" -C $(@D)/src
 endef
 
 define SYSVINIT_INSTALL_TARGET_CMDS
-- 
1.7.1
