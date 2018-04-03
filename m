From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 15:44:16 +0200
Subject: [Buildroot] [git commit] tpm2-abrmd: disable for musl
Message-ID: <20180403135146.7A6767FFCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aa99ad004968484c1968ca1b57a78397d1e037f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version requires macros and funtions not availabe on musl
(TEMP_FAILURE_RETRY, srand48_r, etc). We could try to circumvent the
problem by means of local patches but for the moment let's disable the
package for musl toolchains and watch the issue reported upstream at

  https://github.com/tpm2-software/tpm2-abrmd/issues/237

Propagate the change to tpm2-tools, which has a run-time dependency on
tpm2-abrmd.

Fixes:
  http://autobuild.buildroot.net/results/d2fa916613d835f856d14747dc03ef9847ad6396
  http://autobuild.buildroot.net/results/e82ff1f7f8a4a930fbabd38353da2149cc54fd9d
  http://autobuild.buildroot.net/results/7aaf6a7cc384b2e52109c0c31792c0d3888bcefd
  http://autobuild.buildroot.net/results/a56e55fb4791a90c00906698676656969484383d
  http://autobuild.buildroot.net/results/7aa020d115a0a3308fee1f3528554e40076ff28d

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/Config.in | 5 +++--
 package/tpm2-tools/Config.in | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 25c27c0abb..0cac754b3c 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # TEMP_FAILURE_RETRY(), etc
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_TPM2_TSS
@@ -21,7 +22,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 	  https://github.com/tpm2-software/tpm2-abrmd
 
-comment "tpm2-abrmd needs a toolchain w/ C++, wchar, threads"
+comment "tpm2-abrmd needs a uClibc or glibc toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 685b75c475..e5feb18786 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TPM2_TOOLS
 	depends on BR2_USE_MMU # dbus, libglib
 	depends on BR2_USE_WCHAR # libglib -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
+	depends on !BR2_TOOLCHAIN_USES_MUSL # tpm2-abrmd
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
@@ -19,7 +20,7 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a toolchain w/ C++, wchar, threads"
+comment "tpm2-tools needs a uClibc or glibc toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
