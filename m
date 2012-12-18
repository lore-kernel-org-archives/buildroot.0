From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 10:27:43 +0100
Subject: [Buildroot] [git commit] libseccomp: Remove the use of /proc when
	installing pc files
Message-ID: <20121218092824.E440C9A379@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca0e51528eef57d766209de255e74f934a06a336
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/d9e12bb0f5b2df9064adf3772bcf479b51d72468

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...omp-0001-use-system-headers-from-sysroot.patch} |    0
 ...eccomp-0002-Remove-the-dependency-on-proc.patch |   42 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch b/package/libseccomp/libseccomp-0001-use-system-headers-from-sysroot.patch
similarity index 100%
rename from package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
rename to package/libseccomp/libseccomp-0001-use-system-headers-from-sysroot.patch
diff --git a/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch b/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch
new file mode 100644
index 0000000..82ae44a
--- /dev/null
+++ b/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch
@@ -0,0 +1,42 @@
+From 58c34ae1343e2a452e08cd160936a231bcdb67a1 Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Tue, 18 Dec 2012 09:57:47 +0100
+Subject: [PATCH] Remove the dependency on /proc
+
+The Makefile relied on a broken logic for the INSTALL_PC_MACRO.
+It was used like this: $(INSTALL_PC_MACRO) file.
+
+The INSTALL_PC_MACRO was then expanded with a trailing sharp, to pass
+the name of the file to install as a comment at the end of the command.
+
+And then, to retrieve the file to copy, it used the $NF variable of awk
+on the /proc/self/cmdline file to happily reinvent the argument
+mechanism.
+
+This patch removes of this crazy stuff by using the -t option of
+install, that keeps the same calling convention.
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ macros.mk |    5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/macros.mk b/macros.mk
+index 6162900..eb61ead 100644
+--- a/macros.mk
++++ b/macros.mk
+@@ -150,9 +150,8 @@ endif
+ INSTALL_PC_MACRO += \
+ 		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) \
+ 			-d "$(INSTALL_LIB_DIR)/pkgconfig"; \
+-		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 \
+-			"$$(cat /proc/$$$$/cmdline | awk '{print $$(NF)}')" \
+-			"$(INSTALL_LIB_DIR)/pkgconfig"; \#
++		$(INSTALL) -t -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 \
++			"$(INSTALL_LIB_DIR)/pkgconfig"
+ 
+ ifeq ($(V),0)
+ 	INSTALL_INC_MACRO = @echo " INSTALL $^ ($(INSTALL_INC_DIR))";
+-- 
+1.7.9.5
+
