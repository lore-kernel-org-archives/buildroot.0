From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Sun, 22 Apr 2018 17:51:59 +0200
Subject: [Buildroot] [PATCH v3 1/1] reaver: fix build errors with static lib
Message-ID: <1524412319-6836-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
v2: build now passes even when BR2_STATIC_LIB=y,
LIBS+=pcap-config caused "./configure" tu pass,
LDFLAGS+=pcap-config fixed problems with "make",
they're both needed.

v3: edited commit to something more releavant

 package/reaver/reaver.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
index 90d1727..8dfec32 100644
--- a/package/reaver/reaver.mk
+++ b/package/reaver/reaver.mk
@@ -14,4 +14,9 @@ REAVER_LICENSE_FILES = docs/LICENSE
 REAVER_SUBDIR = src
 REAVER_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_STATIC_LIBS),y)
+REAVER_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+REAVER_CONF_OPTS += LDFLAGS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
