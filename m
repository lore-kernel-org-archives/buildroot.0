From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 14:16:41 +0200
Subject: [Buildroot] [git commit] aircrack-ng: don't build SSE code for non
	SSE target
Message-ID: <20170427121702.971E1807DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc1287ee8acf44b0842136fea90ca99e6b083035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/763/7631470016f923e8f4a7696e65437c71b8668b6e/
http://autobuild.buildroot.net/results/621/621588651b5cf54726bbf5361399a2dc301b8a29/
http://autobuild.buildroot.net/results/628/628a66ef766308fba699f1faa942306e600e5575/

Cc: Laurent Cans <laurent.cans@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aircrack-ng/aircrack-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index b728624..6b384c0 100644
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
