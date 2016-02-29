From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:53:22 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
	support for binfmt
Message-ID: <20160229215455.7B61680415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d8485bc7531b04b05c26878b1e961cd9df62512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index e9a7883..6289252 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -84,6 +84,14 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
+config BR2_PACKAGE_SYSTEMD_BINFMT
+	bool "enable binfmt tool"
+	help
+	  systemd-binfmt is an early boot service that registers
+	  additional binary formats for executables in the kernel.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 87fdbd7..5f7941c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -131,6 +131,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-microhttpd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BINFMT),y)
+SYSTEMD_CONF_OPTS += --enable-binfmt
+else
+SYSTEMD_CONF_OPTS += --disable-binfmt
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
