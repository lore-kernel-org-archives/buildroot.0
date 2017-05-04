From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 May 2017 17:28:37 +0200
Subject: [Buildroot] [PATCH] binutils: disallow selection of 2.27 on
	ARM/noMMU
Message-ID: <1493911717-11921-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils 2.27 triggers a segfault in elf2flt on ARM/noMMU. While Arnout
has identified a binutils 2.28 commit that can be backported on 2.27,
this commit is huge and we don't clearly understand the impact.

Since both binutils 2.26 and 2.28 are unaffected by this issue, we
simply disallow the selection of binutils 2.27 on ARM/noMMU, and default
to binutils 2.28.

Fixes:

  http://autobuild.buildroot.net/results/e14cadb290b0b86cac12c4bfb681eb6eee9e6dea/
  and lots of other similar ARM/Cortex-M4 failures

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index aa24fd7..e147ef0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,6 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_27_X
+	default BR2_BINUTILS_VERSION_2_28_X if (BR2_arm && !BR2_USE_MMU)
 	depends on !BR2_arc
 	help
 	  Select the version of binutils you wish to use.
@@ -12,6 +13,8 @@ config BR2_BINUTILS_VERSION_2_26_X
 
 config BR2_BINUTILS_VERSION_2_27_X
 	bool "binutils 2.27"
+	# binutils 2.27 triggers a bug in elf2flt on ARM/noMMU
+	depends on !(BR2_arm && !BR2_USE_MMU)
 
 config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28"
-- 
2.7.4
