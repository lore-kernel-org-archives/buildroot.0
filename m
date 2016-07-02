From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 15:59:07 +0200
Subject: [Buildroot] [PATCH 1/9] package/systemd: Add optional support for
	myhostname
Message-ID: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b44d57a..7c591b7 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -225,6 +225,17 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
+config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
+	bool "enable myhostname NSS plugin"
+	default y
+	help
+	  nss-myhostname is a plug-in module for the GNU Name Service Switch (NSS)
+	  functionality of the GNU C Library (glibc), primarily providing hostname
+	  resolution for the locally configured system hostname as returned by
+	  gethostname(2).
+
+	  http://www.freedesktop.org/software/systemd/man/nss-myhostname.html
+
 config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	bool "enable timedate daemon"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 423afcc..cca3f05 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -249,6 +249,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-hostnamed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_MYHOSTNAME),y)
+SYSTEMD_CONF_OPTS += --enable-myhostname
+else
+SYSTEMD_CONF_OPTS += --disable-myhostname
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMEDATED),y)
 SYSTEMD_CONF_OPTS += --enable-timedated
 else
-- 
2.8.1
