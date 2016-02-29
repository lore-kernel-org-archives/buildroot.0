From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:54:16 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
	support for bootchart
Message-ID: <20160229215455.94E0580359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41304124f2e0e717ef6bb9e6bf8b0c61c2fba745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f1cd465..85dcf07 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -100,6 +100,16 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
+config BR2_PACKAGE_SYSTEMD_BOOTCHART
+	bool "enable bootchart tool"
+	help
+	  systemd-bootchart is a tool, usually run at system startup,
+	  that collects the CPU load, disk load, memory usage, as well
+	  as per-process information from a running system. Collected
+	  results are output as an SVG graph.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 124119f..6266388 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -143,6 +143,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-vconsole
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOTCHART),y)
+SYSTEMD_CONF_OPTS += --enable-bootchart
+else
+SYSTEMD_CONF_OPTS += --disable-bootchart
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
