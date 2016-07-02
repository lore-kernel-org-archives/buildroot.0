From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:27:47 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	sysusers
Message-ID: <20160702110926.A2FED81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbb4d119da6b3586ee5fbcaee7bc0a9921bb7606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index df1a428..20b4e28 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -142,6 +142,14 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUSERS
+	bool "enable sysusers support"
+	help
+	  systemd-sysusers creates system users and groups, based on
+	  the file format and location specified in sysusers.d(5).
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 779d7c5..0520ced 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -165,6 +165,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-tmpfiles
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+SYSTEMD_CONF_OPTS += --enable-sysusers
+else
+SYSTEMD_CONF_OPTS += --disable-sysusers
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
