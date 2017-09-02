From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:41:57 +0200
Subject: [Buildroot] [git commit] util-linux: linux-pam is needed for runuser
Message-ID: <20170902213516.EFBD481994@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09860f354ae0824cfead384e994d3f119e22b851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With linux-pam, the configure script bails out with:

configure: error: runuser selected, but required PAM header file not available

Fixes:

  http://autobuild.buildroot.net/results/ea7430012f1d8e2ae3ceb8fe5d41630ea1eaa3af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b3494af..d2a925c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -297,12 +297,20 @@ config BR2_PACKAGE_UTIL_LINUX_RESET
 
 config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	bool "runuser"
-	depends on BR2_USE_MMU # fork()
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # fork(), linux-pam
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID (does not need
 	  to ask for a password, because it may be executed by the root
 	  user only)
 
+comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
 	help
