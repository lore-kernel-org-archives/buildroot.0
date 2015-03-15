From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:09:17 +0100
Subject: [Buildroot] [git commit] libnl: add patch to add Libs.private in
	libnl-3.0.pc
Message-ID: <20150315170932.E74DF7FA73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=155b219245bca431819a4d6886712ce39d71d813
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having a properly defined Libs.private field allows to make sure
static linking against libnl-3.0 works fine, at least as long as
pkg-config is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ibs.private-field-in-libnl-pkg-config-fil.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch b/package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
new file mode 100644
index 0000000..845a593
--- /dev/null
+++ b/package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
@@ -0,0 +1,30 @@
+From db0d59cd06f3ffd350379847c0885e1bfb85af0f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 7 Mar 2015 11:34:42 +0100
+Subject: [PATCH 2/2] build: add Libs.private field in libnl pkg-config file
+
+In order to support static linking, the libnl pkg-config file should
+indicate in its Libs.private field the libraries that libnl-3.0.a
+requires. The LIBS variable contains the appropriate list of
+libraries: -lm in all cases, and -lpthread when pthread support is
+enabled. This allows to statically link applications against libnl
+properly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libnl-3.0.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libnl-3.0.pc.in b/libnl-3.0.pc.in
+index b87e3dc..ddbc999 100644
+--- a/libnl-3.0.pc.in
++++ b/libnl-3.0.pc.in
+@@ -7,4 +7,5 @@ Name: libnl
+ Description: Convenience library for netlink sockets
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lnl- at MAJ_VERSION@
++Libs.private: @LIBS@
+ Cflags: -I${includedir}/libnl at MAJ_VERSION@
+-- 
+2.1.0
+
