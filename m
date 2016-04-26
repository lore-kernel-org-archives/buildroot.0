From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 26 Apr 2016 13:02:40 +0100
Subject: [Buildroot] [PATCH 2/2] ipmitool: add an option to enable/disable
	ipmishell
In-Reply-To: <1461672160-1596-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1461672160-1596-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1461672160-1596-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/a62/a62e95619acb3d4d6be4425cf44a4628ac227494/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ipmitool/Config.in   | 7 +++++++
 package/ipmitool/ipmitool.mk | 7 +++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index e9b5374..1da0ace 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -23,4 +23,11 @@ config BR2_PACKAGE_IPMITOOL_IPMIEVD
 	help
 	  IPMI event daemon for sending events to syslog
 
+config BR2_PACKAGE_IPMITOOL_IPMISHELL
+	bool "ipmishell"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  IPMI shell interface
+
 endif
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 60ef2f8..a246584 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -20,8 +20,11 @@ else
 IPMITOOL_CONF_OPTS += --disable-intf-lanplus
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
-IPMITOOL_DEPENDENCIES += readline
+ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
+IPMITOOL_DEPENDENCIES += ncurses readline
+IPMITOOL_CONF_OPTS += --enable-ipmishell
+else
+IPMITOOL_CONF_OPTS += --disable-ipmishell
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),)
-- 
2.7.3
