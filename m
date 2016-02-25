From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:18 +0000
Subject: [Buildroot] [PATCH 09/32] package/systemd: add support for
	specifying NTP servers
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-10-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd warns against the use of using the default NTP servers:

configure: WARNING: *** Using Google NTP servers.
                        Do not ship OSes or devices with these default settings.
                        See DISTRO_PORTING for details!

DISTRO_PORTING notes that Google's NTP servers aren't actually
a publicly offered service like Google Public DNS and that they serve
non-standard time that can be up to .5s off.

To avoid unexpected behavior in out-of-the-box builds, ntp.org is used
as the default.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 18 +++++++++++++++++-
 package/systemd/systemd.mk |  4 +++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 5d6759d..5d74383 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -107,6 +107,22 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
+if BR2_PACKAGE_SYSTEMD_TIMESYNCD
+
+config BR2_PACKAGE_SYSTEMD_NTP_SERVERS
+	string "default NTP servers"
+	default "0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
+	help
+	  You may specify a space-separated list of default NTP servers for timesyncd
+	  to use.
+
+	  Anyone distributing an appliance, operating system, or some other kind of
+	  software using NTP can register their own vendor pool at ntp.org:
+
+	  http://www.pool.ntp.org/en/vendors.html
+
+endif # BR2_PACKAGE_SYSTEMD_TIMESYNCD
+
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "enable compatibility libraries"
 	help
@@ -134,4 +150,4 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and manages
 	  security labels for sockets.
 
-endif
+endif # BR2_PACKAGE_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 639b8a5..32bf41b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -145,7 +145,9 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
-SYSTEMD_CONF_OPTS += --enable-timesyncd
+SYSTEMD_CONF_OPTS += \
+	--enable-timesyncd \
+	--with-ntp-servers=$(BR2_PACKAGE_SYSTEMD_NTP_SERVERS)
 define SYSTEMD_INSTALL_SERVICE_TIMESYNC
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
 	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
-- 
1.9.1
