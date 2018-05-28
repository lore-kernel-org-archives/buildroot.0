From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:12:42 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/attr: fix install
Message-ID: <20180528142834.590FB805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bc0033d5e18772a65d7bc65b873d716ef04453d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Do not overwrite destination file if it exists.

Fixes: #10986

Reported-by: mzweerspenko+bugzilla at gmail.com
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: mzweerspenko+bugzilla at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 28d8f8dfd5b10748b009377445d710abef6b8502)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-all-use-install-1-to-install-executables.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/attr/0004-all-use-install-1-to-install-executables.patch b/package/attr/0004-all-use-install-1-to-install-executables.patch
new file mode 100644
index 0000000000..ef59bb797c
--- /dev/null
+++ b/package/attr/0004-all-use-install-1-to-install-executables.patch
@@ -0,0 +1,67 @@
+From 4187e60ab52cac3ed36036a354977310dab68dcb Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 8 May 2018 15:16:10 +0200
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
+widespread that we don't bother checking for it, as this is just a
+workaround while waiting for the version bump that will eventually fix
+it for good.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ attr/Makefile     | 4 ++--
+ getfattr/Makefile | 4 ++--
+ setfattr/Makefile | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/attr/Makefile b/attr/Makefile
+index 1c467e8..326dd7e 100644
+--- a/attr/Makefile
++++ b/attr/Makefile
+@@ -29,6 +29,6 @@ default: $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_BIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)
++	install -D -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)/$(LTCOMMAND)
++
+ install-dev install-lib:
+diff --git a/getfattr/Makefile b/getfattr/Makefile
+index 91d3df2..f913172 100644
+--- a/getfattr/Makefile
++++ b/getfattr/Makefile
+@@ -30,6 +30,6 @@ default: $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_BIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)
++	install -D -m 755 $(LTCOMMAND) $(PKG_BIN_DIR)/$(LTCOMMAND)
++
+ install-dev install-lib:
+diff --git a/setfattr/Makefile b/setfattr/Makefile
+index d55461b..26dc5d8 100644
+--- a/setfattr/Makefile
++++ b/setfattr/Makefile
+@@ -30,6 +30,6 @@ default: $(LTCOMMAND)
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
