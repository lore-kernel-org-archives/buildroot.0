From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:36 +0200
Subject: [Buildroot] [PATCH 11/15] package/refpolicy: allow selecting
 additional modules
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-12-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow users to select additional modules available in the refpolicy, to
be built in the binary policy. This will allow non-base modules to be
selected based on the user use-case and to select extra module
dependencies when providing out-of-tree modules.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/refpolicy/Config.in    | 5 +++++
 package/refpolicy/refpolicy.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 030b1e93c9bd..73274920000a 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -64,6 +64,11 @@ config BR2_REFPOLICY_EXTRA_MODULES_DIRS
 	  Each of those directories must contain the SELinux policy .fc, .if
 	  and .te files directly at the top-level, with no sub-directories.
 
+config BR2_REFPOLICY_EXTRA_MODULES
+	string "Extra modules to enable"
+	help
+	  List of extra SELinux modules to enable in the refpolicy.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index edbb5a228f55..de1fe9217a80 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -47,6 +47,7 @@ REFPOLICY_MODULES = \
 	unconfined \
 	userdomain \
 	$(PACKAGES_SELINUX_MODULES) \
+	$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES)) \
 	$(foreach d,$(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
 		$(basename $(notdir $(wildcard $(d)/*.te))))
 
-- 
2.26.2
