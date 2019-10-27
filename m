From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2019 11:39:12 +0100
Subject: [Buildroot] [PATCH v2] doc/manual/configure.txt: add a short
 tutorial to reuse a Buildroot toolchain as external toolchain
Message-ID: <20191027103912.17402-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent reported that a short tutorial was missing in the manual to
explain how to reuse a Buildroot toolchain as external toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Laurent Guillier <laurent.guillier@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
---
v2: Merge Matt's review and comments.

v1 is Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Matt can you check if it's ok for you?
---
 docs/manual/configure.txt | 100 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 008813c9b4..c1c1dac1c0 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -210,6 +210,106 @@ definitely to build it with http://crosstool-ng.org[crosstool-NG]. We
 recommend to build the toolchain separately from Buildroot, and then
 _import_ it in Buildroot using the external toolchain backend.
 
+The Buildroot internal toolchain option can be used to create an
+external toolchain. Here are a series of steps to build an internal
+toolchain and package it up for reuse.
+
+* From a project directory, start by cloning the buildroot git tree.
+
+-----
+/path/to/project/ $ git clone git://git.buildroot.net/buildroot
+-----
+
+* Next run a out of tree build to create the Buildroot project that
+  will build the toolchain. Then select the *target options* and the
+  toolchain components for an *internal toolchain backend*.
+
+At this point, you can remove the *Busybox* init system from the
+default defconfig by first not installing an *init system*
+(select none) and second, removing the default *shell* (select none).
+With those two options disabled, Buildroot will allow you to disable
+the *Busybox* package.
+
+Buildroot will by default build a *tar* archive containing the
+filesystem image which can be disabled as it won't be used as part of
+the toolchain.
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
+The path to this *host* directory may be important later if you are
+planning to not relocate the toolchain but use it locally.  There is
+an example of this below.
+
+----
+/path/to/project/toolchain/host
+----
+
+Buildroot supports allowing you to relocate the *sdk* (internal
+toolchain) to another build machine.  The *sdk* target sanitizes the
+*rpath* of the toolchain binaries.  Once the sanitize complete the
+host folder could be turned into a tarball and moved to another build
+machine.
+
+-----
+/path/to/project/ $ make -C buildroot O=toolchain sdk
+-----
+
+* As an example, lets setup an out of tree build to create a Buildroot
+  project that uses the new *external toolchain* we just built.
+
+-----
+/path/to/project/ $ make -C buildroot O=output menuconfig
+-----
+
+Select the same *target options* as the ones used to create the
+previous internal toolchain. In the toolchain menu, select the
+*external toolchain backend*, select an external *custom toolchain*
+and select toolchain origin *Pre-installed toolchain*.
+
+Now you can set the *Toolchain path* with the path to the toolchain
+previously built (including host directory).
+
+----
+BR2_TOOLCHAIN_EXTERNAL_PATH=/path/to/project/toolchain/host
+----
+
+Then you have to select the toolchain characteristics like gcc version,
+the libc implementation, linux headers, etc...
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
2.21.0
