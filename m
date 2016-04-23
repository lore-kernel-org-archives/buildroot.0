From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 11:37:57 +0200
Subject: [Buildroot] [git commit] shared-mime-info: add patch to fix
	parallel installation issue
Message-ID: <20160423094021.1063581819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92f67662dd224d056934285d86c822fd54ee819e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch that should fix the parallel installation. A
similar patch is used by the Yocto Project, and they have already
submitted it upstream.

Fixes:

  http://autobuild.buildroot.org/results/bb29c8fa5c44eaa575ff641958cba4736d9b2538/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...correct-dependency-from-install-data-hook.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch b/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch
new file mode 100644
index 0000000..a0d3fb0
--- /dev/null
+++ b/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch
@@ -0,0 +1,45 @@
+From 3bcb00e27ab09c433fdfecace0d48a6a7ed55ea8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 22 Apr 2016 23:14:32 +0200
+Subject: [PATCH] Remove incorrect dependency from install-data-hook
+
+Having install-binPROGRAMS as a dependency of install-data-hook is not
+correct, as it causes the installation of programs to be executed
+twice, and those two installations are racing with each other, causing
+random installation failures.
+
+In addition, this dependency is not needed: the install-data-hook
+calls the update-mime-database program in one of two ways:
+
+ - When cross-compiling, using the program pointed by
+   UPDATE_MIME_DATABASE, which is already built, and is not installed
+   by install-binPROGRAMS.
+
+ - When compiling natively, suing the update-mime-database from the
+   build directory, so there is no need to depend on
+   install-binPROGRAMS.
+
+This patch is similar to the patch used by the Yocto Project at
+http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6fc4f73..c318dc3 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -52,7 +52,7 @@ else
+   update_mime_database="$(top_builddir)/update-mime-database$(EXEEXT)"
+ endif
+ 
+-install-data-hook: install-binPROGRAMS
++install-data-hook:
+ if ENABLE_UPDATE_MIMEDB
+ 	$(update_mime_database) -V "$(DESTDIR)$(datadir)/mime"
+ endif
+-- 
+2.6.4
+
