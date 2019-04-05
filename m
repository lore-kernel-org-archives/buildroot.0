From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 22:48:29 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/tpm2-tools: drop
 unused dbus / libglib2 dependencies
Message-ID: <20190405204614.10BC68DE36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17e2e102dc71ff9e2b0b7ead17e370fe9ed8d9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

tpm2-tools does not need dbus or libglib2, so remove them and the
corresponding toolchain dependencies.

The confusion may have come from the upstream travis configuration, which
also builds tpm2-abrmd (which uses dbus+libglib2).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f63a58c35018d55bb56900922bd81369e214e4a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/Config.in     | 11 ++---------
 package/tpm2-tools/tpm2-tools.mk |  2 +-
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index d8660a8f71..35ca63bf64 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
-	depends on BR2_USE_MMU # dbus, libglib
-	depends on BR2_USE_WCHAR # libglib -> gettext
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
 	depends on !BR2_STATIC_LIBS # tpm2-tss
-	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_TPM2_TSS
 	help
@@ -23,7 +18,5 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a toolchain w/ dynamic library, wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+comment "tpm2-tools needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 381873a8f9..9e50170297 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -8,7 +8,7 @@ TPM2_TOOLS_VERSION = 3.1.4
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-2-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
-TPM2_TOOLS_DEPENDENCIES = dbus libcurl libglib2 openssl tpm2-tss host-pkgconf
+TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
