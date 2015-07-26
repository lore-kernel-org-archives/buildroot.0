From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:15 +0200
Subject: [Buildroot] [05/37] package/expedite: move to package directory
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add efl reverse dependencies.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                      | 1 +
 package/efl/Config.in                  | 1 -
 package/{efl => }/expedite/Config.in   | 7 +++++--
 package/{efl => }/expedite/expedite.mk | 0
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename package/{efl => }/expedite/Config.in (75%)
 rename package/{efl => }/expedite/expedite.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 2697e56..0b2c131 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -66,6 +66,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/dropwatch/Config.in"
 	source "package/dstat/Config.in"
 	source "package/duma/Config.in"
+	source "package/expedite/Config.in"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3d31a26..cb91660 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -10,7 +10,6 @@ menuconfig BR2_PACKAGE_EFL
 
 if BR2_PACKAGE_EFL
 
-source "package/efl/expedite/Config.in"
 source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
diff --git a/package/efl/expedite/Config.in b/package/expedite/Config.in
similarity index 75%
rename from package/efl/expedite/Config.in
rename to package/expedite/Config.in
index 1e12108..82bceb9 100644
--- a/package/efl/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,15 +1,18 @@
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
+	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
 	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
 	  DirectFB and so on. Its tests are quite extensive, trying to
 	  reproduce real world usage cases.
 
-comment "expedite needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "expedite needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/efl/expedite/expedite.mk b/package/expedite/expedite.mk
similarity index 100%
rename from package/efl/expedite/expedite.mk
rename to package/expedite/expedite.mk
-- 
2.4.3
