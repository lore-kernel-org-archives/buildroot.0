From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Feb 2014 21:48:15 +0100
Subject: [Buildroot] [PATCH] cegui06: need dynamic library support
Message-ID: <1393447695-16154-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/caf/caf421629f4465cd347dc40af0b559c4d9b0c09f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cegui06/Config.in | 5 +++--
 package/spice/Config.in   | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
index 92bbb70..f03e488 100644
--- a/package/cegui06/Config.in
+++ b/package/cegui06/Config.in
@@ -1,10 +1,11 @@
-comment "cegui06 needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "cegui06 needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_CEGUI06
 	bool "cegui06"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_PCRE
diff --git a/package/spice/Config.in b/package/spice/Config.in
index 9bddb06..b95e32e 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -50,11 +50,15 @@ comment "client needs a toolchain w/ threads, C++"
 config BR2_PACKAGE_SPICE_GUI
 	bool "Enable GUI"
 	depends on BR2_PACKAGE_SPICE_CLIENT
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_CEGUI06
 	help
 	  Say 'y' here to enable the Graphical User Interface (GUI)
 	  start dialog.
 
+comment "gui needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_SPICE_TUNNEL
 	bool "Enable network redirection"
 	select BR2_PACKAGE_SLIRP
-- 
1.8.3.2
