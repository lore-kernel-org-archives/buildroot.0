From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 18:46:44 +0100
Subject: [Buildroot] [git commit] libsepol: require threads
Message-ID: <20171103173941.237FD8120D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3947b14c68d9502fd297e9513cec015eb72fc171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsepol 2.7 now uses <pthread.h>

Fixes:

  http://autobuild.buildroot.net/results/5f1c6872a395d8c6d55e2b1722730871b4daf6a3

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsepol/Config.in       | 4 ++++
 package/semodule-utils/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index f92af52..cfa923e 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBSEPOL
 	bool "libsepol"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	help
 	  Libsepol is the binary policy manipulation library. It doesn't
 	  depend upon or use any of the other SELinux components.
 
 	  http://selinuxproject.org/page/Main_Page
+
+comment "libsepol needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
index d9cb928..38e043d 100644
--- a/package/semodule-utils/Config.in
+++ b/package/semodule-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SEMODULE_UTILS
 	bool "semodule-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	select BR2_PACKAGE_LIBSEPOL
 	help
 	  semodule-utils is a package that contains tools for handling
@@ -13,3 +14,6 @@ config BR2_PACKAGE_SEMODULE_UTILS
 	  * semodule_package - Create a SELinux policy module package.
 
 	  https://github.com/SELinuxProject/selinux/wiki/Releases
+
+comment "semodule-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
