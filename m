From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 14:58:48 +0200
Subject: [Buildroot] [git commit] samba: add option for built-in debug
	messages
Message-ID: <20130504130541.0414C99AAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5627bd798a2291f36326558d7cbe1e8f6bb01e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option allows users to specify the maximum level for compiled-in
debug messages with -1 being none.
In a typical scenario of nmbd+smbd+smbpasswd this can save a full
megabyte of target space.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/Config.in |    8 ++++++++
 package/samba/samba.mk  |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index fedbccd..0ab67ed 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -13,6 +13,14 @@ config BR2_PACKAGE_SAMBA
 
 if BR2_PACKAGE_SAMBA
 
+config BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL
+	int "Maximum level of compiled-in debug messages"
+	range -1 10000
+	default -1
+	help
+	  Define the level of compiled-in debug messages.
+	  This allows for big space savings, -1 being the lowest (none).
+
 config BR2_PACKAGE_SAMBA_LIBICONV
 	bool "extended encodings (libiconv)"
 	depends on !BR2_ENABLE_LOCALE
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 3a004e1..683c7b2 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -158,6 +158,9 @@ else
 SAMBA_CONF_OPT += --with-libiconv=""
 endif
 
+# Compiled debug messages by level
+SAMBA_CONF_OPT += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL)"
+
 ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
