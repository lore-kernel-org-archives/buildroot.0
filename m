From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:37:35 +0200
Subject: [Buildroot] [git commit] ipmitool: add an option to enable/disable
	ipmishell
Message-ID: <20160426203739.CE67B81E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f48085ecff26123d088884ec50af290a95865f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/a62/a62e95619acb3d4d6be4425cf44a4628ac227494/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
