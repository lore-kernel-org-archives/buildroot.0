From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 14:52:02 +0100
Subject: [Buildroot] [git commit master 1/1] pciutils: SHARED make opt goes
	for install too
Message-ID: <20110110135659.B89588A3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=54942318f93b12f8166f110905ec7df6e3279a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we don't pass SHARED when installing we miss the shared library
symlinks (libpci.so & libpci.so.3).

On internal and external toolchains that have a proper cross ldconfig this
isn't a problem as they get created during ldconfig, but it breaks on
toolchains that lack a cross ldconfig to automagically make the symlinks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 6e16300..782d348 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -39,8 +39,10 @@ endef
 
 # Ditch install-lib if SHARED is an option in the future
 define PCIUTILS_INSTALL_TARGET_CMDS
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-lib
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
+		SHARED=$(PCIUTILS_SHARED) install
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
+		SHARED=$(PCIUTILS_SHARED) install-lib
 endef
 
 $(eval $(call GENTARGETS,package,pciutils))
-- 
1.7.2.2
