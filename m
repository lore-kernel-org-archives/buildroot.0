From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 16:17:56 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/efl: needs host
 gcc >= 4.9
Message-ID: <20200929140959.8D3568E1A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdd2630154b98a8123e46fbd00e682aee120a6a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Commit dbe2d2e686281c19739824d4d4faec62187d1779 forgot to add a
host gcc >= 4.9 dependency on efl (because of host-efl)

Fixes:
 - http://autobuild.buildroot.org/results/f627d44919c20e068e377d7fe113833e2d4d0ad3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60cd158f0eb323c479f3d2b212261276410c5669)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index cf4976f66d..ce1e51e2f2 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-efl
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
@@ -300,8 +301,9 @@ comment "SVG loader needs a toolchain w/ gcc >= 4.8"
 
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, threads, wchar"
+comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		|| !BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
