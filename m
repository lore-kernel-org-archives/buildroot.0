From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Apr 2017 14:30:14 +0300
Subject: [Buildroot] [PATCH] aircrack-ng: don't build SSE code for non SSE
	target
Message-ID: <5343392152d546eef2d82eb4b98f78e82db64054.1493292614.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/763/7631470016f923e8f4a7696e65437c71b8668b6e/
http://autobuild.buildroot.net/results/621/621588651b5cf54726bbf5361399a2dc301b8a29/
http://autobuild.buildroot.net/results/628/628a66ef766308fba699f1faa942306e600e5575/

Cc: Laurent Cans <laurent.cans@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/aircrack-ng/aircrack-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index b728624003c1..6b384c072003 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -53,6 +53,12 @@ else
 AIRCRACK_NG_MAKE_OPTS += sqlite=false
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+AIRCRACK_NG_MAKE_OPTS += NEWSSE=true
+else
+AIRCRACK_NG_MAKE_OPTS += NEWSSE=false
+endif
+
 define AIRCRACK_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(AIRCRACK_NG_LDFLAGS)" \
 		$(MAKE) -C $(@D) $(AIRCRACK_NG_MAKE_OPTS)
-- 
2.11.0
