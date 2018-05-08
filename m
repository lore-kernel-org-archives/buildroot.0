From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 May 2018 15:42:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/ac: fix install
In-Reply-To: <cover.1525786905.git.yann.morin.1998@free.fr>
References: <cover.1525786905.git.yann.morin.1998@free.fr>
Message-ID: <8b860ca93d0672e9d84d2321027f425fce34181d.1525786906.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not overwrite destination file if it exists.

Simliar to bug #10986.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: mzweerspenko+bugzilla at gmail.com
---
 ...-all-use-install-1-to-install-executables.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/acl/0003-all-use-install-1-to-install-executables.patch

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
-- 
2.14.1
