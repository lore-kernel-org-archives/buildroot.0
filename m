From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 21:51:42 +0200
Subject: [Buildroot] [git commit] package/gpm: fix build failure with gcc 10
Message-ID: <20200716194750.4DE3A87696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e15b28d74ffef9c0f6f899f3b3566a701609cd96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream [1] to fix -fno-common build failure

[1] https://github.com/telmich/gpm/commit/f04f24dd5ca5c1c13608b144ab66e2ccd47f106a

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-daemon.h-avoid-redefinition-of-last_sele.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch b/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
new file mode 100644
index 0000000000..36a8ddc5bb
--- /dev/null
+++ b/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
@@ -0,0 +1,43 @@
+From f04f24dd5ca5c1c13608b144ab66e2ccd47f106a Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Sun, 19 Jan 2020 19:53:41 +0000
+Subject: [PATCH] src/headers/daemon.h: avoid redefinition of
+ 'last_selection_time'
+
+Noticed build failure on gcc-10 as:
+
+```
+gcc  -L/home/slyfox/dev/git/gpm/src  -o gpm mice.o ... report.o tools.o   -lm
+ld: twiddler.o:gpm/src/headers/daemon.h:183:
+  multiple definition of `last_selection_time'; mice.o:gpm/src/headers/daemon.h:183: first defined here
+ld: synaptics.o:git/gpm/src/headers/daemon.h:183:
+  multiple definition of `last_selection_time'; mice.o:git/gpm/src/headers/daemon.h:183: first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=-fno-common passed explicitly.
+
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/headers/daemon.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/headers/daemon.h b/src/headers/daemon.h
+index a8936ad..24a1a97 100644
+--- a/src/headers/daemon.h
++++ b/src/headers/daemon.h
+@@ -180,7 +180,7 @@ extern struct mouse_features  mouse_table[3],
+ extern Gpm_Type         mice[];
+ extern Gpm_Type         *repeated_type;
+ 
+-time_t                  last_selection_time;
++extern time_t           last_selection_time;
+ 
+ 
+ 
+-- 
+2.20.1
+
