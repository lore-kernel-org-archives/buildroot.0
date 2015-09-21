From: imrehg at gmail.com <imrehg@gmail.com>
Date: Mon, 21 Sep 2015 23:03:14 +0800
Subject: [Buildroot] [PATCH 1/1] board/wandboard: fix linux compilation
	error due to deprecated perl statement
Message-ID: <1442847794-6972-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

The perl syntax has changed since linux 3.8 and it is causing a compile error
in wandboard's kernel. Add in a proposed simple patch (one of the many
identical versions found online).

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 .../patches/linux/perl-define-in-timeconst.patch   | 24 ++++++++++++++++++++++
 configs/wandboard_defconfig                        |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 board/wandboard/patches/linux/perl-define-in-timeconst.patch

diff --git a/board/wandboard/patches/linux/perl-define-in-timeconst.patch b/board/wandboard/patches/linux/perl-define-in-timeconst.patch
new file mode 100644
index 0000000..811b0a4
--- /dev/null
+++ b/board/wandboard/patches/linux/perl-define-in-timeconst.patch
@@ -0,0 +1,24 @@
+The use of defined() on arrays and hashes has been deprecated since perl
+5.6, but until 5.17.6 it only warned on lexicals, not package globals.
+
+Signed-off-by: Dagfinn Ilmari Manns?ker <ilmari@ilmari.org>
+---
+ kernel/timeconst.pl |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/timeconst.pl b/kernel/timeconst.pl
+index eb51d76..0461239 100644
+--- a/kernel/timeconst.pl
++++ b/kernel/timeconst.pl
+@@ -370,7 +370,7 @@ if ($hz eq '--can') {
+ 	}
+ 
+ 	@val = @{$canned_values{$hz}};
+-	if (!defined(@val)) {
++	if (!@val) {
+ 		@val = compute_values($hz);
+ 	}
+ 	output($hz, @val);
+-- 
+1.7.5.4
+
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 5d74fc3..5ce5fdf 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_GLOBAL_PATCH_DIR="board/wandboard/patches"
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.0.101"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
-- 
2.5.3
