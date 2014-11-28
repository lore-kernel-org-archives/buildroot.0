From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 28 Nov 2014 09:25:04 -0600
Subject: [Buildroot] [PATCH v3 1/3] pkg-generic.mk: reinstall targets
In-Reply-To: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1417188306-9035-2-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add reinstall targets for host, target, staging, and images variants.
clean-for-reinstall targets added to remove package
.stamp_target_install file to allow package install.  Additionally, when
OVERRIDE_SRCDIR is provided, .stamp_rsynced is removed to ensure pakcage
is up to date before reinstalling.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/pkg-generic.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..0fe7059 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -480,34 +480,51 @@ $(1):			$(1)-install
 
 ifeq ($$($(2)_TYPE),host)
 $(1)-install:	        $(1)-install-host
+$(1)-reinstall:		$(1)-reinstall-host
 else
 $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
+$(1)-reinstall:		$(1)-reinstall-staging $(1)-reinstall-target $(1)-reinstall-images
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
 $(1)-install-target:		$$($(2)_TARGET_INSTALL_TARGET)
+$(1)-reinstall-target:		$(1)-clean-for-reinstall-target $$($(2)_TARGET_INSTALL_TARGET)
+$(1)-clean-for-reinstall-target:$(1)-clean-for-reinstall
+			rm -f $$($(2)_TARGET_INSTALL_TARGET)
 $$($(2)_TARGET_INSTALL_TARGET):	$$($(2)_TARGET_BUILD)
 else
 $(1)-install-target:
+$(1)-reinstall-target:
 endif
 
 ifeq ($$($(2)_INSTALL_STAGING),YES)
 $(1)-install-staging:			$$($(2)_TARGET_INSTALL_STAGING)
+$(1)-reinstall-staging:			$(1)-clean-for-reinstall-staging $$($(2)_TARGET_INSTALL_STAGING)
+$(1)-clean-for-reinstall-staging:	$(1)-clean-for-reinstall
+			rm -f $$($(2)_TARGET_INSTALL_STAGING)
 $$($(2)_TARGET_INSTALL_STAGING):	$$($(2)_TARGET_BUILD)
 # Some packages use install-staging stuff for install-target
 $$($(2)_TARGET_INSTALL_TARGET):		$$($(2)_TARGET_INSTALL_STAGING)
 else
 $(1)-install-staging:
+$(1)-reinstall-staging:
 endif
 
 ifeq ($$($(2)_INSTALL_IMAGES),YES)
 $(1)-install-images:		$$($(2)_TARGET_INSTALL_IMAGES)
+$(1)-reinstall-images:		$(1)-clean-for-reinstall-images $$($(2)_TARGET_INSTALL_IMAGES)
+$(1)-clean-for-reinstall-images:$(1)-clean-for-reinstall
+			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 $$($(2)_TARGET_INSTALL_IMAGES):	$$($(2)_TARGET_BUILD)
 else
 $(1)-install-images:
+$(1)-reinstall-images:
 endif
 
 $(1)-install-host:      	$$($(2)_TARGET_INSTALL_HOST)
+$(1)-reinstall-host:      	$(1)-clean-for-reinstall-host $$($(2)_TARGET_INSTALL_HOST)
+$(1)-clean-for-reinstall-host:	$(1)-clean-for-reinstall
+			rm -f $$($(2)_TARGET_INSTALL_HOST)
 $$($(2)_TARGET_INSTALL_HOST):	$$($(2)_TARGET_BUILD)
 
 $(1)-build:		$$($(2)_TARGET_BUILD)
@@ -545,6 +562,8 @@ $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
+
+$(1)-clean-for-reinstall:
 else
 # In the package override case, the sequence of steps
 #  source, by rsyncing
@@ -563,6 +582,9 @@ $(1)-extract:		$(1)-rsync
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+
+$(1)-clean-for-reinstall:
+			rm -f $$($(2)_TARGET_RSYNC)
 endif
 
 $(1)-show-depends:
-- 
1.9.1
