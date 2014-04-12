From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 17:10:15 +0200
Subject: [Buildroot] [git commit] rsh-redone: enable rshd and rlogind
Message-ID: <20140412151044.688D89C697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7e5163ea28074bca8236501f9658bb111c27025
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add dependency on linux-pam for rshd and rlogind, adjust
commit message.]

Signed-off-by Andreas Ehmanns <universeii@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsh-redone/Config.in     |   20 ++++++++++++++------
 package/rsh-redone/rsh-redone.mk |    8 ++++++--
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 5a90362..d26ca2b 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -16,15 +16,23 @@ if BR2_PACKAGE_RSH_REDONE
 config BR2_PACKAGE_RSH_REDONE_RLOGIN
 	bool "rlogin"
 
-# requires PAM
-#config BR2_PACKAGE_RSH_REDONE_RLOGIND
-#	bool "rlogind"
+config BR2_PACKAGE_RSH_REDONE_RLOGIND
+	bool "rlogind"
+	select BR2_PACKAGE_LINUX_PAM
+	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
+
+comment "rlogind needs a toolchain w/ wchar, locale"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
 
-# requires PAM
-#config BR2_PACKAGE_RSH_REDONE_RSHD
-#	bool "rshd"
+config BR2_PACKAGE_RSH_REDONE_RSHD
+	bool "rshd"
+	select BR2_PACKAGE_LINUX_PAM
+	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
+
+comment "rshd needs a toolchain w/ wchar, locale"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 
 endif
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index c7d3b7a..93e1358 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -13,8 +13,12 @@ rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RCP) += rcp
 rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
 rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
 rsh-redone-sbin-y =
-rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += rlogind
-rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += rshd
+rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += in.rlogind
+rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += in.rshd
+
+ifneq ($(BR2_PACKAGE_RSH_REDONE_RSHD)$(BR2_PACKAGE_RSH_REDONE_RLOGIND),)
+RSH_REDONE_DEPENDENCIES = linux-pam
+endif
 
 define RSH_REDONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) BIN="$(rsh-redone-bin-y)" SBIN="$(rsh-redone-sbin-y)"
