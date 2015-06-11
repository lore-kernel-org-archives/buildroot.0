From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:14:20 +0200
Subject: [Buildroot] [git commit] package/linux-fusion: fix build for Linux
	>= 4.0
Message-ID: <20150611201431.9B62681D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca5f11e489357d5338e728dd554b25830d6b9b85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-for-linux-4-and-above.patch           |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
new file mode 100644
index 0000000..689d9bf
--- /dev/null
+++ b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
@@ -0,0 +1,25 @@
+Fix build for linux >= 4.x
+
+Instead of relying on testing for '3' as the linux kernel major verison,
+check that it is 2.x to include the proper Makefile, otherwise forcibly
+include the .26 Makefile, that is good for 3.x and 4.x too.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN linux-fusion-9.0.2.orig/Makefile linux-fusion-9.0.2/Makefile
+--- linux-fusion-9.0.2.orig/Makefile	2013-07-15 11:58:03.000000000 +0200
++++ linux-fusion-9.0.2/Makefile	2015-06-06 19:03:04.059842652 +0200
+@@ -62,10 +62,10 @@
+   CPPFLAGS += -DHAVE_LINUX_CONFIG_H
+ endif
+ 
+-ifeq ($(K_VERSION),3)
+-  KMAKEFILE = Makefile-2.6
+-else
++ifeq ($(K_VERSION),2)
+   KMAKEFILE = Makefile-2.$(K_PATCHLEVEL)
++else
++  KMAKEFILE = Makefile-2.6
+ endif
+ 
+ check-version = $(shell expr \( $(K_VERSION) \* 65536 + $(K_PATCHLEVEL) \* 256 + $(K_SUBLEVEL) \) \>= \( $(1) \* 65536 + $(2) \* 256 + $(3) \))
