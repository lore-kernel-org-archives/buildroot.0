From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Apr 2019 18:10:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/wireshark: add systemd optional
 dependency
In-Reply-To: <20190415161058.14182-1-fontaine.fabrice@gmail.com>
References: <20190415161058.14182-1-fontaine.fabrice@gmail.com>
Message-ID: <20190415161058.14182-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 691f0140b5..13da31d5c3 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -18,8 +18,7 @@ WIRESHARK_MAKE_ENV = \
 WIRESHARK_CONF_OPTS = \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF \
-	-DENABLE_STATIC=OFF \
-	-DBUILD_sdjournal=OFF
+	-DENABLE_STATIC=OFF
 
 # wireshark needs the host version of lemon during compilation.
 # This binrary is provided by sqlite-src (which is different from
@@ -141,6 +140,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_SPANDSP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=ON
+WIRESHARK_DEPENDENCIES += systemd
+else
+WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
+endif
+
 define WIRESHARK_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
 		-o -name '*.html' -print0 | xargs -0 rm -f
-- 
2.20.1
