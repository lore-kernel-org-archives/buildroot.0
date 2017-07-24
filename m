From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:57:14 +0200
Subject: [Buildroot] [git commit] xvisor: bump version to 0.29
Message-ID: <20170724155305.7B52C80466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a217f0e67fbb5013f14ca251b27df136a0433a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 0.29, drop deprecated patch and update dependencies.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Makefile-Fix-oldconfig-make-target.patch  | 30 -----------
 .../xvisor/0002-openconf-do-not-check-stdin.patch  | 58 ----------------------
 package/xvisor/xvisor.hash                         |  2 +-
 package/xvisor/xvisor.mk                           |  3 +-
 4 files changed, 3 insertions(+), 90 deletions(-)

diff --git a/package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch b/package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch
deleted file mode 100644
index f056625..0000000
--- a/package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 99bbdc042ee4c92a13edcfeaf336aa755a199d0f Mon Sep 17 00:00:00 2001
-From: Anup Patel <anup@brainfault.org>
-Date: Sun, 11 Sep 2016 19:53:40 +0530
-Subject: [PATCH] Makefile: Fix oldconfig make target
-
-Use "-s" instead of "-o" option of "openconf/conf" tool because
-the "-o" option does not generate all required openconf files.
-
-Signed-off-by: Anup Patel <anup@brainfault.org>
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 149a682..e05e801 100644
---- a/Makefile
-+++ b/Makefile
-@@ -434,7 +434,7 @@ menuconfig:
- oldconfig:
- 	$(V)mkdir -p $(OPENCONF_TMPDIR)
- 	$(V)$(MAKE) -C tools/openconf oldconfig
--	./tools/openconf/conf -o $(OPENCONF_INPUT)
-+	./tools/openconf/conf -s $(OPENCONF_INPUT)
- 
- # Rule for "make savedefconfig"
- .PHONY: savedefconfig
--- 
-2.4.11
-
diff --git a/package/xvisor/0002-openconf-do-not-check-stdin.patch b/package/xvisor/0002-openconf-do-not-check-stdin.patch
deleted file mode 100644
index 34b350d..0000000
--- a/package/xvisor/0002-openconf-do-not-check-stdin.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6b49c1dbe0ac43e39eec97a7e79cf5fb995747dc Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 12 Sep 2016 21:49:55 +0530
-Subject: [PATCH] openconf: do not check stdin
-
-Do not check if stdin is redirected when ask_silent is true, so the
-`yes` program can be used to answer the questions about new values.
-
-Example:
-
-  yes "" | make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- oldconfig
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Signed-off-by: Anup Patel <anup@brainfault.org>
----
- tools/openconf/conf.c | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/tools/openconf/conf.c b/tools/openconf/conf.c
-index a428058..711cf0b 100644
---- a/tools/openconf/conf.c
-+++ b/tools/openconf/conf.c
-@@ -65,16 +65,6 @@ static void strip(char *str)
- 		*p-- = 0;
- }
- 
--static void check_stdin(void)
--{
--	if (!valid_stdin) {
--		printf("aborted!\n\n");
--		printf("Console input/output is redirected. ");
--		printf("Run 'make oldconfig' to update configuration.\n\n");
--		exit(1);
--	}
--}
--
- static int conf_askvalue(struct symbol *sym, const char *def)
- {
- 	char *ret;
-@@ -100,7 +90,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
- 			printf("%s\n", def);
- 			return 0;
- 		}
--		check_stdin();
- 	case ask_all:
- 		fflush(stdout);
- 		ret = fgets(line, 128, stdin);
-@@ -306,7 +295,6 @@ static int conf_choice(struct menu *menu)
- 				printf("%d\n", cnt);
- 				break;
- 			}
--			check_stdin();
- 		case ask_all:
- 			fflush(stdout);
- 			ret = fgets(line, 128, stdin);
--- 
-2.4.11
-
diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
index 13335be..c170fdb 100644
--- a/package/xvisor/xvisor.hash
+++ b/package/xvisor/xvisor.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 9347080c3481fb8586d196dd51a580a57084bfea1bc425e89f7fa0da7170708a xvisor-0.2.8.tar.gz
+sha256 29b3b830380dde4f596611abd34487fb753e120ce462dbb0056f3025b88ef14f  xvisor-0.2.9.tar.gz
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index addd7e6..f75175a 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-XVISOR_VERSION = 0.2.8
+XVISOR_VERSION = 0.2.9
 XVISOR_SITE = http://www.xhypervisor.org/tarball
 XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
+XVISOR_DEPENDENCIES = host-bison host-flex
 
 XVISOR_MAKE_TARGETS = all
 
