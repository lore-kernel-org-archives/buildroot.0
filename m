From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 19 May 2019 23:08:54 +0300
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix static build with pcap
Message-ID: <20190519200854.8933-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of suricata fails with BR2_STATIC_LIBS=y because pcap
requires libnl which can't be found, so use pkg-config to obtain
libpcap dependencies.

Fixes:
	http://autobuild.buildroot.net/results/b5fdf31db6897a9612a0badc7c4bd3e54f031308/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/suricata/suricata.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index e5884cdfe4..503d76e6a8 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -123,4 +123,6 @@ define SURICATA_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/suricata.service
 endef
 
+SURICATA_CONF_OPTS += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libpcap`"
+
 $(eval $(autotools-package))
-- 
2.21.0
