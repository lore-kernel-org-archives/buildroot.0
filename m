From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 10:10:23 +0100
Subject: [Buildroot] [git commit] i2c-tools: fix static build
Message-ID: <20180102091432.B1967839EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98ca1e3474b50fd00866e7b32cc75667e401347c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to disable installation of dynamic library on static build.

Fixes:
http://autobuild.buildroot.net/results/2ba/2bab61f82fdab8fe7e13da61b7814a4c33501cd8/
http://autobuild.buildroot.net/results/284/28474ec930dc82fa504c57927e1f9bd994b2774a/
http://autobuild.buildroot.net/results/a1b/a1bf99467ad3661dcb3ede491a70a57f1f1e01b1/

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...mk-don-t-install-dynamic-library-when-dis.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch b/package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch
new file mode 100644
index 0000000..69410ce
--- /dev/null
+++ b/package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch
@@ -0,0 +1,41 @@
+From ae2e0c9708aeb4a8fb301a1a4016cec7b05fc142 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 2 Jan 2018 06:55:41 +0200
+Subject: [PATCH] lib/Module.mk: don't install dynamic library when disabled
+
+Do not attempt to install the dynamic library when build of that library
+is disabled. Fixes the following installation error:
+
+install -m 755 lib/libi2c.so.0.1.0 .../target/usr/lib
+install: cannot stat 'lib/libi2c.so.0.1.0': No such file or directory
+lib/Module.mk:90: recipe for target 'install-lib' failed
+
+Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+Patch status: posted upstream
+https://marc.info/?l=linux-i2c&m=151486925730634&w=2
+
+ lib/Module.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 2ebc70d76ed9..c492961e0a4a 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -88,9 +88,11 @@ clean-lib:
+ 
+ install-lib: $(addprefix $(LIB_DIR)/,$(LIB_TARGETS))
+ 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
++ifeq ($(BUILD_DYNAMIC_LIB),1)
+ 	$(INSTALL_PROGRAM) $(LIB_DIR)/$(LIB_SHLIBNAME) $(DESTDIR)$(libdir)
+ 	$(LN) $(LIB_SHLIBNAME) $(DESTDIR)$(libdir)/$(LIB_SHSONAME)
+ 	$(LN) $(LIB_SHSONAME) $(DESTDIR)$(libdir)/$(LIB_SHBASENAME)
++endif
+ ifeq ($(BUILD_STATIC_LIB),1)
+ 	$(INSTALL_DATA) $(LIB_DIR)/$(LIB_STLIBNAME) $(DESTDIR)$(libdir)
+ endif
+-- 
+2.15.1
+
