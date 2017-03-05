From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:36:58 +0100
Subject: [Buildroot] [git commit] odroid-mali: mark package as BROKEN
Message-ID: <20170305203732.C44747FFB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2ac546c1951ba8a3e88965d3023eb38a9493f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version of the khrplatform.h header bundled with odroid-mali has a
definition of the khronos_intptr_t and khronos_ssize_t that doesn't
match the official Khronos registry headers or the Mesa3D headers. Due
to this, it causes conflicts with some packages that redefines those
types (with the correct definitions), such as libepoxy.

Issue reported upstream at: https://github.com/mdrjr/c2_mali/issues/1

Since nobody bothered fixing the issue even though it has been happening
since July 2016 (first build failure at
http://autobuild.buildroot.net/results/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/),
let's mark this package as BROKEN.

Fixes:

  http://autobuild.buildroot.net/results/ca48bb6291ca16e410edb83b5cdeb24847b6eaee/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-mali/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index e5c07f2..5a6af75 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -5,6 +5,16 @@ config BR2_PACKAGE_ODROID_MALI
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
+	# The version of the khrplatform.h header bundled with
+	# odroid-mali has a definition of the khronos_intptr_t and
+	# khronos_ssize_t that doesn't match the official Khronos
+	# registry headers or the Mesa3D headers. Due to this, it
+	# causes conflicts with some packages that redefines those
+	# types (with the correct definitions), such as libepoxy.
+	#
+	# Issue reported upstream at:
+	# https://github.com/mdrjr/c2_mali/issues/1
+	depends on BROKEN
 	help
 	  Install the ARM Mali drivers for odroidc2 based systems.
 
