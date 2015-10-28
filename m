From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 28 Oct 2015 16:59:03 +0100
Subject: [Buildroot] [PATCH 3/3] skeleton: wait interface to appear if dhcp
	is enabled
In-Reply-To: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
Message-ID: <1446047943-24641-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wait-delay hook is enabled only if wait-delay property appears in
/etc/network/interfaces. This patch enable it automaticaly when
interface is configured through DHCP at bootup. However, if user choose
to write /etc/network/interface himself, he have to explicitly
set wait-delay.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/skeleton/skeleton.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 920d3b4..d1b797d 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -89,6 +89,7 @@ define SET_NETWORK_DHCP
 		echo ;                                               \
 		echo "auto $(NETWORK_DHCP_IFACE)";                   \
 		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
+		echo "	wait-delay 15";                              \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 endif
-- 
2.1.4
