From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 19:21:38 +0200
Subject: [Buildroot] [PATCH 3/3] alsamixergui: use a normal 'select'
	statement for the alsa-lib dependency
In-Reply-To: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1347988898-5279-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsamixergui/Config.in |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 3afc314..39809d9 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,15 +1,16 @@
 config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_ALSA_LIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_FLTK
+	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	bool "alsamixergui"
 	help
 	  A nice GUI mixer for Alsa using fltk
 
 	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
 
-comment "alsamixergui requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7 && BR2_PACKAGE_ALSA_LIB
+comment "alsamixergui requires a toolchain with C++ and threads support enabled"
+	depends on (!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS) && BR2_PACKAGE_XORG7
-- 
1.7.9.5
