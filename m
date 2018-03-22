From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 00:00:40 +0100
Subject: [Buildroot] [git commit] tpm2-tools: propagate dependencies of
 selected packages
Message-ID: <20180322230316.E215D838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be409f401c0b1daba6ca84e79d3185c7cf10bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- C++ (tpm2-tss)
- MMU (dbus, libglib)
- threads (libglib)
- wchar (libglib -> gettext)

Fixes (libglib):
  http://autobuild.buildroot.net/results/786859fccc477de1519d85d8a180626bb8ebe062
  http://autobuild.buildroot.net/results/df6518f331c16b477c6e934914d0e56dc102c228

[Peter: add C++ dependency to config option]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 6429b24531..685b75c475 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
+	depends on BR2_INSTALL_LIBSTDCPP # tpm2-tss
+	depends on BR2_USE_MMU # dbus, libglib
+	depends on BR2_USE_WCHAR # libglib -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,3 +18,8 @@ config BR2_PACKAGE_TPM2_TOOLS
 	  implementation.
 
 	  https://github.com/tpm2-software/tpm2-tools
+
+comment "tpm2-tools needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
