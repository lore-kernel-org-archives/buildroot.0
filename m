From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:29:07 +0100
Subject: [Buildroot] [git commit] docs/manual/configure.txt: explain how to
 reuse a Buildroot toolchain as external toolchain
Message-ID: <20191027152232.EADE18A2CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7b0b0ad734b53fc9001a1b3ba24f865c959581e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Laurent reported that a short tutorial was missing in the manual to
explain how to reuse a Buildroot toolchain as external toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Laurent Guillier <laurent.guillier@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: completely rewrite the thing]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/configure.txt | 54 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 008813c9b4..c9eef567f4 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -206,9 +206,9 @@ Buildroot or crosstool-NG.
 
 If you want to generate a custom toolchain for your project, that can
 be used as an external toolchain in Buildroot, our recommendation is
-definitely to build it with http://crosstool-ng.org[crosstool-NG]. We
-recommend to build the toolchain separately from Buildroot, and then
-_import_ it in Buildroot using the external toolchain backend.
+to build it either with Buildroot itself (see
+xref:build-toolchain-with-buildroot[]) or with
+http://crosstool-ng.org[crosstool-NG].
 
 Advantages of this backend:
 
@@ -223,7 +223,53 @@ Drawbacks of this backend:
 
 * If your pre-built external toolchain has a bug, may be hard to get a
   fix from the toolchain vendor, unless you build your external
-  toolchain by yourself using Crosstool-NG.
+  toolchain by yourself using Buildroot or Crosstool-NG.
+
+[[build-toolchain-with-buildroot]]
+==== Build an external toolchain with Buildroot
+
+The Buildroot internal toolchain option can be used to create an
+external toolchain. Here are a series of steps to build an internal
+toolchain and package it up for reuse by Buildroot itself (or other
+projects).
+
+Create a new Buildroot configuration, with the following details:
+
+* Select the appropriate *Target options* for your target CPU
+  architecture
+
+* In the *Toolchain* menu, keep the default of *Buildroot toolchain*
+  for *Toolchain type*, and configure your toolchain as desired
+
+* In the *System configuration* menu, select *None* as the *Init
+  system* and *none* as */bin/sh*
+
+* In the *Target packages* menu, disable *BusyBox*
+
+* In the *Filesystem images* menu, disable *tar the root filesystem*
+
+Then, we can trigger the build, and also ask Buildroot to generate a
+SDK. This will conveniently generate for us a tarball which contains
+our toolchain:
+
+-----
+make sdk
+-----
+
+This produces the SDK tarball in +$(O)/images+, with a name similar to
++arm-buildroot-linux-uclibcgnueabi_sdk-buildroot.tar.gz+. Save this
+tarball, as it is now the toolchain that you can re-use as an external
+toolchain in other Buildroot projects.
+
+In those other Buildroot projects, in the *Toolchain* menu:
+
+* Set *Toolchain type* to *External toolchain*
+
+* Set *Toolchain* to *Custom toolchain*
+
+* Set *Toolchain origin* to *Toolchain to be downloaded and installed*
+
+* Set *Toolchain URL* to +file:///path/to/your/sdk/tarball.tar.gz+
 
 ===== External toolchain wrapper
 
