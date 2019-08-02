From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  2 Aug 2019 22:30:51 +0200
Subject: [Buildroot] [PATCH] doc/manual/configure.txt: add a short tutorial
 to reuse a Buildroot toolchain as external toolchain
Message-ID: <20190802203051.22350-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent reported that a short tutorial was missing in the manual to
explain how to reuse a Buildroot toolchain as external toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Laurent Guillier <laurent.guillier@smile.fr>
---
 docs/manual/configure.txt | 91 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 008813c9b4..a6416675e4 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -210,6 +210,97 @@ definitely to build it with http://crosstool-ng.org[crosstool-NG]. We
 recommend to build the toolchain separately from Buildroot, and then
 _import_ it in Buildroot using the external toolchain backend.
 
+Here are steps to build a Buildroot toolchain and reuse it as an
+external toolchain:
+
+* From a project directory, start by cloning the buildroot git tree.
+
+-----
+/path/to/project/ $ git clone git://git.buildroot.net/buildroot
+-----
+
+* Run a out of tree build to create the Buildroot project that will
+  build the toolchain. Then select the *target options* and the
+  toolchain componants for an *internal toolchain backend*.
+  Eventually, you can removing *Busybox* from the default defconfig by
+  not installing an *init system* (select none) and removing the
+  default *shell* (select none). By doing this, Buildroot will allow
+  you to disable the *Busybox* package.
+  Finally, you can avoid building a *tar* archive of the filesystem
+  image (rootfs.tar) since it not useful.
+
+-----
+/path/to/project/ $ make -C buildroot O=toolchain menuconfig
+-----
+
+* At this step, you should have this directory tree:
+
+----
+/path/to/project/
+  |- buildroot
+  |- toolchain
+  |     |build
+  |     |host
+  |     `----
+----
+
+Keep the full path to the *host* directory for the next step.
+
+----
+/path/to/project/toolchain/host
+----
+
+Eventually, you can run *sdk* to be able to relocate the toolchain
+to another build machine. This allow to sanitize the *rpath* of the
+toolchain binaires.
+
+-----
+/path/to/project/ $ make -C buildroot O=toolchain sdk
+-----
+
+* Run a out of tree build to create the Buildroot project that will
+  build the target image using an *external toolchain*.
+
+-----
+/path/to/project/ $ make -C buildroot O=output menuconfig
+-----
+
+Select the same *target options* as the one used to create the
+toolchain. In the toolchain menu, select the *external toolchain
+backend*, select an external *custom toolchain* and select toolchain
+origin *Pre-installed toolchain*.
+
+Now you can set the *Toolchain path* with the path to the toolchain
+previously built (including host directory).
+
+----
+BR2_TOOLCHAIN_EXTERNAL_PATH=/path/to/project/toolchain/host
+----
+
+Then you have to select the toolchain caracteristics like gcc version,
+the libc implementation etc... As for other external custom toolchain.
+To check if the external toolchain can be imported, you can run:
+
+-----
+/path/to/project/ $ make -C buildroot O=output toolchain
+-----
+
+* At this step, you should have this directory tree:
+
+----
+/path/to/project/
+  |- buildroot
+  |- toolchain
+  |     |build
+  |     |host
+  |     `----
+  `- output
+        |build
+        |host
+        |target
+        `----
+----
+
 Advantages of this backend:
 
 * Allows to use well-known and well-tested cross-compilation
-- 
2.20.1
