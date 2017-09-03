From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Sep 2017 15:07:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix dependencies for
	linux-pam in BR2_PACKAGE_UTIL_LINUX_LOGIN
Message-ID: <20170903130714.6652-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/util-linux?id=f52af619185df072c2b43f4d7dc21c70d86b2e2f
added the new option BR2_PACKAGE_UTIL_LINUX_LOGIN but forgot to
propagate the !BR2_STATIC_LIBS dependency. Re-format this option to be
inline with other util-linux options depending on linux-pam.

Fixes
http://autobuild.buildroot.net/results/5fa/5fa2438f23792c9155760ff30be65315a397b5c9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/util-linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 80aab881a..e642602d3 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -171,8 +171,8 @@ config BR2_PACKAGE_UTIL_LINUX_LOGGER
 
 config BR2_PACKAGE_UTIL_LINUX_LOGIN
 	bool "login"
-	depends on BR2_ENABLE_LOCALE # linux-pam
-	depends on BR2_USE_WCHAR # linux-pam
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	select BR2_PACKAGE_LINUX_PAM
-- 
2.11.0
