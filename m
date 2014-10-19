From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:17:29 +0200
Subject: [Buildroot] [git commit] tar: bump to version 1.28
Message-ID: <20141019151802.17644AF95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6548119c9039e87bc60b94dd3c5e05616178adc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file and set eprefix to / otherwise when busybox is around
we've got duplicate tar applications (/bin/tar for busybox, /usr/bin/tar
for full-blown) normally making busybox still win in directory search.

[Thomas: slightly improve the comment that explains why we pass
--exec-prefix.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tar/tar-0001-fix-build-failure.patch |   52 ++++++++++++++++++++++++++
 package/tar/tar.hash                         |    2 +
 package/tar/tar.mk                           |    5 ++-
 3 files changed, 58 insertions(+), 1 deletions(-)

diff --git a/package/tar/tar-0001-fix-build-failure.patch b/package/tar/tar-0001-fix-build-failure.patch
new file mode 100644
index 0000000..8550a3e
--- /dev/null
+++ b/package/tar/tar-0001-fix-build-failure.patch
@@ -0,0 +1,52 @@
+Status: upstream
+http://git.savannah.gnu.org/cgit/tar.git/commit/?id=e9ddc08da0982f36581ae5a8c7763453ff41cfe8
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+From e9ddc08da0982f36581ae5a8c7763453ff41cfe8 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Wed, 24 Sep 2014 21:22:16 +0000
+Subject: Bugfixes.
+
+* doc/tar.1: Fix typo in font spec.
+* src/tar.c (sort_mode_arg, sort_mode_flag): Protect "inode"
+(SAVEDIR_SORT_INODE) with D_INO_IN_DIRENT
+---
+diff --git a/doc/tar.1 b/doc/tar.1
+index 9000627..b91de63 100644
+--- a/doc/tar.1
++++ b/doc/tar.1
+@@ -879,7 +879,7 @@ Exclude files matching patterns listed in FILE.
+ \fB\-\-strip\-components\fR=\fINUMBER\fR
+ Strip \fINUMBER\fR leading components from file names on extraction.
+ .TP
+-\fB\-\-transform\fR=\fIEXPRESSION\dR, \fB\-\-xform\fR=\fIEXPRESSION\fR
++\fB\-\-transform\fR=\fIEXPRESSION\fR, \fB\-\-xform\fR=\fIEXPRESSION\fR
+ Use sed replace \fIEXPRESSION\fR to transform file names.
+ .SS File name matching options
+ These options affect both exclude and include patterns.
+diff --git a/src/tar.c b/src/tar.c
+index 225c624..f8102e0 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -1341,14 +1341,18 @@ static char filename_terminator;
+ static char const *const sort_mode_arg[] = {
+   "none",
+   "name",
++#if D_INO_IN_DIRENT
+   "inode",
++#endif
+   NULL
+ };
+ 
+ static int sort_mode_flag[] = {
+     SAVEDIR_SORT_NONE,
+     SAVEDIR_SORT_NAME,
++#if D_INO_IN_DIRENT
+     SAVEDIR_SORT_INODE
++#endif
+ };
+ 
+ ARGMATCH_VERIFY (sort_mode_arg, sort_mode_flag);
+--
+cgit v0.9.0.2
diff --git a/package/tar/tar.hash b/package/tar/tar.hash
new file mode 100644
index 0000000..ffad2d2
--- /dev/null
+++ b/package/tar/tar.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking signature
+sha256	64ee8d88ec1b47a0961033493f919d27218c41b580138fd6802327462aff22f2	tar-1.28.tar.xz
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 369dc9d..caaa5ad 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,9 +4,12 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.27.1
+TAR_VERSION = 1.28
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
+# busybox installs in /bin, so we need tar to install as well in /bin
+# so that it overrides the Busybox symlinks.
+TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPLv3+
 TAR_LICENSE_FILES = COPYING
 
