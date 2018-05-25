From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 25 May 2018 17:58:46 +0200
Subject: [Buildroot] [PATCH] package/bash-completion: fix a parallel build
 issue
Message-ID: <1527263926-26561-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The STAGING_DIR/usr/share/bash-completion/completions directory is not
created yet.

Fixed by:
https://github.com/scop/bash-completion/commit/ee6b37ad7ff5b309cbb9b886a871252abd9398fa

Fixes:
http://autobuild.buildroot.org/results/7ee/7eea0f512695605714cf2d8c971778d4784b4c75/build-end.log

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...-Makefile.am-Use-install-data-hook-not-in.patch | 35 ++++++++++++++++++++++
 package/bash-completion/bash-completion.mk         |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch

diff --git a/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch b/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
new file mode 100644
index 0000000..4d01eb6
--- /dev/null
+++ b/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
@@ -0,0 +1,35 @@
+From f9a1dfe7a3d0f35474b3f4ded05e3d97be5017bf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ville=20Skytt=C3=A4?= <ville.skytta@iki.fi>
+Date: Fri, 25 May 2018 17:38:59 +0200
+Subject: [PATCH] completions/Makefile.am: Use install-data-hook, not
+ install-data-local
+
+-hook is run after the main rule, while -local might end up before.
+https://www.gnu.org/software/automake/manual/html_node/Extending.html#index-hook-targets
+
+Closes #212
+
+[backported from ee6b37ad7ff5b309cbb9b886a871252abd9398fa]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ completions/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/completions/Makefile.am b/completions/Makefile.am
+index e442a9e..5c49796 100644
+--- a/completions/Makefile.am
++++ b/completions/Makefile.am
+@@ -993,8 +993,8 @@ symlinks: $(targetdir) $(DATA)
+ all-local: targetdir = .
+ all-local: symlinks
+ 
+-install-data-local: targetdir = $(DESTDIR)$(bashcompdir)
+-install-data-local: symlinks
++install-data-hook: targetdir = $(DESTDIR)$(bashcompdir)
++install-data-hook: symlinks
+ 
+ check-local:
+ 	ret=0
+-- 
+2.7.4
+
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index 9976918..c43fb15 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -10,6 +10,9 @@ BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
 BASH_COMPLETION_LICENSE_FILES = COPYING
 
+# 0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
+BASH_COMPLETION_AUTORECONF = YES
+
 # Install bash-completion.pc file
 BASH_COMPLETION_INSTALL_STAGING = YES
 
-- 
2.7.4
