From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 11:49:49 +0200
Subject: [Buildroot] [git commit] package/nano: bump version to 2.8.7
Message-ID: <20170913094504.4D8BE801E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30f8bad974b0a7a0fca58c0caf6f4b1c956a1733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch to fix build error:

move.o: In function `do_page_up':
move.c:(.text+0x150): undefined reference to `leftedge_for'
move.o: In function `do_page_down':
move.c:(.text+0x20c): undefined reference to `leftedge_for'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pilation-when-configured-with-enable-tiny.patch | 43 ++++++++++++++++++++++
 package/nano/nano.hash                             |  2 +-
 package/nano/nano.mk                               |  2 +-
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch b/package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch
new file mode 100644
index 0000000..db684f9
--- /dev/null
+++ b/package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch
@@ -0,0 +1,43 @@
+From 28cfab7580c42a6d6c9c5d787ce736094fd51a0c Mon Sep 17 00:00:00 2001
+From: Benno Schulenberg <bensberg@telfort.nl>
+Date: Tue, 29 Aug 2017 19:28:44 +0200
+Subject: tweaks: fix compilation when configured with --enable-tiny
+
+When moving the cursor to the top-left corner, it is not necessary
+to compute leftedge because firstcolumn IS the relevant leftedge.
+
+Reported-by: Jordi Mallach <jordi@debian.org>
+
+Downloaded from upstream master branch:
+http://git.savannah.gnu.org/cgit/nano.git/commit/?id=28cfab7580c42a6d6c9c5d787ce736094fd51a0c
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/move.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/move.c b/src/move.c
+index d138356..ce276e4 100644
+--- a/src/move.c
++++ b/src/move.c
+@@ -121,7 +121,7 @@ void do_page_up(void)
+ 	openfile->current = openfile->edittop;
+ 	openfile->current_y = 0;
+ 
+-	leftedge = leftedge_for(openfile->firstcolumn, openfile->edittop);
++	leftedge = openfile->firstcolumn;
+ 	target_column = 0;
+     } else
+ 	get_edge_and_target(&leftedge, &target_column);
+@@ -152,7 +152,7 @@ void do_page_down(void)
+ 	openfile->current = openfile->edittop;
+ 	openfile->current_y = 0;
+ 
+-	leftedge = leftedge_for(openfile->firstcolumn, openfile->edittop);
++	leftedge = openfile->firstcolumn;
+ 	target_column = 0;
+     } else
+ 	get_edge_and_target(&leftedge, &target_column);
+-- 
+cgit v1.0-41-gc330
+
diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index dfc6603..4e0abc4 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 c7cf264f0f3e4af43ecdbc4ec72c3b1e831c69a1a5f6512d5b0c109e6bac7b11  nano-2.8.4.tar.xz
+sha256 fbe31746958698d73c6726ee48ad8b0612697157961a2e9aaa83b4aa53d1165a  nano-2.8.7.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 966d43b..f1c172f 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.8
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION = $(NANO_VERSION_MAJOR).7
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
