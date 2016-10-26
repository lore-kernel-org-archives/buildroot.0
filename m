From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 26 Oct 2016 13:18:04 -0400
Subject: [Buildroot] [PATCH 1/1] systemd: don't build systemd-firstboot by
	default
Message-ID: <1477502284-6023-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-firstboot is never invoked since systemd's first boot detection
logic checks whether /etc/machine-id exists. Since the file is created
automatically by systemd.mk, systemd will never detect first boot and
therefore the systemd-firstboot.service unit file will never get run.

Additionally, if /etc/machine-id is removed to allow systemd-firstboot
to run, it interactively prompts for the system locale. This makes it
seem unlikely that an embedded system would want to use it.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ddaf3e2..1aedb7b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -106,7 +106,6 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 
 config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	bool "enable firstboot support"
-	default y
 	help
 	  systemd-firstboot initializes the most basic system settings
 	  interactively on the first boot.
-- 
2.7.4
