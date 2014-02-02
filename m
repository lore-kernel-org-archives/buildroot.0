From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:23 +0100
Subject: [Buildroot] [PATCH 8 of 9] spice: automatically select python
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <3c7d7f9a9a791c7d3964.1391343083@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that have a required dependency on python should select python
instead of depending on it, as this is most logical towards the user (which
may not clearly realize the python dependency).

This commit also updates the comments about toolchain options, adding
missing base dependencies (arch) and the extra mmu dependency for python.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/spice/Config.in |  11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,15 +1,13 @@
 comment "spice server needs a toolchain w/ wchar, threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "spice server depends on python (for pyparsing)"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_PYTHON
-
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_PYTHON
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR # libglib2, python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_CELT051
@@ -17,6 +15,7 @@ config BR2_PACKAGE_SPICE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYPARSING
 	select BR2_PACKAGE_SPICE_PROTOCOL
 	help
