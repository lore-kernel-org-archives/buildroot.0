From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Nov 2018 23:20:55 +0100
Subject: [Buildroot] [git commit] ifupdown-script: send current hostname in
 DHCP request
Message-ID: <20181105222005.9613E814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a3f85ddff33c9c02ee04f1f9aaf5d5c7a9bac45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the default (BR2_SYSTEM_DHCP) /etc/network/interfaces handling.

Both the "big" and busybox ifupdown variants pass the hostname argument to
the DHCP client through the shell, so we can use $() to expand to the
current hostname value.

Notice that this may not be handled by all DHCP clients.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index ebc89b3872..17364aed03 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -23,6 +23,7 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "iface $(IFUPDOWN_SCRIPTS_DHCP_IFACE) inet dhcp"; \
 		echo "  pre-up /etc/network/nfs_check"; \
 		echo "  wait-delay 15"; \
+		echo "  hostname \$$(hostname)"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 	$(INSTALL) -m 0755 -D $(IFUPDOWN_SCRIPTS_PKGDIR)/nfs_check \
 		$(TARGET_DIR)/etc/network/nfs_check
