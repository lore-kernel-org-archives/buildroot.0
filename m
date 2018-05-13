From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:11:00 +0200
Subject: [Buildroot] [git commit] package/acl: fix install
Message-ID: <20180513201030.3005B8C9A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3e62d39844b28b59650747e59e86a21d71f05c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not overwrite destination file if it exists.

Simliar to bug #10986.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: mzweerspenko+bugzilla at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-all-use-install-1-to-install-executables.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/acl/0003-all-use-install-1-to-install-executables.patch b/package/acl/0003-all-use-install-1-to-install-executables.patch
new file mode 100644
index 0000000000..9640dd866d
--- /dev/null
+++ b/package/acl/0003-all-use-install-1-to-install-executables.patch
@@ -0,0 +1,67 @@
+From d3bd7b29b79147b4155e78a8ea06ded98b91f92a Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 8 May 2018 15:23:57 +0200
+Subject: [PATCH] all: use install(1) to install executables
+
+When the destination file already exists, the current install script
+will overwrite it with the new executable.
+
+However, when the existing executable is a symlink or hardlink to
+something else, like busybox, this effectively overwrites that something
+with the new executable, and thus replaces busybox and all its applets
+with the code for either of the three commands.
+
+We fix that by simply calling install(1). install(1) is sufficiently
+widespread that we don't bother checking for it, as tis is just a
+workaround while waiting for the version bump that will eventually fix
+it for good.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ chacl/Makefile   | 4 ++--
+ getfacl/Makefile | 4 ++--
+ setfacl/Makefile | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/chacl/Makefile b/chacl/Makefile
+index 33858d6..c857329 100644
+--- a/chacl/Makefile
++++ b/chacl/Makefile
+@@ -30,6 +30,6 @@ default: $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_BIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)
++	install -D -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)/$(LTCOMMAND)
++
+ install-dev install-lib:
+diff --git a/getfacl/Makefile b/getfacl/Makefile
+index 7fbafda..8ac63e0 100644
+--- a/getfacl/Makefile
++++ b/getfacl/Makefile
+@@ -31,6 +31,6 @@ default: $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_BIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)
++	install -D -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)/$(LTCOMMAND)
++
+ install-dev install-lib:
+diff --git a/setfacl/Makefile b/setfacl/Makefile
+index c44e7c0..eea2ede 100644
+--- a/setfacl/Makefile
++++ b/setfacl/Makefile
+@@ -31,6 +31,6 @@ default: $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_BIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)
++	install -D -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)/$(LTCOMMAND)
++
+ install-dev install-lib:
+-- 
+2.14.1
+
