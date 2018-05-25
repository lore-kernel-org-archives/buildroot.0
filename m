From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 May 2018 19:03:55 +0200
Subject: [Buildroot] [git commit] package/bash-completion: fix a parallel
 build issue
Message-ID: <20180525170340.170EC827E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1755c8784bf9f54e25b320edb464c7cdebf94fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The STAGING_DIR/usr/share/bash-completion/completions directory is not
created yet.

Fixed by:
https://github.com/scop/bash-completion/commit/ee6b37ad7ff5b309cbb9b886a871252abd9398fa

Fixes:
http://autobuild.buildroot.org/results/7ee/7eea0f512695605714cf2d8c971778d4784b4c75/build-end.log

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Makefile.am-Use-install-data-hook-not-in.patch | 35 ++++++++++++++++++++++
 package/bash-completion/bash-completion.mk         |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch b/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
new file mode 100644
index 0000000000..4d01eb6eea
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
index 9976918648..c43fb15cd0 100644
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
 
