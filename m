From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Apr 2019 00:22:14 +0200
Subject: [Buildroot] [git commit] package/wireshark: add systemd optional
 dependency
Message-ID: <20190415222957.540E68E9AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa882c18343e4d830a6586d9bf25a2a04b94aea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
