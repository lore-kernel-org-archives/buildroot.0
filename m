From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:17 +0200
Subject: [Buildroot] [PATCH v4 01/35] package/expedite: move to package
	directory
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no advantage for efl related packages to share the same version
number anymore (except for Efl and Elementary).

Here are the version number used for the 1.15 stable release:
EFL                     1.15.2
Elementary              1.15.2
Emotion Generic Players 1.15.0
Evas Generic Loaders    1.15.0
Python-EFL              1.15.0

Also, we usually do not have a sub-directory for a family of related
packages which doen't share the same version number, so move expedite
to the package directory. Expedite appear now in the
"Graphic libraries and applications (graphic/text)" in the Kconfig menu.

In a followup patch, expedite will be downloaded directly from the 1.15
branch in the git repository since there is no new release after 1.7.0.

Since expedite now select the efl package, propagate the reverse
dependencies on mmu and wchar.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: improve the commit log (ThomasP)
    move expedite to "Graphic applications" under
    "Graphic libraries and applications" menu (ThomasP)
    fix package comment dependency on BR2_USE_MMU
---
 package/Config.in                      | 1 +
 package/efl/Config.in                  | 1 -
 package/{efl => }/expedite/Config.in   | 8 ++++++--
 package/{efl => }/expedite/expedite.mk | 0
 4 files changed, 7 insertions(+), 3 deletions(-)
 rename package/{efl => }/expedite/Config.in (73%)
 rename package/{efl => }/expedite/expedite.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 7392363..0897eb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -219,6 +219,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
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
similarity index 73%
rename from package/efl/expedite/Config.in
rename to package/expedite/Config.in
index 1e12108..dab91c8 100644
--- a/package/efl/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,15 +1,19 @@
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
+	depends on BR2_USE_MMU
diff --git a/package/efl/expedite/expedite.mk b/package/expedite/expedite.mk
similarity index 100%
rename from package/efl/expedite/expedite.mk
rename to package/expedite/expedite.mk
-- 
2.4.3
