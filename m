From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:57:03 +0100
Subject: [Buildroot] [git commit] package/sigrok-cli: propagate
 BR2_ENABLE_LOCALE dependency of libsigrok
Message-ID: <20181231145345.9F790882E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1099197b9e4425dedd12ba3a92b89de5f3d82f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 922b82bde9d554237769c21e50f6c5b4f73f41a8 ("libsigrok:
bump version to 0.5.1"), libsigrok depends on BR2_ENABLE_LOCALE, but
this dependency was not propagated to sigrok-cli. This commit fixes
this issue.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sigrok-cli/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
index 75bd8c6d5a..df1cd95bed 100644
--- a/package/sigrok-cli/Config.in
+++ b/package/sigrok-cli/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SIGROK_CLI
 	depends on !BR2_STATIC_LIBS
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBSIGROK
 	help
 	  Sigrok-cli is a command-line frontend for the sigrok
@@ -15,7 +16,8 @@ config BR2_PACKAGE_SIGROK_CLI
 
 	  http://sigrok.org/wiki/Sigrok-cli
 
-comment "sigrok-cli needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7"
+comment "sigrok-cli needs a toolchain w/ locale, wchar, threads, dynamic library, gcc >= 4.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE
