From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 08:12:57 +0100
Subject: [Buildroot] [git commit] linux: add conditional patch for
	timeconst.pl
Message-ID: <20160210072226.D974E818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6a5d71aba8e21b8aa28d93075a603297d1d3b3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernels older than 3.9 (not counting stable releases) used the
timeconst.pl perl script for their build process.
The problem with this script is that it used deprecated perl features,
namely defined(@array) which was removed for the perl 5.22 release,
causing build failure of older kernels on newer distributions.

To fix this instead of going the hard way (moving to the new
timeconst.bc script) use the easy way by patching timeconst.pl with an
upstream patch used for stable releases.

First try a dry-run on the patch to see if it applies, if it does then
call a proper APPLY_PATCHES to it.

Tested against an arbitrary 2.6.30 kernel (applies and builds), against
4.4.1 for a missing timeconst.pl (does not apply since it's missing) and
3.8.13 (does not apply since it's fixed already).

Known broken distributions: fedora 23, debian testing (stretch) and unstable
(sid).

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nst.pl-Eliminate-Perl-warning.patch.conditional | 45 ++++++++++++++++++++++
 linux/linux.mk                                     | 10 +++++
 2 files changed, 55 insertions(+)

diff --git a/linux/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional b/linux/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional
new file mode 100644
index 0000000..02abadd
--- /dev/null
+++ b/linux/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional
@@ -0,0 +1,45 @@
+From 63a3f603413ffe82ad775f2d62a5afff87fd94a0 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@linux.intel.com>
+Date: Thu, 7 Feb 2013 17:14:08 -0800
+Subject: [PATCH] timeconst.pl: Eliminate Perl warning
+
+defined(@array) is deprecated in Perl and gives off a warning.
+Restructure the code to remove that warning.
+
+[ hpa: it would be interesting to revert to the timeconst.bc script.
+  It appears that the failures reported by akpm during testing of
+  that script was due to a known broken version of make, not a problem
+  with bc.  The Makefile rules could probably be restructured to avoid
+  the make bug, or it is probably old enough that it doesn't matter. ]
+
+Reported-by: Andi Kleen <ak@linux.intel.com>
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+Cc: Andrew Morton <akpm@linux-foundation.org>
+Cc: <stable@vger.kernel.org>
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+---
+Patch status: upstream
+
+ kernel/timeconst.pl | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/kernel/timeconst.pl b/kernel/timeconst.pl
+index eb51d76..3f42652 100644
+--- a/kernel/timeconst.pl
++++ b/kernel/timeconst.pl
+@@ -369,10 +369,8 @@ if ($hz eq '--can') {
+ 		die "Usage: $0 HZ\n";
+ 	}
+ 
+-	@val = @{$canned_values{$hz}};
+-	if (!defined(@val)) {
+-		@val = compute_values($hz);
+-	}
++	$cv = $canned_values{$hz};
++	@val = defined($cv) ? @$cv : compute_values($hz);
+ 	output($hz, @val);
+ }
+ exit 0;
+-- 
+2.4.10
+
diff --git a/linux/linux.mk b/linux/linux.mk
index 578fea1..7e20255 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -184,6 +184,16 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
+# Older linux kernels use deprecated perl constructs in timeconst.pl
+# that were removed for perl 5.22+ so it breaks on newer distributions
+# Try a dry-run patch to see if this applies, if it does go ahead
+define LINUX_TRY_PATCH_TIMECONST
+	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional >/dev/null ; then \
+		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional ; \
+	fi
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
