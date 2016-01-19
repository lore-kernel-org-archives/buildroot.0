From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2016 22:53:59 +0100
Subject: [Buildroot] [git commit] package/triggerhappy: bump to latest
	commit to fix runtime issue
Message-ID: <20160119215434.9DA0B827F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc9304aa7220d9b3657572940b1e61504f920e24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest commit to fix runtime issue with the Linux Kernel headers 4.4:
  Starting thd: Unable to parse trigger line: [..]

With version 4.4 of the Linux Kernel the input event codes are not defined in
'linux/input.h' anymore, but in a seperate header file
'linux/input-event-codes.h' leaving triggerhappys evtable_*.h header files
empty with no event codes defined.

This issue is fixed upstream by commit 7e5abc69f215678e93a6b999524981c8b40bdcd9
which also makes overwriting of the 'LINUX_INPUT_H' definition obsolet.

Tested with an internal Buildroot toolchain with Linux Kernel headers 4.4 and
an external Linaro ARM 2015.08 toolchain with Linux Kernel headers 4.0.

[Peter: add hash file]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/triggerhappy/triggerhappy.hash | 2 ++
 package/triggerhappy/triggerhappy.mk   | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/triggerhappy/triggerhappy.hash b/package/triggerhappy/triggerhappy.hash
new file mode 100644
index 0000000..17eefdb
--- /dev/null
+++ b/package/triggerhappy/triggerhappy.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	6b01497377e522c368818c5f6c726362f42530e3dc24a01c6d77b1b4d6068308  triggerhappy-7e5abc69f215678e93a6b999524981c8b40bdcd9.tar.gz
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index 3a68e50..5a29ca7 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-TRIGGERHAPPY_VERSION = aac9f353a28c0f414b27ac54bbbb2292c152eedc
+TRIGGERHAPPY_VERSION = 7e5abc69f215678e93a6b999524981c8b40bdcd9
 TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
 TRIGGERHAPPY_LICENSE = GPLv3+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
 
 define TRIGGERHAPPY_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		LINUX_INPUT_H=$(STAGING_DIR)/usr/include/linux/input.h \
-		-C $(@D) thd th-cmd
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) thd th-cmd
 endef
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
