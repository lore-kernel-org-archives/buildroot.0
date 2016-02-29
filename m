From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:53:50 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
	support for vconsole
Message-ID: <20160229215455.8831E80415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f01ad723db77148889c2ae9cfdd7ab6eeb83b036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6289252..f1cd465 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -92,6 +92,14 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
 
+config BR2_PACKAGE_SYSTEMD_VCONSOLE
+	bool "enable vconsole tool"
+	help
+	  systemd-vconsole-setup is an early boot service that
+	  configures the virtual console font and console keymap.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5f7941c..124119f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -137,6 +137,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-binfmt
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
+SYSTEMD_CONF_OPTS += --enable-vconsole
+else
+SYSTEMD_CONF_OPTS += --disable-vconsole
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
