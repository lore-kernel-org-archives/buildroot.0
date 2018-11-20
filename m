From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 20 Nov 2018 08:14:02 -0200
Subject: [Buildroot] [PATCH next v2] tpm2-tss: depend on shared libraries
Message-ID: <20181120101402.4123-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code includes dlfcn.h even if --enable-static and --disable-shared
are passed to configure. There is an "#ifndef NO_DL ... #endif" wrapper
but NO_DL is never defined and adding "-DNO_DL" to CFLAGS causes other
compilation errors.

Fixes:
  http://autobuild.buildroot.net/results/cfc3bfef5e93329bf944a57947086d9ddc4fece3

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Supersedes: https://patchwork.ozlabs.org/patch/999631/
---
Changes v1->v2:
- propagate this dependency to the reverse dependencies of tpm2-tss.
---
 package/tpm2-abrmd/Config.in | 6 ++++--
 package/tpm2-tools/Config.in | 6 ++++--
 package/tpm2-tss/Config.in   | 4 ++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 31c5ae7d6b..d18f736182 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_STATIC_LIBS # tpm2-tss
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_TPM2_TSS
@@ -20,6 +21,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 	  https://github.com/tpm2-software/tpm2-abrmd
 
-comment "tpm2-abrmd needs a toolchain w/ wchar, threads"
+comment "tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 24cd4b8f9a..cc87e2a1bf 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TPM2_TOOLS
 	depends on BR2_USE_MMU # dbus, libglib
 	depends on BR2_USE_WCHAR # libglib -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
+	depends on !BR2_STATIC_LIBS # tpm2-tss
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,6 +19,7 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a toolchain w/ wchar, threads"
+comment "tpm2-tools needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 4e299eccc1..933adb4b2a 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -30,3 +31,6 @@ config BR2_PACKAGE_TPM2_TSS
 	    Microsoft software TPM2 simulator.
 
 	  https://github.com/tpm2-software/tpm2-tss
+
+comment "tpm2-tss needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.14.5
