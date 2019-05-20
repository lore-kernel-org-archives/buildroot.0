From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:56:38 +0200
Subject: [Buildroot] [git commit branch/next] package/libubootenv: new
 package
Message-ID: <20190520205130.1508F88530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98086ee492a8098011e6fc33462eab03a3c420b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Libubootenv is a library that provides a hardware independent
way to access to U-Boot environment.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...w_printenv-remove-declaration-in-for-loop.patch | 53 ++++++++++++++++++++++
 package/libubootenv/Config.in                      | 11 +++++
 package/libubootenv/libubootenv.hash               |  2 +
 package/libubootenv/libubootenv.mk                 | 13 ++++++
 6 files changed, 83 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 293a19530e..d5a7b7d390 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1848,6 +1848,9 @@ F:	package/kf5/
 N:	Pierre Floury <pierre.floury@gmail.com>
 F:	package/trace-cmd/
 
+N:	Pierre-Jean Texier <pjtexier@koncepto.io>
+F:	package/libubootenv/
+
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
 
diff --git a/package/Config.in b/package/Config.in
index 03fdd91411..6f1c4593e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ endmenu
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linuxconsoletools/Config.in"
 	source "package/linux-backports/Config.in"
diff --git a/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
new file mode 100644
index 0000000000..318050d719
--- /dev/null
+++ b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
@@ -0,0 +1,53 @@
+From ffca94e6f84956838a2d88824b37fcd3b0d0694b Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Sun, 5 May 2019 21:42:48 +0200
+Subject: [PATCH] fw_printenv: remove declaration in for loop
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit fixes :
+
+src/fw_printenv.c:142:4: error: ???for??? loop initial declarations are only allowed in C99 or C11 mode
+    for (int i = 0; i < argc; i++) {
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: https://github.com/sbabic/libubootenv/commit/d63007652f1d9f9256a5eedbce6273b9848b653c]
+---
+ src/fw_printenv.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/fw_printenv.c b/src/fw_printenv.c
+index 361d150..4236eaa 100644
+--- a/src/fw_printenv.c
++++ b/src/fw_printenv.c
+@@ -59,7 +59,7 @@ int main (int argc, char **argv) {
+ 	char *cfgfname = NULL;
+ 	char *defenvfile = NULL;
+ 	char *scriptfile = NULL;
+-	int c;
++	int c, i;
+ 	int ret = 0;
+ 	void *tmp;
+ 	const char *name, *value;
+@@ -139,7 +139,7 @@ int main (int argc, char **argv) {
+ 				fprintf(stdout, "%s=%s\n", name, value);
+ 			}
+ 		} else {
+-			for (int i = 0; i < argc; i++) {
++			for (i = 0; i < argc; i++) {
+ 				value = libuboot_get_env(ctx, argv[i]);
+ 				if (noheader)
+ 					fprintf(stdout, "%s\n", value ? value : "");
+@@ -151,7 +151,7 @@ int main (int argc, char **argv) {
+ 		if (scriptfile)
+ 			libuboot_load_file(ctx, scriptfile);
+ 		else {
+-			for (int i = 0; i < argc; i += 2) {
++			for (i = 0; i < argc; i += 2) {
+ 				if (i + 1 == argc)
+ 					libuboot_set_env(ctx, argv[i], NULL);
+ 				else
+-- 
+2.7.4
+
diff --git a/package/libubootenv/Config.in b/package/libubootenv/Config.in
new file mode 100644
index 0000000000..9be52c4522
--- /dev/null
+++ b/package/libubootenv/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBUBOOTENV
+	bool "libubootenv"
+	select BR2_PACKAGE_ZLIB
+	help
+	  libubootenv is a library that provides a hardware independent
+	  way to access to U-Boot environment.
+
+	  The package provides the fw_printenv / fw_setenv utilities,
+	  new tools build from the library and not from U-Boot.
+
+	  https://github.com/sbabic/libubootenv/
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
new file mode 100644
index 0000000000..79aaac7b56
--- /dev/null
+++ b/package/libubootenv/libubootenv.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 82c6966af5feae8726bd78a2cde4c4c2f69e81f8fdc548098063f8a35eaad090 libubootenv-8a7d4030bcb106de11632e85b6a0e7b7d4cb47af.tar.gz
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
new file mode 100644
index 0000000000..5348794713
--- /dev/null
+++ b/package/libubootenv/libubootenv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libubootenv
+#
+################################################################################
+
+LIBUBOOTENV_VERSION = 8a7d4030bcb106de11632e85b6a0e7b7d4cb47af
+LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
+LIBUBOOTENV_LICENSE = LGPL-2.1
+LIBUBOOTENV_INSTALL_STAGING = YES
+LIBUBOOTENV_DEPENDENCIES = zlib
+
+$(eval $(cmake-package))
