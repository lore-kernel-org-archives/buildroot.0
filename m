From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Fri, 20 Apr 2018 20:27:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] reaver: add missing dependency on non
 static lib.
Message-ID: <1524248835-4552-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes 

	http://autobuild.buildroot.net/results/0fb387f0544e962e5080ea966864f325fbaf4117

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---

v2: static libs are now allowed. I used Arnout's suggestion
which caused ./configure to pass. Then there was a linker problem
that was solved by using the trick on LDFLAGS this time. Build now passes.

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
