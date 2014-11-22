From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 21 Nov 2014 20:14:17 -0600
Subject: [Buildroot] [PATCH 1/1] pkg-generic.mk: -clean-for-*-reinstall
	targets
In-Reply-To: <1416622457-10448-1-git-send-email-rdkehn@yahoo.com>
References: <1416622457-10448-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1416622457-10448-2-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add targets to remove package .stamp_target_install file to allow
<package>-install-target to reinstall <package> in the target directory.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..c723f80 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -594,6 +594,14 @@ $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 
 $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
+$(1)-clean-for-staging-reinstall:
+			rm -f $$($(2)_TARGET_INSTALL_STAGING)
+
+$(1)-clean-for-target-reinstall:
+			rm -f $$($(2)_TARGET_INSTALL_TARGET)
+
+$(1)-clean-for-reinstall: $(1)-clean-for-staging-reinstall $(1)-clean-for-target-reinstall
+
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
-- 
1.9.1
