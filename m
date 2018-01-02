From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 21:47:52 +0100
Subject: [Buildroot] [git commit] package/zisofs-tools: new package
Message-ID: <20180102205800.7CE54838FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa4ee4dc0a46754b737a99e02800703a9171a309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To support transparent (de)compression in iso9660, we need mkzftree,
which comes from zisofs_tools, biundled with cdrkit.

However, cdrkit is a cmake package, but zisofs_tools is an autotools
package, so we need a separate package just to get mkzftree, but it is
pretty lightweight.

We just need the host variant for now,so we just add that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: add entry to DEVELOPERS file, rename to zisofs-tools.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                             |  1 +
 package/zisofs-tools/zisofs-tools.hash |  5 +++++
 package/zisofs-tools/zisofs-tools.mk   | 15 +++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e14b56..f8cf260 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1879,6 +1879,7 @@ F:	package/vde2/
 F:	package/w_scan/
 F:	package/wayland/
 F:	package/weston/
+F:	package/zisofs-tools/
 F:	support/download/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
diff --git a/package/zisofs-tools/zisofs-tools.hash b/package/zisofs-tools/zisofs-tools.hash
new file mode 100644
index 0000000..d2f594c
--- /dev/null
+++ b/package/zisofs-tools/zisofs-tools.hash
@@ -0,0 +1,5 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit/cdrkit_1.1.11-3.dsc
+sha256  d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da  cdrkit_1.1.11.orig.tar.gz
+
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  3rd-party/zisofs_tools/COPYING
diff --git a/package/zisofs-tools/zisofs-tools.mk b/package/zisofs-tools/zisofs-tools.mk
new file mode 100644
index 0000000..fd8c371
--- /dev/null
+++ b/package/zisofs-tools/zisofs-tools.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# zisofs-tools
+#
+################################################################################
+
+ZISOFS_TOOLS_VERSION = 1.1.11
+ZISOFS_TOOLS_SOURCE = cdrkit_$(ZISOFS_TOOLS_VERSION).orig.tar.gz
+ZISOFS_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
+ZISOFS_TOOLS_LICENSE = GPL-2.0+
+ZISOFS_TOOLS_LICENSE_FILES = 3rd-party/zisofs_tools/COPYING
+ZISOFS_TOOLS_SUBDIR = 3rd-party/zisofs_tools
+HOST_ZISOFS_TOOLS_DEPENDENCIES = host-zlib
+
+$(eval $(host-autotools-package))
