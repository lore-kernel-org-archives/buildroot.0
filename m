From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jan 2017 18:07:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/sngrep: fix static linking against
	libpcap
Message-ID: <20170128170759.2489-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired by
https://git.buildroot.net/buildroot/tree/package/aircrack-ng/aircrack-ng.mk#n30

Fixes
http://autobuild.buildroot.net/results/699/6993c398649469e25f2491fdb8f1ac9b6d6d8c3c/
http://autobuild.buildroot.net/results/846/8468df3462ac6d53faef228ca241bc500b2d7a52/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sngrep/sngrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 52c8a2da4..6ca56fe84 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -11,6 +11,9 @@ SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses
 
+SNGREP_CONF_ENV += \
+	$(if $(BR2_STATIC_LIBS),LIBS="-lpcap `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`")
+
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
 
-- 
2.11.0
