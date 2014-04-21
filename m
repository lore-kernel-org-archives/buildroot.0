From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 10:34:48 +0200
Subject: [Buildroot] [git commit] util-linux: fix chfn/chsh missing
	dependencies
Message-ID: <20140421083506.22BB39C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb39b46f6007d02ba8db7611b5f11705b96e6cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

chfn/chsh utilities need linux-pam.

Fixes:
  http://autobuild.buildroot.org/results/cfc/cfc5fd00b9db21b60efe8b74e9966b6192b1da17/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cef8009..28bda11 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -58,9 +58,14 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
 
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
+	select BR2_PACKAGE_LINUX_PAM
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	help
 	  Change login shell, real user name and information
 
+comment "chfn/chsh needs a toolchain w/ wchar, locale"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
