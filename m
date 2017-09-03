From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 13:17:25 +0200
Subject: [Buildroot] [git commit] util-linux: linux-pam is needed for su
Message-ID: <20170903111007.EDF7580137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6488923fb785ac11f6ec78e53db5da22203b178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With linux-pam, the configure script bails out with:

configure: error: su selected, but required PAM header file not available

Fixes:
http://autobuild.buildroot.net/results/338/3381a49d17aa0d4b9711cbb36a5d7b563a8ae08f/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index d2a925c..80aab88 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -330,10 +330,18 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
 
 config BR2_PACKAGE_UTIL_LINUX_SU
 	bool "su"
-	depends on BR2_USE_MMU # fork()
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # fork(), linux-pam
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID
 
+comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
 	depends on BR2_USE_MMU # fork()
