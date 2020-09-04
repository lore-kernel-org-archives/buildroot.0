From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:34:20 +0200
Subject: [Buildroot] [git commit] package/refpolicy: allow selecting
 additional modules
Message-ID: <20200904123951.E2CCD8185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f3b075609c82fdc8ab3c0353ae718c801d56abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow users to select additional modules available in the refpolicy, to
be built in the binary policy. This will allow non-base modules to be
selected based on the user use-case and to select extra module
dependencies when providing out-of-tree modules.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/Config.in    | 5 +++++
 package/refpolicy/refpolicy.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 1912f24a58..24c811ca24 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -67,6 +67,11 @@ config BR2_REFPOLICY_EXTRA_MODULES_DIRS
 	  sub-directories. Also, you cannot have several modules with
 	  the same name in different directories.
 
+config BR2_REFPOLICY_EXTRA_MODULES
+	string "Extra modules to enable"
+	help
+	  List of extra SELinux modules to enable in the refpolicy.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index a7a924f0af..50d86699b2 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -54,6 +54,7 @@ REFPOLICY_MODULES = \
 	unconfined \
 	userdomain \
 	$(PACKAGES_SELINUX_MODULES) \
+	$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES)) \
 	$(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
 		$(basename $(notdir $(wildcard $(d)/*.te))))
 
