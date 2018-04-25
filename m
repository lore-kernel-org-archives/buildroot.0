From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:21:46 +0200
Subject: [Buildroot] [git commit] reaver: fix static link build issue
Message-ID: <20180425202258.0AFAA88DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=559416ffe2039d1cac94e348bd28e963adf008a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libpcap itself is linked against other libraries, reaver fails to
build as it doesn't link with libpcap dependencies. This patch fixes
that by using the pcap-config program.

Fixes:

  http://autobuild.buildroot.net/results/899fd633288d5cd5aa221413cded857e4f743194/

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/reaver/reaver.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
index 90d1727bad..d9a621a847 100644
--- a/package/reaver/reaver.mk
+++ b/package/reaver/reaver.mk
@@ -14,4 +14,10 @@ REAVER_LICENSE_FILES = docs/LICENSE
 REAVER_SUBDIR = src
 REAVER_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_STATIC_LIBS),y)
+REAVER_CONF_ENV += \
+	LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`" \
+	LDFLAGS="$(TARGET_LDFLAGS) `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+
 $(eval $(autotools-package))
